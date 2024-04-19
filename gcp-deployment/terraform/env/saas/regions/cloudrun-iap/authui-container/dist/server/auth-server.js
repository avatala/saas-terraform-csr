"use strict";
/*
 * Copyright 2020 Google Inc. All Rights Reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except
 * in compliance with the License. You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software distributed under the
 * License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
 * express or implied. See the License for the specific language governing permissions and
 * limitations under the License.
 */
var __createBinding = (this && this.__createBinding) || (Object.create ? (function(o, m, k, k2) {
    if (k2 === undefined) k2 = k;
    Object.defineProperty(o, k2, { enumerable: true, get: function() { return m[k]; } });
}) : (function(o, m, k, k2) {
    if (k2 === undefined) k2 = k;
    o[k2] = m[k];
}));
var __setModuleDefault = (this && this.__setModuleDefault) || (Object.create ? (function(o, v) {
    Object.defineProperty(o, "default", { enumerable: true, value: v });
}) : function(o, v) {
    o["default"] = v;
});
var __importStar = (this && this.__importStar) || function (mod) {
    if (mod && mod.__esModule) return mod;
    var result = {};
    if (mod != null) for (var k in mod) if (k !== "default" && Object.hasOwnProperty.call(mod, k)) __createBinding(result, mod, k);
    __setModuleDefault(result, mod);
    return result;
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.AuthServer = exports.ALLOWED_LAST_CHAR = exports.MAX_BUCKET_STRING_LENGTH = exports.HOSTED_UI_VERSION = exports.AUTH_SERVER_SCOPES = void 0;
const express = require("express");
const bodyParser = require("body-parser");
const templates = __importStar(require("./templates"));
const path = require("path");
const metadata_server_1 = require("./api/metadata-server");
const cloud_storage_handler_1 = require("./api/cloud-storage-handler");
const error_1 = require("../server/utils/error");
const validator_1 = require("../common/validator");
const config_builder_1 = require("../common/config-builder");
const iap_settings_handler_1 = require("./api/iap-settings-handler");
const gcip_handler_1 = require("./api/gcip-handler");
const index_1 = require("../common/index");
const http_proxy_middleware_1 = require("http-proxy-middleware");
// Defines the Auth server OAuth scopes needed for internal usage.
// This is used to query APIs to determine the default config.
exports.AUTH_SERVER_SCOPES = [
    'https://www.googleapis.com/auth/cloud-platform',
    'https://www.googleapis.com/auth/identitytoolkit',
];
// Configuration file name.
const CONFIG_FILE_NAME = 'config.json';
// The current hosted UI version.
exports.HOSTED_UI_VERSION = '__XXX_HOSTED_UI_VERSION_XXX__';
// The maximum allowed length of a GCS bucket.
exports.MAX_BUCKET_STRING_LENGTH = 63;
// Character to substitute at the end of a bucket name to ensure it
// ends with a letter or number.
exports.ALLOWED_LAST_CHAR = '0';
/**
 * Executes post actions when proxy failed.
 * @param target Target address which requests are proxied to.
 */
function errorCallback(err, req, res, target) {
    log(`Failed to proxy requests to target ${target}: ${err.message}`);
}
/**
 * Renders the sign-in UI HTML container and serves it in the response.
 * @param req The expressjs request.
 * @param res The expressjs response.
 */
function serveContentForSignIn(req, res) {
    const logo = 'https://img.icons8.com/cotton/2x/cloud.png';
    res.set('Content-Type', 'text/html');
    res.end(templates.main({
        logo,
    }));
}
/**
 * Depending on the DEBUG_CONSOLE environment variable, this will log the provided arguments to the console.
 * @param args The list of arguments to log.
 */
function log(...args) {
    if (process.env.DEBUG_CONSOLE === 'true' || process.env.DEBUG_CONSOLE === '1') {
        // tslint:disable-next-line:no-console
        console.log.apply(console, arguments);
    }
}
/** Abstracts the express JS server used to handle all authentication related operations. */
class AuthServer {
    /**
     * Creates an instance of the auth server using the specified express application instance.
     * @param app The express application instance.
     */
    constructor(app) {
        this.app = app;
        // Metadata server is used to retrieve current app data (project ID, number, GCP zone, etc).
        // It is also used to call APIs on behalf of the service. This is mostly for read operations.
        // For example to read the default app configuration.
        // For write operations, the admin OAuth access token is used.
        this.metadataServer = new metadata_server_1.MetadataServer(exports.AUTH_SERVER_SCOPES, log);
        this.bucketName = null;
        // GCIP handler used to construct the default configuration file and to populate
        // the web UI config (apiKey + authDomain).
        this.gcipHandler = new gcip_handler_1.GcipHandler(this.metadataServer, this.metadataServer);
        // IAP settings handler used to list all IAP enabled services and their settings.
        this.iapSettingsHandler = new iap_settings_handler_1.IapSettingsHandler(this.metadataServer, this.metadataServer);
        this.init();
    }
    /**
     * Starts the authentication server at the specified port number.
     * @param port The port to start the server with. This defaults to 8080.
     * @return A promise that resolves on readiness.
     */
    start(port = '8080') {
        return new Promise((resolve, reject) => {
            this.server = this.app.listen(parseInt(port, 10), () => {
                // Log current version of hosted UI.
                // tslint:disable-next-line:no-console
                console.log('Server started with version', exports.HOSTED_UI_VERSION);
                resolve();
            });
        });
    }
    /** Closes the server. */
    stop() {
        if (this.server) {
            this.server.close();
        }
    }
    /**
     * Initializes the server endpoints.
     */
    init() {
        this.app.enable('trust proxy');
        // Oauth handler widget code.
        // Proxy these requests to <project>.firebaseapp.com.
        // set this up before adding json body parser to the app. This causes POST requests to fail as mentioned in
        // https://github.com/chimurai/http-proxy-middleware/issues/171#issuecomment-356218599
        this.fetchAuthDomainProxyTarget().then(authDomainProxyTarget => {
            log(`Proxy auth requests to target ${authDomainProxyTarget}`);
            this.app.use('/__/auth/', http_proxy_middleware_1.createProxyMiddleware({
                target: authDomainProxyTarget,
                // set to true to pass SSL cert checks.
                // This causes the SNI/Host Header of the proxy request to be set to the targetURL
                // '<project>.firebaseapp.com'.
                changeOrigin: true,
                logLevel: 'debug',
                onError: errorCallback
            }));
            // Support JSON-encoded bodies.
            this.app.use(bodyParser.json());
            // Support URL-encoded bodies.
            this.app.use(bodyParser.urlencoded({
                extended: true
            }));
            // Post requests needs bodyParser to be setup first.
            // Otherwise, URLs in the request payload are not parsed correctly.
            // Administrative API for writing a custom configuration to.
            // This will save the configuration in a predetermined GCS bucket.
            if (this.isAdminAllowed()) {
                this.app.post('/set_admin_config', (req, res) => {
                    if (!req.headers.authorization ||
                        req.headers.authorization.split(' ').length <= 1) {
                        this.handleErrorResponse(res, error_1.ERROR_MAP.UNAUTHENTICATED);
                    }
                    else if (!validator_1.isNonNullObject(req.body) ||
                        Object.keys(req.body).length === 0) {
                        this.handleErrorResponse(res, error_1.ERROR_MAP.INVALID_ARGUMENT);
                    }
                    else {
                        const accessToken = req.headers.authorization.split(' ')[1];
                        try {
                            // Validate config before saving it.
                            config_builder_1.DefaultUiConfigBuilder.validateConfig(req.body);
                            this.setConfigForAdmin(accessToken, req.body).then(() => {
                                res.set('Content-Type', 'application/json');
                                res.send(JSON.stringify({
                                    status: 200,
                                    message: 'Changes successfully saved.',
                                }));
                            }).catch((err) => {
                                this.handleError(res, err);
                            });
                        }
                        catch (e) {
                            this.handleErrorResponse(res, {
                                error: {
                                    code: 400,
                                    status: 'INVALID_ARGUMENT',
                                    message: e.message || 'Invalid UI configuration.',
                                },
                            });
                        }
                    }
                });
            }
        });
        // Static assets.
        // Note that in production, this is served from dist/server/auth-server.js.
        this.app.use('/static', express.static(path.join(__dirname, '../public')));
        // IAP sign-in flow.
        this.app.get('/', (req, res) => {
            // Serve content for signed in user.
            return serveContentForSignIn(req, res);
        });
        // Provide easy way for developer to determine the auth domain being used.
        // This is the location to which requests are being proxied. This is same as
        // the output of /gcipConfig authDomain, but it validates that the proxy target
        // was read correctly by the constructor/init() code.
        this.app.get('/authdomain-proxytarget', (req, res) => {
            this.fetchAuthDomainProxyTarget()
                .then((authDomainProxyTarget) => {
                res.set('Content-Type', 'text/html');
                res.end(authDomainProxyTarget);
            })
                .catch((err) => {
                this.handleError(res, err);
            });
        });
        // Provide easy way for developer to determine version.
        this.app.get('/versionz', (req, res) => {
            res.set('Content-Type', 'text/html');
            res.end(exports.HOSTED_UI_VERSION);
        });
        // Developers can disable admin panel when deploying Cloud Run service.
        if (this.isAdminAllowed()) {
            // Administrative sign-in UI config customization.
            this.app.get('/admin', (req, res) => {
                res.set('Content-Type', 'text/html');
                res.end(templates.admin({}));
            });
            // Administrative API for reading the current app configuration.
            // This could be either saved in GCS (custom config), environment variable (custom config)
            // or in memory (default config).
            this.app.get('/get_admin_config', (req, res) => {
                if (!req.headers.authorization ||
                    req.headers.authorization.split(' ').length <= 1) {
                    this.handleErrorResponse(res, error_1.ERROR_MAP.UNAUTHENTICATED);
                }
                else {
                    // Use the hostname of the request to figure out the URL of the hosted UI.
                    // This should be used as authDomain in admin config, unless it was overridden to a different value.
                    // This enables authDomain to be in the same origin as the sign-in UI.
                    const accessToken = req.headers.authorization.split(' ')[1];
                    this.getConfigForAdmin(accessToken, req.hostname).then((config) => {
                        res.set('Content-Type', 'application/json');
                        res.send(JSON.stringify(config || {}));
                    }).catch((err) => {
                        this.handleError(res, err);
                    });
                }
            });
        }
        // Used to return the auth configuration (apiKey + authDomain).
        this.app.get('/gcipConfig', (req, res) => {
            this.gcipHandler.getGcipConfig()
                .then((gcipConfig) => {
                res.set('Content-Type', 'application/json');
                res.send(JSON.stringify(gcipConfig));
            })
                .catch((err) => {
                this.handleError(res, err);
            });
        });
        // Returns the custom config (if available) or the default config, needed to render
        // the sign-in UI for IAP.
        this.app.get('/config', (req, res) => {
            // Use the hostname of the request to figure out the URL of the hosted UI.
            // This should be used as authDomain in config, unless it was overridden to a different value.
            // This enables authDomain to be in the same origin as the sign-in UI.
            this.getFallbackConfig(req.hostname)
                .then((currentConfig) => {
                if (!currentConfig) {
                    this.handleErrorResponse(res, error_1.ERROR_MAP.NOT_FOUND);
                }
                else {
                    res.set('Content-Type', 'application/json');
                    res.send(JSON.stringify(currentConfig));
                }
            })
                .catch((err) => {
                this.handleError(res, err);
            });
        });
    }
    /** @return Destination where requests with path "__/auth/" are proxied to. */
    fetchAuthDomainProxyTarget() {
        if (this.gcipHandler === undefined) {
            return Promise.reject(new Error('Gcip handler has not been initialized!'));
        }
        return this.gcipHandler.getGcipConfig()
            .then((gcipConfig) => `https://${gcipConfig.authDomain}`);
    }
    /** @return Whether admin panel is allowed. */
    isAdminAllowed() {
        return !(process.env.ALLOW_ADMIN === 'false' || process.env.ALLOW_ADMIN === '0');
    }
    /**
     * @return A promise that resolves with the current UI config.
     * The hostname parameter is used to override the authDomain to the hostname of the signin-page, i.e the requester UI.
     */
    getFallbackConfig(hostname) {
        // Parse config from environment variable first.
        if (process.env.UI_CONFIG) {
            try {
                const config = JSON.parse(process.env.UI_CONFIG);
                config_builder_1.DefaultUiConfigBuilder.validateConfig(config);
                return Promise.resolve(config);
            }
            catch (error) {
                // Ignore but log error.
                log(`Invalid configuration in environment variable UI_CONFIG: ${error.message}`);
            }
        }
        // Parse config from GCS bucket if available.
        const cloudStorageHandler = new cloud_storage_handler_1.CloudStorageHandler(this.metadataServer, this.metadataServer);
        return this.getBucketName()
            .then((bucketName) => {
            return cloudStorageHandler.readFile(bucketName, CONFIG_FILE_NAME);
        })
            .catch((error) => {
            // If not available in GCS, use default config.
            if (!this.defaultConfigPromise) {
                // Default config should be retrieved once and cached in memory.
                this.defaultConfigPromise = this.getDefaultConfig(hostname);
            }
            return this.defaultConfigPromise.then((config) => {
                if (!config) {
                    // Do not cache config if IAP is not yet enabled.
                    this.defaultConfigPromise = null;
                    // Return default config.
                    return null;
                }
                return config;
            })
                .catch((err) => {
                // Do not cache errors in building default config.
                this.defaultConfigPromise = null;
                throw err;
            });
        });
    }
    /**
     * Returns the map of tenant IDs and their TenantUiConfigs.
     * @param tenantIds The list of tenant IDs whose TenantUiConfigs are to be returend.
     * @return A promise that resolves with a object containing the mapping of tenant IDs and
     *     their TenantUiConfigs as retrieved from GCIP.
     */
    getTenantUiConfigForTenants(tenantIds) {
        const optionsMap = {};
        const getConfigLocal = () => {
            if (tenantIds.length === 0) {
                return Promise.resolve(optionsMap);
            }
            const tenantId = tenantIds.pop();
            return this.gcipHandler.getTenantUiConfig(tenantId)
                .then((options) => {
                if (tenantId.charAt(0) === '_') {
                    optionsMap._ = options;
                }
                else {
                    optionsMap[tenantId] = options;
                }
                return getConfigLocal();
            });
        };
        return getConfigLocal();
    }
    /**
     * @return A promise that resolves with the constructed default UI config if available.
     *     If IAP is not configured, null is returned instead.
     * @param hostname The hostname of the requesting app. This will be used as the authDomain field in UiConfig.
     */
    getDefaultConfig(hostname) {
        let gcipConfig;
        let projectId;
        return this.metadataServer.getProjectId()
            .then((retrievedProjectId) => {
            projectId = retrievedProjectId;
            return this.gcipHandler.getGcipConfig();
        })
            .then((retrievedGcipConfig) => {
            gcipConfig = retrievedGcipConfig;
            return this.iapSettingsHandler.listIapSettings()
                .catch((error) => {
                return [];
            });
        })
            .then((iapSettings) => {
            // Get list of all tenants used.
            const tenantIdsSet = new Set();
            iapSettings.forEach((iapConfig) => {
                if (iapConfig &&
                    iapConfig.accessSettings &&
                    iapConfig.accessSettings.gcipSettings &&
                    iapConfig.accessSettings.gcipSettings.tenantIds) {
                    // Add underlying tenant IDs to set.
                    iapConfig.accessSettings.gcipSettings.tenantIds.forEach((tenantId) => {
                        tenantIdsSet.add(tenantId);
                    });
                }
            });
            return Array.from(tenantIdsSet);
        })
            .then((tenantIds) => {
            return this.getTenantUiConfigForTenants(tenantIds);
        })
            .then((optionsMap) => {
            const defaultUiConfig = new config_builder_1.DefaultUiConfigBuilder(projectId, hostname, gcipConfig, optionsMap);
            return defaultUiConfig.build();
        });
    }
    /** @return A promise that resolves with the service GCS bucket name. */
    getBucketName() {
        const bucketPrefix = `gcip-iap-bucket-${process.env.K_CONFIGURATION}-`;
        if (this.bucketName) {
            return Promise.resolve(this.bucketName);
        }
        else if (process.env.GCS_BUCKET_NAME) {
            this.bucketName = process.env.GCS_BUCKET_NAME;
            return Promise.resolve(this.bucketName);
        }
        return this.metadataServer.getProjectNumber()
            .then((projectNumber) => {
            // https://cloud.google.com/storage/docs/naming-buckets#requirements
            // Bucket names cannot exceed a certain limit. Trim overflowing characters.
            // Bucket names must also start and end with a number or letter.
            let computedBucketName = `${bucketPrefix}${projectNumber}`.substr(0, exports.MAX_BUCKET_STRING_LENGTH);
            // Last character should always be a number, unless the bucket name is trimmed.
            if (!index_1.isLastCharLetterOrNumber(computedBucketName)) {
                // Last char is not a letter or number. Replace with 0.
                computedBucketName =
                    computedBucketName.substr(0, computedBucketName.length - 1) + exports.ALLOWED_LAST_CHAR;
            }
            this.bucketName = computedBucketName;
            return this.bucketName;
        });
    }
    /**
     * Returns the current UI config if found in GCS. If not, the default config is
     * returned instead.
     * @param accessToken The personal admin user OAuth access token.
     * @param hostname The hostname of the requesting app. This will be used as the authDomain field in UiConfig.
     * @return A promise that resolves with the UI config.
     */
    getConfigForAdmin(accessToken, hostname) {
        let bucketName;
        const fileName = CONFIG_FILE_NAME;
        // Required OAuth scope: https://www.googleapis.com/auth/devstorage.read_write
        const accessTokenManager = {
            getAccessToken: () => Promise.resolve(accessToken),
        };
        const cloudStorageHandler = new cloud_storage_handler_1.CloudStorageHandler(this.metadataServer, accessTokenManager);
        // Check bucket exists first.
        return this.getBucketName()
            .then((retrievedBucketName) => {
            bucketName = retrievedBucketName;
            return cloudStorageHandler.readFile(bucketName, fileName);
        })
            .catch((error) => {
            if ((error.message && error.message.toLowerCase().indexOf('not found') !== -1) ||
                error.statusCode === 404) {
                // Since we can't check permissions on a non-existant bucket,
                // check user can list buckets.
                return cloudStorageHandler.listBuckets()
                    .then(() => {
                    // If not found, but user can list buckets, return default config.
                    // Otherwise throw an error.
                    return this.getDefaultConfig(hostname);
                });
            }
            throw error;
        });
    }
    /**
     * Saves the custom configuration to the expected GCS bucket.
     * @param accessToken The personal admin user OAuth access token.
     * @param customConfig The custom configuration JSON file to be saved.
     * @return A promise that resolves on successful saving.
     */
    setConfigForAdmin(accessToken, customConfig) {
        let bucketName;
        const fileName = CONFIG_FILE_NAME;
        // Required OAuth scope: https://www.googleapis.com/auth/devstorage.read_write
        const accessTokenManager = {
            getAccessToken: () => Promise.resolve(accessToken),
        };
        const cloudStorageHandler = new cloud_storage_handler_1.CloudStorageHandler(this.metadataServer, accessTokenManager);
        // Check bucket exists first.
        return this.getBucketName()
            .then((retrievedBucketName) => {
            bucketName = retrievedBucketName;
            return cloudStorageHandler.readFile(bucketName, fileName);
        })
            .catch((error) => {
            if ((error.message && error.message.toLowerCase().indexOf('not found') !== -1) ||
                error.statusCode === 404) {
                // Create bucket.
                return cloudStorageHandler.createBucket(bucketName);
            }
            throw error;
        })
            .then(() => {
            // Bucket either exists or just created. Write update file to it.
            return cloudStorageHandler.writeFile(bucketName, fileName, customConfig);
        });
    }
    /**
     * Handles the provided error response object.
     * @param res The express response object.
     * @param errorResponse The error response to return in the response.
     */
    handleErrorResponse(res, errorResponse) {
        res.status(errorResponse.error.code).json(errorResponse);
    }
    /**
     * Handles the provided error.
     * @param res The express response object.
     * @param error The associated error object.
     */
    handleError(res, error) {
        if (error && error.cloudCompliant) {
            this.handleErrorResponse(res, error.rawResponse);
        }
        else {
            // Response with unknown error.
            this.handleErrorResponse(res, {
                error: {
                    code: 500,
                    status: 'UNKNOWN',
                    message: error.message || 'Unknown server error.',
                },
            });
        }
    }
}
exports.AuthServer = AuthServer;
