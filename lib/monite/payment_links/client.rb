# frozen_string_literal: true
require_relative "../../requests"
require_relative "../types/currency_enum"
require "date"
require_relative "../types/invoice"
require_relative "../types/payment_object"
require_relative "../types/monite_all_payment_methods_types"
require_relative "../types/payment_account_object"
require_relative "../types/public_payment_link_response"
require "async"
require "async"
require "async"
require_relative "../../requests"

module Monite
  class PaymentLinksClient
  # @return [Monite::RequestClient] 
    attr_reader :request_client


    # @param request_client [Monite::RequestClient] 
    # @return [Monite::PaymentLinksClient]
    def initialize(request_client:)
      @request_client = request_client
    end
    # @param amount [Integer] The payment amount in [minor
#  units](https://docs.monite.com/references/currencies#minor-units). Required if
#  `object` is not specified.
    # @param currency [Monite::CurrencyEnum] The payment currency. Required if `object` is not specified.
    # @param expires_at [DateTime] 
    # @param invoice [Hash] An object containing information about the invoice being paid. Used only if
#  `object` is not specified.Request of type Monite::Invoice, as a Hash
    #   * :due_date (String) 
    #   * :file (Hash)
    #     * :mimetype (String) 
    #     * :name (String) 
    #     * :url (String) 
    #   * :issue_date (String) 
    # @param object [Hash] If the invoice being paid is a payable or receivable stored in Monite, provide
#  the `object` object containing the invoice type and ID. Otherwise, use the
#  `amount`, `currency`, `payment_reference`, and (optionally) `invoice` fields to
#  specify the invoice-related data.Request of type Monite::PaymentObject, as a Hash
    #   * :id (String) 
    #   * :type (Monite::PaymentObjectType) 
    # @param payment_methods [Array<Monite::MoniteAllPaymentMethodsTypes>] 
    # @param payment_reference [String] A payment reference number that the recipient can use to identify the payer or
#  purpose of the transaction. Required if `object` is not specified.
    # @param recipient [Hash] Request of type Monite::PaymentAccountObject, as a Hash
    #   * :id (String) 
    #   * :type (Monite::PaymentAccountType) 
    # @param return_url [String] The URL where to redirect the payer after the payment. If `return_url` is
#  specified, then after the payment is completed the payment page will display the
#  "Return to platform" link that navigates to this URL.
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::PublicPaymentLinkResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.payment_links.create(payment_methods: [SEPA_CREDIT], recipient: { id: "id", type: ENTITY })
    def create(amount: nil, currency: nil, expires_at: nil, invoice: nil, object: nil, payment_methods:, payment_reference: nil, recipient:, return_url: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), amount: amount, currency: currency, expires_at: expires_at, invoice: invoice, object: object, payment_methods: payment_methods, payment_reference: payment_reference, recipient: recipient, return_url: return_url }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/payment_links"
end
      Monite::PublicPaymentLinkResponse.from_json(json_object: response.body)
    end
    # @param payment_link_id [String] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::PublicPaymentLinkResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.payment_links.get_by_id(payment_link_id: "payment_link_id")
    def get_by_id(payment_link_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/payment_links/#{payment_link_id}"
end
      Monite::PublicPaymentLinkResponse.from_json(json_object: response.body)
    end
    # @param payment_link_id [String] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::PublicPaymentLinkResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.payment_links.expire_by_id(payment_link_id: "payment_link_id")
    def expire_by_id(payment_link_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/payment_links/#{payment_link_id}/expire"
end
      Monite::PublicPaymentLinkResponse.from_json(json_object: response.body)
    end
  end
  class AsyncPaymentLinksClient
  # @return [Monite::AsyncRequestClient] 
    attr_reader :request_client


    # @param request_client [Monite::RequestClient] 
    # @return [Monite::AsyncPaymentLinksClient]
    def initialize(request_client:)
      @request_client = request_client
    end
    # @param amount [Integer] The payment amount in [minor
#  units](https://docs.monite.com/references/currencies#minor-units). Required if
#  `object` is not specified.
    # @param currency [Monite::CurrencyEnum] The payment currency. Required if `object` is not specified.
    # @param expires_at [DateTime] 
    # @param invoice [Hash] An object containing information about the invoice being paid. Used only if
#  `object` is not specified.Request of type Monite::Invoice, as a Hash
    #   * :due_date (String) 
    #   * :file (Hash)
    #     * :mimetype (String) 
    #     * :name (String) 
    #     * :url (String) 
    #   * :issue_date (String) 
    # @param object [Hash] If the invoice being paid is a payable or receivable stored in Monite, provide
#  the `object` object containing the invoice type and ID. Otherwise, use the
#  `amount`, `currency`, `payment_reference`, and (optionally) `invoice` fields to
#  specify the invoice-related data.Request of type Monite::PaymentObject, as a Hash
    #   * :id (String) 
    #   * :type (Monite::PaymentObjectType) 
    # @param payment_methods [Array<Monite::MoniteAllPaymentMethodsTypes>] 
    # @param payment_reference [String] A payment reference number that the recipient can use to identify the payer or
#  purpose of the transaction. Required if `object` is not specified.
    # @param recipient [Hash] Request of type Monite::PaymentAccountObject, as a Hash
    #   * :id (String) 
    #   * :type (Monite::PaymentAccountType) 
    # @param return_url [String] The URL where to redirect the payer after the payment. If `return_url` is
#  specified, then after the payment is completed the payment page will display the
#  "Return to platform" link that navigates to this URL.
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::PublicPaymentLinkResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.payment_links.create(payment_methods: [SEPA_CREDIT], recipient: { id: "id", type: ENTITY })
    def create(amount: nil, currency: nil, expires_at: nil, invoice: nil, object: nil, payment_methods:, payment_reference: nil, recipient:, return_url: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), amount: amount, currency: currency, expires_at: expires_at, invoice: invoice, object: object, payment_methods: payment_methods, payment_reference: payment_reference, recipient: recipient, return_url: return_url }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/payment_links"
end
        Monite::PublicPaymentLinkResponse.from_json(json_object: response.body)
      end
    end
    # @param payment_link_id [String] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::PublicPaymentLinkResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.payment_links.get_by_id(payment_link_id: "payment_link_id")
    def get_by_id(payment_link_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/payment_links/#{payment_link_id}"
end
        Monite::PublicPaymentLinkResponse.from_json(json_object: response.body)
      end
    end
    # @param payment_link_id [String] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::PublicPaymentLinkResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.payment_links.expire_by_id(payment_link_id: "payment_link_id")
    def expire_by_id(payment_link_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/payment_links/#{payment_link_id}/expire"
end
        Monite::PublicPaymentLinkResponse.from_json(json_object: response.body)
      end
    end
  end
end