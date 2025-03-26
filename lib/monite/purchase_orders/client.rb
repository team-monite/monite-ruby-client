# frozen_string_literal: true
require_relative "../../requests"
require_relative "../types/order_enum"
require_relative "../types/purchase_order_cursor_fields"
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
require_relative "../types/purchase_order_status_enum"
require_relative "../types/currency_enum"
require_relative "../types/purchase_order_pagination_response"
require_relative "../types/purchase_order_item"
require_relative "../types/purchase_order_response_schema"
require_relative "../types/variables_object_list"
require_relative "../types/purchase_order_email_preview_response"
require_relative "../types/purchase_order_email_sent_response"
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
  class PurchaseOrdersClient
  # @return [Monite::RequestClient] 
    attr_reader :request_client


    # @param request_client [Monite::RequestClient] 
    # @return [Monite::PurchaseOrdersClient]
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
    # @param sort [Monite::PurchaseOrderCursorFields] The field to sort the results by. Typically used together with the `order`
#  parameter.
    # @param created_at_gt [DateTime] 
    # @param created_at_lt [DateTime] 
    # @param created_at_gte [DateTime] 
    # @param created_at_lte [DateTime] 
    # @param updated_at_gt [DateTime] 
    # @param updated_at_lt [DateTime] 
    # @param updated_at_gte [DateTime] 
    # @param updated_at_lte [DateTime] 
    # @param issued_at_gt [DateTime] 
    # @param issued_at_lt [DateTime] 
    # @param issued_at_gte [DateTime] 
    # @param issued_at_lte [DateTime] 
    # @param status [Monite::PurchaseOrderStatusEnum] 
    # @param document_id [String] 
    # @param document_id_in [String] 
    # @param created_by [String] 
    # @param counterpart_id [String] 
    # @param counterpart_id_in [String] 
    # @param counterpart_name [String] 
    # @param currency [Monite::CurrencyEnum] 
    # @param currency_in [Monite::CurrencyEnum] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::PurchaseOrderPaginationResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.purchase_orders.get
    def get(order: nil, limit: nil, pagination_token: nil, sort: nil, created_at_gt: nil, created_at_lt: nil, created_at_gte: nil, created_at_lte: nil, updated_at_gt: nil, updated_at_lt: nil, updated_at_gte: nil, updated_at_lte: nil, issued_at_gt: nil, issued_at_lt: nil, issued_at_gte: nil, issued_at_lte: nil, status: nil, document_id: nil, document_id_in: nil, created_by: nil, counterpart_id: nil, counterpart_id_in: nil, counterpart_name: nil, currency: nil, currency_in: nil, request_options: nil)
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
  req.params = { **(request_options&.additional_query_parameters || {}), "order": order, "limit": limit, "pagination_token": pagination_token, "sort": sort, "created_at__gt": created_at_gt, "created_at__lt": created_at_lt, "created_at__gte": created_at_gte, "created_at__lte": created_at_lte, "updated_at__gt": updated_at_gt, "updated_at__lt": updated_at_lt, "updated_at__gte": updated_at_gte, "updated_at__lte": updated_at_lte, "issued_at__gt": issued_at_gt, "issued_at__lt": issued_at_lt, "issued_at__gte": issued_at_gte, "issued_at__lte": issued_at_lte, "status": status, "document_id": document_id, "document_id__in": document_id_in, "created_by": created_by, "counterpart_id": counterpart_id, "counterpart_id__in": counterpart_id_in, "counterpart.name": counterpart_name, "currency": currency, "currency__in": currency_in }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/payable_purchase_orders"
end
      Monite::PurchaseOrderPaginationResponse.from_json(json_object: response.body)
    end
    # @param counterpart_address_id [String] The ID of counterpart address object stored in counterparts service. If not
#  provided, counterpart's default address is used.
    # @param counterpart_id [String] Counterpart unique ID.
    # @param currency [Monite::CurrencyEnum] The currency in which the price of the product is set. (all items need to have
#  the same currency)
    # @param entity_vat_id_id [String] Entity VAT ID identifier that applied to purchase order
    # @param items [Array<Hash>] List of item to purchaseRequest of type Array<Monite::PurchaseOrderItem>, as a Hash
    #   * :currency (Monite::CurrencyEnum) 
    #   * :name (String) 
    #   * :price (Integer) 
    #   * :quantity (Integer) 
    #   * :unit (String) 
    #   * :vat_rate (Integer) 
    # @param message [String] Msg which will be send to counterpart for who the purchase order is issued.
    # @param valid_for_days [Integer] Number of days for which purchase order is valid
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::PurchaseOrderResponseSchema]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.purchase_orders.create(
#    counterpart_id: "counterpart_id",
#    currency: AED,
#    items: [{ currency: AED, name: "name", price: 1, quantity: 1, unit: "unit", vat_rate: 1 }],
#    message: "message",
#    valid_for_days: 1
#  )
    def create(counterpart_address_id: nil, counterpart_id:, currency:, entity_vat_id_id: nil, items:, message:, valid_for_days:, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), counterpart_address_id: counterpart_address_id, counterpart_id: counterpart_id, currency: currency, entity_vat_id_id: entity_vat_id_id, items: items, message: message, valid_for_days: valid_for_days }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/payable_purchase_orders"
end
      Monite::PurchaseOrderResponseSchema.from_json(json_object: response.body)
    end
# Get a list of placeholders allowed to insert into an email template for
#  customization
    #
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::VariablesObjectList]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.purchase_orders.get_variables
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
  req.url "#{@request_client.get_url(request_options: request_options)}/payable_purchase_orders/variables"
end
      Monite::VariablesObjectList.from_json(json_object: response.body)
    end
    # @param purchase_order_id [String] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::PurchaseOrderResponseSchema]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.purchase_orders.get_by_id(purchase_order_id: "purchase_order_id")
    def get_by_id(purchase_order_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/payable_purchase_orders/#{purchase_order_id}"
end
      Monite::PurchaseOrderResponseSchema.from_json(json_object: response.body)
    end
    # @param purchase_order_id [String] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Void]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.purchase_orders.delete_by_id(purchase_order_id: "purchase_order_id")
    def delete_by_id(purchase_order_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/payable_purchase_orders/#{purchase_order_id}"
end
    end
    # @param purchase_order_id [String] 
    # @param counterpart_address_id [String] The ID of counterpart address object stored in counterparts service. If not
#  provided, counterpart's default address is used.
    # @param counterpart_id [String] Counterpart unique ID.
    # @param entity_vat_id_id [String] Entity VAT ID identifier that applied to purchase order
    # @param items [Array<Hash>] List of item to purchaseRequest of type Array<Monite::PurchaseOrderItem>, as a Hash
    #   * :currency (Monite::CurrencyEnum) 
    #   * :name (String) 
    #   * :price (Integer) 
    #   * :quantity (Integer) 
    #   * :unit (String) 
    #   * :vat_rate (Integer) 
    # @param message [String] Msg which will be send to counterpart for who the purchase order is issued.
    # @param valid_for_days [Integer] Number of days for which purchase order is valid
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::PurchaseOrderResponseSchema]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.purchase_orders.update_by_id(purchase_order_id: "purchase_order_id")
    def update_by_id(purchase_order_id:, counterpart_address_id: nil, counterpart_id: nil, entity_vat_id_id: nil, items: nil, message: nil, valid_for_days: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), counterpart_address_id: counterpart_address_id, counterpart_id: counterpart_id, entity_vat_id_id: entity_vat_id_id, items: items, message: message, valid_for_days: valid_for_days }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/payable_purchase_orders/#{purchase_order_id}"
end
      Monite::PurchaseOrderResponseSchema.from_json(json_object: response.body)
    end
    # @param purchase_order_id [String] 
    # @param body_text [String] 
    # @param subject_text [String] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::PurchaseOrderEmailPreviewResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.purchase_orders.preview_by_id(
#    purchase_order_id: "purchase_order_id",
#    body_text: "body_text",
#    subject_text: "subject_text"
#  )
    def preview_by_id(purchase_order_id:, body_text:, subject_text:, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), body_text: body_text, subject_text: subject_text }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/payable_purchase_orders/#{purchase_order_id}/preview"
end
      Monite::PurchaseOrderEmailPreviewResponse.from_json(json_object: response.body)
    end
    # @param purchase_order_id [String] 
    # @param body_text [String] 
    # @param subject_text [String] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::PurchaseOrderEmailSentResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.purchase_orders.send_by_id(
#    purchase_order_id: "purchase_order_id",
#    body_text: "body_text",
#    subject_text: "subject_text"
#  )
    def send_by_id(purchase_order_id:, body_text:, subject_text:, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), body_text: body_text, subject_text: subject_text }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/payable_purchase_orders/#{purchase_order_id}/send"
end
      Monite::PurchaseOrderEmailSentResponse.from_json(json_object: response.body)
    end
  end
  class AsyncPurchaseOrdersClient
  # @return [Monite::AsyncRequestClient] 
    attr_reader :request_client


    # @param request_client [Monite::RequestClient] 
    # @return [Monite::AsyncPurchaseOrdersClient]
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
    # @param sort [Monite::PurchaseOrderCursorFields] The field to sort the results by. Typically used together with the `order`
#  parameter.
    # @param created_at_gt [DateTime] 
    # @param created_at_lt [DateTime] 
    # @param created_at_gte [DateTime] 
    # @param created_at_lte [DateTime] 
    # @param updated_at_gt [DateTime] 
    # @param updated_at_lt [DateTime] 
    # @param updated_at_gte [DateTime] 
    # @param updated_at_lte [DateTime] 
    # @param issued_at_gt [DateTime] 
    # @param issued_at_lt [DateTime] 
    # @param issued_at_gte [DateTime] 
    # @param issued_at_lte [DateTime] 
    # @param status [Monite::PurchaseOrderStatusEnum] 
    # @param document_id [String] 
    # @param document_id_in [String] 
    # @param created_by [String] 
    # @param counterpart_id [String] 
    # @param counterpart_id_in [String] 
    # @param counterpart_name [String] 
    # @param currency [Monite::CurrencyEnum] 
    # @param currency_in [Monite::CurrencyEnum] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::PurchaseOrderPaginationResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.purchase_orders.get
    def get(order: nil, limit: nil, pagination_token: nil, sort: nil, created_at_gt: nil, created_at_lt: nil, created_at_gte: nil, created_at_lte: nil, updated_at_gt: nil, updated_at_lt: nil, updated_at_gte: nil, updated_at_lte: nil, issued_at_gt: nil, issued_at_lt: nil, issued_at_gte: nil, issued_at_lte: nil, status: nil, document_id: nil, document_id_in: nil, created_by: nil, counterpart_id: nil, counterpart_id_in: nil, counterpart_name: nil, currency: nil, currency_in: nil, request_options: nil)
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
  req.params = { **(request_options&.additional_query_parameters || {}), "order": order, "limit": limit, "pagination_token": pagination_token, "sort": sort, "created_at__gt": created_at_gt, "created_at__lt": created_at_lt, "created_at__gte": created_at_gte, "created_at__lte": created_at_lte, "updated_at__gt": updated_at_gt, "updated_at__lt": updated_at_lt, "updated_at__gte": updated_at_gte, "updated_at__lte": updated_at_lte, "issued_at__gt": issued_at_gt, "issued_at__lt": issued_at_lt, "issued_at__gte": issued_at_gte, "issued_at__lte": issued_at_lte, "status": status, "document_id": document_id, "document_id__in": document_id_in, "created_by": created_by, "counterpart_id": counterpart_id, "counterpart_id__in": counterpart_id_in, "counterpart.name": counterpart_name, "currency": currency, "currency__in": currency_in }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/payable_purchase_orders"
end
        Monite::PurchaseOrderPaginationResponse.from_json(json_object: response.body)
      end
    end
    # @param counterpart_address_id [String] The ID of counterpart address object stored in counterparts service. If not
#  provided, counterpart's default address is used.
    # @param counterpart_id [String] Counterpart unique ID.
    # @param currency [Monite::CurrencyEnum] The currency in which the price of the product is set. (all items need to have
#  the same currency)
    # @param entity_vat_id_id [String] Entity VAT ID identifier that applied to purchase order
    # @param items [Array<Hash>] List of item to purchaseRequest of type Array<Monite::PurchaseOrderItem>, as a Hash
    #   * :currency (Monite::CurrencyEnum) 
    #   * :name (String) 
    #   * :price (Integer) 
    #   * :quantity (Integer) 
    #   * :unit (String) 
    #   * :vat_rate (Integer) 
    # @param message [String] Msg which will be send to counterpart for who the purchase order is issued.
    # @param valid_for_days [Integer] Number of days for which purchase order is valid
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::PurchaseOrderResponseSchema]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.purchase_orders.create(
#    counterpart_id: "counterpart_id",
#    currency: AED,
#    items: [{ currency: AED, name: "name", price: 1, quantity: 1, unit: "unit", vat_rate: 1 }],
#    message: "message",
#    valid_for_days: 1
#  )
    def create(counterpart_address_id: nil, counterpart_id:, currency:, entity_vat_id_id: nil, items:, message:, valid_for_days:, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), counterpart_address_id: counterpart_address_id, counterpart_id: counterpart_id, currency: currency, entity_vat_id_id: entity_vat_id_id, items: items, message: message, valid_for_days: valid_for_days }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/payable_purchase_orders"
end
        Monite::PurchaseOrderResponseSchema.from_json(json_object: response.body)
      end
    end
# Get a list of placeholders allowed to insert into an email template for
#  customization
    #
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::VariablesObjectList]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.purchase_orders.get_variables
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
  req.url "#{@request_client.get_url(request_options: request_options)}/payable_purchase_orders/variables"
end
        Monite::VariablesObjectList.from_json(json_object: response.body)
      end
    end
    # @param purchase_order_id [String] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::PurchaseOrderResponseSchema]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.purchase_orders.get_by_id(purchase_order_id: "purchase_order_id")
    def get_by_id(purchase_order_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/payable_purchase_orders/#{purchase_order_id}"
end
        Monite::PurchaseOrderResponseSchema.from_json(json_object: response.body)
      end
    end
    # @param purchase_order_id [String] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Void]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.purchase_orders.delete_by_id(purchase_order_id: "purchase_order_id")
    def delete_by_id(purchase_order_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/payable_purchase_orders/#{purchase_order_id}"
end
      end
    end
    # @param purchase_order_id [String] 
    # @param counterpart_address_id [String] The ID of counterpart address object stored in counterparts service. If not
#  provided, counterpart's default address is used.
    # @param counterpart_id [String] Counterpart unique ID.
    # @param entity_vat_id_id [String] Entity VAT ID identifier that applied to purchase order
    # @param items [Array<Hash>] List of item to purchaseRequest of type Array<Monite::PurchaseOrderItem>, as a Hash
    #   * :currency (Monite::CurrencyEnum) 
    #   * :name (String) 
    #   * :price (Integer) 
    #   * :quantity (Integer) 
    #   * :unit (String) 
    #   * :vat_rate (Integer) 
    # @param message [String] Msg which will be send to counterpart for who the purchase order is issued.
    # @param valid_for_days [Integer] Number of days for which purchase order is valid
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::PurchaseOrderResponseSchema]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.purchase_orders.update_by_id(purchase_order_id: "purchase_order_id")
    def update_by_id(purchase_order_id:, counterpart_address_id: nil, counterpart_id: nil, entity_vat_id_id: nil, items: nil, message: nil, valid_for_days: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), counterpart_address_id: counterpart_address_id, counterpart_id: counterpart_id, entity_vat_id_id: entity_vat_id_id, items: items, message: message, valid_for_days: valid_for_days }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/payable_purchase_orders/#{purchase_order_id}"
end
        Monite::PurchaseOrderResponseSchema.from_json(json_object: response.body)
      end
    end
    # @param purchase_order_id [String] 
    # @param body_text [String] 
    # @param subject_text [String] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::PurchaseOrderEmailPreviewResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.purchase_orders.preview_by_id(
#    purchase_order_id: "purchase_order_id",
#    body_text: "body_text",
#    subject_text: "subject_text"
#  )
    def preview_by_id(purchase_order_id:, body_text:, subject_text:, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), body_text: body_text, subject_text: subject_text }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/payable_purchase_orders/#{purchase_order_id}/preview"
end
        Monite::PurchaseOrderEmailPreviewResponse.from_json(json_object: response.body)
      end
    end
    # @param purchase_order_id [String] 
    # @param body_text [String] 
    # @param subject_text [String] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::PurchaseOrderEmailSentResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.purchase_orders.send_by_id(
#    purchase_order_id: "purchase_order_id",
#    body_text: "body_text",
#    subject_text: "subject_text"
#  )
    def send_by_id(purchase_order_id:, body_text:, subject_text:, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), body_text: body_text, subject_text: subject_text }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/payable_purchase_orders/#{purchase_order_id}/send"
end
        Monite::PurchaseOrderEmailSentResponse.from_json(json_object: response.body)
      end
    end
  end
end