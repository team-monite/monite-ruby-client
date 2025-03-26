# frozen_string_literal: true
require_relative "../../requests"
require_relative "../types/payment_terms_list_response"
require_relative "../types/payment_term_discount"
require_relative "../types/payment_term"
require_relative "../types/payment_terms_response"
require "async"
require "async"
require "async"
require "async"
require "async"
require_relative "../../requests"

module Monite
  class PaymentTermsClient
  # @return [Monite::RequestClient] 
    attr_reader :request_client


    # @param request_client [Monite::RequestClient] 
    # @return [Monite::PaymentTermsClient]
    def initialize(request_client:)
      @request_client = request_client
    end
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::PaymentTermsListResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.payment_terms.get
    def get(request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/payment_terms"
end
      Monite::PaymentTermsListResponse.from_json(json_object: response.body)
    end
    # @param description [String] 
    # @param name [String] 
    # @param term_1 [Hash] The first tier of the payment term. Represents the terms of the first early
#  discount.Request of type Monite::PaymentTermDiscount, as a Hash
    #   * :discount (Integer) 
    #   * :number_of_days (Integer) 
    # @param term_2 [Hash] The second tier of the payment term. Defines the terms of the second early
#  discount.Request of type Monite::PaymentTermDiscount, as a Hash
    #   * :discount (Integer) 
    #   * :number_of_days (Integer) 
    # @param term_final [Hash] The final tier of the payment term. Defines the invoice due date.Request of type Monite::PaymentTerm, as a Hash
    #   * :number_of_days (Integer) 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::PaymentTermsResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.payment_terms.create(name: "name", term_final: { number_of_days: 1 })
    def create(description: nil, name:, term_1: nil, term_2: nil, term_final:, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), description: description, name: name, term_1: term_1, term_2: term_2, term_final: term_final }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/payment_terms"
end
      Monite::PaymentTermsResponse.from_json(json_object: response.body)
    end
    # @param payment_terms_id [String] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::PaymentTermsResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.payment_terms.get_by_id(payment_terms_id: "payment_terms_id")
    def get_by_id(payment_terms_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/payment_terms/#{payment_terms_id}"
end
      Monite::PaymentTermsResponse.from_json(json_object: response.body)
    end
    # @param payment_terms_id [String] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Void]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.payment_terms.delete_by_id(payment_terms_id: "payment_terms_id")
    def delete_by_id(payment_terms_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/payment_terms/#{payment_terms_id}"
end
    end
    # @param payment_terms_id [String] 
    # @param description [String] 
    # @param name [String] 
    # @param term_1 [Hash] The first tier of the payment term. Represents the terms of the first early
#  discount.Request of type Monite::PaymentTermDiscount, as a Hash
    #   * :discount (Integer) 
    #   * :number_of_days (Integer) 
    # @param term_2 [Hash] The second tier of the payment term. Defines the terms of the second early
#  discount.Request of type Monite::PaymentTermDiscount, as a Hash
    #   * :discount (Integer) 
    #   * :number_of_days (Integer) 
    # @param term_final [Hash] The final tier of the payment term. Defines the invoice due date.Request of type Monite::PaymentTerm, as a Hash
    #   * :number_of_days (Integer) 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::PaymentTermsResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.payment_terms.update_by_id(payment_terms_id: "payment_terms_id")
    def update_by_id(payment_terms_id:, description: nil, name: nil, term_1: nil, term_2: nil, term_final: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), description: description, name: name, term_1: term_1, term_2: term_2, term_final: term_final }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/payment_terms/#{payment_terms_id}"
end
      Monite::PaymentTermsResponse.from_json(json_object: response.body)
    end
  end
  class AsyncPaymentTermsClient
  # @return [Monite::AsyncRequestClient] 
    attr_reader :request_client


    # @param request_client [Monite::RequestClient] 
    # @return [Monite::AsyncPaymentTermsClient]
    def initialize(request_client:)
      @request_client = request_client
    end
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::PaymentTermsListResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.payment_terms.get
    def get(request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/payment_terms"
end
        Monite::PaymentTermsListResponse.from_json(json_object: response.body)
      end
    end
    # @param description [String] 
    # @param name [String] 
    # @param term_1 [Hash] The first tier of the payment term. Represents the terms of the first early
#  discount.Request of type Monite::PaymentTermDiscount, as a Hash
    #   * :discount (Integer) 
    #   * :number_of_days (Integer) 
    # @param term_2 [Hash] The second tier of the payment term. Defines the terms of the second early
#  discount.Request of type Monite::PaymentTermDiscount, as a Hash
    #   * :discount (Integer) 
    #   * :number_of_days (Integer) 
    # @param term_final [Hash] The final tier of the payment term. Defines the invoice due date.Request of type Monite::PaymentTerm, as a Hash
    #   * :number_of_days (Integer) 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::PaymentTermsResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.payment_terms.create(name: "name", term_final: { number_of_days: 1 })
    def create(description: nil, name:, term_1: nil, term_2: nil, term_final:, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), description: description, name: name, term_1: term_1, term_2: term_2, term_final: term_final }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/payment_terms"
end
        Monite::PaymentTermsResponse.from_json(json_object: response.body)
      end
    end
    # @param payment_terms_id [String] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::PaymentTermsResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.payment_terms.get_by_id(payment_terms_id: "payment_terms_id")
    def get_by_id(payment_terms_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/payment_terms/#{payment_terms_id}"
end
        Monite::PaymentTermsResponse.from_json(json_object: response.body)
      end
    end
    # @param payment_terms_id [String] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Void]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.payment_terms.delete_by_id(payment_terms_id: "payment_terms_id")
    def delete_by_id(payment_terms_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/payment_terms/#{payment_terms_id}"
end
      end
    end
    # @param payment_terms_id [String] 
    # @param description [String] 
    # @param name [String] 
    # @param term_1 [Hash] The first tier of the payment term. Represents the terms of the first early
#  discount.Request of type Monite::PaymentTermDiscount, as a Hash
    #   * :discount (Integer) 
    #   * :number_of_days (Integer) 
    # @param term_2 [Hash] The second tier of the payment term. Defines the terms of the second early
#  discount.Request of type Monite::PaymentTermDiscount, as a Hash
    #   * :discount (Integer) 
    #   * :number_of_days (Integer) 
    # @param term_final [Hash] The final tier of the payment term. Defines the invoice due date.Request of type Monite::PaymentTerm, as a Hash
    #   * :number_of_days (Integer) 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::PaymentTermsResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.payment_terms.update_by_id(payment_terms_id: "payment_terms_id")
    def update_by_id(payment_terms_id:, description: nil, name: nil, term_1: nil, term_2: nil, term_final: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), description: description, name: name, term_1: term_1, term_2: term_2, term_final: term_final }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/payment_terms/#{payment_terms_id}"
end
        Monite::PaymentTermsResponse.from_json(json_object: response.body)
      end
    end
  end
end