# frozen_string_literal: true
require_relative "../../../requests"
require_relative "../../types/onboarding_payment_methods_response"
require_relative "../../types/monite_all_payment_methods_types"
require "async"
require "async"
require_relative "../../../requests"

module Monite
  module Entities
    class PaymentMethodsClient
    # @return [Monite::RequestClient] 
      attr_reader :request_client


      # @param request_client [Monite::RequestClient] 
      # @return [Monite::Entities::PaymentMethodsClient]
      def initialize(request_client:)
        @request_client = request_client
      end
# Get all enabled payment methods.
      #
      # @param entity_id [String] 
      # @param request_options [Monite::RequestOptions] 
      # @return [Monite::OnboardingPaymentMethodsResponse]
      # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.entities.payment_methods.get(entity_id: "entity_id")
      def get(entity_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/entities/#{entity_id}/payment_methods"
end
        Monite::OnboardingPaymentMethodsResponse.from_json(json_object: response.body)
      end
# Set which payment methods should be enabled.
      #
      # @param entity_id [String] 
      # @param payment_methods [Array<Monite::MoniteAllPaymentMethodsTypes>] Deprecated. Use payment_methods_receive instead.
      # @param payment_methods_receive [Array<Monite::MoniteAllPaymentMethodsTypes>] Enable payment methods to receive money.
      # @param payment_methods_send [Array<Monite::MoniteAllPaymentMethodsTypes>] Enable payment methods to send money.
      # @param request_options [Monite::RequestOptions] 
      # @return [Monite::OnboardingPaymentMethodsResponse]
      # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.entities.payment_methods.set(entity_id: "entity_id")
      def set(entity_id:, payment_methods: nil, payment_methods_receive: nil, payment_methods_send: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), payment_methods: payment_methods, payment_methods_receive: payment_methods_receive, payment_methods_send: payment_methods_send }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/entities/#{entity_id}/payment_methods"
end
        Monite::OnboardingPaymentMethodsResponse.from_json(json_object: response.body)
      end
    end
    class AsyncPaymentMethodsClient
    # @return [Monite::AsyncRequestClient] 
      attr_reader :request_client


      # @param request_client [Monite::RequestClient] 
      # @return [Monite::Entities::AsyncPaymentMethodsClient]
      def initialize(request_client:)
        @request_client = request_client
      end
# Get all enabled payment methods.
      #
      # @param entity_id [String] 
      # @param request_options [Monite::RequestOptions] 
      # @return [Monite::OnboardingPaymentMethodsResponse]
      # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.entities.payment_methods.get(entity_id: "entity_id")
      def get(entity_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/entities/#{entity_id}/payment_methods"
end
          Monite::OnboardingPaymentMethodsResponse.from_json(json_object: response.body)
        end
      end
# Set which payment methods should be enabled.
      #
      # @param entity_id [String] 
      # @param payment_methods [Array<Monite::MoniteAllPaymentMethodsTypes>] Deprecated. Use payment_methods_receive instead.
      # @param payment_methods_receive [Array<Monite::MoniteAllPaymentMethodsTypes>] Enable payment methods to receive money.
      # @param payment_methods_send [Array<Monite::MoniteAllPaymentMethodsTypes>] Enable payment methods to send money.
      # @param request_options [Monite::RequestOptions] 
      # @return [Monite::OnboardingPaymentMethodsResponse]
      # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.entities.payment_methods.set(entity_id: "entity_id")
      def set(entity_id:, payment_methods: nil, payment_methods_receive: nil, payment_methods_send: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), payment_methods: payment_methods, payment_methods_receive: payment_methods_receive, payment_methods_send: payment_methods_send }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/entities/#{entity_id}/payment_methods"
end
          Monite::OnboardingPaymentMethodsResponse.from_json(json_object: response.body)
        end
      end
    end
  end
end