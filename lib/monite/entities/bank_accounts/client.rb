# frozen_string_literal: true
require_relative "../../../requests"
require_relative "../../types/entity_bank_account_pagination_response"
require_relative "../../types/allowed_countries"
require_relative "../../types/currency_enum"
require_relative "../../types/entity_bank_account_response"
require "async"
require "async"
require "async"
require "async"
require "async"
require "async"
require_relative "../../../requests"

module Monite
  module Entities
    class BankAccountsClient
    # @return [Monite::RequestClient] 
      attr_reader :request_client


      # @param request_client [Monite::RequestClient] 
      # @return [Monite::Entities::BankAccountsClient]
      def initialize(request_client:)
        @request_client = request_client
      end
# Get all bank accounts of this entity.
      #
      # @param request_options [Monite::RequestOptions] 
      # @return [Monite::EntityBankAccountPaginationResponse]
      # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.entities.bank_accounts.get
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
  req.url "#{@request_client.get_url(request_options: request_options)}/bank_accounts"
end
        Monite::EntityBankAccountPaginationResponse.from_json(json_object: response.body)
      end
# Add a new bank account for the specified entity.
#  The minimum required fields are `currency` and `country`. Other required fields
#  depend on the currency:
#  * EUR accounts require `iban`.
#  * GBP accounts require `account_holder_name`, `account_number`, and `sort_code`.
#  * USD accounts require `account_holder_name`, `account_number`, and
#  `routing_number`.
#  * Accounts in other currencies require one of:
#  * `iban`
#  * `account_number` and `sort_code`
#  * `account_number` and `routing_number`
      #
      # @param account_holder_name [String] The name of the person or business that owns this bank account. Required if the
#  account currency is GBP or USD.
      # @param account_number [String] The bank account number. Required if the account currency is GBP or USD. UK
#  account numbers typically contain 8 digits. US bank account numbers contain 9 to
#  12 digits.
      # @param bank_name [String] The bank name.
      # @param bic [String] The SWIFT/BIC code of the bank.
      # @param country [Monite::AllowedCountries] The country in which the bank account is registered, repsesented as a two-letter
#  country code ([ISO 3166-1
#  alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2)).
      # @param currency [Monite::CurrencyEnum] The currency of the bank account, represented as a three-letter ISO [currency
#  code](https://docs.monite.com/references/currencies).
      # @param display_name [String] User-defined name of this bank account, such as 'Primary account' or 'Savings
#  account'.
      # @param iban [String] The IBAN of the bank account. Required if the account currency is EUR.
      # @param is_default_for_currency [Boolean] If set to `true` or if this is the first bank account added for the given
#  currency, this account becomes the default one for its currency.
      # @param routing_number [String] The bank's routing transit number (RTN) or branch code. Required if the account
#  currency is USD. US routing numbers consist of 9 digits.
      # @param sort_code [String] The bank's sort code. Required if the account currency is GBP.
      # @param request_options [Monite::RequestOptions] 
      # @return [Monite::EntityBankAccountResponse]
      # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.entities.bank_accounts.create(country: AF, currency: AED)
      def create(account_holder_name: nil, account_number: nil, bank_name: nil, bic: nil, country:, currency:, display_name: nil, iban: nil, is_default_for_currency: nil, routing_number: nil, sort_code: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), account_holder_name: account_holder_name, account_number: account_number, bank_name: bank_name, bic: bic, country: country, currency: currency, display_name: display_name, iban: iban, is_default_for_currency: is_default_for_currency, routing_number: routing_number, sort_code: sort_code }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/bank_accounts"
end
        Monite::EntityBankAccountResponse.from_json(json_object: response.body)
      end
# Retrieve a bank account by its ID.
      #
      # @param bank_account_id [String] 
      # @param request_options [Monite::RequestOptions] 
      # @return [Monite::EntityBankAccountResponse]
      # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.entities.bank_accounts.get_by_id(bank_account_id: "bank_account_id")
      def get_by_id(bank_account_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/bank_accounts/#{bank_account_id}"
end
        Monite::EntityBankAccountResponse.from_json(json_object: response.body)
      end
# Delete the bank account specified by its ID.
      #
      # @param bank_account_id [String] 
      # @param request_options [Monite::RequestOptions] 
      # @return [Void]
      # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.entities.bank_accounts.delete_by_id(bank_account_id: "bank_account_id")
      def delete_by_id(bank_account_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/bank_accounts/#{bank_account_id}"
end
      end
# Change the specified fields with the provided values.
      #
      # @param bank_account_id [String] 
      # @param account_holder_name [String] The name of the person or business that owns this bank account. If the account
#  currency is GBP or USD, the holder name cannot be changed to an empty string.
      # @param display_name [String] User-defined name of this bank account, such as 'Primary account' or 'Savings
#  account'.
      # @param request_options [Monite::RequestOptions] 
      # @return [Monite::EntityBankAccountResponse]
      # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.entities.bank_accounts.update_by_id(bank_account_id: "bank_account_id")
      def update_by_id(bank_account_id:, account_holder_name: nil, display_name: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), account_holder_name: account_holder_name, display_name: display_name }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/bank_accounts/#{bank_account_id}"
end
        Monite::EntityBankAccountResponse.from_json(json_object: response.body)
      end
# Set a bank account as the default for this entity per currency.
      #
      # @param bank_account_id [String] 
      # @param request_options [Monite::RequestOptions] 
      # @return [Monite::EntityBankAccountResponse]
      # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.entities.bank_accounts.make_default_by_id(bank_account_id: "bank_account_id")
      def make_default_by_id(bank_account_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/bank_accounts/#{bank_account_id}/make_default"
end
        Monite::EntityBankAccountResponse.from_json(json_object: response.body)
      end
    end
    class AsyncBankAccountsClient
    # @return [Monite::AsyncRequestClient] 
      attr_reader :request_client


      # @param request_client [Monite::RequestClient] 
      # @return [Monite::Entities::AsyncBankAccountsClient]
      def initialize(request_client:)
        @request_client = request_client
      end
# Get all bank accounts of this entity.
      #
      # @param request_options [Monite::RequestOptions] 
      # @return [Monite::EntityBankAccountPaginationResponse]
      # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.entities.bank_accounts.get
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
  req.url "#{@request_client.get_url(request_options: request_options)}/bank_accounts"
end
          Monite::EntityBankAccountPaginationResponse.from_json(json_object: response.body)
        end
      end
# Add a new bank account for the specified entity.
#  The minimum required fields are `currency` and `country`. Other required fields
#  depend on the currency:
#  * EUR accounts require `iban`.
#  * GBP accounts require `account_holder_name`, `account_number`, and `sort_code`.
#  * USD accounts require `account_holder_name`, `account_number`, and
#  `routing_number`.
#  * Accounts in other currencies require one of:
#  * `iban`
#  * `account_number` and `sort_code`
#  * `account_number` and `routing_number`
      #
      # @param account_holder_name [String] The name of the person or business that owns this bank account. Required if the
#  account currency is GBP or USD.
      # @param account_number [String] The bank account number. Required if the account currency is GBP or USD. UK
#  account numbers typically contain 8 digits. US bank account numbers contain 9 to
#  12 digits.
      # @param bank_name [String] The bank name.
      # @param bic [String] The SWIFT/BIC code of the bank.
      # @param country [Monite::AllowedCountries] The country in which the bank account is registered, repsesented as a two-letter
#  country code ([ISO 3166-1
#  alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2)).
      # @param currency [Monite::CurrencyEnum] The currency of the bank account, represented as a three-letter ISO [currency
#  code](https://docs.monite.com/references/currencies).
      # @param display_name [String] User-defined name of this bank account, such as 'Primary account' or 'Savings
#  account'.
      # @param iban [String] The IBAN of the bank account. Required if the account currency is EUR.
      # @param is_default_for_currency [Boolean] If set to `true` or if this is the first bank account added for the given
#  currency, this account becomes the default one for its currency.
      # @param routing_number [String] The bank's routing transit number (RTN) or branch code. Required if the account
#  currency is USD. US routing numbers consist of 9 digits.
      # @param sort_code [String] The bank's sort code. Required if the account currency is GBP.
      # @param request_options [Monite::RequestOptions] 
      # @return [Monite::EntityBankAccountResponse]
      # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.entities.bank_accounts.create(country: AF, currency: AED)
      def create(account_holder_name: nil, account_number: nil, bank_name: nil, bic: nil, country:, currency:, display_name: nil, iban: nil, is_default_for_currency: nil, routing_number: nil, sort_code: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), account_holder_name: account_holder_name, account_number: account_number, bank_name: bank_name, bic: bic, country: country, currency: currency, display_name: display_name, iban: iban, is_default_for_currency: is_default_for_currency, routing_number: routing_number, sort_code: sort_code }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/bank_accounts"
end
          Monite::EntityBankAccountResponse.from_json(json_object: response.body)
        end
      end
# Retrieve a bank account by its ID.
      #
      # @param bank_account_id [String] 
      # @param request_options [Monite::RequestOptions] 
      # @return [Monite::EntityBankAccountResponse]
      # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.entities.bank_accounts.get_by_id(bank_account_id: "bank_account_id")
      def get_by_id(bank_account_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/bank_accounts/#{bank_account_id}"
end
          Monite::EntityBankAccountResponse.from_json(json_object: response.body)
        end
      end
# Delete the bank account specified by its ID.
      #
      # @param bank_account_id [String] 
      # @param request_options [Monite::RequestOptions] 
      # @return [Void]
      # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.entities.bank_accounts.delete_by_id(bank_account_id: "bank_account_id")
      def delete_by_id(bank_account_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/bank_accounts/#{bank_account_id}"
end
        end
      end
# Change the specified fields with the provided values.
      #
      # @param bank_account_id [String] 
      # @param account_holder_name [String] The name of the person or business that owns this bank account. If the account
#  currency is GBP or USD, the holder name cannot be changed to an empty string.
      # @param display_name [String] User-defined name of this bank account, such as 'Primary account' or 'Savings
#  account'.
      # @param request_options [Monite::RequestOptions] 
      # @return [Monite::EntityBankAccountResponse]
      # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.entities.bank_accounts.update_by_id(bank_account_id: "bank_account_id")
      def update_by_id(bank_account_id:, account_holder_name: nil, display_name: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), account_holder_name: account_holder_name, display_name: display_name }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/bank_accounts/#{bank_account_id}"
end
          Monite::EntityBankAccountResponse.from_json(json_object: response.body)
        end
      end
# Set a bank account as the default for this entity per currency.
      #
      # @param bank_account_id [String] 
      # @param request_options [Monite::RequestOptions] 
      # @return [Monite::EntityBankAccountResponse]
      # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.entities.bank_accounts.make_default_by_id(bank_account_id: "bank_account_id")
      def make_default_by_id(bank_account_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/bank_accounts/#{bank_account_id}/make_default"
end
          Monite::EntityBankAccountResponse.from_json(json_object: response.body)
        end
      end
    end
  end
end