# frozen_string_literal: true
require_relative "../../../requests"
require_relative "../../types/order_enum"
require_relative "../../types/tax_rate_account_cursor_fields"
require_relative "../../types/accounting_tax_rate_list_response"
require_relative "../../types/accounting_tax_rate_response"
require "async"
require "async"
require_relative "../../../requests"

module Monite
  module Accounting
    class TaxRatesClient
    # @return [Monite::RequestClient] 
      attr_reader :request_client


      # @param request_client [Monite::RequestClient] 
      # @return [Monite::Accounting::TaxRatesClient]
      def initialize(request_client:)
        @request_client = request_client
      end
# Get all tax rate accounts
      #
      # @param order [Monite::OrderEnum] Order by
      # @param limit [Integer] Max is 100
      # @param pagination_token [String] A token, obtained from previous page. Prior over other filters
      # @param sort [Monite::TAX_RATE_ACCOUNT_CURSOR_FIELDS] Allowed sort fields
      # @param request_options [Monite::RequestOptions] 
      # @return [Monite::AccountingTaxRateListResponse]
      # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.accounting.tax_rates.get
      def get(order: nil, limit: nil, pagination_token: nil, sort: nil, request_options: nil)
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
  req.params = { **(request_options&.additional_query_parameters || {}), "order": order, "limit": limit, "pagination_token": pagination_token, "sort": sort }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/accounting_tax_rates"
end
        Monite::AccountingTaxRateListResponse.from_json(json_object: response.body)
      end
# Get tax rate account by id
      #
      # @param tax_rate_id [String] 
      # @param request_options [Monite::RequestOptions] 
      # @return [Monite::AccountingTaxRateResponse]
      # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.accounting.tax_rates.get_by_id(tax_rate_id: "tax_rate_id")
      def get_by_id(tax_rate_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/accounting_tax_rates/#{tax_rate_id}"
end
        Monite::AccountingTaxRateResponse.from_json(json_object: response.body)
      end
    end
    class AsyncTaxRatesClient
    # @return [Monite::AsyncRequestClient] 
      attr_reader :request_client


      # @param request_client [Monite::RequestClient] 
      # @return [Monite::Accounting::AsyncTaxRatesClient]
      def initialize(request_client:)
        @request_client = request_client
      end
# Get all tax rate accounts
      #
      # @param order [Monite::OrderEnum] Order by
      # @param limit [Integer] Max is 100
      # @param pagination_token [String] A token, obtained from previous page. Prior over other filters
      # @param sort [Monite::TAX_RATE_ACCOUNT_CURSOR_FIELDS] Allowed sort fields
      # @param request_options [Monite::RequestOptions] 
      # @return [Monite::AccountingTaxRateListResponse]
      # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.accounting.tax_rates.get
      def get(order: nil, limit: nil, pagination_token: nil, sort: nil, request_options: nil)
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
  req.params = { **(request_options&.additional_query_parameters || {}), "order": order, "limit": limit, "pagination_token": pagination_token, "sort": sort }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/accounting_tax_rates"
end
          Monite::AccountingTaxRateListResponse.from_json(json_object: response.body)
        end
      end
# Get tax rate account by id
      #
      # @param tax_rate_id [String] 
      # @param request_options [Monite::RequestOptions] 
      # @return [Monite::AccountingTaxRateResponse]
      # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.accounting.tax_rates.get_by_id(tax_rate_id: "tax_rate_id")
      def get_by_id(tax_rate_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/accounting_tax_rates/#{tax_rate_id}"
end
          Monite::AccountingTaxRateResponse.from_json(json_object: response.body)
        end
      end
    end
  end
end