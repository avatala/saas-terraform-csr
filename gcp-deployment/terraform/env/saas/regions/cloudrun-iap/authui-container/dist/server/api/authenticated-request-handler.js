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
exports.AuthenticatedRequestHandler = void 0;
const deep_copy_1 = require("../../common/deep-copy");
const http_server_request_handler_1 = require("../../server/utils/http-server-request-handler");
/** Utility for sending authenticated server side HTTP requests. */
class AuthenticatedRequestHandler extends http_server_request_handler_1.HttpServerRequestHandler {
    /**
     * Instantiates an authenticated request handler instance using the access token manager
     * provided.
     * @param baseOptions The base options for the request.
     * @param accessTokenManager The access token manager used to facilitate retrieval of OAuth access tokens.
     * @param logger The optional logging function used to log request information for debugging purposes.
     *   This can be accessed via Cloud Run LOGS tab.
     */
    constructor(baseOptions, accessTokenManager, logger) {
        super(baseOptions, logger);
        this.accessTokenManager = accessTokenManager;
    }
    /**
     * Sends the specified request options to the underlying endpoint while injecting an
     * OAuth access token in the request header.
     * @param requestOptions The variable request options to append to base config options.
     * @param defaultMessage The default error message if none is available in the response.
     * @return A promise that resolves with the full response.
     */
    send(requestOptions, defaultMessage) {
        const modifiedRequestOptions = deep_copy_1.deepCopy(requestOptions || {});
        if (typeof modifiedRequestOptions.headers === 'undefined') {
            modifiedRequestOptions.headers = {};
        }
        // Get OAuth access token and add to header.
        return this.accessTokenManager.getAccessToken()
            .then((accessToken) => {
            // Inject access token to request.
            modifiedRequestOptions.headers.Authorization = `Bearer ${accessToken}`;
            return super.send(modifiedRequestOptions, defaultMessage);
        });
    }
}
exports.AuthenticatedRequestHandler = AuthenticatedRequestHandler;
