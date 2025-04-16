// AUTO-GENERATED FILE. DO NOT MODIFY.
// This file is auto-generated by the Ballerina OpenAPI tool.

// Copyright (c) 2024, WSO2 LLC. (http://www.wso2.org).
//
// WSO2 LLC. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.

import ballerina/data.jsondata;
import ballerina/http;

# The Gmail API lets you view and manage Gmail mailbox data like threads, messages, and labels.
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    #
    # + config - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ConnectionConfig config, string serviceUrl = "https://gmail.googleapis.com/gmail/v1") returns error? {
        http:ClientConfiguration httpClientConfig = {auth: config.auth, httpVersion: config.httpVersion, http1Settings: config.http1Settings, http2Settings: config.http2Settings, timeout: config.timeout, forwarded: config.forwarded, followRedirects: config.followRedirects, poolConfig: config.poolConfig, cache: config.cache, compression: config.compression, circuitBreaker: config.circuitBreaker, retryConfig: config.retryConfig, cookieConfig: config.cookieConfig, responseLimits: config.responseLimits, secureSocket: config.secureSocket, proxy: config.proxy, socketConfig: config.socketConfig, validation: config.validation, laxDataBinding: config.laxDataBinding};
        self.clientEp = check new (serviceUrl, httpClientConfig);
    }

    # Lists the drafts in the user's mailbox.
    #
    # + userId - The user's email address. The special value `me` can be used to indicate the authenticated user
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Successful response 
    resource isolated function get users/[string userId]/drafts(map<string|string[]> headers = {}, *GmailUsersDraftsListQueries queries) returns ListDraftsResponse|error {
        string resourcePath = string `/users/${getEncodedUri(userId)}/drafts`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    # Creates a new draft with the `DRAFT` label.
    #
    # + userId - The user's email address. The special value `me` can be used to indicate the authenticated user
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + payload - The draft to create 
    # + return - Successful response 
    resource isolated function post users/[string userId]/drafts(Draft payload, map<string|string[]> headers = {}, *GmailUsersDraftsCreateQueries queries) returns Draft|error {
        string resourcePath = string `/users/${getEncodedUri(userId)}/drafts`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, headers);
    }

    # Sends the specified, existing draft to the recipients in the `To`, `Cc`, and `Bcc` headers.
    #
    # + userId - The user's email address. The special value `me` can be used to indicate the authenticated user
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + payload - The ID of the existing draft to send. (Optional) Updated draft if necessary 
    # + return - Successful response 
    resource isolated function post users/[string userId]/drafts/send(Draft payload, map<string|string[]> headers = {}, *GmailUsersDraftsSendQueries queries) returns Message|error {
        string resourcePath = string `/users/${getEncodedUri(userId)}/drafts/send`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, headers);
    }

    # Gets the specified draft.
    #
    # + userId - The user's email address. The special value `me` can be used to indicate the authenticated user
    # + id - The ID of the draft to retrieve
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Successful response 
    resource isolated function get users/[string userId]/drafts/[string id](map<string|string[]> headers = {}, *GmailUsersDraftsGetQueries queries) returns Draft|error {
        string resourcePath = string `/users/${getEncodedUri(userId)}/drafts/${getEncodedUri(id)}`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    # Replaces a draft's content.
    #
    # + userId - The user's email address. The special value `me` can be used to indicate the authenticated user
    # + id - The ID of the draft to update
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + payload - The updated draft to update 
    # + return - Successful response 
    resource isolated function put users/[string userId]/drafts/[string id](Draft payload, map<string|string[]> headers = {}, *GmailUsersDraftsUpdateQueries queries) returns Draft|error {
        string resourcePath = string `/users/${getEncodedUri(userId)}/drafts/${getEncodedUri(id)}`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    # Immediately and permanently deletes the specified draft. Does not simply trash it.
    #
    # + userId - The user's email address. The special value `me` can be used to indicate the authenticated user
    # + id - The ID of the draft to delete
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Successful response 
    resource isolated function delete users/[string userId]/drafts/[string id](map<string|string[]> headers = {}, *GmailUsersDraftsDeleteQueries queries) returns error? {
        string resourcePath = string `/users/${getEncodedUri(userId)}/drafts/${getEncodedUri(id)}`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->delete(resourcePath, headers = headers);
    }

    # Lists the history of all changes to the given mailbox. History results are returned in chronological order (increasing `historyId`).
    #
    # + userId - The user's email address. The special value `me` can be used to indicate the authenticated user
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Successful response 
    resource isolated function get users/[string userId]/history(map<string|string[]> headers = {}, *GmailUsersHistoryListQueries queries) returns ListHistoryResponse|error {
        string resourcePath = string `/users/${getEncodedUri(userId)}/history`;
        map<Encoding> queryParamEncoding = {"historyTypes": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queries, queryParamEncoding);
        return self.clientEp->get(resourcePath, headers);
    }

    # Lists all labels in the user's mailbox.
    #
    # + userId - The user's email address. The special value `me` can be used to indicate the authenticated user
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Successful response 
    resource isolated function get users/[string userId]/labels(map<string|string[]> headers = {}, *GmailUsersLabelsListQueries queries) returns ListLabelsResponse|error {
        string resourcePath = string `/users/${getEncodedUri(userId)}/labels`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    # Creates a new label.
    #
    # + userId - The user's email address. The special value `me` can be used to indicate the authenticated user
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + payload - The label to create 
    # + return - Successful response 
    resource isolated function post users/[string userId]/labels(Label payload, map<string|string[]> headers = {}, *GmailUsersLabelsCreateQueries queries) returns Label|error {
        string resourcePath = string `/users/${getEncodedUri(userId)}/labels`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, headers);
    }

    # Gets the specified label.
    #
    # + userId - The user's email address. The special value `me` can be used to indicate the authenticated user
    # + id - The ID of the label to retrieve
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Successful response 
    resource isolated function get users/[string userId]/labels/[string id](map<string|string[]> headers = {}, *GmailUsersLabelsGetQueries queries) returns Label|error {
        string resourcePath = string `/users/${getEncodedUri(userId)}/labels/${getEncodedUri(id)}`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    # Updates the specified label.
    #
    # + userId - The user's email address. The special value `me` can be used to indicate the authenticated user
    # + id - The ID of the label to update
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + payload - The updated label to update 
    # + return - Successful response 
    resource isolated function put users/[string userId]/labels/[string id](Label payload, map<string|string[]> headers = {}, *GmailUsersLabelsUpdateQueries queries) returns Label|error {
        string resourcePath = string `/users/${getEncodedUri(userId)}/labels/${getEncodedUri(id)}`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    # Immediately and permanently deletes the specified label and removes it from any messages and threads that it is applied to.
    #
    # + userId - The user's email address. The special value `me` can be used to indicate the authenticated user
    # + id - The ID of the label to delete
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Successful response 
    resource isolated function delete users/[string userId]/labels/[string id](map<string|string[]> headers = {}, *GmailUsersLabelsDeleteQueries queries) returns error? {
        string resourcePath = string `/users/${getEncodedUri(userId)}/labels/${getEncodedUri(id)}`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->delete(resourcePath, headers = headers);
    }

    # Patch the specified label.
    #
    # + userId - The user's email address. The special value `me` can be used to indicate the authenticated user
    # + id - The ID of the label to update
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + payload - The updated label to update 
    # + return - Successful response 
    resource isolated function patch users/[string userId]/labels/[string id](Label payload, map<string|string[]> headers = {}, *GmailUsersLabelsPatchQueries queries) returns Label|error {
        string resourcePath = string `/users/${getEncodedUri(userId)}/labels/${getEncodedUri(id)}`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->patch(resourcePath, request, headers);
    }

    # Lists the messages in the user's mailbox.
    #
    # + userId - The user's email address. The special value `me` can be used to indicate the authenticated user
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Successful response 
    resource isolated function get users/[string userId]/messages(map<string|string[]> headers = {}, *GmailUsersMessagesListQueries queries) returns ListMessagesResponse|error {
        string resourcePath = string `/users/${getEncodedUri(userId)}/messages`;
        map<Encoding> queryParamEncoding = {"labelIds": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queries, queryParamEncoding);
        return self.clientEp->get(resourcePath, headers);
    }

    # Directly inserts a message into only this user's mailbox similar to `IMAP APPEND`, bypassing most scanning and classification. Does not send a message.
    #
    # + userId - The user's email address. The special value `me` can be used to indicate the authenticated user
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + payload - The message to be inserted 
    # + return - Successful response 
    resource isolated function post users/[string userId]/messages(Message payload, map<string|string[]> headers = {}, *GmailUsersMessagesInsertQueries queries) returns Message|error {
        string resourcePath = string `/users/${getEncodedUri(userId)}/messages`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, headers);
    }

    # Deletes many messages by message ID. Provides no guarantees that messages were not already deleted or even existed at all.
    #
    # + userId - The user's email address. The special value `me` can be used to indicate the authenticated user
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + payload - The IDs of the messages to delete 
    # + return - Successful response 
    resource isolated function post users/[string userId]/messages/batchDelete(BatchDeleteMessagesRequest payload, map<string|string[]> headers = {}, *GmailUsersMessagesBatchDeleteQueries queries) returns error? {
        string resourcePath = string `/users/${getEncodedUri(userId)}/messages/batchDelete`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, headers);
    }

    # Modifies the labels on the specified messages.
    #
    # + userId - The user's email address. The special value `me` can be used to indicate the authenticated user
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + payload - A list of labels to add/remove in messages 
    # + return - Successful response 
    resource isolated function post users/[string userId]/messages/batchModify(BatchModifyMessagesRequest payload, map<string|string[]> headers = {}, *GmailUsersMessagesBatchModifyQueries queries) returns error? {
        string resourcePath = string `/users/${getEncodedUri(userId)}/messages/batchModify`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, headers);
    }

    resource isolated function post users/[string userId]/messages/'import(Message payload, map<string|string[]> headers = {}, *GmailUsersMessagesImportQueries queries) returns Message|error {
        string resourcePath = string `/users/${getEncodedUri(userId)}/messages/import`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, headers);
    }

    # Sends the specified message to the recipients in the `To`, `Cc`, and `Bcc` headers. For example usage, see [Sending email](https://developers.google.com/gmail/api/guides/sending).
    #
    # + userId - The user's email address. The special value `me` can be used to indicate the authenticated user
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + payload - The message to be sent 
    # + return - Successful response 
    resource isolated function post users/[string userId]/messages/send(Message payload, map<string|string[]> headers = {}, *GmailUsersMessagesSendQueries queries) returns Message|error {
        string resourcePath = string `/users/${getEncodedUri(userId)}/messages/send`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, headers);
    }

    # Gets the specified message.
    #
    # + userId - The user's email address. The special value `me` can be used to indicate the authenticated user
    # + id - The ID of the message to retrieve. This ID is usually retrieved using `messages.list`. The ID is also contained in the result when a message is inserted (`messages.insert`) or imported (`messages.import`)
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Successful response 
    resource isolated function get users/[string userId]/messages/[string id](map<string|string[]> headers = {}, *GmailUsersMessagesGetQueries queries) returns Message|error {
        string resourcePath = string `/users/${getEncodedUri(userId)}/messages/${getEncodedUri(id)}`;
        map<Encoding> queryParamEncoding = {"metadataHeaders": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queries, queryParamEncoding);
        return self.clientEp->get(resourcePath, headers);
    }

    # Immediately and permanently deletes the specified message. This operation cannot be undone. Prefer `messages.trash` instead.
    #
    # + userId - The user's email address. The special value `me` can be used to indicate the authenticated user
    # + id - The ID of the message to delete
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Successful response 
    resource isolated function delete users/[string userId]/messages/[string id](map<string|string[]> headers = {}, *GmailUsersMessagesDeleteQueries queries) returns error? {
        string resourcePath = string `/users/${getEncodedUri(userId)}/messages/${getEncodedUri(id)}`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->delete(resourcePath, headers = headers);
    }

    # Modifies the labels on the specified message.
    #
    # + userId - The user's email address. The special value `me` can be used to indicate the authenticated user
    # + id - The ID of the message to modify
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + payload - A list of labels to add/remove on the message 
    # + return - Successful response 
    resource isolated function post users/[string userId]/messages/[string id]/modify(ModifyMessageRequest payload, map<string|string[]> headers = {}, *GmailUsersMessagesModifyQueries queries) returns Message|error {
        string resourcePath = string `/users/${getEncodedUri(userId)}/messages/${getEncodedUri(id)}/modify`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, headers);
    }

    # Moves the specified message to the trash.
    #
    # + userId - The user's email address. The special value `me` can be used to indicate the authenticated user
    # + id - The ID of the message to Trash
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Successful response 
    resource isolated function post users/[string userId]/messages/[string id]/trash(map<string|string[]> headers = {}, *GmailUsersMessagesTrashQueries queries) returns Message|error {
        string resourcePath = string `/users/${getEncodedUri(userId)}/messages/${getEncodedUri(id)}/trash`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        http:Request request = new;
        return self.clientEp->post(resourcePath, request, headers);
    }

    # Removes the specified message from the trash.
    #
    # + userId - The user's email address. The special value `me` can be used to indicate the authenticated user
    # + id - The ID of the message to remove from Trash
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Successful response 
    resource isolated function post users/[string userId]/messages/[string id]/untrash(map<string|string[]> headers = {}, *GmailUsersMessagesUntrashQueries queries) returns Message|error {
        string resourcePath = string `/users/${getEncodedUri(userId)}/messages/${getEncodedUri(id)}/untrash`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        http:Request request = new;
        return self.clientEp->post(resourcePath, request, headers);
    }

    # Gets the specified message attachment.
    #
    # + userId - The user's email address. The special value `me` can be used to indicate the authenticated user
    # + messageId - The ID of the message containing the attachment
    # + id - The ID of the attachment
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Successful response 
    resource isolated function get users/[string userId]/messages/[string messageId]/attachments/[string id](map<string|string[]> headers = {}, *GmailUsersMessagesAttachmentsGetQueries queries) returns MessagePartBody|error {
        string resourcePath = string `/users/${getEncodedUri(userId)}/messages/${getEncodedUri(messageId)}/attachments/${getEncodedUri(id)}`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    # Gets the current user's Gmail profile.
    #
    # + userId - The user's email address. The special value `me` can be used to indicate the authenticated user
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Successful response 
    resource isolated function get users/[string userId]/profile(map<string|string[]> headers = {}, *GmailUsersGetProfileQueries queries) returns Profile|error {
        string resourcePath = string `/users/${getEncodedUri(userId)}/profile`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    # Lists the threads in the user's mailbox.
    #
    # + userId - The user's email address. The special value `me` can be used to indicate the authenticated user
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Successful response 
    resource isolated function get users/[string userId]/threads(map<string|string[]> headers = {}, *GmailUsersThreadsListQueries queries) returns ListThreadsResponse|error {
        string resourcePath = string `/users/${getEncodedUri(userId)}/threads`;
        map<Encoding> queryParamEncoding = {"labelIds": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queries, queryParamEncoding);
        return self.clientEp->get(resourcePath, headers);
    }

    # Gets the specified thread.
    #
    # + userId - The user's email address. The special value `me` can be used to indicate the authenticated user
    # + id - The ID of the thread to retrieve
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Successful response 
    resource isolated function get users/[string userId]/threads/[string id](map<string|string[]> headers = {}, *GmailUsersThreadsGetQueries queries) returns MailThread|error {
        string resourcePath = string `/users/${getEncodedUri(userId)}/threads/${getEncodedUri(id)}`;
        map<Encoding> queryParamEncoding = {"metadataHeaders": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queries, queryParamEncoding);
        return self.clientEp->get(resourcePath, headers);
    }

    # Immediately and permanently deletes the specified thread. Any messages that belong to the thread are also deleted. This operation cannot be undone. Prefer `threads.trash` instead.
    #
    # + userId - The user's email address. The special value `me` can be used to indicate the authenticated user
    # + id - ID of the Thread to delete
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Successful response 
    resource isolated function delete users/[string userId]/threads/[string id](map<string|string[]> headers = {}, *GmailUsersThreadsDeleteQueries queries) returns error? {
        string resourcePath = string `/users/${getEncodedUri(userId)}/threads/${getEncodedUri(id)}`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->delete(resourcePath, headers = headers);
    }

    # Modifies the labels applied to the thread. This applies to all messages in the thread.
    #
    # + userId - The user's email address. The special value `me` can be used to indicate the authenticated user
    # + id - The ID of the thread to modify
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + payload - A list labels to add/remove on the thread 
    # + return - Successful response 
    resource isolated function post users/[string userId]/threads/[string id]/modify(ModifyThreadRequest payload, map<string|string[]> headers = {}, *GmailUsersThreadsModifyQueries queries) returns MailThread|error {
        string resourcePath = string `/users/${getEncodedUri(userId)}/threads/${getEncodedUri(id)}/modify`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, headers);
    }

    # Moves the specified thread to the trash. Any messages that belong to the thread are also moved to the trash.
    #
    # + userId - The user's email address. The special value `me` can be used to indicate the authenticated user
    # + id - The ID of the thread to Trash
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Successful response 
    resource isolated function post users/[string userId]/threads/[string id]/trash(map<string|string[]> headers = {}, *GmailUsersThreadsTrashQueries queries) returns MailThread|error {
        string resourcePath = string `/users/${getEncodedUri(userId)}/threads/${getEncodedUri(id)}/trash`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        http:Request request = new;
        return self.clientEp->post(resourcePath, request, headers);
    }

    # Removes the specified thread from the trash. Any messages that belong to the thread are also removed from the trash.
    #
    # + userId - The user's email address. The special value `me` can be used to indicate the authenticated user
    # + id - The ID of the thread to remove from Trash
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Successful response 
    resource isolated function post users/[string userId]/threads/[string id]/untrash(map<string|string[]> headers = {}, *GmailUsersThreadsUntrashQueries queries) returns MailThread|error {
        string resourcePath = string `/users/${getEncodedUri(userId)}/threads/${getEncodedUri(id)}/untrash`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        http:Request request = new;
        return self.clientEp->post(resourcePath, request, headers);
    }
}
