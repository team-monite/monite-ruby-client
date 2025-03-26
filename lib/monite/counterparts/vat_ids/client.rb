# frozen_string_literal: true
require_relative "../../../requests"
require_relative "../../types/counterpart_vat_id_resource_list"
require_relative "../../types/allowed_countries"
require_relative "../../types/vat_id_type_enum"
require_relative "../../types/counterpart_vat_id_response"
require "async"
require "async"
require "async"
require "async"
require "async"
require_relative "../../../requests"

module Monite
  module Counterparts
    class VatIdsClient
    # @return [Monite::RequestClient] 
      attr_reader :request_client


      # @param request_client [Monite::RequestClient] 
      # @return [Monite::Counterparts::VatIdsClient]
      def initialize(request_client:)
        @request_client = request_client
      end
      # @param counterpart_id [String] 
      # @param request_options [Monite::RequestOptions] 
      # @return [Monite::CounterpartVatIdResourceList]
      # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.counterparts.vat_ids.get(counterpart_id: "counterpart_id")
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
  req.url "#{@request_client.get_url(request_options: request_options)}/counterparts/#{counterpart_id}/vat_ids"
end
        Monite::CounterpartVatIdResourceList.from_json(json_object: response.body)
      end
      # @param counterpart_id [String] 
      # @param country [Monite::AllowedCountries] 
      # @param type [Monite::VatIdTypeEnum] 
      # @param value [String] 
      # @param request_options [Monite::RequestOptions] 
      # @return [Monite::CounterpartVatIdResponse]
      # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.counterparts.vat_ids.create(counterpart_id: "counterpart_id", value: "123456789")
      def create(counterpart_id:, country: nil, type: nil, value:, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), country: country, type: type, value: value }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/counterparts/#{counterpart_id}/vat_ids"
end
        Monite::CounterpartVatIdResponse.from_json(json_object: response.body)
      end
      # @param vat_id [String] 
      # @param counterpart_id [String] 
      # @param request_options [Monite::RequestOptions] 
      # @return [Monite::CounterpartVatIdResponse]
      # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.counterparts.vat_ids.get_by_id(vat_id: "vat_id", counterpart_id: "counterpart_id")
      def get_by_id(vat_id:, counterpart_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/counterparts/#{vat_id}/vat_ids/#{counterpart_id}"
end
        Monite::CounterpartVatIdResponse.from_json(json_object: response.body)
      end
      # @param vat_id [String] 
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
#  api.counterparts.vat_ids.delete_by_id(vat_id: "vat_id", counterpart_id: "counterpart_id")
      def delete_by_id(vat_id:, counterpart_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/counterparts/#{vat_id}/vat_ids/#{counterpart_id}"
end
      end
      # @param vat_id [String] 
      # @param counterpart_id [String] 
      # @param country [Monite::AllowedCountries] 
      # @param type [Monite::VatIdTypeEnum] 
      # @param value [String] 
      # @param request_options [Monite::RequestOptions] 
      # @return [Monite::CounterpartVatIdResponse]
      # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.counterparts.vat_ids.update_by_id(vat_id: "vat_id", counterpart_id: "counterpart_id")
      def update_by_id(vat_id:, counterpart_id:, country: nil, type: nil, value: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), country: country, type: type, value: value }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/counterparts/#{vat_id}/vat_ids/#{counterpart_id}"
end
        Monite::CounterpartVatIdResponse.from_json(json_object: response.body)
      end
    end
    class AsyncVatIdsClient
    # @return [Monite::AsyncRequestClient] 
      attr_reader :request_client


      # @param request_client [Monite::RequestClient] 
      # @return [Monite::Counterparts::AsyncVatIdsClient]
      def initialize(request_client:)
        @request_client = request_client
      end
      # @param counterpart_id [String] 
      # @param request_options [Monite::RequestOptions] 
      # @return [Monite::CounterpartVatIdResourceList]
      # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.counterparts.vat_ids.get(counterpart_id: "counterpart_id")
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
  req.url "#{@request_client.get_url(request_options: request_options)}/counterparts/#{counterpart_id}/vat_ids"
end
          Monite::CounterpartVatIdResourceList.from_json(json_object: response.body)
        end
      end
      # @param counterpart_id [String] 
      # @param country [Monite::AllowedCountries] 
      # @param type [Monite::VatIdTypeEnum] 
      # @param value [String] 
      # @param request_options [Monite::RequestOptions] 
      # @return [Monite::CounterpartVatIdResponse]
      # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.counterparts.vat_ids.create(counterpart_id: "counterpart_id", value: "123456789")
      def create(counterpart_id:, country: nil, type: nil, value:, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), country: country, type: type, value: value }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/counterparts/#{counterpart_id}/vat_ids"
end
          Monite::CounterpartVatIdResponse.from_json(json_object: response.body)
        end
      end
      # @param vat_id [String] 
      # @param counterpart_id [String] 
      # @param request_options [Monite::RequestOptions] 
      # @return [Monite::CounterpartVatIdResponse]
      # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.counterparts.vat_ids.get_by_id(vat_id: "vat_id", counterpart_id: "counterpart_id")
      def get_by_id(vat_id:, counterpart_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/counterparts/#{vat_id}/vat_ids/#{counterpart_id}"
end
          Monite::CounterpartVatIdResponse.from_json(json_object: response.body)
        end
      end
      # @param vat_id [String] 
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
#  api.counterparts.vat_ids.delete_by_id(vat_id: "vat_id", counterpart_id: "counterpart_id")
      def delete_by_id(vat_id:, counterpart_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/counterparts/#{vat_id}/vat_ids/#{counterpart_id}"
end
        end
      end
      # @param vat_id [String] 
      # @param counterpart_id [String] 
      # @param country [Monite::AllowedCountries] 
      # @param type [Monite::VatIdTypeEnum] 
      # @param value [String] 
      # @param request_options [Monite::RequestOptions] 
      # @return [Monite::CounterpartVatIdResponse]
      # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.counterparts.vat_ids.update_by_id(vat_id: "vat_id", counterpart_id: "counterpart_id")
      def update_by_id(vat_id:, counterpart_id:, country: nil, type: nil, value: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), country: country, type: type, value: value }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/counterparts/#{vat_id}/vat_ids/#{counterpart_id}"
end
          Monite::CounterpartVatIdResponse.from_json(json_object: response.body)
        end
      end
    end
  end
end