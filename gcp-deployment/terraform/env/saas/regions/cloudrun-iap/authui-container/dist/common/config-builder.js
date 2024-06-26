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
exports.DefaultUiConfigBuilder = exports.TENANT_ICON_URL = void 0;
const validators = __importStar(require("./validator"));
// TODO: Temporary URLs for now. Replace with production ones when ready.
// This is the icon for each tenant button in the tenant selection screen.
exports.TENANT_ICON_URL = 'https://www.gstatic.com/firebasejs/ui/2.0.0/images/auth/anonymous.png';
// List of required fields.
const REQUIRED_FIELDS = [
    '*.authDomain',
    '*.displayMode',
    '*.tenants.*.displayName',
    '*.tenants.*.iconUrl',
    '*.tenants.*.buttonColor',
    '*.tenants.*.signInOptions[]',
];
/** UiConfig validation tree. */
const VALIDATION_TREE = {
    '*': {
        nodes: {
            authDomain: {
                validator: (value, key) => {
                    if (!validators.isSafeString(value)) {
                        throw new Error(`"${key}" should be a valid string.`);
                    }
                },
            },
            displayMode: {
                validator: (value, key) => {
                    if (value !== 'optionFirst' && value !== 'identifierFirst') {
                        throw new Error(`"${key}" should be either "optionFirst" or "identifierFirst".`);
                    }
                },
            },
            selectTenantUiTitle: {
                validator: (value, key) => {
                    if (!validators.isSafeString(value)) {
                        throw new Error(`"${key}" should be a valid string.`);
                    }
                },
            },
            selectTenantUiLogo: {
                validator: (value, key) => {
                    if (value && !validators.isHttpsURL(value)) {
                        throw new Error(`"${key}" should be a valid HTTPS URL.`);
                    }
                },
            },
            styleUrl: {
                validator: (value, key) => {
                    if (value && !validators.isHttpsURL(value)) {
                        throw new Error(`"${key}" should be a valid HTTPS URL.`);
                    }
                },
            },
            tosUrl: {
                validator: (value, key) => {
                    if (value && !validators.isHttpsURL(value)) {
                        throw new Error(`"${key}" should be a valid HTTPS URL.`);
                    }
                },
            },
            privacyPolicyUrl: {
                validator: (value, key) => {
                    if (value && !validators.isHttpsURL(value)) {
                        throw new Error(`"${key}" should be a valid HTTPS URL.`);
                    }
                },
            },
            tenants: {
                nodes: {
                    '*': {
                        nodes: {
                            fullLabel: {
                                validator: (value, key) => {
                                    if (!validators.isSafeString(value)) {
                                        throw new Error(`"${key}" should be a valid string.`);
                                    }
                                },
                            },
                            displayName: {
                                validator: (value, key) => {
                                    if (!validators.isSafeString(value)) {
                                        throw new Error(`"${key}" should be a valid string.`);
                                    }
                                },
                            },
                            iconUrl: {
                                validator: (value, key) => {
                                    if (!validators.isHttpsURL(value)) {
                                        throw new Error(`"${key}" should be a valid HTTPS URL.`);
                                    }
                                },
                            },
                            logoUrl: {
                                validator: (value, key) => {
                                    if (value && !validators.isHttpsURL(value)) {
                                        throw new Error(`"${key}" should be a valid HTTPS URL.`);
                                    }
                                },
                            },
                            buttonColor: {
                                validator: (value, key) => {
                                    if (!validators.isValidColorString(value)) {
                                        throw new Error(`"${key}" should be a valid color string of format #xxxxxx.`);
                                    }
                                },
                            },
                            tosUrl: {
                                validator: (value, key) => {
                                    if (value && !validators.isHttpsURL(value)) {
                                        throw new Error(`"${key}" should be a valid HTTPS URL.`);
                                    }
                                },
                            },
                            privacyPolicyUrl: {
                                validator: (value, key) => {
                                    if (value && !validators.isHttpsURL(value)) {
                                        throw new Error(`"${key}" should be a valid HTTPS URL.`);
                                    }
                                },
                            },
                            immediateFederatedRedirect: {
                                validator: (value, key) => {
                                    if (!validators.isBoolean(value)) {
                                        throw new Error(`"${key}" should be a valid boolean.`);
                                    }
                                },
                            },
                            signInFlow: {
                                validator: (value, key) => {
                                    if (value !== 'popup' && value !== 'redirect') {
                                        throw new Error(`"${key}" should be either "popup" or "redirect".`);
                                    }
                                },
                            },
                            adminRestrictedOperation: {
                                nodes: {
                                    status: {
                                        validator: (value, key) => {
                                            if (!validators.isBoolean(value)) {
                                                throw new Error(`"${key}" should be a boolean.`);
                                            }
                                        },
                                    },
                                    adminEmail: {
                                        validator: (value, key) => {
                                            if (value && !validators.isEmail(value)) {
                                                throw new Error(`"${key}" should be a valid email.`);
                                            }
                                        },
                                    },
                                    helpLink: {
                                        validator: (value, key) => {
                                            if (value && !validators.isHttpsURL(value)) {
                                                throw new Error(`"${key}" should be a valid HTTPS URL.`);
                                            }
                                        },
                                    },
                                },
                            },
                            'signInOptions[]': {
                                // signInOptions can be a list of string too.
                                validator: (value, key) => {
                                    if (!validators.isProviderId(value)) {
                                        throw new Error(`"${key}" should be a valid providerId string or provider object.`);
                                    }
                                },
                                nodes: {
                                    provider: {
                                        validator: (value, key) => {
                                            if (!validators.isProviderId(value)) {
                                                throw new Error(`"${key}" should be a valid providerId string.`);
                                            }
                                        },
                                    },
                                    providerName: {
                                        validator: (value, key) => {
                                            if (!validators.isSafeString(value)) {
                                                throw new Error(`"${key}" should be a valid string.`);
                                            }
                                        },
                                    },
                                    fullLabel: {
                                        validator: (value, key) => {
                                            if (!validators.isSafeString(value)) {
                                                throw new Error(`"${key}" should be a valid string.`);
                                            }
                                        },
                                    },
                                    hd: {
                                        validator: (value, key) => {
                                            // Regexp is not an allowed JSON field. Limit to domains.
                                            if (!validators.isSafeString(value)) {
                                                throw new Error(`"${key}" should be a valid domain string.`);
                                            }
                                        },
                                    },
                                    buttonColor: {
                                        validator: (value, key) => {
                                            if (!validators.isValidColorString(value)) {
                                                throw new Error(`"${key}" should be a valid color string of format #xxxxxx.`);
                                            }
                                        },
                                    },
                                    iconUrl: {
                                        validator: (value, key) => {
                                            if (!validators.isHttpsURL(value)) {
                                                throw new Error(`"${key}" should be a valid HTTPS URL.`);
                                            }
                                        },
                                    },
                                    'scopes[]': {
                                        validator: (value, key) => {
                                            // Google OAuth scopes are URLs.
                                            if (!validators.isSafeString(value) && !validators.isHttpsURL(value)) {
                                                throw new Error(`"${key}" should be a valid array of OAuth scopes.`);
                                            }
                                        },
                                    },
                                    customParameters: {
                                        nodes: {
                                            '*': {
                                                validator: (value, key) => {
                                                    if (!validators.isSafeString(value)) {
                                                        throw new Error(`"${key}" should be a valid string.`);
                                                    }
                                                },
                                            },
                                        },
                                    },
                                    loginHintKey: {
                                        validator: (value, key) => {
                                            if (!validators.isSafeString(value)) {
                                                throw new Error(`"${key}" should be a valid string.`);
                                            }
                                        },
                                    },
                                    requireDisplayName: {
                                        validator: (value, key) => {
                                            if (!validators.isBoolean(value)) {
                                                throw new Error(`"${key}" should be a valid boolean.`);
                                            }
                                        },
                                    },
                                    recaptchaParameters: {
                                        nodes: {
                                            type: {
                                                validator: (value, key) => {
                                                    if (value !== 'image' && value !== 'audio') {
                                                        throw new Error(`"${key}" should be either "image" or "audio".`);
                                                    }
                                                },
                                            },
                                            size: {
                                                validator: (value, key) => {
                                                    if (value !== 'invisible' && value !== 'compact' && value !== 'normal') {
                                                        throw new Error(`"${key}" should be one of ["invisible", "compact", "normal"].`);
                                                    }
                                                },
                                            },
                                            badge: {
                                                validator: (value, key) => {
                                                    if (value !== 'bottomright' && value !== 'bottomleft' && value !== 'inline') {
                                                        throw new Error(`"${key}" should be one of ["bottomright", "bottomleft", "inline"].`);
                                                    }
                                                },
                                            },
                                        },
                                    },
                                    defaultCountry: {
                                        validator: (value, key) => {
                                            if (!validators.isSafeString(value)) {
                                                throw new Error(`"${key}" should be a valid string.`);
                                            }
                                        },
                                    },
                                    defaultNationalNumber: {
                                        validator: (value, key) => {
                                            if (!validators.isSafeString(value)) {
                                                throw new Error(`"${key}" should be a valid string.`);
                                            }
                                        },
                                    },
                                    loginHint: {
                                        validator: (value, key) => {
                                            if (!validators.isSafeString(value)) {
                                                throw new Error(`"${key}" should be a valid string.`);
                                            }
                                        },
                                    },
                                    'whitelistedCountries[]': {
                                        validator: (value, key) => {
                                            if (!validators.isSafeString(value)) {
                                                throw new Error(`"${key}" should be a valid string.`);
                                            }
                                        },
                                    },
                                    'blacklistedCountries[]': {
                                        validator: (value, key) => {
                                            if (!validators.isSafeString(value)) {
                                                throw new Error(`"${key}" should be a valid string.`);
                                            }
                                        },
                                    },
                                    disableSignUp: {
                                        nodes: {
                                            status: {
                                                validator: (value, key) => {
                                                    if (!validators.isBoolean(value)) {
                                                        throw new Error(`"${key}" should be a boolean.`);
                                                    }
                                                },
                                            },
                                            adminEmail: {
                                                validator: (value, key) => {
                                                    if (value && !validators.isEmail(value)) {
                                                        throw new Error(`"${key}" should be a valid email.`);
                                                    }
                                                },
                                            },
                                            helpLink: {
                                                validator: (value, key) => {
                                                    if (value && !validators.isHttpsURL(value)) {
                                                        throw new Error(`"${key}" should be a valid HTTPS URL.`);
                                                    }
                                                },
                                            },
                                        },
                                    },
                                },
                            },
                        },
                    },
                },
            },
        },
    },
};
/** Utility for building the default UI config object. */
class DefaultUiConfigBuilder {
    /**
     * Instantiates a default UI config builder instance.
     * @param projectId The project ID to use.
     * @param gcipConfig The GCIP web config.
     * @param tenantUiConfigMap The map of tenant IDs to TenantUiConfig object.
     */
    constructor(projectId, hostName, gcipConfig, tenantUiConfigMap) {
        this.projectId = projectId;
        this.hostName = hostName;
        this.gcipConfig = gcipConfig;
        this.tenantUiConfigMap = tenantUiConfigMap;
    }
    /**
     * Validates the provided UiConfig object.
     * @param config The input configuration to validate.
     */
    static validateConfig(config) {
        DefaultUiConfigBuilder.uiConfigValidator.validate(config);
    }
    /**
     * @return The generated UiConfig object if available, null otherwise.
     */
    build() {
        const tenantConfigs = {};
        let charCode = 'A'.charCodeAt(0);
        const optionsMap = this.tenantUiConfigMap;
        const tenantIds = [];
        let totalSignInOptions = 0;
        for (const tenantId in optionsMap) {
            if (optionsMap.hasOwnProperty(tenantId)) {
                tenantIds.push(tenantId);
            }
        }
        tenantIds.forEach((tenantId) => {
            let key;
            let displayName;
            let fullLabel;
            if (tenantId.charAt(0) === '_') {
                key = '_';
                displayName = (optionsMap[key] && optionsMap[key].displayName) ||
                    'My Company';
                fullLabel = optionsMap[key] && optionsMap[key].fullLabel;
            }
            else {
                key = tenantId;
                displayName = (optionsMap[key] && optionsMap[key].displayName) ||
                    `Company ${String.fromCharCode(charCode)}`;
                fullLabel = optionsMap[key] && optionsMap[key].fullLabel;
                charCode++;
            }
            totalSignInOptions += (optionsMap[key] &&
                optionsMap[key].signInOptions && optionsMap[key].signInOptions.length) || 0;
            const adminRestrictedOperation = optionsMap[key] && optionsMap[key].adminRestrictedOperation;
            tenantConfigs[key] = {
                displayName,
                iconUrl: exports.TENANT_ICON_URL,
                logoUrl: '',
                buttonColor: '#007bff',
                // By default, use immediate federated redirect.
                // This is safe since if more than one provider is used, FirebaseUI will ignore this.
                immediateFederatedRedirect: true,
                signInFlow: 'redirect',
                signInOptions: (optionsMap[key] && optionsMap[key].signInOptions) || [],
                tosUrl: '',
                privacyPolicyUrl: '',
                adminRestrictedOperation,
            };
            if (!adminRestrictedOperation) {
                delete tenantConfigs[key].adminRestrictedOperation;
            }
            if (fullLabel) {
                tenantConfigs[key].fullLabel = fullLabel;
            }
        });
        // IAP or IdPs not yet configured.
        if (totalSignInOptions === 0) {
            ;
            return null;
        }
        let authDomain = this.gcipConfig.authDomain;
        // override authDomain to be the current IAP URL by default,
        // so that requests to "/__/auth" are sent on the same domain as the main UI.
        // These requests will be proxied to the original authDomain in auth-server.ts.
        if (validators.isNonEmptyString(this.hostName)) {
            authDomain = this.hostName;
        }
        return {
            [this.gcipConfig.apiKey]: {
                authDomain,
                displayMode: 'optionFirst',
                selectTenantUiTitle: this.projectId,
                selectTenantUiLogo: '',
                styleUrl: '',
                tenants: tenantConfigs,
                tosUrl: '',
                privacyPolicyUrl: '',
            },
        };
    }
}
exports.DefaultUiConfigBuilder = DefaultUiConfigBuilder;
DefaultUiConfigBuilder.uiConfigValidator = new validators.JsonObjectValidator(VALIDATION_TREE, REQUIRED_FIELDS);
