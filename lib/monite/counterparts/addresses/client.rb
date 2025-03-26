# frozen_string_literal: true
require_relative "../../../requests"
require_relative "../../types/counterpart_address_resource_list"
require_relative "../../types/counterpart_address"
require_relative "../../types/counterpart_address_response_with_counterpart_id"
require_relative "../../types/allowed_countries"
require "async"
require "async"
require "async"
require "async"
require "async"
require_relative "../../../requests"

module Monite
  module Counterparts
    class AddressesClient
    # @return [Monite::RequestClient] 
      attr_reader :request_client


      # @param request_client [Monite::RequestClient] 
      # @return [Monite::Counterparts::AddressesClient]
      def initialize(request_client:)
        @request_client = request_client
      end
      # @param counterpart_id [String] 
      # @param request_options [Monite::RequestOptions] 
      # @return [Monite::CounterpartAddressResourceList]
      # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.counterparts.addresses.get(counterpart_id: "counterpart_id")
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
  req.url "#{@request_client.get_url(request_options: request_options)}/counterparts/#{counterpart_id}/addresses"
end
        Monite::CounterpartAddressResourceList.from_json(json_object: response.body)
      end
      # @param counterpart_id [String] 
      # @param request [Hash] Request of type Monite::CounterpartAddress, as a Hash
      #   * :city (String) 
      #   * :country (Monite::AllowedCountries) 
      #   * :line_1 (String) 
      #   * :line_2 (String) 
      #   * :postal_code (String) 
      #   * :state (String) 
      # @param request_options [Monite::RequestOptions] 
      # @return [Monite::CounterpartAddressResponseWithCounterpartId]
      # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.counterparts.addresses.create(counterpart_id: "counterpart_id", request: { city: "Berlin", country: AF, line_1: "Flughafenstrasse 52", postal_code: "10115" })
      def create(counterpart_id:, request:, request_options: nil)
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
  req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/counterparts/#{counterpart_id}/addresses"
end
        Monite::CounterpartAddressResponseWithCounterpartId.from_json(json_object: response.body)
      end
      # @param address_id [String] 
      # @param counterpart_id [String] 
      # @param request_options [Monite::RequestOptions] 
      # @return [Monite::CounterpartAddressResponseWithCounterpartId]
      # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.counterparts.addresses.get_by_id(address_id: "address_id", counterpart_id: "counterpart_id")
      def get_by_id(address_id:, counterpart_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/counterparts/#{address_id}/addresses/#{counterpart_id}"
end
        Monite::CounterpartAddressResponseWithCounterpartId.from_json(json_object: response.body)
      end
      # @param address_id [String] 
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
#  api.counterparts.addresses.delete_by_id(address_id: "address_id", counterpart_id: "counterpart_id")
      def delete_by_id(address_id:, counterpart_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/counterparts/#{address_id}/addresses/#{counterpart_id}"
end
      end
      # @param address_id [String] 
      # @param counterpart_id [String] 
      # @param city [String] City name.
      # @param country [Monite::AllowedCountries] Two-letter ISO country code ([ISO 3166-1
#  alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2)).
      # @param line_1 [String] Street address.
      # @param line_2 [String] Additional address information (if any).
      # @param postal_code [String] ZIP or postal code.
      # @param state [String] State, region, province, or county.
      # @param request_options [Monite::RequestOptions] 
      # @return [Monite::CounterpartAddressResponseWithCounterpartId]
      # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.counterparts.addresses.update_by_id(address_id: "address_id", counterpart_id: "counterpart_id")
      def update_by_id(address_id:, counterpart_id:, city: nil, country: nil, line_1: nil, line_2: nil, postal_code: nil, state: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), city: city, country: country, line1: line_1, line2: line_2, postal_code: postal_code, state: state }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/counterparts/#{address_id}/addresses/#{counterpart_id}"
end
        Monite::CounterpartAddressResponseWithCounterpartId.from_json(json_object: response.body)
      end
    end
    class AsyncAddressesClient
    # @return [Monite::AsyncRequestClient] 
      attr_reader :request_client


      # @param request_client [Monite::RequestClient] 
      # @return [Monite::Counterparts::AsyncAddressesClient]
      def initialize(request_client:)
        @request_client = request_client
      end
      # @param counterpart_id [String] 
      # @param request_options [Monite::RequestOptions] 
      # @return [Monite::CounterpartAddressResourceList]
      # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.counterparts.addresses.get(counterpart_id: "counterpart_id")
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
  req.url "#{@request_client.get_url(request_options: request_options)}/counterparts/#{counterpart_id}/addresses"
end
          Monite::CounterpartAddressResourceList.from_json(json_object: response.body)
        end
      end
      # @param counterpart_id [String] 
      # @param request [Hash] Request of type Monite::CounterpartAddress, as a Hash
      #   * :city (String) 
      #   * :country (Monite::AllowedCountries) 
      #   * :line_1 (String) 
      #   * :line_2 (String) 
      #   * :postal_code (String) 
      #   * :state (String) 
      # @param request_options [Monite::RequestOptions] 
      # @return [Monite::CounterpartAddressResponseWithCounterpartId]
      # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.counterparts.addresses.create(counterpart_id: "counterpart_id", request: { city: "Berlin", country: AF, line_1: "Flughafenstrasse 52", postal_code: "10115" })
      def create(counterpart_id:, request:, request_options: nil)
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
  req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/counterparts/#{counterpart_id}/addresses"
end
          Monite::CounterpartAddressResponseWithCounterpartId.from_json(json_object: response.body)
        end
      end
      # @param address_id [String] 
      # @param counterpart_id [String] 
      # @param request_options [Monite::RequestOptions] 
      # @return [Monite::CounterpartAddressResponseWithCounterpartId]
      # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.counterparts.addresses.get_by_id(address_id: "address_id", counterpart_id: "counterpart_id")
      def get_by_id(address_id:, counterpart_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/counterparts/#{address_id}/addresses/#{counterpart_id}"
end
          Monite::CounterpartAddressResponseWithCounterpartId.from_json(json_object: response.body)
        end
      end
      # @param address_id [String] 
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
#  api.counterparts.addresses.delete_by_id(address_id: "address_id", counterpart_id: "counterpart_id")
      def delete_by_id(address_id:, counterpart_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/counterparts/#{address_id}/addresses/#{counterpart_id}"
end
        end
      end
      # @param address_id [String] 
      # @param counterpart_id [String] 
      # @param city [String] City name.
      # @param country [Monite::AllowedCountries] Two-letter ISO country code ([ISO 3166-1
#  alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2)).
      # @param line_1 [String] Street address.
      # @param line_2 [String] Additional address information (if any).
      # @param postal_code [String] ZIP or postal code.
      # @param state [String] State, region, province, or county.
      # @param request_options [Monite::RequestOptions] 
      # @return [Monite::CounterpartAddressResponseWithCounterpartId]
      # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.counterparts.addresses.update_by_id(address_id: "address_id", counterpart_id: "counterpart_id")
      def update_by_id(address_id:, counterpart_id:, city: nil, country: nil, line_1: nil, line_2: nil, postal_code: nil, state: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), city: city, country: country, line1: line_1, line2: line_2, postal_code: postal_code, state: state }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/counterparts/#{address_id}/addresses/#{counterpart_id}"
end
          Monite::CounterpartAddressResponseWithCounterpartId.from_json(json_object: response.body)
        end
      end
    end
  end
end