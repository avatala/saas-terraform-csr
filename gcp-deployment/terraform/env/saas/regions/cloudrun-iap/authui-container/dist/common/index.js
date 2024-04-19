"use strict";
/*!
 * Copyright 2020 Google Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
Object.defineProperty(exports, "__esModule", { value: true });
exports.isLastCharLetterOrNumber = exports.isSafeUrl = exports.sanitizeUrl = exports.mapObject = exports.formatString = exports.removeUndefinedFields = exports.addReadonlyGetter = void 0;
const validator_1 = require("./validator");
// REGEX pattern for safe URL.
const SAFE_URL_PATTERN = /^(?:(?:https?|mailto|ftp):|[^:/?#]*(?:[/?#]|$))/i;
/**
 * The innocuous string returned when an unsafe URL is to be sanitized.
 * about:invalid is registered in
 * http://www.w3.org/TR/css3-values/#about-invalid.
 */
const INNOCUOUS_STRING = 'about:invalid';
/**
 * Defines a new read-only property directly on an object and returns the object.
 *
 * @param obj The object on which to define the property.
 * @param prop The name of the property to be defined or modified.
 * @param value The value associated with the property.
 */
function addReadonlyGetter(obj, prop, value) {
    Object.defineProperty(obj, prop, {
        value,
        // Make this property read-only.
        writable: false,
        // Include this property during enumeration of obj's properties.
        enumerable: true,
    });
}
exports.addReadonlyGetter = addReadonlyGetter;
/**
 * Removes entries in an object whose values are undefined and returns the same
 * object. This only removes the top-level undefined fields.
 *
 * @param obj The object whose undefined fields are to be removed.
 * @return The same object with undefined fields removed.
 */
function removeUndefinedFields(obj) {
    // If obj is not a non-null object, return it back.
    if (!validator_1.isNonNullObject(obj)) {
        return obj;
    }
    for (const key in obj) {
        if (typeof obj[key] === 'undefined') {
            delete obj[key];
        }
    }
    return obj;
}
exports.removeUndefinedFields = removeUndefinedFields;
/**
 * Formats a string of form 'project/{projectId}/{api}' and replaces
 * with corresponding arguments {projectId: '1234', api: 'resource'}
 * and returns output: 'project/1234/resource'.
 *
 * @param str The original string where the param need to be
 *     replaced.
 * @param params The optional parameters to replace in the
 *     string.
 * @return The resulting formatted string.
 */
function formatString(str, params) {
    let formatted = str;
    Object.keys(params || {}).forEach((key) => {
        formatted = formatted.replace(new RegExp('{' + key + '}', 'g'), params[key]);
    });
    return formatted;
}
exports.formatString = formatString;
/**
 * Maps an object's value based on the provided callback function.
 *
 * @param obj The object to map.
 * @param cb The callback function used to compute the new mapped value.
 * @return The mapped new object.
 */
function mapObject(obj, cb) {
    const mappedObject = {};
    Object.keys(obj).forEach((key) => {
        mappedObject[key] = cb(key, obj[key]);
    });
    return mappedObject;
}
exports.mapObject = mapObject;
/**
 * Sanitizes the URL provided.
 *
 * @param url The unsanitized URL.
 * @return The sanitized URL.
 */
function sanitizeUrl(url) {
    if (!isSafeUrl(url)) {
        return INNOCUOUS_STRING;
    }
    return url;
}
exports.sanitizeUrl = sanitizeUrl;
/**
 * @param url The URL to validate for safety.
 * @return Whether the URL is safe to use.
 */
function isSafeUrl(url) {
    return SAFE_URL_PATTERN.test(url);
}
exports.isSafeUrl = isSafeUrl;
/**
 * @param str The string to check.
 * @return Whether the string ends with a letter or number.
 */
function isLastCharLetterOrNumber(str) {
    const lastChar = str.charAt(str.length - 1);
    return !!lastChar.match(/[a-z0-9]/i);
}
exports.isLastCharLetterOrNumber = isLastCharLetterOrNumber;
