# frozen_string_literal: true
require_relative "../../requests"
require_relative "../types/e_invoicing_retrieve_list_data"
require_relative "../types/einvoicing_address"
require_relative "../types/einvoicing_connection_response"
require_relative "../types/einvoice_schema_type_enum"
require_relative "../types/einvoicing_network_credentials_response"
require "async"
require "async"
require "async"
require "async"
require "async"
require_relative "../../requests"

module Monite
  class EInvoicingConnectionsClient
  # @return [Monite::RequestClient] 
    attr_reader :request_client


    # @param request_client [Monite::RequestClient] 
    # @return [Monite::EInvoicingConnectionsClient]
    def initialize(request_client:)
      @request_client = request_client
    end
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::EInvoicingRetrieveListData]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.e_invoicing_connections.get_einvoicing_connections
    def get_einvoicing_connections(request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/einvoicing_connections"
end
      Monite::EInvoicingRetrieveListData.from_json(json_object: response.body)
    end
    # @param address [Hash] Integration AddressRequest of type Monite::EinvoicingAddress, as a Hash
    #   * :address_line_1 (String) 
    #   * :address_line_2 (String) 
    #   * :city (String) 
    #   * :country (Monite::AllowedEinvoicingCountryCodes) 
    #   * :postal_code (String) 
    #   * :state (String) 
    # @param entity_vat_id_id [String] Entity VAT ID identifier for the integration
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::EinvoicingConnectionResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.e_invoicing_connections.post_einvoicing_connections(address: { address_line_1: "address_line1", city: "city", country: DE, postal_code: "postal_code" })
    def post_einvoicing_connections(address:, entity_vat_id_id: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), address: address, entity_vat_id_id: entity_vat_id_id }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/einvoicing_connections"
end
      Monite::EinvoicingConnectionResponse.from_json(json_object: response.body)
    end
    # @param einvoicing_connection_id [String] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::EinvoicingConnectionResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.e_invoicing_connections.get_einvoicing_connections_id(einvoicing_connection_id: "einvoicing_connection_id")
    def get_einvoicing_connections_id(einvoicing_connection_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/einvoicing_connections/#{einvoicing_connection_id}"
end
      Monite::EinvoicingConnectionResponse.from_json(json_object: response.body)
    end
    # @param einvoicing_connection_id [String] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Void]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.e_invoicing_connections.delete_einvoicing_connections_id(einvoicing_connection_id: "einvoicing_connection_id")
    def delete_einvoicing_connections_id(einvoicing_connection_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/einvoicing_connections/#{einvoicing_connection_id}"
end
    end
    # @param einvoicing_connection_id [String] 
    # @param network_credentials_identifier [String] Network participant identifier
    # @param network_credentials_schema [Monite::EinvoiceSchemaTypeEnum] Network scheme identifier
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::EinvoicingNetworkCredentialsResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.e_invoicing_connections.post_einvoicing_connections_id_network_credentials(
#    einvoicing_connection_id: "einvoicing_connection_id",
#    network_credentials_identifier: "12345678",
#    network_credentials_schema: DE_VAT
#  )
    def post_einvoicing_connections_id_network_credentials(einvoicing_connection_id:, network_credentials_identifier:, network_credentials_schema:, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), network_credentials_identifier: network_credentials_identifier, network_credentials_schema: network_credentials_schema }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/einvoicing_connections/#{einvoicing_connection_id}/network_credentials"
end
      Monite::EinvoicingNetworkCredentialsResponse.from_json(json_object: response.body)
    end
  end
  class AsyncEInvoicingConnectionsClient
  # @return [Monite::AsyncRequestClient] 
    attr_reader :request_client


    # @param request_client [Monite::RequestClient] 
    # @return [Monite::AsyncEInvoicingConnectionsClient]
    def initialize(request_client:)
      @request_client = request_client
    end
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::EInvoicingRetrieveListData]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.e_invoicing_connections.get_einvoicing_connections
    def get_einvoicing_connections(request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/einvoicing_connections"
end
        Monite::EInvoicingRetrieveListData.from_json(json_object: response.body)
      end
    end
    # @param address [Hash] Integration AddressRequest of type Monite::EinvoicingAddress, as a Hash
    #   * :address_line_1 (String) 
    #   * :address_line_2 (String) 
    #   * :city (String) 
    #   * :country (Monite::AllowedEinvoicingCountryCodes) 
    #   * :postal_code (String) 
    #   * :state (String) 
    # @param entity_vat_id_id [String] Entity VAT ID identifier for the integration
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::EinvoicingConnectionResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.e_invoicing_connections.post_einvoicing_connections(address: { address_line_1: "address_line1", city: "city", country: DE, postal_code: "postal_code" })
    def post_einvoicing_connections(address:, entity_vat_id_id: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), address: address, entity_vat_id_id: entity_vat_id_id }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/einvoicing_connections"
end
        Monite::EinvoicingConnectionResponse.from_json(json_object: response.body)
      end
    end
    # @param einvoicing_connection_id [String] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::EinvoicingConnectionResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.e_invoicing_connections.get_einvoicing_connections_id(einvoicing_connection_id: "einvoicing_connection_id")
    def get_einvoicing_connections_id(einvoicing_connection_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/einvoicing_connections/#{einvoicing_connection_id}"
end
        Monite::EinvoicingConnectionResponse.from_json(json_object: response.body)
      end
    end
    # @param einvoicing_connection_id [String] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Void]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.e_invoicing_connections.delete_einvoicing_connections_id(einvoicing_connection_id: "einvoicing_connection_id")
    def delete_einvoicing_connections_id(einvoicing_connection_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/einvoicing_connections/#{einvoicing_connection_id}"
end
      end
    end
    # @param einvoicing_connection_id [String] 
    # @param network_credentials_identifier [String] Network participant identifier
    # @param network_credentials_schema [Monite::EinvoiceSchemaTypeEnum] Network scheme identifier
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::EinvoicingNetworkCredentialsResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.e_invoicing_connections.post_einvoicing_connections_id_network_credentials(
#    einvoicing_connection_id: "einvoicing_connection_id",
#    network_credentials_identifier: "12345678",
#    network_credentials_schema: DE_VAT
#  )
    def post_einvoicing_connections_id_network_credentials(einvoicing_connection_id:, network_credentials_identifier:, network_credentials_schema:, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), network_credentials_identifier: network_credentials_identifier, network_credentials_schema: network_credentials_schema }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/einvoicing_connections/#{einvoicing_connection_id}/network_credentials"
end
        Monite::EinvoicingNetworkCredentialsResponse.from_json(json_object: response.body)
      end
    end
  end
end