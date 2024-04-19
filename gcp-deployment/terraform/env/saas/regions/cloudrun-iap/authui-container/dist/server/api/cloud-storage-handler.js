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
exports.CloudStorageHandler = exports.DEFAULT_ERROR_MESSAGE_LIST_BUCKETS = exports.DEFAULT_ERROR_MESSAGE_WRITE_FILE = exports.DEFAULT_ERROR_MESSAGE_READ_FILE = exports.DEFAULT_ERROR_MESSAGE_CREATE_BUCKET = void 0;
const authenticated_request_handler_1 = require("./authenticated-request-handler");
/** GCS create bucket endpoint. */
const GCS_CREATE_BUCKET_URL = 'https://storage.googleapis.com/storage/v1/b?project={projectId}';
/** GCS read file endpoint. */
const GCS_READ_FILE_URL = 'https://storage.googleapis.com/storage/v1/b/{bucketName}/o/{fileName}?alt=media';
/** GCS write file endpoint. */
const GCS_WRITE_FILE_URL = 'https://storage.googleapis.com/upload/storage/v1/b/{bucketName}/o?uploadType=media&name={fileName}';
/** GCS list buckets permissions endpoint. */
const GCS_LIST_BUCKETS_URL = GCS_CREATE_BUCKET_URL;
/** Default error message to show when a GCS bucket cannot be created. */
exports.DEFAULT_ERROR_MESSAGE_CREATE_BUCKET = 'Unable to create GCS bucket.';
/** Default error message to show when a GCS bucket file cannot be read. */
exports.DEFAULT_ERROR_MESSAGE_READ_FILE = 'Unable to read GCS file.';
/** Default error message to show when a GCS bucket file cannot be written to. */
exports.DEFAULT_ERROR_MESSAGE_WRITE_FILE = 'Unable to write to GCS file.';
/** Default error message to show when GCS buckets cannot be listed. */
exports.DEFAULT_ERROR_MESSAGE_LIST_BUCKETS = 'Unable to list GCS buckets.';
/** Network request timeout duration. */
const TIMEOUT_DURATION = 10000;
/**
 * Utility used to make API calls to GCS. This supports the ability to create
 * storage backets, read and write to them.
 * OAuth scope required: https://www.googleapis.com/auth/devstorage.read_write
 */
class CloudStorageHandler {
    /**
     * Instantiates a Cloud Storage API handler.
     * @param app The application data.
     * @param accessTokenManager The access token manager.
     */
    constructor(app, accessTokenManager) {
        this.app = app;
        this.accessTokenManager = accessTokenManager;
        this.createBucketHandler = new authenticated_request_handler_1.AuthenticatedRequestHandler({
            method: 'POST',
            url: GCS_CREATE_BUCKET_URL,
            timeout: TIMEOUT_DURATION,
        }, this.accessTokenManager, app.log.bind(app));
        this.readFileHandler = new authenticated_request_handler_1.AuthenticatedRequestHandler({
            method: 'GET',
            url: GCS_READ_FILE_URL,
            timeout: TIMEOUT_DURATION,
        }, this.accessTokenManager, app.log.bind(app));
        this.writeFileHandler = new authenticated_request_handler_1.AuthenticatedRequestHandler({
            method: 'POST',
            url: GCS_WRITE_FILE_URL,
            timeout: TIMEOUT_DURATION,
        }, this.accessTokenManager, app.log.bind(app));
        this.listBucketsHandler = new authenticated_request_handler_1.AuthenticatedRequestHandler({
            method: 'GET',
            url: GCS_LIST_BUCKETS_URL,
            timeout: TIMEOUT_DURATION,
        }, this.accessTokenManager, app.log.bind(app));
    }
    /**
     * Creates a new bucket using the name provided.
     * @param bucketName The name of the bucket to be created.
     * @return A promise that resolves on successful creation.
     */
    createBucket(bucketName) {
        let urlParams;
        return this.app.getProjectId()
            .then((projectId) => {
            urlParams = {
                projectId,
            };
            return this.app.getZone();
        })
            .then((zone) => {
            return this.createBucketHandler.send({
                urlParams,
                body: {
                    name: bucketName,
                    location: zone.toUpperCase(),
                    storageClass: 'STANDARD',
                },
            }, exports.DEFAULT_ERROR_MESSAGE_CREATE_BUCKET);
        })
            .then((httpResponse) => {
            // Return nothing.
        });
    }
    /**
     * Reads a Cloud Storage bucket for a specified JSON file contents.
     * @param bucketName The name of the bucket where the file is located.
     * @param fileName The name of the file to be read.
     * @return A promise that resolves with the content of the file.
     */
    readFile(bucketName, fileName) {
        return this.readFileHandler.send({
            urlParams: {
                bucketName,
                fileName,
            },
        }, exports.DEFAULT_ERROR_MESSAGE_READ_FILE).then((httpResponse) => {
            return typeof httpResponse.body === 'object' ?
                httpResponse.body : JSON.parse(httpResponse.body);
        });
    }
    /**
     * Writes to a Cloud Storage bucket file.
     * @param bucketName The name of the bucket where the file is located.
     * @param fileName The name of the file to write to.
     * @return A promise that resolves on successful write.
     */
    writeFile(bucketName, fileName, content) {
        return this.writeFileHandler.send({
            urlParams: {
                bucketName,
                fileName,
            },
            body: content,
        }, exports.DEFAULT_ERROR_MESSAGE_WRITE_FILE).then((httpResponse) => {
            // Return nothing.
        });
    }
    /**
     * Returns a list of all GCS buckets.
     * When a user does not have permissions to list the buckets, the error is returned:
     * {
     *   error: {
     *     code: 403,
     *     message: 'EMAIL does not have storage.buckets.list access to project PROJECT_NUMBER.',
     *     errors: [
     *       {
     *         message: 'EMAIL does not have storage.buckets.list access to project PROJECT_NUMBER.',
     *         domain: 'global',
     *         reason: 'forbidden'
     *       }
     *     ]
     *   }
     * }
     * @return A promise that resolves with the listed buckets.
     */
    listBuckets() {
        return this.app.getProjectId()
            .then((projectId) => {
            return this.listBucketsHandler.send({
                urlParams: {
                    projectId,
                },
            }, exports.DEFAULT_ERROR_MESSAGE_LIST_BUCKETS);
        })
            .then((httpResponse) => {
            return typeof httpResponse.body === 'object' ?
                httpResponse.body : JSON.parse(httpResponse.body);
        });
    }
}
exports.CloudStorageHandler = CloudStorageHandler;
