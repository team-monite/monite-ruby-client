# frozen_string_literal: true
require_relative "../../../requests"
require_relative "../../types/accounting_receivable_list"
require_relative "../../types/accounting_receivable"
require "async"
require "async"
require_relative "../../../requests"

module Monite
  module Accounting
    class ReceivablesClient
    # @return [Monite::RequestClient] 
      attr_reader :request_client


      # @param request_client [Monite::RequestClient] 
      # @return [Monite::Accounting::ReceivablesClient]
      def initialize(request_client:)
        @request_client = request_client
      end
# Returns a list of invoices that exist in the entity's accounting system. This
#  requires that an accounting connection has been previously established. Refer to
#  the [Accounting integration
#  guide](https://docs.monite.com/accounting/integration/index) for details.
#  This endpoint only provides read-only access to the accounting system's data but
#  does not pull those invoices into Monite. You can use it to review the data in
#  the accounting system and find out which of those invoices already exist or do
#  not exist in Monite.
#  Data is actual as of the date and time of the last accounting synchronization,
#  which is specified by the `last_pull` value in the response from `GET
#  /accounting_connections/{connection_id}`. To make sure you are accessing the
#  most up-to-date accounting data, you can use `POST
#  /accounting_connections/{connection_id}/sync` to trigger on-demand
#  synchronization before getting the invoice list.
      #
      # @param limit [Integer] Number of results per page.
      # @param offset [Integer] Number of results to skip before selecting items to return.
      # @param request_options [Monite::RequestOptions] 
      # @return [Monite::AccountingReceivableList]
      # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.accounting.receivables.get
      def get(limit: nil, offset: nil, request_options: nil)
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
  req.params = { **(request_options&.additional_query_parameters || {}), "limit": limit, "offset": offset }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/accounting/receivables"
end
        Monite::AccountingReceivableList.from_json(json_object: response.body)
      end
# Returns information about an individual invoice that exists in the entity's
#  accounting system. This invoice may or may not also exist in Monite.
      #
      # @param invoice_id [String] An internal ID of the invoice in the accounting system. You can get these IDs
#  from `GET /accounting/receivables`.
      # @param request_options [Monite::RequestOptions] 
      # @return [Monite::AccountingReceivable]
      # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.accounting.receivables.get_by_id(invoice_id: "invoice_id")
      def get_by_id(invoice_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/accounting/receivables/#{invoice_id}"
end
        Monite::AccountingReceivable.from_json(json_object: response.body)
      end
    end
    class AsyncReceivablesClient
    # @return [Monite::AsyncRequestClient] 
      attr_reader :request_client


      # @param request_client [Monite::RequestClient] 
      # @return [Monite::Accounting::AsyncReceivablesClient]
      def initialize(request_client:)
        @request_client = request_client
      end
# Returns a list of invoices that exist in the entity's accounting system. This
#  requires that an accounting connection has been previously established. Refer to
#  the [Accounting integration
#  guide](https://docs.monite.com/accounting/integration/index) for details.
#  This endpoint only provides read-only access to the accounting system's data but
#  does not pull those invoices into Monite. You can use it to review the data in
#  the accounting system and find out which of those invoices already exist or do
#  not exist in Monite.
#  Data is actual as of the date and time of the last accounting synchronization,
#  which is specified by the `last_pull` value in the response from `GET
#  /accounting_connections/{connection_id}`. To make sure you are accessing the
#  most up-to-date accounting data, you can use `POST
#  /accounting_connections/{connection_id}/sync` to trigger on-demand
#  synchronization before getting the invoice list.
      #
      # @param limit [Integer] Number of results per page.
      # @param offset [Integer] Number of results to skip before selecting items to return.
      # @param request_options [Monite::RequestOptions] 
      # @return [Monite::AccountingReceivableList]
      # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.accounting.receivables.get
      def get(limit: nil, offset: nil, request_options: nil)
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
  req.params = { **(request_options&.additional_query_parameters || {}), "limit": limit, "offset": offset }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/accounting/receivables"
end
          Monite::AccountingReceivableList.from_json(json_object: response.body)
        end
      end
# Returns information about an individual invoice that exists in the entity's
#  accounting system. This invoice may or may not also exist in Monite.
      #
      # @param invoice_id [String] An internal ID of the invoice in the accounting system. You can get these IDs
#  from `GET /accounting/receivables`.
      # @param request_options [Monite::RequestOptions] 
      # @return [Monite::AccountingReceivable]
      # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.accounting.receivables.get_by_id(invoice_id: "invoice_id")
      def get_by_id(invoice_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/accounting/receivables/#{invoice_id}"
end
          Monite::AccountingReceivable.from_json(json_object: response.body)
        end
      end
    end
  end
end