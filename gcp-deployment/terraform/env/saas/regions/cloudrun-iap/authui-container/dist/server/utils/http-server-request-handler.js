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
exports.HttpServerRequestHandler = void 0;
const requestPromise = require("request-promise");
const deep_copy_1 = require("../../common/deep-copy");
const validator_1 = require("../../common/validator");
const index_1 = require("../../common/index");
const url_1 = require("url");
/** Default error message to shown when an expected non-200 response is returned. */
const DEFAULT_ERROR_MESSAGE = 'Unexpected error occurred.';
/** Defines a utility for sending server side HTTP requests. */
class HttpServerRequestHandler {
    /**
     * Instantiates an HttpServerRequest instance used for sending server side HTTP requests
     * using the provided base configuration.
     * @param baseOptions The base options for the request.
     * @param logger The optional logging function used to log request information for debugging purposes.
     *   This can be accessed via Cloud Run LOGS tab.
     */
    constructor(baseOptions, logger) {
        this.logger = logger;
        this.baseRequestPromiseOptions = deep_copy_1.deepExtend({
            // Send request in JSON format.
            json: true,
            // Resolve promise with full response.
            resolveWithFullResponse: true,
            // This will resolve promise with full response even for non 2xx http status codes.
            simple: false,
        }, baseOptions);
    }
    /**
     * Sends the specified request options to the underlying endpoint.
     * @param requestOptions The variable request options to append to base config options.
     * @param defaultMessage The default error message if none is available in the response.
     * @return A promise that resolves with the full response.
     */
    send(requestOptions, defaultMessage = DEFAULT_ERROR_MESSAGE) {
        const requestPromiseOptions = deep_copy_1.deepCopy(this.baseRequestPromiseOptions);
        // Replace placeholders in the URL with their values if available.
        if (requestOptions && requestOptions.urlParams) {
            requestPromiseOptions.url = index_1.formatString(requestPromiseOptions.url, requestOptions.urlParams);
        }
        if (requestOptions && requestOptions.body) {
            if (requestPromiseOptions.method === 'GET' || requestPromiseOptions.method === 'HEAD') {
                if (!validator_1.isNonNullObject(requestOptions.body)) {
                    return Promise.reject(new Error('Invalid GET request data'));
                }
                // Parse URL and append data to query string.
                const parsedUrl = new url_1.URL(requestPromiseOptions.url);
                const dataObj = requestOptions.body;
                for (const key in dataObj) {
                    if (dataObj.hasOwnProperty(key)) {
                        parsedUrl.searchParams.append(key, dataObj[key]);
                    }
                }
                requestPromiseOptions.url = parsedUrl.toString();
            }
            else {
                requestPromiseOptions.body = requestOptions.body;
            }
        }
        if (requestOptions && requestOptions.headers) {
            requestPromiseOptions.headers = requestPromiseOptions.headers || {};
            for (const key in requestOptions.headers) {
                if (requestOptions.headers.hasOwnProperty(key)) {
                    requestPromiseOptions.headers[key] = requestOptions.headers[key];
                }
            }
        }
        // Log requests. Do not log headers as they can contain sensitive OAuth access tokens.
        this.log(`${requestPromiseOptions.method} to ${requestPromiseOptions.url}`);
        if (requestPromiseOptions.body) {
            this.log('Request body:', requestPromiseOptions.body);
        }
        return Promise.resolve(requestPromise(requestPromiseOptions))
            .catch((reason) => {
            this.log('Error encountered:', reason.error);
            throw reason.error;
        })
            .then((httpResponse) => {
            // To be safe, we will not log successful responses as they may contain
            // sensitive information like OAuth client secrets, hashing secret keys, etc.
            // Logging is mainly needed for debugging issues.
            if (httpResponse.statusCode !== 200) {
                this.log(`${httpResponse.statusCode} Response:`, httpResponse.body);
                const parsedError = this.getError(httpResponse, defaultMessage);
                throw parsedError;
            }
            else {
                this.log(`${httpResponse.statusCode} response`);
            }
            return httpResponse;
        });
    }
    /**
     * Logs the network request operation if a logger is available.
     * @param args The list of arguments to log.
     */
    log(...args) {
        if (this.logger) {
            this.logger(...args);
        }
    }
    /**
     * Returns the Error objects from the non-200 HTTP response.
     * @param httpResponse The non-200 HTTP response.
     * @param defaultMessage The default error message if none is available in the response.
     * @return The corresponding Error object.
     */
    getError(httpResponse, defaultMessage) {
        let jsonResponse;
        let error;
        try {
            jsonResponse = typeof httpResponse.body === 'object' ?
                httpResponse.body : JSON.parse(httpResponse.body);
            error = new Error((jsonResponse &&
                jsonResponse.error &&
                jsonResponse.error.message &&
                jsonResponse.error.message.toString()) || defaultMessage);
        }
        catch (e) {
            // If the error response body is a string. Use the string as the error message.
            // This is the case for GCS:
            // response.body === 'No such object: gcip-iap-bucket-625969875839/config.json'
            // response.body === 'Not found'
            error = new Error(typeof httpResponse.body === 'string' ? httpResponse.body : defaultMessage);
        }
        if (jsonResponse &&
            jsonResponse.error &&
            jsonResponse.error.message &&
            jsonResponse.error.code) {
            index_1.addReadonlyGetter(error, 'cloudCompliant', true);
        }
        else {
            index_1.addReadonlyGetter(error, 'cloudCompliant', false);
        }
        index_1.addReadonlyGetter(error, 'rawResponse', httpResponse.body);
        // Append status code as it is more reliable than error messages.
        index_1.addReadonlyGetter(error, 'statusCode', httpResponse.statusCode);
        return error;
    }
}
exports.HttpServerRequestHandler = HttpServerRequestHandler;
