# frozen_string_literal: true
require_relative "../../requests"
require_relative "../types/order_enum"
require_relative "../types/payment_record_cursor_fields"
require_relative "../types/payment_record_response_list"
require_relative "../types/currency_enum"
require_relative "../types/payment_record_object_request"
require "date"
require_relative "../types/payment_record_response"
require "async"
require "async"
require "async"
require_relative "../../requests"

module Monite
  class PaymentRecordsClient
  # @return [Monite::RequestClient] 
    attr_reader :request_client


    # @param request_client [Monite::RequestClient] 
    # @return [Monite::PaymentRecordsClient]
    def initialize(request_client:)
      @request_client = request_client
    end
    # @param order [Monite::OrderEnum] Order by
    # @param limit [Integer] Max is 100
    # @param pagination_token [String] A token, obtained from previous page. Prior over other filters
    # @param sort [Monite::PaymentRecordCursorFields] Allowed sort fields
    # @param is_external [Boolean] 
    # @param object_id [String] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::PaymentRecordResponseList]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.payment_records.get
    def get(order: nil, limit: nil, pagination_token: nil, sort: nil, is_external: nil, object_id: nil, request_options: nil)
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
  req.params = { **(request_options&.additional_query_parameters || {}), "order": order, "limit": limit, "pagination_token": pagination_token, "sort": sort, "is_external": is_external, "object_id": object_id }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/payment_records"
end
      Monite::PaymentRecordResponseList.from_json(json_object: response.body)
    end
    # @param amount [Integer] 
    # @param currency [Monite::CurrencyEnum] 
    # @param entity_user_id [String] 
    # @param object [Hash] Request of type Monite::PaymentRecordObjectRequest, as a Hash
    #   * :id (String) 
    #   * :type (Monite::ObjectTypeEnum) 
    # @param paid_at [DateTime] 
    # @param payment_intent_id [String] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::PaymentRecordResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.payment_records.create(
#    amount: 1,
#    currency: AED,
#    object: { id: "id", type: RECEIVABLE },
#    paid_at: DateTime.parse("2024-01-15T09:30:00.000Z"),
#    payment_intent_id: "payment_intent_id"
#  )
    def create(amount:, currency:, entity_user_id: nil, object:, paid_at:, payment_intent_id:, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), amount: amount, currency: currency, entity_user_id: entity_user_id, object: object, paid_at: paid_at, payment_intent_id: payment_intent_id }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/payment_records"
end
      Monite::PaymentRecordResponse.from_json(json_object: response.body)
    end
    # @param payment_record_id [String] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::PaymentRecordResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.payment_records.get_by_id(payment_record_id: "payment_record_id")
    def get_by_id(payment_record_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/payment_records/#{payment_record_id}"
end
      Monite::PaymentRecordResponse.from_json(json_object: response.body)
    end
  end
  class AsyncPaymentRecordsClient
  # @return [Monite::AsyncRequestClient] 
    attr_reader :request_client


    # @param request_client [Monite::RequestClient] 
    # @return [Monite::AsyncPaymentRecordsClient]
    def initialize(request_client:)
      @request_client = request_client
    end
    # @param order [Monite::OrderEnum] Order by
    # @param limit [Integer] Max is 100
    # @param pagination_token [String] A token, obtained from previous page. Prior over other filters
    # @param sort [Monite::PaymentRecordCursorFields] Allowed sort fields
    # @param is_external [Boolean] 
    # @param object_id [String] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::PaymentRecordResponseList]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.payment_records.get
    def get(order: nil, limit: nil, pagination_token: nil, sort: nil, is_external: nil, object_id: nil, request_options: nil)
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
  req.params = { **(request_options&.additional_query_parameters || {}), "order": order, "limit": limit, "pagination_token": pagination_token, "sort": sort, "is_external": is_external, "object_id": object_id }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/payment_records"
end
        Monite::PaymentRecordResponseList.from_json(json_object: response.body)
      end
    end
    # @param amount [Integer] 
    # @param currency [Monite::CurrencyEnum] 
    # @param entity_user_id [String] 
    # @param object [Hash] Request of type Monite::PaymentRecordObjectRequest, as a Hash
    #   * :id (String) 
    #   * :type (Monite::ObjectTypeEnum) 
    # @param paid_at [DateTime] 
    # @param payment_intent_id [String] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::PaymentRecordResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.payment_records.create(
#    amount: 1,
#    currency: AED,
#    object: { id: "id", type: RECEIVABLE },
#    paid_at: DateTime.parse("2024-01-15T09:30:00.000Z"),
#    payment_intent_id: "payment_intent_id"
#  )
    def create(amount:, currency:, entity_user_id: nil, object:, paid_at:, payment_intent_id:, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), amount: amount, currency: currency, entity_user_id: entity_user_id, object: object, paid_at: paid_at, payment_intent_id: payment_intent_id }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/payment_records"
end
        Monite::PaymentRecordResponse.from_json(json_object: response.body)
      end
    end
    # @param payment_record_id [String] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::PaymentRecordResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.payment_records.get_by_id(payment_record_id: "payment_record_id")
    def get_by_id(payment_record_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/payment_records/#{payment_record_id}"
end
        Monite::PaymentRecordResponse.from_json(json_object: response.body)
      end
    end
  end
end