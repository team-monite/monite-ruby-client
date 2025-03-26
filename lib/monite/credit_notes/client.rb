# frozen_string_literal: true
require_relative "../../requests"
require_relative "../types/order_enum"
require_relative "../types/credit_note_cursor_fields"
require "date"
require "date"
require "date"
require "date"
require_relative "../types/credit_note_state_enum"
require_relative "../types/currency_enum"
require_relative "../types/credit_note_pagination_response"
require_relative "../types/credit_note_response"
require_relative "../../core/file_utilities"
require_relative "../types/credit_note_line_item_cursor_fields"
require "date"
require "date"
require "date"
require "date"
require_relative "../types/credit_note_line_item_pagination_response"
require_relative "../types/credit_note_line_item_create_request"
require_relative "../types/credit_note_line_item_response"
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
  class CreditNotesClient
  # @return [Monite::RequestClient] 
    attr_reader :request_client


    # @param request_client [Monite::RequestClient] 
    # @return [Monite::CreditNotesClient]
    def initialize(request_client:)
      @request_client = request_client
    end
    # @param order [Monite::OrderEnum] Sort order (ascending by default). Typically used together with the `sort`
#  parameter.
    # @param limit [Integer] The number of items (0 .. 100) to return in a single page of the response. The
#  response may contain fewer items if it is the last or only page.
    # @param pagination_token [String] A pagination token obtained from a previous call to this endpoint. Use it to get
#  the next or previous page of results for your initial query. If
#  `pagination_token` is specified, all other query parameters are ignored and
#  inferred from the initial query.
#  If not specified, the first page of results will be returned.
    # @param sort [Monite::CreditNoteCursorFields] The field to sort the results by. Typically used together with the `order`
#  parameter.
    # @param created_at_gt [DateTime] 
    # @param created_at_lt [DateTime] 
    # @param created_at_gte [DateTime] 
    # @param created_at_lte [DateTime] 
    # @param issued_at [String] 
    # @param issued_at_gt [String] 
    # @param issued_at_lt [String] 
    # @param issued_at_gte [String] 
    # @param issued_at_lte [String] 
    # @param document_id [String] 
    # @param document_id_iexact [String] 
    # @param document_id_contains [String] 
    # @param document_id_icontains [String] 
    # @param total_amount_gt [Integer] 
    # @param total_amount_lt [Integer] 
    # @param total_amount_gte [Integer] 
    # @param total_amount_lte [Integer] 
    # @param subtotal_gt [Integer] 
    # @param subtotal_lt [Integer] 
    # @param subtotal_gte [Integer] 
    # @param subtotal_lte [Integer] 
    # @param based_on [String] 
    # @param counterpart_id [String] 
    # @param created_by_entity_user_id [String] 
    # @param status [Monite::CreditNoteStateEnum] 
    # @param status_in [Monite::CreditNoteStateEnum] 
    # @param status_not_in [Monite::CreditNoteStateEnum] 
    # @param currency [Monite::CurrencyEnum] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::CreditNotePaginationResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.credit_notes.get_payable_credit_notes
    def get_payable_credit_notes(order: nil, limit: nil, pagination_token: nil, sort: nil, created_at_gt: nil, created_at_lt: nil, created_at_gte: nil, created_at_lte: nil, issued_at: nil, issued_at_gt: nil, issued_at_lt: nil, issued_at_gte: nil, issued_at_lte: nil, document_id: nil, document_id_iexact: nil, document_id_contains: nil, document_id_icontains: nil, total_amount_gt: nil, total_amount_lt: nil, total_amount_gte: nil, total_amount_lte: nil, subtotal_gt: nil, subtotal_lt: nil, subtotal_gte: nil, subtotal_lte: nil, based_on: nil, counterpart_id: nil, created_by_entity_user_id: nil, status: nil, status_in: nil, status_not_in: nil, currency: nil, request_options: nil)
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
  req.params = { **(request_options&.additional_query_parameters || {}), "order": order, "limit": limit, "pagination_token": pagination_token, "sort": sort, "created_at__gt": created_at_gt, "created_at__lt": created_at_lt, "created_at__gte": created_at_gte, "created_at__lte": created_at_lte, "issued_at": issued_at, "issued_at__gt": issued_at_gt, "issued_at__lt": issued_at_lt, "issued_at__gte": issued_at_gte, "issued_at__lte": issued_at_lte, "document_id": document_id, "document_id__iexact": document_id_iexact, "document_id__contains": document_id_contains, "document_id__icontains": document_id_icontains, "total_amount__gt": total_amount_gt, "total_amount__lt": total_amount_lt, "total_amount__gte": total_amount_gte, "total_amount__lte": total_amount_lte, "subtotal__gt": subtotal_gt, "subtotal__lt": subtotal_lt, "subtotal__gte": subtotal_gte, "subtotal__lte": subtotal_lte, "based_on": based_on, "counterpart_id": counterpart_id, "created_by_entity_user_id": created_by_entity_user_id, "status": status, "status__in": status_in, "status__not_in": status_not_in, "currency": currency }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/payable_credit_notes"
end
      Monite::CreditNotePaginationResponse.from_json(json_object: response.body)
    end
    # @param based_on [String] ID of the payable this credit note is based on. The credit note will be linked
#  to this payable
    # @param based_on_document_id [String] The document ID of the original payable that this credit note refers to
    # @param counterpart_address_id [String] The ID of the counterpart's address
    # @param counterpart_bank_account_id [String] The ID of the counterpart's bank account
    # @param counterpart_id [String] The ID of the counterpart (vendor/supplier)
    # @param counterpart_vat_id_id [String] The ID of the counterpart's VAT registration
    # @param currency [Monite::CurrencyEnum] The currency code of the credit note
    # @param description [String] An arbitrary description of this credit note
    # @param document_id [String] A unique credit note number assigned by the credit note issuer for tracking
#  purposes
    # @param issued_at [String] The date when the credit note was issued, in the YYYY-MM-DD format
    # @param project_id [String] The ID of the project this credit note belongs to
    # @param sender [String] The email address from which the credit note was received
    # @param subtotal [Integer] The subtotal amount before taxes
    # @param tag_ids [Array<String>] List of tag IDs associated with this credit note
    # @param tax [Integer] The tax percentage applied to the subtotal
    # @param tax_amount [Integer] The calculated tax amount
    # @param total_amount [Integer] The total amount including taxes
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::CreditNoteResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.credit_notes.post_payable_credit_notes(document_id: "CN-2287", issued_at: "2024-01-15")
    def post_payable_credit_notes(based_on: nil, based_on_document_id: nil, counterpart_address_id: nil, counterpart_bank_account_id: nil, counterpart_id: nil, counterpart_vat_id_id: nil, currency: nil, description: nil, document_id:, issued_at:, project_id: nil, sender: nil, subtotal: nil, tag_ids: nil, tax: nil, tax_amount: nil, total_amount: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), based_on: based_on, based_on_document_id: based_on_document_id, counterpart_address_id: counterpart_address_id, counterpart_bank_account_id: counterpart_bank_account_id, counterpart_id: counterpart_id, counterpart_vat_id_id: counterpart_vat_id_id, currency: currency, description: description, document_id: document_id, issued_at: issued_at, project_id: project_id, sender: sender, subtotal: subtotal, tag_ids: tag_ids, tax: tax, tax_amount: tax_amount, total_amount: total_amount }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/payable_credit_notes"
end
      Monite::CreditNoteResponse.from_json(json_object: response.body)
    end
# Upload an incoming credit note (payable) in PDF, PNG, JPEG, or TIFF format and
#  scan its contents. The maximum file size is 10MB.
    #
    # @param file [String, IO] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::CreditNoteResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.credit_notes.post_payable_credit_notes_upload_from_file(file: my_file.txt)
    def post_payable_credit_notes_upload_from_file(file:, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), file: Monite::FileUtilities.as_faraday_multipart(file_like: file) }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/payable_credit_notes/upload_from_file"
end
      Monite::CreditNoteResponse.from_json(json_object: response.body)
    end
    # @param credit_note_id [String] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::CreditNoteResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.credit_notes.get_payable_credit_notes_id(credit_note_id: "credit_note_id")
    def get_payable_credit_notes_id(credit_note_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/payable_credit_notes/#{credit_note_id}"
end
      Monite::CreditNoteResponse.from_json(json_object: response.body)
    end
    # @param credit_note_id [String] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Void]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.credit_notes.delete_payable_credit_notes_id(credit_note_id: "credit_note_id")
    def delete_payable_credit_notes_id(credit_note_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/payable_credit_notes/#{credit_note_id}"
end
    end
    # @param credit_note_id [String] 
    # @param based_on [String] ID of the payable this credit note is based on. The credit note will be linked
#  to this payable
    # @param based_on_document_id [String] The document ID of the original payable
    # @param counterpart_address_id [String] ID of the counterpart's address
    # @param counterpart_bank_account_id [String] ID of the counterpart's bank account
    # @param counterpart_id [String] ID of the counterpart
    # @param counterpart_vat_id_id [String] ID of the counterpart's VAT registration
    # @param currency [Monite::CurrencyEnum] The currency code of the credit note
    # @param description [String] An arbitrary description of this credit note
    # @param document_id [String] A unique credit note number assigned by the credit note issuer for tracking
#  purposes
    # @param issued_at [String] The date when the credit note was issued, in the YYYY-MM-DD format
    # @param project_id [String] The ID of the project this credit note belongs to
    # @param sender [String] Email address of the sender
    # @param subtotal [Integer] The subtotal amount before taxes
    # @param tag_ids [Array<String>] List of tag IDs associated with this credit note
    # @param tax [Integer] The tax percentage applied to the subtotal
    # @param tax_amount [Integer] The calculated tax amount
    # @param total_amount [Integer] The total amount including taxes
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::CreditNoteResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.credit_notes.patch_payable_credit_notes_id(credit_note_id: "credit_note_id")
    def patch_payable_credit_notes_id(credit_note_id:, based_on: nil, based_on_document_id: nil, counterpart_address_id: nil, counterpart_bank_account_id: nil, counterpart_id: nil, counterpart_vat_id_id: nil, currency: nil, description: nil, document_id: nil, issued_at: nil, project_id: nil, sender: nil, subtotal: nil, tag_ids: nil, tax: nil, tax_amount: nil, total_amount: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), based_on: based_on, based_on_document_id: based_on_document_id, counterpart_address_id: counterpart_address_id, counterpart_bank_account_id: counterpart_bank_account_id, counterpart_id: counterpart_id, counterpart_vat_id_id: counterpart_vat_id_id, currency: currency, description: description, document_id: document_id, issued_at: issued_at, project_id: project_id, sender: sender, subtotal: subtotal, tag_ids: tag_ids, tax: tax, tax_amount: tax_amount, total_amount: total_amount }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/payable_credit_notes/#{credit_note_id}"
end
      Monite::CreditNoteResponse.from_json(json_object: response.body)
    end
# Approve the credit note for appliance.
    #
    # @param credit_note_id [String] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::CreditNoteResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.credit_notes.post_payable_credit_notes_id_approve(credit_note_id: "credit_note_id")
    def post_payable_credit_notes_id_approve(credit_note_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/payable_credit_notes/#{credit_note_id}/approve"
end
      Monite::CreditNoteResponse.from_json(json_object: response.body)
    end
# Cancel the credit note that was not confirmed during the review.
    #
    # @param credit_note_id [String] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::CreditNoteResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.credit_notes.post_payable_credit_notes_id_cancel(credit_note_id: "credit_note_id")
    def post_payable_credit_notes_id_cancel(credit_note_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/payable_credit_notes/#{credit_note_id}/cancel"
end
      Monite::CreditNoteResponse.from_json(json_object: response.body)
    end
# Request to cancel the OCR processing of the specified credit note.
    #
    # @param credit_note_id [String] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::CreditNoteResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.credit_notes.post_payable_credit_notes_id_cancel_ocr(credit_note_id: "credit_note_id")
    def post_payable_credit_notes_id_cancel_ocr(credit_note_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/payable_credit_notes/#{credit_note_id}/cancel_ocr"
end
      Monite::CreditNoteResponse.from_json(json_object: response.body)
    end
    # @param credit_note_id [String] 
    # @param order [Monite::OrderEnum] Sort order (ascending by default). Typically used together with the `sort`
#  parameter.
    # @param limit [Integer] The number of items (0 .. 100) to return in a single page of the response. The
#  response may contain fewer items if it is the last or only page.
    # @param pagination_token [String] A pagination token obtained from a previous call to this endpoint. Use it to get
#  the next or previous page of results for your initial query. If
#  `pagination_token` is specified, all other query parameters are ignored and
#  inferred from the initial query.
#  If not specified, the first page of results will be returned.
    # @param sort [Monite::CreditNoteLineItemCursorFields] The field to sort the results by. Typically used together with the `order`
#  parameter.
    # @param created_at_gt [DateTime] 
    # @param created_at_lt [DateTime] 
    # @param created_at_gte [DateTime] 
    # @param created_at_lte [DateTime] 
    # @param name [String] 
    # @param name_iexact [String] 
    # @param name_contains [String] 
    # @param name_icontains [String] 
    # @param description [String] 
    # @param description_contains [String] 
    # @param description_icontains [String] 
    # @param total_gt [Integer] 
    # @param total_lt [Integer] 
    # @param total_gte [Integer] 
    # @param total_lte [Integer] 
    # @param subtotal_gt [Integer] 
    # @param subtotal_lt [Integer] 
    # @param subtotal_gte [Integer] 
    # @param subtotal_lte [Integer] 
    # @param unit_price_gt [Integer] 
    # @param unit_price_lt [Integer] 
    # @param unit_price_gte [Integer] 
    # @param unit_price_lte [Integer] 
    # @param quantity_gt [Float] 
    # @param quantity_lt [Float] 
    # @param quantity_gte [Float] 
    # @param quantity_lte [Float] 
    # @param tax_gt [Integer] 
    # @param tax_lt [Integer] 
    # @param tax_gte [Integer] 
    # @param tax_lte [Integer] 
    # @param tax_amount_gt [Integer] 
    # @param tax_amount_lt [Integer] 
    # @param tax_amount_gte [Integer] 
    # @param tax_amount_lte [Integer] 
    # @param created_by_user_id [String] 
    # @param unit [String] 
    # @param unit_iexact [String] 
    # @param source [String] 
    # @param source_id [String] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::CreditNoteLineItemPaginationResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.credit_notes.get_payable_credit_notes_id_line_items(credit_note_id: "credit_note_id")
    def get_payable_credit_notes_id_line_items(credit_note_id:, order: nil, limit: nil, pagination_token: nil, sort: nil, created_at_gt: nil, created_at_lt: nil, created_at_gte: nil, created_at_lte: nil, name: nil, name_iexact: nil, name_contains: nil, name_icontains: nil, description: nil, description_contains: nil, description_icontains: nil, total_gt: nil, total_lt: nil, total_gte: nil, total_lte: nil, subtotal_gt: nil, subtotal_lt: nil, subtotal_gte: nil, subtotal_lte: nil, unit_price_gt: nil, unit_price_lt: nil, unit_price_gte: nil, unit_price_lte: nil, quantity_gt: nil, quantity_lt: nil, quantity_gte: nil, quantity_lte: nil, tax_gt: nil, tax_lt: nil, tax_gte: nil, tax_lte: nil, tax_amount_gt: nil, tax_amount_lt: nil, tax_amount_gte: nil, tax_amount_lte: nil, created_by_user_id: nil, unit: nil, unit_iexact: nil, source: nil, source_id: nil, request_options: nil)
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
  req.params = { **(request_options&.additional_query_parameters || {}), "order": order, "limit": limit, "pagination_token": pagination_token, "sort": sort, "created_at__gt": created_at_gt, "created_at__lt": created_at_lt, "created_at__gte": created_at_gte, "created_at__lte": created_at_lte, "name": name, "name__iexact": name_iexact, "name__contains": name_contains, "name__icontains": name_icontains, "description": description, "description__contains": description_contains, "description__icontains": description_icontains, "total__gt": total_gt, "total__lt": total_lt, "total__gte": total_gte, "total__lte": total_lte, "subtotal__gt": subtotal_gt, "subtotal__lt": subtotal_lt, "subtotal__gte": subtotal_gte, "subtotal__lte": subtotal_lte, "unit_price__gt": unit_price_gt, "unit_price__lt": unit_price_lt, "unit_price__gte": unit_price_gte, "unit_price__lte": unit_price_lte, "quantity__gt": quantity_gt, "quantity__lt": quantity_lt, "quantity__gte": quantity_gte, "quantity__lte": quantity_lte, "tax__gt": tax_gt, "tax__lt": tax_lt, "tax__gte": tax_gte, "tax__lte": tax_lte, "tax_amount__gt": tax_amount_gt, "tax_amount__lt": tax_amount_lt, "tax_amount__gte": tax_amount_gte, "tax_amount__lte": tax_amount_lte, "created_by_user_id": created_by_user_id, "unit": unit, "unit__iexact": unit_iexact, "source": source, "source_id": source_id }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/payable_credit_notes/#{credit_note_id}/line_items"
end
      Monite::CreditNoteLineItemPaginationResponse.from_json(json_object: response.body)
    end
    # @param credit_note_id [String] 
    # @param request [Hash] Request of type Monite::CreditNoteLineItemCreateRequest, as a Hash
    #   * :description (String) 
    #   * :name (String) 
    #   * :quantity (Float) 
    #   * :tax (Integer) 
    #   * :unit (String) 
    #   * :unit_price (Integer) 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::CreditNoteLineItemResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.credit_notes.post_payable_credit_notes_id_line_items(credit_note_id: "credit_note_id", request: {  })
    def post_payable_credit_notes_id_line_items(credit_note_id:, request:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/payable_credit_notes/#{credit_note_id}/line_items"
end
      Monite::CreditNoteLineItemResponse.from_json(json_object: response.body)
    end
    # @param credit_note_id [String] 
    # @param data [Array<Hash>] List of credit note line items to replace existing onesRequest of type Array<Monite::CreditNoteLineItemCreateRequest>, as a Hash
    #   * :description (String) 
    #   * :name (String) 
    #   * :quantity (Float) 
    #   * :tax (Integer) 
    #   * :unit (String) 
    #   * :unit_price (Integer) 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::CreditNoteLineItemPaginationResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.credit_notes.put_payable_credit_notes_id_line_items(credit_note_id: "credit_note_id", data: [{  }])
    def put_payable_credit_notes_id_line_items(credit_note_id:, data:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/payable_credit_notes/#{credit_note_id}/line_items"
end
      Monite::CreditNoteLineItemPaginationResponse.from_json(json_object: response.body)
    end
    # @param credit_note_id [String] 
    # @param line_item_id [String] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::CreditNoteLineItemResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.credit_notes.get_payable_credit_notes_id_line_items_id(credit_note_id: "credit_note_id", line_item_id: "line_item_id")
    def get_payable_credit_notes_id_line_items_id(credit_note_id:, line_item_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/payable_credit_notes/#{credit_note_id}/line_items/#{line_item_id}"
end
      Monite::CreditNoteLineItemResponse.from_json(json_object: response.body)
    end
    # @param credit_note_id [String] 
    # @param line_item_id [String] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::CreditNoteLineItemPaginationResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.credit_notes.delete_payable_credit_notes_id_line_items_id(credit_note_id: "credit_note_id", line_item_id: "line_item_id")
    def delete_payable_credit_notes_id_line_items_id(credit_note_id:, line_item_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/payable_credit_notes/#{credit_note_id}/line_items/#{line_item_id}"
end
      Monite::CreditNoteLineItemPaginationResponse.from_json(json_object: response.body)
    end
    # @param credit_note_id [String] 
    # @param line_item_id [String] 
    # @param description [String] Detailed description of the line item
    # @param name [String] Name or title of the line item
    # @param quantity [Float] Quantity of items
    # @param tax [Integer] VAT rate in percent [minor
#  units](https://docs.monite.com/references/currencies#minor-units). Example:
#  12.5% is 1250.
    # @param unit [String] Unit of measurement
    # @param unit_price [Integer] Price per unit in smallest currency unit
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::CreditNoteLineItemResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.credit_notes.patch_payable_credit_notes_id_line_items_id(credit_note_id: "credit_note_id", line_item_id: "line_item_id")
    def patch_payable_credit_notes_id_line_items_id(credit_note_id:, line_item_id:, description: nil, name: nil, quantity: nil, tax: nil, unit: nil, unit_price: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), description: description, name: name, quantity: quantity, tax: tax, unit: unit, unit_price: unit_price }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/payable_credit_notes/#{credit_note_id}/line_items/#{line_item_id}"
end
      Monite::CreditNoteLineItemResponse.from_json(json_object: response.body)
    end
# Decline the credit note when an approver finds any mismatch or discrepancies.
    #
    # @param credit_note_id [String] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::CreditNoteResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.credit_notes.post_payable_credit_notes_id_reject(credit_note_id: "credit_note_id")
    def post_payable_credit_notes_id_reject(credit_note_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/payable_credit_notes/#{credit_note_id}/reject"
end
      Monite::CreditNoteResponse.from_json(json_object: response.body)
    end
# Start the approval process once the uploaded credit note is validated.
    #
    # @param credit_note_id [String] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::CreditNoteResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.credit_notes.post_payable_credit_notes_id_submit_for_approval(credit_note_id: "credit_note_id")
    def post_payable_credit_notes_id_submit_for_approval(credit_note_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/payable_credit_notes/#{credit_note_id}/submit_for_approval"
end
      Monite::CreditNoteResponse.from_json(json_object: response.body)
    end
  end
  class AsyncCreditNotesClient
  # @return [Monite::AsyncRequestClient] 
    attr_reader :request_client


    # @param request_client [Monite::RequestClient] 
    # @return [Monite::AsyncCreditNotesClient]
    def initialize(request_client:)
      @request_client = request_client
    end
    # @param order [Monite::OrderEnum] Sort order (ascending by default). Typically used together with the `sort`
#  parameter.
    # @param limit [Integer] The number of items (0 .. 100) to return in a single page of the response. The
#  response may contain fewer items if it is the last or only page.
    # @param pagination_token [String] A pagination token obtained from a previous call to this endpoint. Use it to get
#  the next or previous page of results for your initial query. If
#  `pagination_token` is specified, all other query parameters are ignored and
#  inferred from the initial query.
#  If not specified, the first page of results will be returned.
    # @param sort [Monite::CreditNoteCursorFields] The field to sort the results by. Typically used together with the `order`
#  parameter.
    # @param created_at_gt [DateTime] 
    # @param created_at_lt [DateTime] 
    # @param created_at_gte [DateTime] 
    # @param created_at_lte [DateTime] 
    # @param issued_at [String] 
    # @param issued_at_gt [String] 
    # @param issued_at_lt [String] 
    # @param issued_at_gte [String] 
    # @param issued_at_lte [String] 
    # @param document_id [String] 
    # @param document_id_iexact [String] 
    # @param document_id_contains [String] 
    # @param document_id_icontains [String] 
    # @param total_amount_gt [Integer] 
    # @param total_amount_lt [Integer] 
    # @param total_amount_gte [Integer] 
    # @param total_amount_lte [Integer] 
    # @param subtotal_gt [Integer] 
    # @param subtotal_lt [Integer] 
    # @param subtotal_gte [Integer] 
    # @param subtotal_lte [Integer] 
    # @param based_on [String] 
    # @param counterpart_id [String] 
    # @param created_by_entity_user_id [String] 
    # @param status [Monite::CreditNoteStateEnum] 
    # @param status_in [Monite::CreditNoteStateEnum] 
    # @param status_not_in [Monite::CreditNoteStateEnum] 
    # @param currency [Monite::CurrencyEnum] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::CreditNotePaginationResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.credit_notes.get_payable_credit_notes
    def get_payable_credit_notes(order: nil, limit: nil, pagination_token: nil, sort: nil, created_at_gt: nil, created_at_lt: nil, created_at_gte: nil, created_at_lte: nil, issued_at: nil, issued_at_gt: nil, issued_at_lt: nil, issued_at_gte: nil, issued_at_lte: nil, document_id: nil, document_id_iexact: nil, document_id_contains: nil, document_id_icontains: nil, total_amount_gt: nil, total_amount_lt: nil, total_amount_gte: nil, total_amount_lte: nil, subtotal_gt: nil, subtotal_lt: nil, subtotal_gte: nil, subtotal_lte: nil, based_on: nil, counterpart_id: nil, created_by_entity_user_id: nil, status: nil, status_in: nil, status_not_in: nil, currency: nil, request_options: nil)
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
  req.params = { **(request_options&.additional_query_parameters || {}), "order": order, "limit": limit, "pagination_token": pagination_token, "sort": sort, "created_at__gt": created_at_gt, "created_at__lt": created_at_lt, "created_at__gte": created_at_gte, "created_at__lte": created_at_lte, "issued_at": issued_at, "issued_at__gt": issued_at_gt, "issued_at__lt": issued_at_lt, "issued_at__gte": issued_at_gte, "issued_at__lte": issued_at_lte, "document_id": document_id, "document_id__iexact": document_id_iexact, "document_id__contains": document_id_contains, "document_id__icontains": document_id_icontains, "total_amount__gt": total_amount_gt, "total_amount__lt": total_amount_lt, "total_amount__gte": total_amount_gte, "total_amount__lte": total_amount_lte, "subtotal__gt": subtotal_gt, "subtotal__lt": subtotal_lt, "subtotal__gte": subtotal_gte, "subtotal__lte": subtotal_lte, "based_on": based_on, "counterpart_id": counterpart_id, "created_by_entity_user_id": created_by_entity_user_id, "status": status, "status__in": status_in, "status__not_in": status_not_in, "currency": currency }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/payable_credit_notes"
end
        Monite::CreditNotePaginationResponse.from_json(json_object: response.body)
      end
    end
    # @param based_on [String] ID of the payable this credit note is based on. The credit note will be linked
#  to this payable
    # @param based_on_document_id [String] The document ID of the original payable that this credit note refers to
    # @param counterpart_address_id [String] The ID of the counterpart's address
    # @param counterpart_bank_account_id [String] The ID of the counterpart's bank account
    # @param counterpart_id [String] The ID of the counterpart (vendor/supplier)
    # @param counterpart_vat_id_id [String] The ID of the counterpart's VAT registration
    # @param currency [Monite::CurrencyEnum] The currency code of the credit note
    # @param description [String] An arbitrary description of this credit note
    # @param document_id [String] A unique credit note number assigned by the credit note issuer for tracking
#  purposes
    # @param issued_at [String] The date when the credit note was issued, in the YYYY-MM-DD format
    # @param project_id [String] The ID of the project this credit note belongs to
    # @param sender [String] The email address from which the credit note was received
    # @param subtotal [Integer] The subtotal amount before taxes
    # @param tag_ids [Array<String>] List of tag IDs associated with this credit note
    # @param tax [Integer] The tax percentage applied to the subtotal
    # @param tax_amount [Integer] The calculated tax amount
    # @param total_amount [Integer] The total amount including taxes
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::CreditNoteResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.credit_notes.post_payable_credit_notes(document_id: "CN-2287", issued_at: "2024-01-15")
    def post_payable_credit_notes(based_on: nil, based_on_document_id: nil, counterpart_address_id: nil, counterpart_bank_account_id: nil, counterpart_id: nil, counterpart_vat_id_id: nil, currency: nil, description: nil, document_id:, issued_at:, project_id: nil, sender: nil, subtotal: nil, tag_ids: nil, tax: nil, tax_amount: nil, total_amount: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), based_on: based_on, based_on_document_id: based_on_document_id, counterpart_address_id: counterpart_address_id, counterpart_bank_account_id: counterpart_bank_account_id, counterpart_id: counterpart_id, counterpart_vat_id_id: counterpart_vat_id_id, currency: currency, description: description, document_id: document_id, issued_at: issued_at, project_id: project_id, sender: sender, subtotal: subtotal, tag_ids: tag_ids, tax: tax, tax_amount: tax_amount, total_amount: total_amount }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/payable_credit_notes"
end
        Monite::CreditNoteResponse.from_json(json_object: response.body)
      end
    end
# Upload an incoming credit note (payable) in PDF, PNG, JPEG, or TIFF format and
#  scan its contents. The maximum file size is 10MB.
    #
    # @param file [String, IO] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::CreditNoteResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.credit_notes.post_payable_credit_notes_upload_from_file(file: my_file.txt)
    def post_payable_credit_notes_upload_from_file(file:, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), file: Monite::FileUtilities.as_faraday_multipart(file_like: file) }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/payable_credit_notes/upload_from_file"
end
        Monite::CreditNoteResponse.from_json(json_object: response.body)
      end
    end
    # @param credit_note_id [String] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::CreditNoteResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.credit_notes.get_payable_credit_notes_id(credit_note_id: "credit_note_id")
    def get_payable_credit_notes_id(credit_note_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/payable_credit_notes/#{credit_note_id}"
end
        Monite::CreditNoteResponse.from_json(json_object: response.body)
      end
    end
    # @param credit_note_id [String] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Void]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.credit_notes.delete_payable_credit_notes_id(credit_note_id: "credit_note_id")
    def delete_payable_credit_notes_id(credit_note_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/payable_credit_notes/#{credit_note_id}"
end
      end
    end
    # @param credit_note_id [String] 
    # @param based_on [String] ID of the payable this credit note is based on. The credit note will be linked
#  to this payable
    # @param based_on_document_id [String] The document ID of the original payable
    # @param counterpart_address_id [String] ID of the counterpart's address
    # @param counterpart_bank_account_id [String] ID of the counterpart's bank account
    # @param counterpart_id [String] ID of the counterpart
    # @param counterpart_vat_id_id [String] ID of the counterpart's VAT registration
    # @param currency [Monite::CurrencyEnum] The currency code of the credit note
    # @param description [String] An arbitrary description of this credit note
    # @param document_id [String] A unique credit note number assigned by the credit note issuer for tracking
#  purposes
    # @param issued_at [String] The date when the credit note was issued, in the YYYY-MM-DD format
    # @param project_id [String] The ID of the project this credit note belongs to
    # @param sender [String] Email address of the sender
    # @param subtotal [Integer] The subtotal amount before taxes
    # @param tag_ids [Array<String>] List of tag IDs associated with this credit note
    # @param tax [Integer] The tax percentage applied to the subtotal
    # @param tax_amount [Integer] The calculated tax amount
    # @param total_amount [Integer] The total amount including taxes
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::CreditNoteResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.credit_notes.patch_payable_credit_notes_id(credit_note_id: "credit_note_id")
    def patch_payable_credit_notes_id(credit_note_id:, based_on: nil, based_on_document_id: nil, counterpart_address_id: nil, counterpart_bank_account_id: nil, counterpart_id: nil, counterpart_vat_id_id: nil, currency: nil, description: nil, document_id: nil, issued_at: nil, project_id: nil, sender: nil, subtotal: nil, tag_ids: nil, tax: nil, tax_amount: nil, total_amount: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), based_on: based_on, based_on_document_id: based_on_document_id, counterpart_address_id: counterpart_address_id, counterpart_bank_account_id: counterpart_bank_account_id, counterpart_id: counterpart_id, counterpart_vat_id_id: counterpart_vat_id_id, currency: currency, description: description, document_id: document_id, issued_at: issued_at, project_id: project_id, sender: sender, subtotal: subtotal, tag_ids: tag_ids, tax: tax, tax_amount: tax_amount, total_amount: total_amount }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/payable_credit_notes/#{credit_note_id}"
end
        Monite::CreditNoteResponse.from_json(json_object: response.body)
      end
    end
# Approve the credit note for appliance.
    #
    # @param credit_note_id [String] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::CreditNoteResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.credit_notes.post_payable_credit_notes_id_approve(credit_note_id: "credit_note_id")
    def post_payable_credit_notes_id_approve(credit_note_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/payable_credit_notes/#{credit_note_id}/approve"
end
        Monite::CreditNoteResponse.from_json(json_object: response.body)
      end
    end
# Cancel the credit note that was not confirmed during the review.
    #
    # @param credit_note_id [String] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::CreditNoteResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.credit_notes.post_payable_credit_notes_id_cancel(credit_note_id: "credit_note_id")
    def post_payable_credit_notes_id_cancel(credit_note_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/payable_credit_notes/#{credit_note_id}/cancel"
end
        Monite::CreditNoteResponse.from_json(json_object: response.body)
      end
    end
# Request to cancel the OCR processing of the specified credit note.
    #
    # @param credit_note_id [String] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::CreditNoteResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.credit_notes.post_payable_credit_notes_id_cancel_ocr(credit_note_id: "credit_note_id")
    def post_payable_credit_notes_id_cancel_ocr(credit_note_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/payable_credit_notes/#{credit_note_id}/cancel_ocr"
end
        Monite::CreditNoteResponse.from_json(json_object: response.body)
      end
    end
    # @param credit_note_id [String] 
    # @param order [Monite::OrderEnum] Sort order (ascending by default). Typically used together with the `sort`
#  parameter.
    # @param limit [Integer] The number of items (0 .. 100) to return in a single page of the response. The
#  response may contain fewer items if it is the last or only page.
    # @param pagination_token [String] A pagination token obtained from a previous call to this endpoint. Use it to get
#  the next or previous page of results for your initial query. If
#  `pagination_token` is specified, all other query parameters are ignored and
#  inferred from the initial query.
#  If not specified, the first page of results will be returned.
    # @param sort [Monite::CreditNoteLineItemCursorFields] The field to sort the results by. Typically used together with the `order`
#  parameter.
    # @param created_at_gt [DateTime] 
    # @param created_at_lt [DateTime] 
    # @param created_at_gte [DateTime] 
    # @param created_at_lte [DateTime] 
    # @param name [String] 
    # @param name_iexact [String] 
    # @param name_contains [String] 
    # @param name_icontains [String] 
    # @param description [String] 
    # @param description_contains [String] 
    # @param description_icontains [String] 
    # @param total_gt [Integer] 
    # @param total_lt [Integer] 
    # @param total_gte [Integer] 
    # @param total_lte [Integer] 
    # @param subtotal_gt [Integer] 
    # @param subtotal_lt [Integer] 
    # @param subtotal_gte [Integer] 
    # @param subtotal_lte [Integer] 
    # @param unit_price_gt [Integer] 
    # @param unit_price_lt [Integer] 
    # @param unit_price_gte [Integer] 
    # @param unit_price_lte [Integer] 
    # @param quantity_gt [Float] 
    # @param quantity_lt [Float] 
    # @param quantity_gte [Float] 
    # @param quantity_lte [Float] 
    # @param tax_gt [Integer] 
    # @param tax_lt [Integer] 
    # @param tax_gte [Integer] 
    # @param tax_lte [Integer] 
    # @param tax_amount_gt [Integer] 
    # @param tax_amount_lt [Integer] 
    # @param tax_amount_gte [Integer] 
    # @param tax_amount_lte [Integer] 
    # @param created_by_user_id [String] 
    # @param unit [String] 
    # @param unit_iexact [String] 
    # @param source [String] 
    # @param source_id [String] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::CreditNoteLineItemPaginationResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.credit_notes.get_payable_credit_notes_id_line_items(credit_note_id: "credit_note_id")
    def get_payable_credit_notes_id_line_items(credit_note_id:, order: nil, limit: nil, pagination_token: nil, sort: nil, created_at_gt: nil, created_at_lt: nil, created_at_gte: nil, created_at_lte: nil, name: nil, name_iexact: nil, name_contains: nil, name_icontains: nil, description: nil, description_contains: nil, description_icontains: nil, total_gt: nil, total_lt: nil, total_gte: nil, total_lte: nil, subtotal_gt: nil, subtotal_lt: nil, subtotal_gte: nil, subtotal_lte: nil, unit_price_gt: nil, unit_price_lt: nil, unit_price_gte: nil, unit_price_lte: nil, quantity_gt: nil, quantity_lt: nil, quantity_gte: nil, quantity_lte: nil, tax_gt: nil, tax_lt: nil, tax_gte: nil, tax_lte: nil, tax_amount_gt: nil, tax_amount_lt: nil, tax_amount_gte: nil, tax_amount_lte: nil, created_by_user_id: nil, unit: nil, unit_iexact: nil, source: nil, source_id: nil, request_options: nil)
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
  req.params = { **(request_options&.additional_query_parameters || {}), "order": order, "limit": limit, "pagination_token": pagination_token, "sort": sort, "created_at__gt": created_at_gt, "created_at__lt": created_at_lt, "created_at__gte": created_at_gte, "created_at__lte": created_at_lte, "name": name, "name__iexact": name_iexact, "name__contains": name_contains, "name__icontains": name_icontains, "description": description, "description__contains": description_contains, "description__icontains": description_icontains, "total__gt": total_gt, "total__lt": total_lt, "total__gte": total_gte, "total__lte": total_lte, "subtotal__gt": subtotal_gt, "subtotal__lt": subtotal_lt, "subtotal__gte": subtotal_gte, "subtotal__lte": subtotal_lte, "unit_price__gt": unit_price_gt, "unit_price__lt": unit_price_lt, "unit_price__gte": unit_price_gte, "unit_price__lte": unit_price_lte, "quantity__gt": quantity_gt, "quantity__lt": quantity_lt, "quantity__gte": quantity_gte, "quantity__lte": quantity_lte, "tax__gt": tax_gt, "tax__lt": tax_lt, "tax__gte": tax_gte, "tax__lte": tax_lte, "tax_amount__gt": tax_amount_gt, "tax_amount__lt": tax_amount_lt, "tax_amount__gte": tax_amount_gte, "tax_amount__lte": tax_amount_lte, "created_by_user_id": created_by_user_id, "unit": unit, "unit__iexact": unit_iexact, "source": source, "source_id": source_id }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/payable_credit_notes/#{credit_note_id}/line_items"
end
        Monite::CreditNoteLineItemPaginationResponse.from_json(json_object: response.body)
      end
    end
    # @param credit_note_id [String] 
    # @param request [Hash] Request of type Monite::CreditNoteLineItemCreateRequest, as a Hash
    #   * :description (String) 
    #   * :name (String) 
    #   * :quantity (Float) 
    #   * :tax (Integer) 
    #   * :unit (String) 
    #   * :unit_price (Integer) 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::CreditNoteLineItemResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.credit_notes.post_payable_credit_notes_id_line_items(credit_note_id: "credit_note_id", request: {  })
    def post_payable_credit_notes_id_line_items(credit_note_id:, request:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/payable_credit_notes/#{credit_note_id}/line_items"
end
        Monite::CreditNoteLineItemResponse.from_json(json_object: response.body)
      end
    end
    # @param credit_note_id [String] 
    # @param data [Array<Hash>] List of credit note line items to replace existing onesRequest of type Array<Monite::CreditNoteLineItemCreateRequest>, as a Hash
    #   * :description (String) 
    #   * :name (String) 
    #   * :quantity (Float) 
    #   * :tax (Integer) 
    #   * :unit (String) 
    #   * :unit_price (Integer) 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::CreditNoteLineItemPaginationResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.credit_notes.put_payable_credit_notes_id_line_items(credit_note_id: "credit_note_id", data: [{  }])
    def put_payable_credit_notes_id_line_items(credit_note_id:, data:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/payable_credit_notes/#{credit_note_id}/line_items"
end
        Monite::CreditNoteLineItemPaginationResponse.from_json(json_object: response.body)
      end
    end
    # @param credit_note_id [String] 
    # @param line_item_id [String] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::CreditNoteLineItemResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.credit_notes.get_payable_credit_notes_id_line_items_id(credit_note_id: "credit_note_id", line_item_id: "line_item_id")
    def get_payable_credit_notes_id_line_items_id(credit_note_id:, line_item_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/payable_credit_notes/#{credit_note_id}/line_items/#{line_item_id}"
end
        Monite::CreditNoteLineItemResponse.from_json(json_object: response.body)
      end
    end
    # @param credit_note_id [String] 
    # @param line_item_id [String] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::CreditNoteLineItemPaginationResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.credit_notes.delete_payable_credit_notes_id_line_items_id(credit_note_id: "credit_note_id", line_item_id: "line_item_id")
    def delete_payable_credit_notes_id_line_items_id(credit_note_id:, line_item_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/payable_credit_notes/#{credit_note_id}/line_items/#{line_item_id}"
end
        Monite::CreditNoteLineItemPaginationResponse.from_json(json_object: response.body)
      end
    end
    # @param credit_note_id [String] 
    # @param line_item_id [String] 
    # @param description [String] Detailed description of the line item
    # @param name [String] Name or title of the line item
    # @param quantity [Float] Quantity of items
    # @param tax [Integer] VAT rate in percent [minor
#  units](https://docs.monite.com/references/currencies#minor-units). Example:
#  12.5% is 1250.
    # @param unit [String] Unit of measurement
    # @param unit_price [Integer] Price per unit in smallest currency unit
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::CreditNoteLineItemResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.credit_notes.patch_payable_credit_notes_id_line_items_id(credit_note_id: "credit_note_id", line_item_id: "line_item_id")
    def patch_payable_credit_notes_id_line_items_id(credit_note_id:, line_item_id:, description: nil, name: nil, quantity: nil, tax: nil, unit: nil, unit_price: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), description: description, name: name, quantity: quantity, tax: tax, unit: unit, unit_price: unit_price }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/payable_credit_notes/#{credit_note_id}/line_items/#{line_item_id}"
end
        Monite::CreditNoteLineItemResponse.from_json(json_object: response.body)
      end
    end
# Decline the credit note when an approver finds any mismatch or discrepancies.
    #
    # @param credit_note_id [String] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::CreditNoteResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.credit_notes.post_payable_credit_notes_id_reject(credit_note_id: "credit_note_id")
    def post_payable_credit_notes_id_reject(credit_note_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/payable_credit_notes/#{credit_note_id}/reject"
end
        Monite::CreditNoteResponse.from_json(json_object: response.body)
      end
    end
# Start the approval process once the uploaded credit note is validated.
    #
    # @param credit_note_id [String] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::CreditNoteResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.credit_notes.post_payable_credit_notes_id_submit_for_approval(credit_note_id: "credit_note_id")
    def post_payable_credit_notes_id_submit_for_approval(credit_note_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/payable_credit_notes/#{credit_note_id}/submit_for_approval"
end
        Monite::CreditNoteResponse.from_json(json_object: response.body)
      end
    end
  end
end