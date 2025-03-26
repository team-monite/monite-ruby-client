# frozen_string_literal: true
require_relative "../../../requests"
require_relative "../../types/counterpart_bank_account_resource_list"
require_relative "../../types/allowed_countries"
require_relative "../../types/currency_enum"
require_relative "../../types/counterpart_bank_account_response"
require "json"
require "async"
require "async"
require "async"
require "async"
require "async"
require "async"
require_relative "../../../requests"

module Monite
  module Counterparts
    class BankAccountsClient
    # @return [Monite::RequestClient] 
      attr_reader :request_client


      # @param request_client [Monite::RequestClient] 
      # @return [Monite::Counterparts::BankAccountsClient]
      def initialize(request_client:)
        @request_client = request_client
      end
      # @param counterpart_id [String] 
      # @param request_options [Monite::RequestOptions] 
      # @return [Monite::CounterpartBankAccountResourceList]
      # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.counterparts.bank_accounts.get(counterpart_id: "counterpart_id")
      def get(counterpart_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/counterparts/#{counterpart_id}/bank_accounts"
end
        Monite::CounterpartBankAccountResourceList.from_json(json_object: response.body)
      end
      # @param counterpart_id [String] 
      # @param account_holder_name [String] The name of the person or business that owns this bank account. Required for US
#  bank accounts to accept ACH payments.
      # @param account_number [String] The bank account number. Required for US bank accounts to accept ACH payments.
#  US account numbers contain 9 to 12 digits. UK account numbers typically contain
#  8 digits.
      # @param bic [String] The BIC/SWIFT code of the bank.
      # @param country [Monite::AllowedCountries] 
      # @param currency [Monite::CurrencyEnum] 
      # @param iban [String] The IBAN of the bank account.
      # @param is_default_for_currency [Boolean] 
      # @param name [String] 
      # @param partner_metadata [Hash{String => Object}] Metadata for partner needs.
      # @param routing_number [String] The bank's routing transit number (RTN). Required for US bank accounts to accept
#  ACH payments. US routing numbers consist of 9 digits.
      # @param sort_code [String] The bank's sort code.
      # @param request_options [Monite::RequestOptions] 
      # @return [Monite::CounterpartBankAccountResponse]
      # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.counterparts.bank_accounts.create(
#    counterpart_id: "counterpart_id",
#    country: AF,
#    currency: AED
#  )
      def create(counterpart_id:, account_holder_name: nil, account_number: nil, bic: nil, country:, currency:, iban: nil, is_default_for_currency: nil, name: nil, partner_metadata: nil, routing_number: nil, sort_code: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), account_holder_name: account_holder_name, account_number: account_number, bic: bic, country: country, currency: currency, iban: iban, is_default_for_currency: is_default_for_currency, name: name, partner_metadata: partner_metadata, routing_number: routing_number, sort_code: sort_code }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/counterparts/#{counterpart_id}/bank_accounts"
end
        Monite::CounterpartBankAccountResponse.from_json(json_object: response.body)
      end
      # @param bank_account_id [String] 
      # @param counterpart_id [String] 
      # @param request_options [Monite::RequestOptions] 
      # @return [Monite::CounterpartBankAccountResponse]
      # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.counterparts.bank_accounts.get_by_id(bank_account_id: "bank_account_id", counterpart_id: "counterpart_id")
      def get_by_id(bank_account_id:, counterpart_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/counterparts/#{bank_account_id}/bank_accounts/#{counterpart_id}"
end
        Monite::CounterpartBankAccountResponse.from_json(json_object: response.body)
      end
      # @param bank_account_id [String] 
      # @param counterpart_id [String] 
      # @param request_options [Monite::RequestOptions] 
      # @return [Void]
      # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.counterparts.bank_accounts.delete_by_id(bank_account_id: "bank_account_id", counterpart_id: "counterpart_id")
      def delete_by_id(bank_account_id:, counterpart_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/counterparts/#{bank_account_id}/bank_accounts/#{counterpart_id}"
end
      end
      # @param bank_account_id [String] 
      # @param counterpart_id [String] 
      # @param account_holder_name [String] The name of the person or business that owns this bank account. Required for US
#  bank accounts to accept ACH payments.
      # @param account_number [String] The bank account number. Required for US bank accounts to accept ACH payments.
#  US account numbers contain 9 to 12 digits. UK account numbers typically contain
#  8 digits.
      # @param bic [String] The BIC/SWIFT code of the bank.
      # @param country [Monite::AllowedCountries] 
      # @param currency [Monite::CurrencyEnum] 
      # @param iban [String] The IBAN of the bank account.
      # @param name [String] 
      # @param partner_metadata [Hash{String => Object}] Metadata for partner needs.
      # @param routing_number [String] The bank's routing transit number (RTN). Required for US bank accounts to accept
#  ACH payments. US routing numbers consist of 9 digits.
      # @param sort_code [String] The bank's sort code.
      # @param request_options [Monite::RequestOptions] 
      # @return [Monite::CounterpartBankAccountResponse]
      # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.counterparts.bank_accounts.update_by_id(bank_account_id: "bank_account_id", counterpart_id: "counterpart_id")
      def update_by_id(bank_account_id:, counterpart_id:, account_holder_name: nil, account_number: nil, bic: nil, country: nil, currency: nil, iban: nil, name: nil, partner_metadata: nil, routing_number: nil, sort_code: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), account_holder_name: account_holder_name, account_number: account_number, bic: bic, country: country, currency: currency, iban: iban, name: name, partner_metadata: partner_metadata, routing_number: routing_number, sort_code: sort_code }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/counterparts/#{bank_account_id}/bank_accounts/#{counterpart_id}"
end
        Monite::CounterpartBankAccountResponse.from_json(json_object: response.body)
      end
      # @param bank_account_id [String] 
      # @param counterpart_id [String] 
      # @param request_options [Monite::RequestOptions] 
      # @return [Object]
      # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.counterparts.bank_accounts.make_default_by_id(bank_account_id: "bank_account_id", counterpart_id: "counterpart_id")
      def make_default_by_id(bank_account_id:, counterpart_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/counterparts/#{bank_account_id}/bank_accounts/#{counterpart_id}/make_default"
end
        parsed_json = JSON.parse(response.body)
        parsed_json
      end
    end
    class AsyncBankAccountsClient
    # @return [Monite::AsyncRequestClient] 
      attr_reader :request_client


      # @param request_client [Monite::RequestClient] 
      # @return [Monite::Counterparts::AsyncBankAccountsClient]
      def initialize(request_client:)
        @request_client = request_client
      end
      # @param counterpart_id [String] 
      # @param request_options [Monite::RequestOptions] 
      # @return [Monite::CounterpartBankAccountResourceList]
      # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.counterparts.bank_accounts.get(counterpart_id: "counterpart_id")
      def get(counterpart_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/counterparts/#{counterpart_id}/bank_accounts"
end
          Monite::CounterpartBankAccountResourceList.from_json(json_object: response.body)
        end
      end
      # @param counterpart_id [String] 
      # @param account_holder_name [String] The name of the person or business that owns this bank account. Required for US
#  bank accounts to accept ACH payments.
      # @param account_number [String] The bank account number. Required for US bank accounts to accept ACH payments.
#  US account numbers contain 9 to 12 digits. UK account numbers typically contain
#  8 digits.
      # @param bic [String] The BIC/SWIFT code of the bank.
      # @param country [Monite::AllowedCountries] 
      # @param currency [Monite::CurrencyEnum] 
      # @param iban [String] The IBAN of the bank account.
      # @param is_default_for_currency [Boolean] 
      # @param name [String] 
      # @param partner_metadata [Hash{String => Object}] Metadata for partner needs.
      # @param routing_number [String] The bank's routing transit number (RTN). Required for US bank accounts to accept
#  ACH payments. US routing numbers consist of 9 digits.
      # @param sort_code [String] The bank's sort code.
      # @param request_options [Monite::RequestOptions] 
      # @return [Monite::CounterpartBankAccountResponse]
      # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.counterparts.bank_accounts.create(
#    counterpart_id: "counterpart_id",
#    country: AF,
#    currency: AED
#  )
      def create(counterpart_id:, account_holder_name: nil, account_number: nil, bic: nil, country:, currency:, iban: nil, is_default_for_currency: nil, name: nil, partner_metadata: nil, routing_number: nil, sort_code: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), account_holder_name: account_holder_name, account_number: account_number, bic: bic, country: country, currency: currency, iban: iban, is_default_for_currency: is_default_for_currency, name: name, partner_metadata: partner_metadata, routing_number: routing_number, sort_code: sort_code }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/counterparts/#{counterpart_id}/bank_accounts"
end
          Monite::CounterpartBankAccountResponse.from_json(json_object: response.body)
        end
      end
      # @param bank_account_id [String] 
      # @param counterpart_id [String] 
      # @param request_options [Monite::RequestOptions] 
      # @return [Monite::CounterpartBankAccountResponse]
      # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.counterparts.bank_accounts.get_by_id(bank_account_id: "bank_account_id", counterpart_id: "counterpart_id")
      def get_by_id(bank_account_id:, counterpart_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/counterparts/#{bank_account_id}/bank_accounts/#{counterpart_id}"
end
          Monite::CounterpartBankAccountResponse.from_json(json_object: response.body)
        end
      end
      # @param bank_account_id [String] 
      # @param counterpart_id [String] 
      # @param request_options [Monite::RequestOptions] 
      # @return [Void]
      # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.counterparts.bank_accounts.delete_by_id(bank_account_id: "bank_account_id", counterpart_id: "counterpart_id")
      def delete_by_id(bank_account_id:, counterpart_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/counterparts/#{bank_account_id}/bank_accounts/#{counterpart_id}"
end
        end
      end
      # @param bank_account_id [String] 
      # @param counterpart_id [String] 
      # @param account_holder_name [String] The name of the person or business that owns this bank account. Required for US
#  bank accounts to accept ACH payments.
      # @param account_number [String] The bank account number. Required for US bank accounts to accept ACH payments.
#  US account numbers contain 9 to 12 digits. UK account numbers typically contain
#  8 digits.
      # @param bic [String] The BIC/SWIFT code of the bank.
      # @param country [Monite::AllowedCountries] 
      # @param currency [Monite::CurrencyEnum] 
      # @param iban [String] The IBAN of the bank account.
      # @param name [String] 
      # @param partner_metadata [Hash{String => Object}] Metadata for partner needs.
      # @param routing_number [String] The bank's routing transit number (RTN). Required for US bank accounts to accept
#  ACH payments. US routing numbers consist of 9 digits.
      # @param sort_code [String] The bank's sort code.
      # @param request_options [Monite::RequestOptions] 
      # @return [Monite::CounterpartBankAccountResponse]
      # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.counterparts.bank_accounts.update_by_id(bank_account_id: "bank_account_id", counterpart_id: "counterpart_id")
      def update_by_id(bank_account_id:, counterpart_id:, account_holder_name: nil, account_number: nil, bic: nil, country: nil, currency: nil, iban: nil, name: nil, partner_metadata: nil, routing_number: nil, sort_code: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), account_holder_name: account_holder_name, account_number: account_number, bic: bic, country: country, currency: currency, iban: iban, name: name, partner_metadata: partner_metadata, routing_number: routing_number, sort_code: sort_code }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/counterparts/#{bank_account_id}/bank_accounts/#{counterpart_id}"
end
          Monite::CounterpartBankAccountResponse.from_json(json_object: response.body)
        end
      end
      # @param bank_account_id [String] 
      # @param counterpart_id [String] 
      # @param request_options [Monite::RequestOptions] 
      # @return [Object]
      # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.counterparts.bank_accounts.make_default_by_id(bank_account_id: "bank_account_id", counterpart_id: "counterpart_id")
      def make_default_by_id(bank_account_id:, counterpart_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/counterparts/#{bank_account_id}/bank_accounts/#{counterpart_id}/make_default"
end
          parsed_json = JSON.parse(response.body)
          parsed_json
        end
      end
    end
  end
end