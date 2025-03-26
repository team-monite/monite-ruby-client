# frozen_string_literal: true
require_relative "../../requests"
require_relative "../types/order_enum"
require_relative "types/receivables_get_request_status_in_item"
require_relative "../types/receivable_cursor_fields"
require_relative "../types/receivable_type"
require "date"
require "date"
require "date"
require "date"
require "date"
require "date"
require "date"
require "date"
require_relative "types/receivables_get_request_status"
require_relative "../types/receivable_pagination_response"
require_relative "../types/receivable_facade_create_payload"
require_relative "../types/receivable_response"
require_relative "../types/receivable_templates_variables_object_list"
require_relative "../types/receivable_update_payload"
require_relative "../types/signature"
require_relative "../types/success_result"
require_relative "../types/receivable_history_cursor_fields"
require_relative "../types/receivable_history_event_type_enum"
require "date"
require "date"
require "date"
require "date"
require_relative "../types/receivable_history_pagination_response"
require_relative "../types/receivable_history_response"
require_relative "../types/line_item"
require_relative "../types/line_items_response"
require_relative "../types/receivable_mail_cursor_fields"
require_relative "../types/receivable_mail_status_enum"
require "date"
require "date"
require "date"
require "date"
require_relative "../types/receivable_mail_pagination_response"
require_relative "../types/receivable_mail_response"
require "date"
require_relative "../types/receivable_file_url"
require_relative "../types/language_code_enum"
require_relative "../types/receivables_preview_type_enum"
require_relative "../types/receivable_preview_response"
require_relative "../types/recipients"
require_relative "../types/receivable_send_response"
require_relative "../types/reminder_type_enum"
require_relative "../types/receivables_send_response"
require_relative "../types/receivables_verify_response"
require "async"
require "async"
require "async"
require "async"
require "async"
require "async"
require "async"
require "async"
require "async"
require "async"
require "async"
require "async"
require "async"
require "async"
require "async"
require "async"
require "async"
require "async"
require "async"
require "async"
require "async"
require "async"
require "async"
require "async"
require_relative "../../requests"

module Monite
  class ReceivablesClient
  # @return [Monite::RequestClient] 
    attr_reader :request_client


    # @param request_client [Monite::RequestClient] 
    # @return [Monite::ReceivablesClient]
    def initialize(request_client:)
      @request_client = request_client
    end
# Returns a list of [accounts
#  receivable](https://docs.monite.com/accounts-receivable/index) documents -
#  invoices, quotes, and credit notes - of the specified entity.
#  Results can be filtered by amount, counterpart, due date, and other criteria.
#  Multiple filters are combined using logical AND unless specified otherwise. If
#  no documents matching the search criteria are found, the endpoint returns a
#  successful response with an empty `data` array.
#  This endpoint supports
#  [pagination](https://docs.monite.com/api/concepts/pagination-sorting-filtering)
#  and sorting. By default, results are sorted by the creation date in ascending
#  order (from oldest to newest).
#  #### Examples
#  ##### Invoices
#  * Get all overdue invoices:
#  ```
#  GET /receivables?type=invoice&status=overdue
#  ```
#  * Get all invoices created for the counterpart named "Solarwind"
#  (case-insensitive):
#  ```
#  GET /receivables?type=invoice?counterpart_name__icontains=Solarwind
#  ```
#  * Get invoices whose total amount starts from 500 EUR:
#  ```
#  GET /receivables?type=invoice&total_amount__gte=50000
#  ```
#  * Get invoices that are due for payment in September 2024:
#  ```
#  GET
#  ype=invoice&due_date__gte=2024-09-01T00:00:00Z&due_date__lt=2024-10-01T00:00:00Z
#  ```
#  * Get invoices created on or after September 1, 2024:
#  ```
#  GET /receivables?type=invoice&created_at__gte=2024-09-01T00:00:00Z
#  ```
#  * Find an invoice created from a specific quote:
#  ```
#  GET /receivables?type=invoice?based_on=QUOTE_ID
#  ```
#  ##### Quotes
#  * Get the latest created quote:
#  ```
#  GET /receivables?type=quote&sort=created_at&order=desc&limit=1
#  ```
#  * Get the latest issued quote:
#  ```
#  GET /receivables?type=quote&sort=issue_date&order=desc&limit=1
#  ```
#  ##### Credit notes
#  * Find all credit notes created for a specific invoice:
#  ```
#  GET /receivables?type=credit_note?based_on=INVOICE_ID
#  ```
    #
    # @param order [Monite::OrderEnum] Sort order (ascending by default). Typically used together with the `sort`
#  parameter.
    # @param limit [Integer] The number of items (0 .. 100) to return in a single page of the response. The
#  response may contain fewer items if it is the last or only page.
#  When using pagination with a non-default `limit`, you must provide the `limit`
#  value alongside `pagination_token` in all subsequent pagination requests. Unlike
#  other query parameters, `limit` is not inferred from `pagination_token`.
    # @param pagination_token [String] A pagination token obtained from a previous call to this endpoint. Use it to get
#  the next or previous page of results for your initial query. If
#  `pagination_token` is specified, all other query parameters except `limit` are
#  ignored and inferred from the initial query.
#  If not specified, the first page of results will be returned.
    # @param id_in [String] Return only receivables with the specified IDs. Valid but nonexistent IDs do not
#  raise errors but produce no results.
#  To specify multiple IDs, repeat this parameter for each value:
#  `id__in=<id1>&id__in=<id2>`
    # @param status_in [Monite::Receivables::ReceivablesGetRequestStatusInItem] Return only receivables that have the specified statuses. See the applicable
#  [invoice statuses](https://docs.monite.com/accounts-receivable/invoices/index),
#  [quote statuses](https://docs.monite.com/accounts-receivable/quotes/index), and
#  [credit note
#  https://docs.monite.com/accounts-receivable/credit-notes#credit-note-lifecycle).
#  To specify multiple statuses, repeat this parameter for each value:
#  `status__in=draft&status__in=issued`
    # @param entity_user_id_in [String] Return only receivables created by the entity users with the specified IDs.To
#  specify multiple user IDs, repeat this parameter for each ID:
#  `entity_user_id__in=<user1>&entity_user_id__in=<user2>`
#  If the request is authenticated using an entity user token, this user must have
#  the `receivable.read.allowed` (rather than `allowed_for_own`) permission to be
#  able to query receivables created by other users.
#  IDs of deleted users will still produce results here if those users had
#  associated receivables. Valid but nonexistent user IDs do not raise errors but
#  produce no results.
    # @param sort [Monite::ReceivableCursorFields] The field to sort the results by. Typically used together with the `order`
#  parameter.
    # @param tag_ids_in [String] Return only receivables whose [tags](https://docs.monite.com/common/tags)
#  include at least one of the tags with the specified IDs.
#  For example, given receivables with the following tags:
#  1. tagA
#  2. tagB
#  3. tagA, tagB
#  4. tagC
#  5. tagB, tagC
#  `tag_ids__in=<tagA>&tag_ids__in=<tagB>` will return receivables 1, 2, 3, and 5.
#  Valid but nonexistent tag IDs do not raise errors but produce no results.
    # @param tag_ids [String] Return only receivables whose [tags](https://docs.monite.com/common/tags)
#  include all of the tags with the specified IDs and optionally other tags that
#  are not specified.
#  For example, given receivables with the following tags:
#  1. tagA
#  2. tagB
#  3. tagA, tagB
#  4. tagC
#  5. tagA, tagB, tagC
#  `tag_ids=<tagA>&tag_ids=<tagB>` will return receivables 3 and 5.
    # @param type [Monite::ReceivableType] 
    # @param document_id [String] 
    # @param document_id_contains [String] 
    # @param document_id_icontains [String] 
    # @param issue_date_gt [DateTime] 
    # @param issue_date_lt [DateTime] 
    # @param issue_date_gte [DateTime] 
    # @param issue_date_lte [DateTime] 
    # @param created_at_gt [DateTime] 
    # @param created_at_lt [DateTime] 
    # @param created_at_gte [DateTime] 
    # @param created_at_lte [DateTime] 
    # @param counterpart_id [String] 
    # @param counterpart_name [String] 
    # @param counterpart_name_contains [String] 
    # @param counterpart_name_icontains [String] 
    # @param total_amount [Integer] 
    # @param total_amount_gt [Integer] 
    # @param total_amount_lt [Integer] 
    # @param total_amount_gte [Integer] 
    # @param total_amount_lte [Integer] 
    # @param status [Monite::Receivables::ReceivablesGetRequestStatus] 
    # @param entity_user_id [String] 
    # @param based_on [String] 
    # @param due_date_gt [String] 
    # @param due_date_lt [String] 
    # @param due_date_gte [String] 
    # @param due_date_lte [String] 
    # @param project_id [String] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::ReceivablePaginationResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.receivables.get
    def get(order: nil, limit: nil, pagination_token: nil, id_in: nil, status_in: nil, entity_user_id_in: nil, sort: nil, tag_ids_in: nil, tag_ids: nil, type: nil, document_id: nil, document_id_contains: nil, document_id_icontains: nil, issue_date_gt: nil, issue_date_lt: nil, issue_date_gte: nil, issue_date_lte: nil, created_at_gt: nil, created_at_lt: nil, created_at_gte: nil, created_at_lte: nil, counterpart_id: nil, counterpart_name: nil, counterpart_name_contains: nil, counterpart_name_icontains: nil, total_amount: nil, total_amount_gt: nil, total_amount_lt: nil, total_amount_gte: nil, total_amount_lte: nil, status: nil, entity_user_id: nil, based_on: nil, due_date_gt: nil, due_date_lt: nil, due_date_gte: nil, due_date_lte: nil, project_id: nil, request_options: nil)
      response = @request_client.conn.get do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.monite_version.nil?
    req.headers["x-monite-version"] = request_options.monite_version
  end
  unless request_options&.monite_entity_id.nil?
    req.headers["x-monite-entity-id"] = request_options.monite_entity_id
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  req.params = { **(request_options&.additional_query_parameters || {}), "order": order, "limit": limit, "pagination_token": pagination_token, "id__in": id_in, "status__in": status_in, "entity_user_id__in": entity_user_id_in, "sort": sort, "tag_ids__in": tag_ids_in, "tag_ids": tag_ids, "type": type, "document_id": document_id, "document_id__contains": document_id_contains, "document_id__icontains": document_id_icontains, "issue_date__gt": issue_date_gt, "issue_date__lt": issue_date_lt, "issue_date__gte": issue_date_gte, "issue_date__lte": issue_date_lte, "created_at__gt": created_at_gt, "created_at__lt": created_at_lt, "created_at__gte": created_at_gte, "created_at__lte": created_at_lte, "counterpart_id": counterpart_id, "counterpart_name": counterpart_name, "counterpart_name__contains": counterpart_name_contains, "counterpart_name__icontains": counterpart_name_icontains, "total_amount": total_amount, "total_amount__gt": total_amount_gt, "total_amount__lt": total_amount_lt, "total_amount__gte": total_amount_gte, "total_amount__lte": total_amount_lte, "status": status, "entity_user_id": entity_user_id, "based_on": based_on, "due_date__gt": due_date_gt, "due_date__lt": due_date_lt, "due_date__gte": due_date_gte, "due_date__lte": due_date_lte, "project_id": project_id }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/receivables"
end
      Monite::ReceivablePaginationResponse.from_json(json_object: response.body)
    end
    # @param request [Monite::ReceivableFacadeCreateQuotePayload, Monite::ReceivableFacadeCreateInvoicePayload, Monite::ReceivableCreateBasedOnPayload] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::ReceivableResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.receivables.create(request: { counterpart_billing_address_id: "counterpart_billing_address_id", counterpart_id: "counterpart_id", currency: AED, line_items: [{ quantity: 1.1 }], type: "quote" })
    def create(request:, request_options: nil)
      response = @request_client.conn.post do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.monite_version.nil?
    req.headers["x-monite-version"] = request_options.monite_version
  end
  unless request_options&.monite_entity_id.nil?
    req.headers["x-monite-entity-id"] = request_options.monite_entity_id
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/receivables"
end
      Monite::ReceivableResponse.from_json(json_object: response.body)
    end
# Get a list of placeholders that can be used in email templates for
#  customization.
    #
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::ReceivableTemplatesVariablesObjectList]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.receivables.get_variables
    def get_variables(request_options: nil)
      response = @request_client.conn.get do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.monite_version.nil?
    req.headers["x-monite-version"] = request_options.monite_version
  end
  unless request_options&.monite_entity_id.nil?
    req.headers["x-monite-entity-id"] = request_options.monite_entity_id
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/receivables/variables"
end
      Monite::ReceivableTemplatesVariablesObjectList.from_json(json_object: response.body)
    end
    # @param receivable_id [String] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::ReceivableResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.receivables.get_by_id(receivable_id: "receivable_id")
    def get_by_id(receivable_id:, request_options: nil)
      response = @request_client.conn.get do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.monite_version.nil?
    req.headers["x-monite-version"] = request_options.monite_version
  end
  unless request_options&.monite_entity_id.nil?
    req.headers["x-monite-entity-id"] = request_options.monite_entity_id
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/receivables/#{receivable_id}"
end
      Monite::ReceivableResponse.from_json(json_object: response.body)
    end
    # @param receivable_id [String] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Void]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.receivables.delete_by_id(receivable_id: "receivable_id")
    def delete_by_id(receivable_id:, request_options: nil)
      response = @request_client.conn.delete do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.monite_version.nil?
    req.headers["x-monite-version"] = request_options.monite_version
  end
  unless request_options&.monite_entity_id.nil?
    req.headers["x-monite-entity-id"] = request_options.monite_entity_id
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/receivables/#{receivable_id}"
end
    end
    # @param receivable_id [String] 
    # @param request [Monite::UpdateQuotePayload, Monite::UpdateInvoicePayload, Monite::UpdateCreditNotePayload, Monite::UpdateIssuedInvoicePayload] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::ReceivableResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.receivables.update_by_id(receivable_id: "receivable_id", request: { quote: {  } })
    def update_by_id(receivable_id:, request:, request_options: nil)
      response = @request_client.conn.patch do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.monite_version.nil?
    req.headers["x-monite-version"] = request_options.monite_version
  end
  unless request_options&.monite_entity_id.nil?
    req.headers["x-monite-entity-id"] = request_options.monite_entity_id
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/receivables/#{receivable_id}"
end
      Monite::ReceivableResponse.from_json(json_object: response.body)
    end
    # @param receivable_id [String] 
    # @param signature [Hash] A digital signature, if required for quote acceptanceRequest of type Monite::Signature, as a Hash
    #   * :email (String) 
    #   * :full_name (String) 
    #   * :signature_image (String) 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::SuccessResult]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.receivables.accept_by_id(receivable_id: "receivable_id")
    def accept_by_id(receivable_id:, signature: nil, request_options: nil)
      response = @request_client.conn.post do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.monite_version.nil?
    req.headers["x-monite-version"] = request_options.monite_version
  end
  unless request_options&.monite_entity_id.nil?
    req.headers["x-monite-entity-id"] = request_options.monite_entity_id
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request_options&.additional_body_parameters || {}), signature: signature }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/receivables/#{receivable_id}/accept"
end
      Monite::SuccessResult.from_json(json_object: response.body)
    end
    # @param receivable_id [String] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Void]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.receivables.cancel_by_id(receivable_id: "receivable_id")
    def cancel_by_id(receivable_id:, request_options: nil)
      response = @request_client.conn.post do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.monite_version.nil?
    req.headers["x-monite-version"] = request_options.monite_version
  end
  unless request_options&.monite_entity_id.nil?
    req.headers["x-monite-entity-id"] = request_options.monite_entity_id
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/receivables/#{receivable_id}/cancel"
end
    end
    # @param receivable_id [String] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::ReceivableResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.receivables.clone_by_id(receivable_id: "receivable_id")
    def clone_by_id(receivable_id:, request_options: nil)
      response = @request_client.conn.post do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.monite_version.nil?
    req.headers["x-monite-version"] = request_options.monite_version
  end
  unless request_options&.monite_entity_id.nil?
    req.headers["x-monite-entity-id"] = request_options.monite_entity_id
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/receivables/#{receivable_id}/clone"
end
      Monite::ReceivableResponse.from_json(json_object: response.body)
    end
    # @param receivable_id [String] 
    # @param comment [String] Field with a comment on why the client declined this Quote
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::SuccessResult]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.receivables.decline_by_id(receivable_id: "receivable_id")
    def decline_by_id(receivable_id:, comment: nil, request_options: nil)
      response = @request_client.conn.post do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.monite_version.nil?
    req.headers["x-monite-version"] = request_options.monite_version
  end
  unless request_options&.monite_entity_id.nil?
    req.headers["x-monite-entity-id"] = request_options.monite_entity_id
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request_options&.additional_body_parameters || {}), comment: comment }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/receivables/#{receivable_id}/decline"
end
      Monite::SuccessResult.from_json(json_object: response.body)
    end
# Returns the history of the specified accounts receivable document. The history
#  contains all revisions of the document, status updates, and other events that
#  occurred during the document's lifecycle. For more information, see [Document
#  history](https://docs.monite.com/accounts-receivable/document-history).
#  You can filter the history by the date range and event type. Events are sorted
#  from oldest to newest by default.
    #
    # @param receivable_id [String] ID of the accounts receivable document whose history you want to get.
    # @param order [Monite::OrderEnum] Order by
    # @param limit [Integer] Max is 100
    # @param pagination_token [String] A token, obtained from previous page. Prior over other filters
    # @param sort [Monite::RECEIVABLE_HISTORY_CURSOR_FIELDS] Allowed sort fields
    # @param event_type_in [Monite::ReceivableHistoryEventTypeEnum] Return only the specified [event
#  ypes](https://docs.monite.com/accounts-receivable/document-history#event-types).
#  To include multiple types, repeat this parameter for each value:
#  `event_type__in=receivable_updated&event_type__in=status_changed`
    # @param entity_user_id_in [String] Return only events caused by the entity users with the specified IDs. To specify
#  multiple user IDs, repeat this parameter for each ID:
#  `entity_user_id__in=<user1>&entity_user_id__in=<user2>`
    # @param timestamp_gt [DateTime] Return only events that occurred after the specified date and time. The value
#  must be in the ISO 8601 format `YYYY-MM-DDThh:mm[:ss[.ffffff]][Z|±hh:mm]`.
    # @param timestamp_lt [DateTime] Return only events that occurred before the specified date and time.
    # @param timestamp_gte [DateTime] Return only events that occurred on or after the specified date and time.
    # @param timestamp_lte [DateTime] Return only events that occurred before or on the specified date and time.
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::ReceivableHistoryPaginationResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.receivables.get_history(receivable_id: "receivable_id")
    def get_history(receivable_id:, order: nil, limit: nil, pagination_token: nil, sort: nil, event_type_in: nil, entity_user_id_in: nil, timestamp_gt: nil, timestamp_lt: nil, timestamp_gte: nil, timestamp_lte: nil, request_options: nil)
      response = @request_client.conn.get do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.monite_version.nil?
    req.headers["x-monite-version"] = request_options.monite_version
  end
  unless request_options&.monite_entity_id.nil?
    req.headers["x-monite-entity-id"] = request_options.monite_entity_id
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  req.params = { **(request_options&.additional_query_parameters || {}), "order": order, "limit": limit, "pagination_token": pagination_token, "sort": sort, "event_type__in": event_type_in, "entity_user_id__in": entity_user_id_in, "timestamp__gt": timestamp_gt, "timestamp__lt": timestamp_lt, "timestamp__gte": timestamp_gte, "timestamp__lte": timestamp_lte }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/receivables/#{receivable_id}/history"
end
      Monite::ReceivableHistoryPaginationResponse.from_json(json_object: response.body)
    end
# Returns a single record from the change history of the specified accounts
#  receivable document.
    #
    # @param receivable_history_id [String] ID of the history record to return. You can get these IDs from `GET
#  /receivables/{receivable_id}/history`.
    # @param receivable_id [String] ID of the accounts receivable document whose history you want to get.
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::ReceivableHistoryResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.receivables.get_history_by_id(receivable_history_id: "receivable_history_id", receivable_id: "receivable_id")
    def get_history_by_id(receivable_history_id:, receivable_id:, request_options: nil)
      response = @request_client.conn.get do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.monite_version.nil?
    req.headers["x-monite-version"] = request_options.monite_version
  end
  unless request_options&.monite_entity_id.nil?
    req.headers["x-monite-entity-id"] = request_options.monite_entity_id
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/receivables/#{receivable_history_id}/history/#{receivable_id}"
end
      Monite::ReceivableHistoryResponse.from_json(json_object: response.body)
    end
    # @param receivable_id [String] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::ReceivableResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.receivables.issue_by_id(receivable_id: "receivable_id")
    def issue_by_id(receivable_id:, request_options: nil)
      response = @request_client.conn.post do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.monite_version.nil?
    req.headers["x-monite-version"] = request_options.monite_version
  end
  unless request_options&.monite_entity_id.nil?
    req.headers["x-monite-entity-id"] = request_options.monite_entity_id
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/receivables/#{receivable_id}/issue"
end
      Monite::ReceivableResponse.from_json(json_object: response.body)
    end
# Replace all line items of an existing invoice or quote with a new list of line
#  items.
    #
    # @param receivable_id [String] 
    # @param data [Array<Hash>] Request of type Array<Monite::LineItem>, as a Hash
    #   * :discount (Hash)
    #     * :amount (Integer) 
    #     * :type (Monite::DiscountType) 
    #   * :product (Hash)
    #     * :description (String) 
    #     * :ledger_account_id (String) 
    #     * :measure_unit (Hash)
    #       * :description (String) 
    #       * :name (String) 
    #     * :name (String) 
    #     * :price (Hash)
    #       * :currency (Monite::CurrencyEnum) 
    #       * :value (Integer) 
    #     * :smallest_amount (Float) 
    #     * :type (Monite::ProductServiceTypeEnum) 
    #   * :product_id (String) 
    #   * :quantity (Float) 
    #   * :tax_rate_value (Integer) 
    #   * :vat_rate_id (String) 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::LineItemsResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.receivables.update_line_items_by_id(receivable_id: "receivable_id", data: [{ quantity: 1.1 }])
    def update_line_items_by_id(receivable_id:, data:, request_options: nil)
      response = @request_client.conn.put do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.monite_version.nil?
    req.headers["x-monite-version"] = request_options.monite_version
  end
  unless request_options&.monite_entity_id.nil?
    req.headers["x-monite-entity-id"] = request_options.monite_entity_id
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request_options&.additional_body_parameters || {}), data: data }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/receivables/#{receivable_id}/line_items"
end
      Monite::LineItemsResponse.from_json(json_object: response.body)
    end
    # @param receivable_id [String] 
    # @param order [Monite::OrderEnum] Order by
    # @param limit [Integer] Max is 100
    # @param pagination_token [String] A token, obtained from previous page. Prior over other filters
    # @param sort [Monite::ReceivableMailCursorFields] Allowed sort fields
    # @param status [Monite::ReceivableMailStatusEnum] 
    # @param status_in [Monite::ReceivableMailStatusEnum] 
    # @param created_at_gt [DateTime] 
    # @param created_at_lt [DateTime] 
    # @param created_at_gte [DateTime] 
    # @param created_at_lte [DateTime] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::ReceivableMailPaginationResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.receivables.get_mails(receivable_id: "receivable_id")
    def get_mails(receivable_id:, order: nil, limit: nil, pagination_token: nil, sort: nil, status: nil, status_in: nil, created_at_gt: nil, created_at_lt: nil, created_at_gte: nil, created_at_lte: nil, request_options: nil)
      response = @request_client.conn.get do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.monite_version.nil?
    req.headers["x-monite-version"] = request_options.monite_version
  end
  unless request_options&.monite_entity_id.nil?
    req.headers["x-monite-entity-id"] = request_options.monite_entity_id
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  req.params = { **(request_options&.additional_query_parameters || {}), "order": order, "limit": limit, "pagination_token": pagination_token, "sort": sort, "status": status, "status__in": status_in, "created_at__gt": created_at_gt, "created_at__lt": created_at_lt, "created_at__gte": created_at_gte, "created_at__lte": created_at_lte }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/receivables/#{receivable_id}/mails"
end
      Monite::ReceivableMailPaginationResponse.from_json(json_object: response.body)
    end
    # @param receivable_id [String] 
    # @param mail_id [String] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::ReceivableMailResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.receivables.get_mail_by_id(receivable_id: "receivable_id", mail_id: "mail_id")
    def get_mail_by_id(receivable_id:, mail_id:, request_options: nil)
      response = @request_client.conn.get do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.monite_version.nil?
    req.headers["x-monite-version"] = request_options.monite_version
  end
  unless request_options&.monite_entity_id.nil?
    req.headers["x-monite-entity-id"] = request_options.monite_entity_id
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/receivables/#{receivable_id}/mails/#{mail_id}"
end
      Monite::ReceivableMailResponse.from_json(json_object: response.body)
    end
    # @param receivable_id [String] 
    # @param comment [String] Optional comment explaining how the payment was made.
    # @param paid_at [DateTime] Date and time when the invoice was paid.
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::ReceivableResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.receivables.mark_as_paid_by_id(receivable_id: "receivable_id")
    def mark_as_paid_by_id(receivable_id:, comment: nil, paid_at: nil, request_options: nil)
      response = @request_client.conn.post do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.monite_version.nil?
    req.headers["x-monite-version"] = request_options.monite_version
  end
  unless request_options&.monite_entity_id.nil?
    req.headers["x-monite-entity-id"] = request_options.monite_entity_id
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request_options&.additional_body_parameters || {}), comment: comment, paid_at: paid_at }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/receivables/#{receivable_id}/mark_as_paid"
end
      Monite::ReceivableResponse.from_json(json_object: response.body)
    end
# Deprecated. Use `POST /payment_records` to record an invoice payment.
    #
    # @param receivable_id [String] 
    # @param amount_paid [Integer] How much has been paid on the invoice (in minor units).
    # @param comment [String] Optional comment explaining how the payment was made.
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::ReceivableResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.receivables.mark_as_partially_paid_by_id(receivable_id: "receivable_id", amount_paid: 1)
    def mark_as_partially_paid_by_id(receivable_id:, amount_paid:, comment: nil, request_options: nil)
      response = @request_client.conn.post do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.monite_version.nil?
    req.headers["x-monite-version"] = request_options.monite_version
  end
  unless request_options&.monite_entity_id.nil?
    req.headers["x-monite-entity-id"] = request_options.monite_entity_id
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request_options&.additional_body_parameters || {}), amount_paid: amount_paid, comment: comment }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/receivables/#{receivable_id}/mark_as_partially_paid"
end
      Monite::ReceivableResponse.from_json(json_object: response.body)
    end
    # @param receivable_id [String] 
    # @param comment [String] Optional comment explains why the Invoice goes uncollectible.
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::ReceivableResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.receivables.mark_as_uncollectible_by_id(receivable_id: "receivable_id")
    def mark_as_uncollectible_by_id(receivable_id:, comment: nil, request_options: nil)
      response = @request_client.conn.post do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.monite_version.nil?
    req.headers["x-monite-version"] = request_options.monite_version
  end
  unless request_options&.monite_entity_id.nil?
    req.headers["x-monite-entity-id"] = request_options.monite_entity_id
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request_options&.additional_body_parameters || {}), comment: comment }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/receivables/#{receivable_id}/mark_as_uncollectible"
end
      Monite::ReceivableResponse.from_json(json_object: response.body)
    end
    # @param receivable_id [String] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::ReceivableFileUrl]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.receivables.get_pdf_link_by_id(receivable_id: "receivable_id")
    def get_pdf_link_by_id(receivable_id:, request_options: nil)
      response = @request_client.conn.get do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.monite_version.nil?
    req.headers["x-monite-version"] = request_options.monite_version
  end
  unless request_options&.monite_entity_id.nil?
    req.headers["x-monite-entity-id"] = request_options.monite_entity_id
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/receivables/#{receivable_id}/pdf_link"
end
      Monite::ReceivableFileUrl.from_json(json_object: response.body)
    end
    # @param receivable_id [String] 
    # @param body_text [String] Body text of the content
    # @param language [Monite::LanguageCodeEnum] Language code for localization purposes
    # @param subject_text [String] Subject text of the content
    # @param type [Monite::ReceivablesPreviewTypeEnum] The type of the preview document.
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::ReceivablePreviewResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.receivables.preview_by_id(
#    receivable_id: "receivable_id",
#    body_text: "body_text",
#    subject_text: "subject_text"
#  )
    def preview_by_id(receivable_id:, body_text:, language: nil, subject_text:, type: nil, request_options: nil)
      response = @request_client.conn.post do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.monite_version.nil?
    req.headers["x-monite-version"] = request_options.monite_version
  end
  unless request_options&.monite_entity_id.nil?
    req.headers["x-monite-entity-id"] = request_options.monite_entity_id
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request_options&.additional_body_parameters || {}), body_text: body_text, language: language, subject_text: subject_text, type: type }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/receivables/#{receivable_id}/preview"
end
      Monite::ReceivablePreviewResponse.from_json(json_object: response.body)
    end
    # @param receivable_id [String] 
    # @param body_text [String] Body text of the content
    # @param recipients [Hash] Request of type Monite::Recipients, as a Hash
    #   * :bcc (Array<String>) 
    #   * :cc (Array<String>) 
    #   * :to (Array<String>) 
    # @param subject_text [String] Subject text of the content
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::ReceivableSendResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.receivables.send_by_id(
#    receivable_id: "receivable_id",
#    body_text: "body_text",
#    subject_text: "subject_text"
#  )
    def send_by_id(receivable_id:, body_text:, recipients: nil, subject_text:, request_options: nil)
      response = @request_client.conn.post do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.monite_version.nil?
    req.headers["x-monite-version"] = request_options.monite_version
  end
  unless request_options&.monite_entity_id.nil?
    req.headers["x-monite-entity-id"] = request_options.monite_entity_id
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request_options&.additional_body_parameters || {}), body_text: body_text, recipients: recipients, subject_text: subject_text }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/receivables/#{receivable_id}/send"
end
      Monite::ReceivableSendResponse.from_json(json_object: response.body)
    end
    # @param receivable_id [String] 
    # @param recipients [Hash] Request of type Monite::Recipients, as a Hash
    #   * :bcc (Array<String>) 
    #   * :cc (Array<String>) 
    #   * :to (Array<String>) 
    # @param reminder_type [Monite::ReminderTypeEnum] The type of the reminder to be sent.
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::ReceivablesSendResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.receivables.send_test_reminder_by_id(receivable_id: "receivable_id", reminder_type: TERM_1)
    def send_test_reminder_by_id(receivable_id:, recipients: nil, reminder_type:, request_options: nil)
      response = @request_client.conn.post do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.monite_version.nil?
    req.headers["x-monite-version"] = request_options.monite_version
  end
  unless request_options&.monite_entity_id.nil?
    req.headers["x-monite-entity-id"] = request_options.monite_entity_id
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request_options&.additional_body_parameters || {}), recipients: recipients, reminder_type: reminder_type }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/receivables/#{receivable_id}/send_test_reminder"
end
      Monite::ReceivablesSendResponse.from_json(json_object: response.body)
    end
    # @param receivable_id [String] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::ReceivablesVerifyResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.receivables.verify_by_id(receivable_id: "receivable_id")
    def verify_by_id(receivable_id:, request_options: nil)
      response = @request_client.conn.post do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.monite_version.nil?
    req.headers["x-monite-version"] = request_options.monite_version
  end
  unless request_options&.monite_entity_id.nil?
    req.headers["x-monite-entity-id"] = request_options.monite_entity_id
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/receivables/#{receivable_id}/verify"
end
      Monite::ReceivablesVerifyResponse.from_json(json_object: response.body)
    end
  end
  class AsyncReceivablesClient
  # @return [Monite::AsyncRequestClient] 
    attr_reader :request_client


    # @param request_client [Monite::RequestClient] 
    # @return [Monite::AsyncReceivablesClient]
    def initialize(request_client:)
      @request_client = request_client
    end
# Returns a list of [accounts
#  receivable](https://docs.monite.com/accounts-receivable/index) documents -
#  invoices, quotes, and credit notes - of the specified entity.
#  Results can be filtered by amount, counterpart, due date, and other criteria.
#  Multiple filters are combined using logical AND unless specified otherwise. If
#  no documents matching the search criteria are found, the endpoint returns a
#  successful response with an empty `data` array.
#  This endpoint supports
#  [pagination](https://docs.monite.com/api/concepts/pagination-sorting-filtering)
#  and sorting. By default, results are sorted by the creation date in ascending
#  order (from oldest to newest).
#  #### Examples
#  ##### Invoices
#  * Get all overdue invoices:
#  ```
#  GET /receivables?type=invoice&status=overdue
#  ```
#  * Get all invoices created for the counterpart named "Solarwind"
#  (case-insensitive):
#  ```
#  GET /receivables?type=invoice?counterpart_name__icontains=Solarwind
#  ```
#  * Get invoices whose total amount starts from 500 EUR:
#  ```
#  GET /receivables?type=invoice&total_amount__gte=50000
#  ```
#  * Get invoices that are due for payment in September 2024:
#  ```
#  GET
#  ype=invoice&due_date__gte=2024-09-01T00:00:00Z&due_date__lt=2024-10-01T00:00:00Z
#  ```
#  * Get invoices created on or after September 1, 2024:
#  ```
#  GET /receivables?type=invoice&created_at__gte=2024-09-01T00:00:00Z
#  ```
#  * Find an invoice created from a specific quote:
#  ```
#  GET /receivables?type=invoice?based_on=QUOTE_ID
#  ```
#  ##### Quotes
#  * Get the latest created quote:
#  ```
#  GET /receivables?type=quote&sort=created_at&order=desc&limit=1
#  ```
#  * Get the latest issued quote:
#  ```
#  GET /receivables?type=quote&sort=issue_date&order=desc&limit=1
#  ```
#  ##### Credit notes
#  * Find all credit notes created for a specific invoice:
#  ```
#  GET /receivables?type=credit_note?based_on=INVOICE_ID
#  ```
    #
    # @param order [Monite::OrderEnum] Sort order (ascending by default). Typically used together with the `sort`
#  parameter.
    # @param limit [Integer] The number of items (0 .. 100) to return in a single page of the response. The
#  response may contain fewer items if it is the last or only page.
#  When using pagination with a non-default `limit`, you must provide the `limit`
#  value alongside `pagination_token` in all subsequent pagination requests. Unlike
#  other query parameters, `limit` is not inferred from `pagination_token`.
    # @param pagination_token [String] A pagination token obtained from a previous call to this endpoint. Use it to get
#  the next or previous page of results for your initial query. If
#  `pagination_token` is specified, all other query parameters except `limit` are
#  ignored and inferred from the initial query.
#  If not specified, the first page of results will be returned.
    # @param id_in [String] Return only receivables with the specified IDs. Valid but nonexistent IDs do not
#  raise errors but produce no results.
#  To specify multiple IDs, repeat this parameter for each value:
#  `id__in=<id1>&id__in=<id2>`
    # @param status_in [Monite::Receivables::ReceivablesGetRequestStatusInItem] Return only receivables that have the specified statuses. See the applicable
#  [invoice statuses](https://docs.monite.com/accounts-receivable/invoices/index),
#  [quote statuses](https://docs.monite.com/accounts-receivable/quotes/index), and
#  [credit note
#  https://docs.monite.com/accounts-receivable/credit-notes#credit-note-lifecycle).
#  To specify multiple statuses, repeat this parameter for each value:
#  `status__in=draft&status__in=issued`
    # @param entity_user_id_in [String] Return only receivables created by the entity users with the specified IDs.To
#  specify multiple user IDs, repeat this parameter for each ID:
#  `entity_user_id__in=<user1>&entity_user_id__in=<user2>`
#  If the request is authenticated using an entity user token, this user must have
#  the `receivable.read.allowed` (rather than `allowed_for_own`) permission to be
#  able to query receivables created by other users.
#  IDs of deleted users will still produce results here if those users had
#  associated receivables. Valid but nonexistent user IDs do not raise errors but
#  produce no results.
    # @param sort [Monite::ReceivableCursorFields] The field to sort the results by. Typically used together with the `order`
#  parameter.
    # @param tag_ids_in [String] Return only receivables whose [tags](https://docs.monite.com/common/tags)
#  include at least one of the tags with the specified IDs.
#  For example, given receivables with the following tags:
#  1. tagA
#  2. tagB
#  3. tagA, tagB
#  4. tagC
#  5. tagB, tagC
#  `tag_ids__in=<tagA>&tag_ids__in=<tagB>` will return receivables 1, 2, 3, and 5.
#  Valid but nonexistent tag IDs do not raise errors but produce no results.
    # @param tag_ids [String] Return only receivables whose [tags](https://docs.monite.com/common/tags)
#  include all of the tags with the specified IDs and optionally other tags that
#  are not specified.
#  For example, given receivables with the following tags:
#  1. tagA
#  2. tagB
#  3. tagA, tagB
#  4. tagC
#  5. tagA, tagB, tagC
#  `tag_ids=<tagA>&tag_ids=<tagB>` will return receivables 3 and 5.
    # @param type [Monite::ReceivableType] 
    # @param document_id [String] 
    # @param document_id_contains [String] 
    # @param document_id_icontains [String] 
    # @param issue_date_gt [DateTime] 
    # @param issue_date_lt [DateTime] 
    # @param issue_date_gte [DateTime] 
    # @param issue_date_lte [DateTime] 
    # @param created_at_gt [DateTime] 
    # @param created_at_lt [DateTime] 
    # @param created_at_gte [DateTime] 
    # @param created_at_lte [DateTime] 
    # @param counterpart_id [String] 
    # @param counterpart_name [String] 
    # @param counterpart_name_contains [String] 
    # @param counterpart_name_icontains [String] 
    # @param total_amount [Integer] 
    # @param total_amount_gt [Integer] 
    # @param total_amount_lt [Integer] 
    # @param total_amount_gte [Integer] 
    # @param total_amount_lte [Integer] 
    # @param status [Monite::Receivables::ReceivablesGetRequestStatus] 
    # @param entity_user_id [String] 
    # @param based_on [String] 
    # @param due_date_gt [String] 
    # @param due_date_lt [String] 
    # @param due_date_gte [String] 
    # @param due_date_lte [String] 
    # @param project_id [String] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::ReceivablePaginationResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.receivables.get
    def get(order: nil, limit: nil, pagination_token: nil, id_in: nil, status_in: nil, entity_user_id_in: nil, sort: nil, tag_ids_in: nil, tag_ids: nil, type: nil, document_id: nil, document_id_contains: nil, document_id_icontains: nil, issue_date_gt: nil, issue_date_lt: nil, issue_date_gte: nil, issue_date_lte: nil, created_at_gt: nil, created_at_lt: nil, created_at_gte: nil, created_at_lte: nil, counterpart_id: nil, counterpart_name: nil, counterpart_name_contains: nil, counterpart_name_icontains: nil, total_amount: nil, total_amount_gt: nil, total_amount_lt: nil, total_amount_gte: nil, total_amount_lte: nil, status: nil, entity_user_id: nil, based_on: nil, due_date_gt: nil, due_date_lt: nil, due_date_gte: nil, due_date_lte: nil, project_id: nil, request_options: nil)
      Async do
        response = @request_client.conn.get do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.monite_version.nil?
    req.headers["x-monite-version"] = request_options.monite_version
  end
  unless request_options&.monite_entity_id.nil?
    req.headers["x-monite-entity-id"] = request_options.monite_entity_id
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  req.params = { **(request_options&.additional_query_parameters || {}), "order": order, "limit": limit, "pagination_token": pagination_token, "id__in": id_in, "status__in": status_in, "entity_user_id__in": entity_user_id_in, "sort": sort, "tag_ids__in": tag_ids_in, "tag_ids": tag_ids, "type": type, "document_id": document_id, "document_id__contains": document_id_contains, "document_id__icontains": document_id_icontains, "issue_date__gt": issue_date_gt, "issue_date__lt": issue_date_lt, "issue_date__gte": issue_date_gte, "issue_date__lte": issue_date_lte, "created_at__gt": created_at_gt, "created_at__lt": created_at_lt, "created_at__gte": created_at_gte, "created_at__lte": created_at_lte, "counterpart_id": counterpart_id, "counterpart_name": counterpart_name, "counterpart_name__contains": counterpart_name_contains, "counterpart_name__icontains": counterpart_name_icontains, "total_amount": total_amount, "total_amount__gt": total_amount_gt, "total_amount__lt": total_amount_lt, "total_amount__gte": total_amount_gte, "total_amount__lte": total_amount_lte, "status": status, "entity_user_id": entity_user_id, "based_on": based_on, "due_date__gt": due_date_gt, "due_date__lt": due_date_lt, "due_date__gte": due_date_gte, "due_date__lte": due_date_lte, "project_id": project_id }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/receivables"
end
        Monite::ReceivablePaginationResponse.from_json(json_object: response.body)
      end
    end
    # @param request [Monite::ReceivableFacadeCreateQuotePayload, Monite::ReceivableFacadeCreateInvoicePayload, Monite::ReceivableCreateBasedOnPayload] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::ReceivableResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.receivables.create(request: { counterpart_billing_address_id: "counterpart_billing_address_id", counterpart_id: "counterpart_id", currency: AED, line_items: [{ quantity: 1.1 }], type: "quote" })
    def create(request:, request_options: nil)
      Async do
        response = @request_client.conn.post do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.monite_version.nil?
    req.headers["x-monite-version"] = request_options.monite_version
  end
  unless request_options&.monite_entity_id.nil?
    req.headers["x-monite-entity-id"] = request_options.monite_entity_id
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/receivables"
end
        Monite::ReceivableResponse.from_json(json_object: response.body)
      end
    end
# Get a list of placeholders that can be used in email templates for
#  customization.
    #
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::ReceivableTemplatesVariablesObjectList]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.receivables.get_variables
    def get_variables(request_options: nil)
      Async do
        response = @request_client.conn.get do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.monite_version.nil?
    req.headers["x-monite-version"] = request_options.monite_version
  end
  unless request_options&.monite_entity_id.nil?
    req.headers["x-monite-entity-id"] = request_options.monite_entity_id
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/receivables/variables"
end
        Monite::ReceivableTemplatesVariablesObjectList.from_json(json_object: response.body)
      end
    end
    # @param receivable_id [String] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::ReceivableResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.receivables.get_by_id(receivable_id: "receivable_id")
    def get_by_id(receivable_id:, request_options: nil)
      Async do
        response = @request_client.conn.get do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.monite_version.nil?
    req.headers["x-monite-version"] = request_options.monite_version
  end
  unless request_options&.monite_entity_id.nil?
    req.headers["x-monite-entity-id"] = request_options.monite_entity_id
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/receivables/#{receivable_id}"
end
        Monite::ReceivableResponse.from_json(json_object: response.body)
      end
    end
    # @param receivable_id [String] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Void]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.receivables.delete_by_id(receivable_id: "receivable_id")
    def delete_by_id(receivable_id:, request_options: nil)
      Async do
        response = @request_client.conn.delete do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.monite_version.nil?
    req.headers["x-monite-version"] = request_options.monite_version
  end
  unless request_options&.monite_entity_id.nil?
    req.headers["x-monite-entity-id"] = request_options.monite_entity_id
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/receivables/#{receivable_id}"
end
      end
    end
    # @param receivable_id [String] 
    # @param request [Monite::UpdateQuotePayload, Monite::UpdateInvoicePayload, Monite::UpdateCreditNotePayload, Monite::UpdateIssuedInvoicePayload] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::ReceivableResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.receivables.update_by_id(receivable_id: "receivable_id", request: { quote: {  } })
    def update_by_id(receivable_id:, request:, request_options: nil)
      Async do
        response = @request_client.conn.patch do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.monite_version.nil?
    req.headers["x-monite-version"] = request_options.monite_version
  end
  unless request_options&.monite_entity_id.nil?
    req.headers["x-monite-entity-id"] = request_options.monite_entity_id
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/receivables/#{receivable_id}"
end
        Monite::ReceivableResponse.from_json(json_object: response.body)
      end
    end
    # @param receivable_id [String] 
    # @param signature [Hash] A digital signature, if required for quote acceptanceRequest of type Monite::Signature, as a Hash
    #   * :email (String) 
    #   * :full_name (String) 
    #   * :signature_image (String) 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::SuccessResult]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.receivables.accept_by_id(receivable_id: "receivable_id")
    def accept_by_id(receivable_id:, signature: nil, request_options: nil)
      Async do
        response = @request_client.conn.post do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.monite_version.nil?
    req.headers["x-monite-version"] = request_options.monite_version
  end
  unless request_options&.monite_entity_id.nil?
    req.headers["x-monite-entity-id"] = request_options.monite_entity_id
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request_options&.additional_body_parameters || {}), signature: signature }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/receivables/#{receivable_id}/accept"
end
        Monite::SuccessResult.from_json(json_object: response.body)
      end
    end
    # @param receivable_id [String] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Void]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.receivables.cancel_by_id(receivable_id: "receivable_id")
    def cancel_by_id(receivable_id:, request_options: nil)
      Async do
        response = @request_client.conn.post do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.monite_version.nil?
    req.headers["x-monite-version"] = request_options.monite_version
  end
  unless request_options&.monite_entity_id.nil?
    req.headers["x-monite-entity-id"] = request_options.monite_entity_id
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/receivables/#{receivable_id}/cancel"
end
      end
    end
    # @param receivable_id [String] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::ReceivableResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.receivables.clone_by_id(receivable_id: "receivable_id")
    def clone_by_id(receivable_id:, request_options: nil)
      Async do
        response = @request_client.conn.post do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.monite_version.nil?
    req.headers["x-monite-version"] = request_options.monite_version
  end
  unless request_options&.monite_entity_id.nil?
    req.headers["x-monite-entity-id"] = request_options.monite_entity_id
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/receivables/#{receivable_id}/clone"
end
        Monite::ReceivableResponse.from_json(json_object: response.body)
      end
    end
    # @param receivable_id [String] 
    # @param comment [String] Field with a comment on why the client declined this Quote
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::SuccessResult]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.receivables.decline_by_id(receivable_id: "receivable_id")
    def decline_by_id(receivable_id:, comment: nil, request_options: nil)
      Async do
        response = @request_client.conn.post do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.monite_version.nil?
    req.headers["x-monite-version"] = request_options.monite_version
  end
  unless request_options&.monite_entity_id.nil?
    req.headers["x-monite-entity-id"] = request_options.monite_entity_id
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request_options&.additional_body_parameters || {}), comment: comment }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/receivables/#{receivable_id}/decline"
end
        Monite::SuccessResult.from_json(json_object: response.body)
      end
    end
# Returns the history of the specified accounts receivable document. The history
#  contains all revisions of the document, status updates, and other events that
#  occurred during the document's lifecycle. For more information, see [Document
#  history](https://docs.monite.com/accounts-receivable/document-history).
#  You can filter the history by the date range and event type. Events are sorted
#  from oldest to newest by default.
    #
    # @param receivable_id [String] ID of the accounts receivable document whose history you want to get.
    # @param order [Monite::OrderEnum] Order by
    # @param limit [Integer] Max is 100
    # @param pagination_token [String] A token, obtained from previous page. Prior over other filters
    # @param sort [Monite::RECEIVABLE_HISTORY_CURSOR_FIELDS] Allowed sort fields
    # @param event_type_in [Monite::ReceivableHistoryEventTypeEnum] Return only the specified [event
#  ypes](https://docs.monite.com/accounts-receivable/document-history#event-types).
#  To include multiple types, repeat this parameter for each value:
#  `event_type__in=receivable_updated&event_type__in=status_changed`
    # @param entity_user_id_in [String] Return only events caused by the entity users with the specified IDs. To specify
#  multiple user IDs, repeat this parameter for each ID:
#  `entity_user_id__in=<user1>&entity_user_id__in=<user2>`
    # @param timestamp_gt [DateTime] Return only events that occurred after the specified date and time. The value
#  must be in the ISO 8601 format `YYYY-MM-DDThh:mm[:ss[.ffffff]][Z|±hh:mm]`.
    # @param timestamp_lt [DateTime] Return only events that occurred before the specified date and time.
    # @param timestamp_gte [DateTime] Return only events that occurred on or after the specified date and time.
    # @param timestamp_lte [DateTime] Return only events that occurred before or on the specified date and time.
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::ReceivableHistoryPaginationResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.receivables.get_history(receivable_id: "receivable_id")
    def get_history(receivable_id:, order: nil, limit: nil, pagination_token: nil, sort: nil, event_type_in: nil, entity_user_id_in: nil, timestamp_gt: nil, timestamp_lt: nil, timestamp_gte: nil, timestamp_lte: nil, request_options: nil)
      Async do
        response = @request_client.conn.get do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.monite_version.nil?
    req.headers["x-monite-version"] = request_options.monite_version
  end
  unless request_options&.monite_entity_id.nil?
    req.headers["x-monite-entity-id"] = request_options.monite_entity_id
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  req.params = { **(request_options&.additional_query_parameters || {}), "order": order, "limit": limit, "pagination_token": pagination_token, "sort": sort, "event_type__in": event_type_in, "entity_user_id__in": entity_user_id_in, "timestamp__gt": timestamp_gt, "timestamp__lt": timestamp_lt, "timestamp__gte": timestamp_gte, "timestamp__lte": timestamp_lte }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/receivables/#{receivable_id}/history"
end
        Monite::ReceivableHistoryPaginationResponse.from_json(json_object: response.body)
      end
    end
# Returns a single record from the change history of the specified accounts
#  receivable document.
    #
    # @param receivable_history_id [String] ID of the history record to return. You can get these IDs from `GET
#  /receivables/{receivable_id}/history`.
    # @param receivable_id [String] ID of the accounts receivable document whose history you want to get.
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::ReceivableHistoryResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.receivables.get_history_by_id(receivable_history_id: "receivable_history_id", receivable_id: "receivable_id")
    def get_history_by_id(receivable_history_id:, receivable_id:, request_options: nil)
      Async do
        response = @request_client.conn.get do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.monite_version.nil?
    req.headers["x-monite-version"] = request_options.monite_version
  end
  unless request_options&.monite_entity_id.nil?
    req.headers["x-monite-entity-id"] = request_options.monite_entity_id
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/receivables/#{receivable_history_id}/history/#{receivable_id}"
end
        Monite::ReceivableHistoryResponse.from_json(json_object: response.body)
      end
    end
    # @param receivable_id [String] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::ReceivableResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.receivables.issue_by_id(receivable_id: "receivable_id")
    def issue_by_id(receivable_id:, request_options: nil)
      Async do
        response = @request_client.conn.post do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.monite_version.nil?
    req.headers["x-monite-version"] = request_options.monite_version
  end
  unless request_options&.monite_entity_id.nil?
    req.headers["x-monite-entity-id"] = request_options.monite_entity_id
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/receivables/#{receivable_id}/issue"
end
        Monite::ReceivableResponse.from_json(json_object: response.body)
      end
    end
# Replace all line items of an existing invoice or quote with a new list of line
#  items.
    #
    # @param receivable_id [String] 
    # @param data [Array<Hash>] Request of type Array<Monite::LineItem>, as a Hash
    #   * :discount (Hash)
    #     * :amount (Integer) 
    #     * :type (Monite::DiscountType) 
    #   * :product (Hash)
    #     * :description (String) 
    #     * :ledger_account_id (String) 
    #     * :measure_unit (Hash)
    #       * :description (String) 
    #       * :name (String) 
    #     * :name (String) 
    #     * :price (Hash)
    #       * :currency (Monite::CurrencyEnum) 
    #       * :value (Integer) 
    #     * :smallest_amount (Float) 
    #     * :type (Monite::ProductServiceTypeEnum) 
    #   * :product_id (String) 
    #   * :quantity (Float) 
    #   * :tax_rate_value (Integer) 
    #   * :vat_rate_id (String) 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::LineItemsResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.receivables.update_line_items_by_id(receivable_id: "receivable_id", data: [{ quantity: 1.1 }])
    def update_line_items_by_id(receivable_id:, data:, request_options: nil)
      Async do
        response = @request_client.conn.put do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.monite_version.nil?
    req.headers["x-monite-version"] = request_options.monite_version
  end
  unless request_options&.monite_entity_id.nil?
    req.headers["x-monite-entity-id"] = request_options.monite_entity_id
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request_options&.additional_body_parameters || {}), data: data }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/receivables/#{receivable_id}/line_items"
end
        Monite::LineItemsResponse.from_json(json_object: response.body)
      end
    end
    # @param receivable_id [String] 
    # @param order [Monite::OrderEnum] Order by
    # @param limit [Integer] Max is 100
    # @param pagination_token [String] A token, obtained from previous page. Prior over other filters
    # @param sort [Monite::ReceivableMailCursorFields] Allowed sort fields
    # @param status [Monite::ReceivableMailStatusEnum] 
    # @param status_in [Monite::ReceivableMailStatusEnum] 
    # @param created_at_gt [DateTime] 
    # @param created_at_lt [DateTime] 
    # @param created_at_gte [DateTime] 
    # @param created_at_lte [DateTime] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::ReceivableMailPaginationResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.receivables.get_mails(receivable_id: "receivable_id")
    def get_mails(receivable_id:, order: nil, limit: nil, pagination_token: nil, sort: nil, status: nil, status_in: nil, created_at_gt: nil, created_at_lt: nil, created_at_gte: nil, created_at_lte: nil, request_options: nil)
      Async do
        response = @request_client.conn.get do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.monite_version.nil?
    req.headers["x-monite-version"] = request_options.monite_version
  end
  unless request_options&.monite_entity_id.nil?
    req.headers["x-monite-entity-id"] = request_options.monite_entity_id
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  req.params = { **(request_options&.additional_query_parameters || {}), "order": order, "limit": limit, "pagination_token": pagination_token, "sort": sort, "status": status, "status__in": status_in, "created_at__gt": created_at_gt, "created_at__lt": created_at_lt, "created_at__gte": created_at_gte, "created_at__lte": created_at_lte }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/receivables/#{receivable_id}/mails"
end
        Monite::ReceivableMailPaginationResponse.from_json(json_object: response.body)
      end
    end
    # @param receivable_id [String] 
    # @param mail_id [String] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::ReceivableMailResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.receivables.get_mail_by_id(receivable_id: "receivable_id", mail_id: "mail_id")
    def get_mail_by_id(receivable_id:, mail_id:, request_options: nil)
      Async do
        response = @request_client.conn.get do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.monite_version.nil?
    req.headers["x-monite-version"] = request_options.monite_version
  end
  unless request_options&.monite_entity_id.nil?
    req.headers["x-monite-entity-id"] = request_options.monite_entity_id
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/receivables/#{receivable_id}/mails/#{mail_id}"
end
        Monite::ReceivableMailResponse.from_json(json_object: response.body)
      end
    end
    # @param receivable_id [String] 
    # @param comment [String] Optional comment explaining how the payment was made.
    # @param paid_at [DateTime] Date and time when the invoice was paid.
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::ReceivableResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.receivables.mark_as_paid_by_id(receivable_id: "receivable_id")
    def mark_as_paid_by_id(receivable_id:, comment: nil, paid_at: nil, request_options: nil)
      Async do
        response = @request_client.conn.post do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.monite_version.nil?
    req.headers["x-monite-version"] = request_options.monite_version
  end
  unless request_options&.monite_entity_id.nil?
    req.headers["x-monite-entity-id"] = request_options.monite_entity_id
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request_options&.additional_body_parameters || {}), comment: comment, paid_at: paid_at }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/receivables/#{receivable_id}/mark_as_paid"
end
        Monite::ReceivableResponse.from_json(json_object: response.body)
      end
    end
# Deprecated. Use `POST /payment_records` to record an invoice payment.
    #
    # @param receivable_id [String] 
    # @param amount_paid [Integer] How much has been paid on the invoice (in minor units).
    # @param comment [String] Optional comment explaining how the payment was made.
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::ReceivableResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.receivables.mark_as_partially_paid_by_id(receivable_id: "receivable_id", amount_paid: 1)
    def mark_as_partially_paid_by_id(receivable_id:, amount_paid:, comment: nil, request_options: nil)
      Async do
        response = @request_client.conn.post do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.monite_version.nil?
    req.headers["x-monite-version"] = request_options.monite_version
  end
  unless request_options&.monite_entity_id.nil?
    req.headers["x-monite-entity-id"] = request_options.monite_entity_id
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request_options&.additional_body_parameters || {}), amount_paid: amount_paid, comment: comment }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/receivables/#{receivable_id}/mark_as_partially_paid"
end
        Monite::ReceivableResponse.from_json(json_object: response.body)
      end
    end
    # @param receivable_id [String] 
    # @param comment [String] Optional comment explains why the Invoice goes uncollectible.
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::ReceivableResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.receivables.mark_as_uncollectible_by_id(receivable_id: "receivable_id")
    def mark_as_uncollectible_by_id(receivable_id:, comment: nil, request_options: nil)
      Async do
        response = @request_client.conn.post do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.monite_version.nil?
    req.headers["x-monite-version"] = request_options.monite_version
  end
  unless request_options&.monite_entity_id.nil?
    req.headers["x-monite-entity-id"] = request_options.monite_entity_id
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request_options&.additional_body_parameters || {}), comment: comment }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/receivables/#{receivable_id}/mark_as_uncollectible"
end
        Monite::ReceivableResponse.from_json(json_object: response.body)
      end
    end
    # @param receivable_id [String] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::ReceivableFileUrl]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.receivables.get_pdf_link_by_id(receivable_id: "receivable_id")
    def get_pdf_link_by_id(receivable_id:, request_options: nil)
      Async do
        response = @request_client.conn.get do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.monite_version.nil?
    req.headers["x-monite-version"] = request_options.monite_version
  end
  unless request_options&.monite_entity_id.nil?
    req.headers["x-monite-entity-id"] = request_options.monite_entity_id
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/receivables/#{receivable_id}/pdf_link"
end
        Monite::ReceivableFileUrl.from_json(json_object: response.body)
      end
    end
    # @param receivable_id [String] 
    # @param body_text [String] Body text of the content
    # @param language [Monite::LanguageCodeEnum] Language code for localization purposes
    # @param subject_text [String] Subject text of the content
    # @param type [Monite::ReceivablesPreviewTypeEnum] The type of the preview document.
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::ReceivablePreviewResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.receivables.preview_by_id(
#    receivable_id: "receivable_id",
#    body_text: "body_text",
#    subject_text: "subject_text"
#  )
    def preview_by_id(receivable_id:, body_text:, language: nil, subject_text:, type: nil, request_options: nil)
      Async do
        response = @request_client.conn.post do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.monite_version.nil?
    req.headers["x-monite-version"] = request_options.monite_version
  end
  unless request_options&.monite_entity_id.nil?
    req.headers["x-monite-entity-id"] = request_options.monite_entity_id
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request_options&.additional_body_parameters || {}), body_text: body_text, language: language, subject_text: subject_text, type: type }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/receivables/#{receivable_id}/preview"
end
        Monite::ReceivablePreviewResponse.from_json(json_object: response.body)
      end
    end
    # @param receivable_id [String] 
    # @param body_text [String] Body text of the content
    # @param recipients [Hash] Request of type Monite::Recipients, as a Hash
    #   * :bcc (Array<String>) 
    #   * :cc (Array<String>) 
    #   * :to (Array<String>) 
    # @param subject_text [String] Subject text of the content
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::ReceivableSendResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.receivables.send_by_id(
#    receivable_id: "receivable_id",
#    body_text: "body_text",
#    subject_text: "subject_text"
#  )
    def send_by_id(receivable_id:, body_text:, recipients: nil, subject_text:, request_options: nil)
      Async do
        response = @request_client.conn.post do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.monite_version.nil?
    req.headers["x-monite-version"] = request_options.monite_version
  end
  unless request_options&.monite_entity_id.nil?
    req.headers["x-monite-entity-id"] = request_options.monite_entity_id
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request_options&.additional_body_parameters || {}), body_text: body_text, recipients: recipients, subject_text: subject_text }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/receivables/#{receivable_id}/send"
end
        Monite::ReceivableSendResponse.from_json(json_object: response.body)
      end
    end
    # @param receivable_id [String] 
    # @param recipients [Hash] Request of type Monite::Recipients, as a Hash
    #   * :bcc (Array<String>) 
    #   * :cc (Array<String>) 
    #   * :to (Array<String>) 
    # @param reminder_type [Monite::ReminderTypeEnum] The type of the reminder to be sent.
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::ReceivablesSendResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.receivables.send_test_reminder_by_id(receivable_id: "receivable_id", reminder_type: TERM_1)
    def send_test_reminder_by_id(receivable_id:, recipients: nil, reminder_type:, request_options: nil)
      Async do
        response = @request_client.conn.post do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.monite_version.nil?
    req.headers["x-monite-version"] = request_options.monite_version
  end
  unless request_options&.monite_entity_id.nil?
    req.headers["x-monite-entity-id"] = request_options.monite_entity_id
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request_options&.additional_body_parameters || {}), recipients: recipients, reminder_type: reminder_type }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/receivables/#{receivable_id}/send_test_reminder"
end
        Monite::ReceivablesSendResponse.from_json(json_object: response.body)
      end
    end
    # @param receivable_id [String] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::ReceivablesVerifyResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.receivables.verify_by_id(receivable_id: "receivable_id")
    def verify_by_id(receivable_id:, request_options: nil)
      Async do
        response = @request_client.conn.post do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.monite_version.nil?
    req.headers["x-monite-version"] = request_options.monite_version
  end
  unless request_options&.monite_entity_id.nil?
    req.headers["x-monite-entity-id"] = request_options.monite_entity_id
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/receivables/#{receivable_id}/verify"
end
        Monite::ReceivablesVerifyResponse.from_json(json_object: response.body)
      end
    end
  end
end