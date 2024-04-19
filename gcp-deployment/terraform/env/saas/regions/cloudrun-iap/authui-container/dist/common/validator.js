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
exports.JsonObjectValidator = exports.isSafeString = exports.isValidColorString = exports.isEmptyObject = exports.isProviderId = exports.isEmail = exports.isLocalhostOrHttpsURL = exports.isHttpsURL = exports.isURL = exports.isNonNullObject = exports.isObject = exports.isNonEmptyString = exports.isString = exports.isNumber = exports.isBoolean = exports.isNonEmptyArray = exports.isArray = void 0;
const url = __importStar(require("url"));
// TODO: find cleaner way to have this work client and server side.
const URL = url.URL || (window && window.URL);
/** Basic IPv4 address regex matcher. */
const IP_ADDRESS_REGEXP = /^\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}$/;
/**
 * Validates that a value is an array.
 *
 * @param value The value to validate.
 * @return Whether the value is an array or not.
 */
function isArray(value) {
    return Array.isArray(value);
}
exports.isArray = isArray;
/**
 * Validates that a value is a non-empty array.
 *
 * @param value The value to validate.
 * @return Whether the value is a non-empty array or not.
 */
function isNonEmptyArray(value) {
    return isArray(value) && value.length !== 0;
}
exports.isNonEmptyArray = isNonEmptyArray;
/**
 * Validates that a value is a boolean.
 *
 * @param value The value to validate.
 * @return Whether the value is a boolean or not.
 */
function isBoolean(value) {
    return typeof value === 'boolean';
}
exports.isBoolean = isBoolean;
/**
 * Validates that a value is a number.
 *
 * @param value The value to validate.
 * @return Whether the value is a number or not.
 */
function isNumber(value) {
    return typeof value === 'number' && !isNaN(value);
}
exports.isNumber = isNumber;
/**
 * Validates that a value is a string.
 *
 * @param value The value to validate.
 * @return Whether the value is a string or not.
 */
function isString(value) {
    return typeof value === 'string';
}
exports.isString = isString;
/**
 * Validates that a value is a non-empty string.
 *
 * @param value The value to validate.
 * @return Whether the value is a non-empty string or not.
 */
function isNonEmptyString(value) {
    return isString(value) && value !== '';
}
exports.isNonEmptyString = isNonEmptyString;
/**
 * Validates that a value is a nullable object.
 *
 * @param value The value to validate.
 * @return Whether the value is an object or not.
 */
function isObject(value) {
    return typeof value === 'object' && !isArray(value);
}
exports.isObject = isObject;
/**
 * Validates that a value is a non-null object.
 *
 * @param value The value to validate.
 * @return Whether the value is a non-null object or not.
 */
function isNonNullObject(value) {
    return isObject(value) && value !== null;
}
exports.isNonNullObject = isNonNullObject;
/**
 * Validates that a string is a valid web URL.
 *
 * @param urlStr The string to validate.
 * @return Whether the string is valid web URL or not.
 */
function isURL(urlStr) {
    if (typeof urlStr !== 'string') {
        return false;
    }
    // Lookup illegal characters.
    const re = /[^a-z0-9\:\/\?\#\[\]\@\!\$\&\'\(\)\*\+\,\;\=\.\-\_\~\%]/i;
    if (re.test(urlStr)) {
        return false;
    }
    try {
        const uri = new URL(urlStr);
        const scheme = uri.protocol;
        const hostname = uri.hostname;
        const pathname = uri.pathname;
        if (scheme !== 'http:' && scheme !== 'https:') {
            return false;
        }
        // Validate hostname: Can contain letters, numbers, underscore and dashes separated by a dot.
        // Each zone must not start with a hyphen or underscore.
        if (!/^[a-zA-Z0-9]+[\w\-]*([\.]?[a-zA-Z0-9]+[\w\-]*)*$/.test(hostname)) {
            return false;
        }
        // Allow for pathnames: (/+chars+)*/*
        // Where chars can be a combination of: a-z A-Z 0-9 - _ . ~ ! $ & ' ( ) * + , ; = : @ %
        const pathnameRe = /^(\/+[\w\-\.\~\!\$\'\(\)\*\+\,\;\=\:\@\%]+)*\/*$/;
        // Validate pathname.
        if (pathname &&
            !/^\/+$/.test(pathname) &&
            !pathnameRe.test(pathname)) {
            return false;
        }
        // Allow any query string and hash as long as no invalid character is used.
    }
    catch (e) {
        return false;
    }
    return true;
}
exports.isURL = isURL;
/**
 * Validates that a string is a valid HTTPS URL.
 *
 * @param urlStr The string to validate.
 * @return Whether the string is valid HTTPS URL or not.
 */
function isHttpsURL(urlStr) {
    return isURL(urlStr) && new URL(urlStr).protocol === 'https:';
}
exports.isHttpsURL = isHttpsURL;
/**
 * Validates that a string is localhost or a valid HTTPS URL.
 * This is needed to facilitate testing. As localhost is always served locally, there is no
 * risk of man in the middle attack.
 *
 * @param urlStr The string to validate.
 * @return Whether the string is localhost/valid HTTPS URL or not.
 */
function isLocalhostOrHttpsURL(urlStr) {
    if (isURL(urlStr)) {
        const uri = new URL(urlStr);
        return (uri.protocol === 'http:' && uri.hostname === 'localhost') ||
            uri.protocol === 'https:';
    }
    return false;
}
exports.isLocalhostOrHttpsURL = isLocalhostOrHttpsURL;
/**
 * Validates that a string is a valid email.
 *
 * @param email The string to validate.
 * @return Whether the string is valid email or not.
 */
function isEmail(email) {
    if (typeof email !== 'string') {
        return false;
    }
    // There must at least one character before the @ symbol and another after.
    const re = /^[^@]+@[^@]+$/;
    return re.test(email);
}
exports.isEmail = isEmail;
/**
 * Validates that a string is a valid provider ID.
 *
 * @param providerId The string to validate.
 * @return Whether the string is valid provider ID or not.
 */
function isProviderId(providerId) {
    if (typeof providerId !== 'string') {
        return false;
    }
    // This check is quite lax. It may be tightened in the future.
    const re = /^[a-zA-Z0-9\-\_\.]+$/;
    return isNonEmptyString(providerId) && re.test(providerId);
}
exports.isProviderId = isProviderId;
/**
 * Validates that a value is an empty object.
 *
 * @param value The value to validate.
 * @return Whether the value is an empty object.
 */
function isEmptyObject(value) {
    return isNonNullObject(value) && Object.keys(value).length === 0 && value.constructor === Object;
}
exports.isEmptyObject = isEmptyObject;
/**
 * Validates that the input in a valid color string of format #00ff00.
 *
 * @param value The string to validate.
 * @return Whether the string is a valid color string.
 */
function isValidColorString(value) {
    if (typeof value !== 'string') {
        return false;
    }
    // Actually raw strings and rgba(50, 75, 75, 1) formats are allowed but for
    // simplicity limit to this format.
    const re = /^#[0-9a-f]{6}$/i;
    return isNonEmptyString(value) && re.test(value);
}
exports.isValidColorString = isValidColorString;
/**
 * Validates that the input is a safe string. This minimizes the risk of XSS.
 *
 * @param value The string to validate.
 * @return Whether the string is safe or not.
 */
function isSafeString(value) {
    if (typeof value !== 'string') {
        return false;
    }
    // This check only allows limited set of characters and spaces.
    const re = /^[a-zA-Z0-9\-\_\.\s\,\+\?\!\&\;]+$/;
    return isNonEmptyString(value) && re.test(value);
}
exports.isSafeString = isSafeString;
/**
 * Utility used to validate a JSON object with nested content using a provided validation tree structure.
 * For the following interface:
 * interface MyStructure {
 *   [key: string]: {
 *     key1: string;
 *     key2: string[];
 *     key3: {
 *       key4: (boolean | {key5: number});
 *     };
 *   };
 * }
 *
 * The following ValidationTree is provided:
 * const VALIDATION_TREE = {
 *   '*': {
 *     nodes: {
 *       key1: {
 *         validator: (input: any) => { // if input not string, throw },
 *       },
 *       key2[]: {
 *         validator: (input: any) => { // if input not string, throw },
 *       },
 *       key3: {
 *         nodes: {
 *           key4: {
 *             validator: (input: any) => { // if input not boolean, throw },
 *             nodes: {
 *               key5: {
 *                 validator: (input: any) => { // if input not number, throw },
 *               },
 *             },
 *           },
 *         },
 *       },
 *     },
 *   },
 * };
 * Required fields can also be enforced:
 * const requiredFields = ['*.key1', '*.key2[]', '*.key3.key4.key5'];
 */
class JsonObjectValidator {
    /**
     * Instantiates a JSON object validator using the provided validation tree.
     * @param validationTree The validation tree to use.
     * @param requiredFields list of required field paths.
     */
    constructor(validationTree, requiredFields = []) {
        this.validationTree = validationTree;
        this.requiredFields = requiredFields;
    }
    /**
     * Validates the provided object.
     * @param obj The object to validate.
     */
    validate(obj) {
        this.validateJson(obj, []);
        this.checkRequiredFields(obj);
    }
    /**
     * Validates that all required fields are provided.
     * @param obj The object to validate.
     */
    checkRequiredFields(obj) {
        for (const requiredField of this.requiredFields) {
            this.validateRequired(obj, requiredField.split('.'), requiredField);
        }
    }
    /**
     * Validates that the list of component keys are available in the provided object.
     * @param obj The object to validate.
     * @param components The array of keys to continue traversing to ensure availability.
     * @param path The full path, useful for providing details in the error message.
     */
    validateRequired(obj, components, path) {
        if (!components.length) {
            return;
        }
        const component = components[0];
        if (component === '*') {
            const allKeys = Object.keys(obj);
            if (!allKeys.length) {
                throw new Error(`Missing required field "${path}"`);
            }
            for (const key of allKeys) {
                this.validateRequired(obj[key], components.slice(1), path);
            }
        }
        else if (component.substring(component.length - 2) === '[]') {
            const prefixKey = component.substring(0, component.length - 2);
            if (!isArray(obj[prefixKey])) {
                throw new Error(`Missing required field "${path}"`);
            }
            for (const entry of obj[prefixKey]) {
                this.validateRequired(entry, components.slice(1), path);
            }
        }
        else if (obj.hasOwnProperty(component)) {
            this.validateRequired(obj[component], components.slice(1), path);
        }
        else {
            throw new Error(`Missing required field "${path}"`);
        }
    }
    /**
     * Returns the validator function for the provided path. If not found, null is returned.
     * @param pathSoFar The path so far in the nested JSON object.
     * @return The validation function for the specified path, null if not found.
     */
    getValidator(pathSoFar) {
        let currentNode = this.validationTree;
        let currentValidator = null;
        for (const currentKey of pathSoFar) {
            // For variable object keys, * is used in the validation tree.
            if (currentNode.hasOwnProperty('*')) {
                currentValidator = currentNode['*'].validator || ((value, key) => {
                    if (!isEmptyObject(value)) {
                        throw new Error(`Invalid value for "${key}"`);
                    }
                });
                currentNode = currentNode['*'].nodes || {};
            }
            else if (currentNode.hasOwnProperty(currentKey)) {
                currentValidator = currentNode[currentKey].validator || ((value, key) => {
                    if (!isEmptyObject(value)) {
                        throw new Error(`Invalid value for "${key}"`);
                    }
                });
                currentNode = currentNode[currentKey].nodes || {};
            }
            else {
                // Not found.
                return null;
            }
        }
        return currentValidator || null;
    }
    /**
     * Recursive internal validator.
     * @param obj The object to validate.
     * @param pathSoFar The path so far in the object.
     */
    validateJson(obj, pathSoFar = []) {
        if (isNonEmptyArray(obj)) {
            const key = pathSoFar.pop() || '';
            pathSoFar.push(`${key}[]`);
            obj.forEach((item) => {
                this.validateJson(item, pathSoFar);
            });
            pathSoFar.pop();
            if (key) {
                pathSoFar.push(key);
            }
        }
        else if (isNonNullObject(obj) && !isEmptyObject(obj)) {
            for (const key in obj) {
                if (obj.hasOwnProperty(key)) {
                    pathSoFar.push(key);
                    this.validateJson(obj[key], pathSoFar);
                    pathSoFar.pop();
                }
            }
        }
        else if (isEmptyObject(obj)) {
            const validator = this.getValidator(pathSoFar);
            if (!validator) {
                throw new Error(`Invalid key or type "${pathSoFar.join('.')}"`);
            }
        }
        else if (isArray(obj) && obj.length === 0) {
            const key = pathSoFar.pop() || '';
            pathSoFar.push(`${key}[]`);
            const validator = this.getValidator(pathSoFar);
            if (!validator) {
                throw new Error(`Invalid key or type "${pathSoFar.join('.')}"`);
            }
        }
        else {
            const validator = this.getValidator(pathSoFar);
            if (!validator) {
                throw new Error(`Invalid key or type "${pathSoFar.join('.')}"`);
            }
            validator(obj, pathSoFar.join('.'));
        }
    }
}
exports.JsonObjectValidator = JsonObjectValidator;
