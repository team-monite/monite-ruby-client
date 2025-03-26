# frozen_string_literal: true
require_relative "../../requests"
require_relative "../types/order_enum"
require_relative "../types/product_cursor_fields"
require_relative "../types/product_service_type_enum"
require_relative "../types/currency_enum"
require "date"
require "date"
require "date"
require "date"
require_relative "../types/product_service_pagination_response"
require_relative "../types/price"
require_relative "../types/product_service_response"
require "async"
require "async"
require "async"
require "async"
require "async"
require_relative "../../requests"

module Monite
  class ProductsClient
  # @return [Monite::RequestClient] 
    attr_reader :request_client


    # @param request_client [Monite::RequestClient] 
    # @return [Monite::ProductsClient]
    def initialize(request_client:)
      @request_client = request_client
    end
    # @param order [Monite::OrderEnum] Order by
    # @param limit [Integer] Max is 100
    # @param pagination_token [String] A token, obtained from previous page. Prior over other filters
    # @param sort [Monite::PRODUCT_CURSOR_FIELDS] Allowed sort fields
    # @param id_in [String] 
    # @param name [String] 
    # @param name_contains [String] 
    # @param name_icontains [String] 
    # @param type [Monite::ProductServiceTypeEnum] 
    # @param price [Integer] 
    # @param price_gt [Integer] 
    # @param price_lt [Integer] 
    # @param price_gte [Integer] 
    # @param price_lte [Integer] 
    # @param currency [Monite::CurrencyEnum] 
    # @param currency_in [Monite::CurrencyEnum] 
    # @param measure_unit_id [String] 
    # @param created_at_gt [DateTime] 
    # @param created_at_lt [DateTime] 
    # @param created_at_gte [DateTime] 
    # @param created_at_lte [DateTime] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::ProductServicePaginationResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.products.get
    def get(order: nil, limit: nil, pagination_token: nil, sort: nil, id_in: nil, name: nil, name_contains: nil, name_icontains: nil, type: nil, price: nil, price_gt: nil, price_lt: nil, price_gte: nil, price_lte: nil, currency: nil, currency_in: nil, measure_unit_id: nil, created_at_gt: nil, created_at_lt: nil, created_at_gte: nil, created_at_lte: nil, request_options: nil)
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
  req.params = { **(request_options&.additional_query_parameters || {}), "order": order, "limit": limit, "pagination_token": pagination_token, "sort": sort, "id__in": id_in, "name": name, "name__contains": name_contains, "name__icontains": name_icontains, "type": type, "price": price, "price__gt": price_gt, "price__lt": price_lt, "price__gte": price_gte, "price__lte": price_lte, "currency": currency, "currency__in": currency_in, "measure_unit_id": measure_unit_id, "created_at__gt": created_at_gt, "created_at__lt": created_at_lt, "created_at__gte": created_at_gte, "created_at__lte": created_at_lte }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/products"
end
      Monite::ProductServicePaginationResponse.from_json(json_object: response.body)
    end
    # @param description [String] Description of the product.
    # @param ledger_account_id [String] 
    # @param measure_unit_id [String] The unique ID reference of the unit used to measure the quantity of this product
#  (e.g. items, meters, kilograms).
    # @param name [String] Name of the product.
    # @param price [Hash] Request of type Monite::Price, as a Hash
    #   * :currency (Monite::CurrencyEnum) 
    #   * :value (Integer) 
    # @param smallest_amount [Float] The smallest amount allowed for this product.
    # @param type [Monite::ProductServiceTypeEnum] Specifies whether this offering is a product or service. This may affect the
#  applicable tax rates.
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::ProductServiceResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.products.create(name: "name")
    def create(description: nil, ledger_account_id: nil, measure_unit_id: nil, name:, price: nil, smallest_amount: nil, type: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), description: description, ledger_account_id: ledger_account_id, measure_unit_id: measure_unit_id, name: name, price: price, smallest_amount: smallest_amount, type: type }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/products"
end
      Monite::ProductServiceResponse.from_json(json_object: response.body)
    end
    # @param product_id [String] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::ProductServiceResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.products.get_by_id(product_id: "product_id")
    def get_by_id(product_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/products/#{product_id}"
end
      Monite::ProductServiceResponse.from_json(json_object: response.body)
    end
    # @param product_id [String] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Void]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.products.delete_by_id(product_id: "product_id")
    def delete_by_id(product_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/products/#{product_id}"
end
    end
    # @param product_id [String] 
    # @param description [String] Description of the product.
    # @param ledger_account_id [String] 
    # @param measure_unit_id [String] The unique ID reference of the unit used to measure the quantity of this product
#  (e.g. items, meters, kilograms).
    # @param name [String] Name of the product.
    # @param price [Hash] Request of type Monite::Price, as a Hash
    #   * :currency (Monite::CurrencyEnum) 
    #   * :value (Integer) 
    # @param smallest_amount [Float] The smallest amount allowed for this product.
    # @param type [Monite::ProductServiceTypeEnum] Specifies whether this offering is a product or service. This may affect the
#  applicable tax rates.
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::ProductServiceResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.products.update_by_id(product_id: "product_id")
    def update_by_id(product_id:, description: nil, ledger_account_id: nil, measure_unit_id: nil, name: nil, price: nil, smallest_amount: nil, type: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), description: description, ledger_account_id: ledger_account_id, measure_unit_id: measure_unit_id, name: name, price: price, smallest_amount: smallest_amount, type: type }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/products/#{product_id}"
end
      Monite::ProductServiceResponse.from_json(json_object: response.body)
    end
  end
  class AsyncProductsClient
  # @return [Monite::AsyncRequestClient] 
    attr_reader :request_client


    # @param request_client [Monite::RequestClient] 
    # @return [Monite::AsyncProductsClient]
    def initialize(request_client:)
      @request_client = request_client
    end
    # @param order [Monite::OrderEnum] Order by
    # @param limit [Integer] Max is 100
    # @param pagination_token [String] A token, obtained from previous page. Prior over other filters
    # @param sort [Monite::PRODUCT_CURSOR_FIELDS] Allowed sort fields
    # @param id_in [String] 
    # @param name [String] 
    # @param name_contains [String] 
    # @param name_icontains [String] 
    # @param type [Monite::ProductServiceTypeEnum] 
    # @param price [Integer] 
    # @param price_gt [Integer] 
    # @param price_lt [Integer] 
    # @param price_gte [Integer] 
    # @param price_lte [Integer] 
    # @param currency [Monite::CurrencyEnum] 
    # @param currency_in [Monite::CurrencyEnum] 
    # @param measure_unit_id [String] 
    # @param created_at_gt [DateTime] 
    # @param created_at_lt [DateTime] 
    # @param created_at_gte [DateTime] 
    # @param created_at_lte [DateTime] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::ProductServicePaginationResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.products.get
    def get(order: nil, limit: nil, pagination_token: nil, sort: nil, id_in: nil, name: nil, name_contains: nil, name_icontains: nil, type: nil, price: nil, price_gt: nil, price_lt: nil, price_gte: nil, price_lte: nil, currency: nil, currency_in: nil, measure_unit_id: nil, created_at_gt: nil, created_at_lt: nil, created_at_gte: nil, created_at_lte: nil, request_options: nil)
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
  req.params = { **(request_options&.additional_query_parameters || {}), "order": order, "limit": limit, "pagination_token": pagination_token, "sort": sort, "id__in": id_in, "name": name, "name__contains": name_contains, "name__icontains": name_icontains, "type": type, "price": price, "price__gt": price_gt, "price__lt": price_lt, "price__gte": price_gte, "price__lte": price_lte, "currency": currency, "currency__in": currency_in, "measure_unit_id": measure_unit_id, "created_at__gt": created_at_gt, "created_at__lt": created_at_lt, "created_at__gte": created_at_gte, "created_at__lte": created_at_lte }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/products"
end
        Monite::ProductServicePaginationResponse.from_json(json_object: response.body)
      end
    end
    # @param description [String] Description of the product.
    # @param ledger_account_id [String] 
    # @param measure_unit_id [String] The unique ID reference of the unit used to measure the quantity of this product
#  (e.g. items, meters, kilograms).
    # @param name [String] Name of the product.
    # @param price [Hash] Request of type Monite::Price, as a Hash
    #   * :currency (Monite::CurrencyEnum) 
    #   * :value (Integer) 
    # @param smallest_amount [Float] The smallest amount allowed for this product.
    # @param type [Monite::ProductServiceTypeEnum] Specifies whether this offering is a product or service. This may affect the
#  applicable tax rates.
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::ProductServiceResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.products.create(name: "name")
    def create(description: nil, ledger_account_id: nil, measure_unit_id: nil, name:, price: nil, smallest_amount: nil, type: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), description: description, ledger_account_id: ledger_account_id, measure_unit_id: measure_unit_id, name: name, price: price, smallest_amount: smallest_amount, type: type }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/products"
end
        Monite::ProductServiceResponse.from_json(json_object: response.body)
      end
    end
    # @param product_id [String] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::ProductServiceResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.products.get_by_id(product_id: "product_id")
    def get_by_id(product_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/products/#{product_id}"
end
        Monite::ProductServiceResponse.from_json(json_object: response.body)
      end
    end
    # @param product_id [String] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Void]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.products.delete_by_id(product_id: "product_id")
    def delete_by_id(product_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/products/#{product_id}"
end
      end
    end
    # @param product_id [String] 
    # @param description [String] Description of the product.
    # @param ledger_account_id [String] 
    # @param measure_unit_id [String] The unique ID reference of the unit used to measure the quantity of this product
#  (e.g. items, meters, kilograms).
    # @param name [String] Name of the product.
    # @param price [Hash] Request of type Monite::Price, as a Hash
    #   * :currency (Monite::CurrencyEnum) 
    #   * :value (Integer) 
    # @param smallest_amount [Float] The smallest amount allowed for this product.
    # @param type [Monite::ProductServiceTypeEnum] Specifies whether this offering is a product or service. This may affect the
#  applicable tax rates.
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::ProductServiceResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.products.update_by_id(product_id: "product_id")
    def update_by_id(product_id:, description: nil, ledger_account_id: nil, measure_unit_id: nil, name: nil, price: nil, smallest_amount: nil, type: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), description: description, ledger_account_id: ledger_account_id, measure_unit_id: measure_unit_id, name: name, price: price, smallest_amount: smallest_amount, type: type }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/products/#{product_id}"
end
        Monite::ProductServiceResponse.from_json(json_object: response.body)
      end
    end
  end
end