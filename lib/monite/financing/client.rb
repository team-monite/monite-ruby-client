# frozen_string_literal: true
require_relative "../../requests"
require_relative "../types/order_enum"
require_relative "../types/financing_invoice_cursor_fields"
require_relative "../types/wc_invoice_status"
require_relative "../types/financing_invoice_type"
require "date"
require "date"
require "date"
require "date"
require "date"
require "date"
require "date"
require "date"
require "date"
require "date"
require "date"
require "date"
require_relative "../types/financing_invoice_list_response"
require_relative "../types/financing_push_invoices_request_invoice"
require_relative "../types/financing_push_invoices_response"
require_relative "../types/financing_offers_response"
require_relative "../types/financing_token_response"
require "async"
require "async"
require "async"
require "async"
require_relative "../../requests"

module Monite
  class FinancingClient
  # @return [Monite::RequestClient] 
    attr_reader :request_client


    # @param request_client [Monite::RequestClient] 
    # @return [Monite::FinancingClient]
    def initialize(request_client:)
      @request_client = request_client
    end
# Returns a list of invoices requested for financing
    #
    # @param order [Monite::OrderEnum] Order by
    # @param limit [Integer] Max is 100
    # @param pagination_token [String] A token, obtained from previous page. Prior over other filters
    # @param sort [Monite::FinancingInvoiceCursorFields] Allowed sort fields
    # @param invoice_id [String] ID of a payable or receivable invoice.
    # @param invoice_id_in [String] List of invoice IDs.
    # @param status [Monite::WcInvoiceStatus] Status of the invoice.
    # @param status_in [Monite::WcInvoiceStatus] List of invoice statuses.
    # @param type [Monite::FinancingInvoiceType] Type of the invoice. payable or receivable.
    # @param type_in [Monite::FinancingInvoiceType] List of invoice types.
    # @param document_id [String] Document ID of the invoice.
    # @param document_id_in [String] List of document IDs.
    # @param issue_date_gt [DateTime] Issue date greater than.
    # @param issue_date_lt [DateTime] Issue date less than.
    # @param issue_date_gte [DateTime] Issue date greater than or equal.
    # @param issue_date_lte [DateTime] Issue date less than or equal.
    # @param due_date_gt [DateTime] Due date greater than.
    # @param due_date_lt [DateTime] Due date less than.
    # @param due_date_gte [DateTime] Due date greater than or equal.
    # @param due_date_lte [DateTime] Due date less than or equal.
    # @param created_at_gt [DateTime] Created date greater than.
    # @param created_at_lt [DateTime] Created date less than.
    # @param created_at_gte [DateTime] Created date greater than or equal.
    # @param created_at_lte [DateTime] Created date less than or equal.
    # @param total_amount [Integer] Total amount of the invoice in minor units.
    # @param total_amount_gt [Integer] Total amount greater than.
    # @param total_amount_lt [Integer] Total amount less than.
    # @param total_amount_gte [Integer] Total amount greater than or equal.
    # @param total_amount_lte [Integer] Total amount less than or equal.
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::FinancingInvoiceListResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.financing.get_financing_invoices
    def get_financing_invoices(order: nil, limit: nil, pagination_token: nil, sort: nil, invoice_id: nil, invoice_id_in: nil, status: nil, status_in: nil, type: nil, type_in: nil, document_id: nil, document_id_in: nil, issue_date_gt: nil, issue_date_lt: nil, issue_date_gte: nil, issue_date_lte: nil, due_date_gt: nil, due_date_lt: nil, due_date_gte: nil, due_date_lte: nil, created_at_gt: nil, created_at_lt: nil, created_at_gte: nil, created_at_lte: nil, total_amount: nil, total_amount_gt: nil, total_amount_lt: nil, total_amount_gte: nil, total_amount_lte: nil, request_options: nil)
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
  req.params = { **(request_options&.additional_query_parameters || {}), "order": order, "limit": limit, "pagination_token": pagination_token, "sort": sort, "invoice_id": invoice_id, "invoice_id__in": invoice_id_in, "status": status, "status__in": status_in, "type": type, "type__in": type_in, "document_id": document_id, "document_id__in": document_id_in, "issue_date__gt": issue_date_gt, "issue_date__lt": issue_date_lt, "issue_date__gte": issue_date_gte, "issue_date__lte": issue_date_lte, "due_date__gt": due_date_gt, "due_date__lt": due_date_lt, "due_date__gte": due_date_gte, "due_date__lte": due_date_lte, "created_at__gt": created_at_gt, "created_at__lt": created_at_lt, "created_at__gte": created_at_gte, "created_at__lte": created_at_lte, "total_amount": total_amount, "total_amount__gt": total_amount_gt, "total_amount__lt": total_amount_lt, "total_amount__gte": total_amount_gte, "total_amount__lte": total_amount_lte }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/financing_invoices"
end
      Monite::FinancingInvoiceListResponse.from_json(json_object: response.body)
    end
# Returns a session token and a connect token to open Kanmon SDK for confirming
#  invoice details.
    #
    # @param invoices [Array<Hash>] A list of invoices to request financing for.Request of type Array<Monite::FinancingPushInvoicesRequestInvoice>, as a Hash
    #   * :id (String) 
    #   * :type (Monite::FinancingInvoiceType) 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::FinancingPushInvoicesResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.financing.post_financing_invoices(invoices: [{ id: "id", type: PAYABLE }])
    def post_financing_invoices(invoices:, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), invoices: invoices }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/financing_invoices"
end
      Monite::FinancingPushInvoicesResponse.from_json(json_object: response.body)
    end
# Returns a list of financing offers and the business's onboarding status
    #
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::FinancingOffersResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.financing.get_financing_offers
    def get_financing_offers(request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/financing_offers"
end
      Monite::FinancingOffersResponse.from_json(json_object: response.body)
    end
# Returns a token for Kanmon SDK. Creates a business and user on Kanmon if not
#  already exist.
    #
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::FinancingTokenResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.financing.post_financing_tokens
    def post_financing_tokens(request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/financing_tokens"
end
      Monite::FinancingTokenResponse.from_json(json_object: response.body)
    end
  end
  class AsyncFinancingClient
  # @return [Monite::AsyncRequestClient] 
    attr_reader :request_client


    # @param request_client [Monite::RequestClient] 
    # @return [Monite::AsyncFinancingClient]
    def initialize(request_client:)
      @request_client = request_client
    end
# Returns a list of invoices requested for financing
    #
    # @param order [Monite::OrderEnum] Order by
    # @param limit [Integer] Max is 100
    # @param pagination_token [String] A token, obtained from previous page. Prior over other filters
    # @param sort [Monite::FinancingInvoiceCursorFields] Allowed sort fields
    # @param invoice_id [String] ID of a payable or receivable invoice.
    # @param invoice_id_in [String] List of invoice IDs.
    # @param status [Monite::WcInvoiceStatus] Status of the invoice.
    # @param status_in [Monite::WcInvoiceStatus] List of invoice statuses.
    # @param type [Monite::FinancingInvoiceType] Type of the invoice. payable or receivable.
    # @param type_in [Monite::FinancingInvoiceType] List of invoice types.
    # @param document_id [String] Document ID of the invoice.
    # @param document_id_in [String] List of document IDs.
    # @param issue_date_gt [DateTime] Issue date greater than.
    # @param issue_date_lt [DateTime] Issue date less than.
    # @param issue_date_gte [DateTime] Issue date greater than or equal.
    # @param issue_date_lte [DateTime] Issue date less than or equal.
    # @param due_date_gt [DateTime] Due date greater than.
    # @param due_date_lt [DateTime] Due date less than.
    # @param due_date_gte [DateTime] Due date greater than or equal.
    # @param due_date_lte [DateTime] Due date less than or equal.
    # @param created_at_gt [DateTime] Created date greater than.
    # @param created_at_lt [DateTime] Created date less than.
    # @param created_at_gte [DateTime] Created date greater than or equal.
    # @param created_at_lte [DateTime] Created date less than or equal.
    # @param total_amount [Integer] Total amount of the invoice in minor units.
    # @param total_amount_gt [Integer] Total amount greater than.
    # @param total_amount_lt [Integer] Total amount less than.
    # @param total_amount_gte [Integer] Total amount greater than or equal.
    # @param total_amount_lte [Integer] Total amount less than or equal.
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::FinancingInvoiceListResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.financing.get_financing_invoices
    def get_financing_invoices(order: nil, limit: nil, pagination_token: nil, sort: nil, invoice_id: nil, invoice_id_in: nil, status: nil, status_in: nil, type: nil, type_in: nil, document_id: nil, document_id_in: nil, issue_date_gt: nil, issue_date_lt: nil, issue_date_gte: nil, issue_date_lte: nil, due_date_gt: nil, due_date_lt: nil, due_date_gte: nil, due_date_lte: nil, created_at_gt: nil, created_at_lt: nil, created_at_gte: nil, created_at_lte: nil, total_amount: nil, total_amount_gt: nil, total_amount_lt: nil, total_amount_gte: nil, total_amount_lte: nil, request_options: nil)
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
  req.params = { **(request_options&.additional_query_parameters || {}), "order": order, "limit": limit, "pagination_token": pagination_token, "sort": sort, "invoice_id": invoice_id, "invoice_id__in": invoice_id_in, "status": status, "status__in": status_in, "type": type, "type__in": type_in, "document_id": document_id, "document_id__in": document_id_in, "issue_date__gt": issue_date_gt, "issue_date__lt": issue_date_lt, "issue_date__gte": issue_date_gte, "issue_date__lte": issue_date_lte, "due_date__gt": due_date_gt, "due_date__lt": due_date_lt, "due_date__gte": due_date_gte, "due_date__lte": due_date_lte, "created_at__gt": created_at_gt, "created_at__lt": created_at_lt, "created_at__gte": created_at_gte, "created_at__lte": created_at_lte, "total_amount": total_amount, "total_amount__gt": total_amount_gt, "total_amount__lt": total_amount_lt, "total_amount__gte": total_amount_gte, "total_amount__lte": total_amount_lte }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/financing_invoices"
end
        Monite::FinancingInvoiceListResponse.from_json(json_object: response.body)
      end
    end
# Returns a session token and a connect token to open Kanmon SDK for confirming
#  invoice details.
    #
    # @param invoices [Array<Hash>] A list of invoices to request financing for.Request of type Array<Monite::FinancingPushInvoicesRequestInvoice>, as a Hash
    #   * :id (String) 
    #   * :type (Monite::FinancingInvoiceType) 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::FinancingPushInvoicesResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.financing.post_financing_invoices(invoices: [{ id: "id", type: PAYABLE }])
    def post_financing_invoices(invoices:, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), invoices: invoices }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/financing_invoices"
end
        Monite::FinancingPushInvoicesResponse.from_json(json_object: response.body)
      end
    end
# Returns a list of financing offers and the business's onboarding status
    #
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::FinancingOffersResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.financing.get_financing_offers
    def get_financing_offers(request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/financing_offers"
end
        Monite::FinancingOffersResponse.from_json(json_object: response.body)
      end
    end
# Returns a token for Kanmon SDK. Creates a business and user on Kanmon if not
#  already exist.
    #
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::FinancingTokenResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.financing.post_financing_tokens
    def post_financing_tokens(request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/financing_tokens"
end
        Monite::FinancingTokenResponse.from_json(json_object: response.body)
      end
    end
  end
end