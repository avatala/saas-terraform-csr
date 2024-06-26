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
Object.defineProperty(exports, "__esModule", { value: true });
exports.TokenManager = exports.OFFSET = void 0;
const http_server_request_handler_1 = require("../../server/utils/http-server-request-handler");
/** Metadata server access token endpoint. */
const METADATA_SERVER_ACCESS_TOKEN_URL = 'http://metadata.google.internal/computeMetadata/v1/instance/service-accounts/default/token';
/** The default OAuth scope to include in the access token. */
const DEFAULT_OAUTH_SCOPE = 'https://www.googleapis.com/auth/cloud-platform';
/** Time offset in milliseconds for forcing a refresh before a token expires. */
exports.OFFSET = 30000;
/** Network request timeout duration. */
const TIMEOUT_DURATION = 10000;
/** Default error message to show when access token fails to be obtained. */
const DEFAULT_ERROR_MESSAGE = 'Unable to retrieve an OAuth access tokens.';
/** Utility used to manage OAuth access tokens generated via the metadata server. */
class TokenManager {
    /**
     * Instantiates an instance of a token manager used to retrieve OAuth access
     * tokens retrieved from the metadata server.
     * @param scopes The OAuth scopes to set on the generated access tokens.
     */
    constructor(scopes = [DEFAULT_OAUTH_SCOPE]) {
        this.metadataServerTokenRetriever = new http_server_request_handler_1.HttpServerRequestHandler({
            method: 'GET',
            url: `${METADATA_SERVER_ACCESS_TOKEN_URL}?scopes=${scopes.join(',')}`,
            headers: {
                'Metadata-Flavor': 'Google',
            },
            timeout: TIMEOUT_DURATION,
        });
    }
    /**
     * @return A promise that resolves with a Google OAuth access token.
     *     A cached token is returned if it is not yet expired.
     */
    getAccessToken(forceRefresh = false) {
        const currentTime = new Date().getTime();
        if (!forceRefresh &&
            (this.accessToken &&
                currentTime + exports.OFFSET <= this.expirationTime)) {
            return Promise.resolve({
                access_token: this.accessToken,
                expires_in: (this.expirationTime - currentTime) / 1000,
            });
        }
        return this.metadataServerTokenRetriever.send(null, DEFAULT_ERROR_MESSAGE)
            .then((httpResponse) => {
            if (httpResponse.statusCode === 200 && httpResponse.body) {
                const tokenResponse = typeof httpResponse.body === 'object' ?
                    httpResponse.body : JSON.parse(httpResponse.body);
                this.accessToken = tokenResponse.access_token;
                this.expirationTime = currentTime + (tokenResponse.expires_in * 1000);
                return tokenResponse;
            }
            else {
                throw new Error(DEFAULT_ERROR_MESSAGE);
            }
        });
    }
    /** Reset cached access tokens. */
    reset() {
        this.accessToken = null;
    }
}
exports.TokenManager = TokenManager;
