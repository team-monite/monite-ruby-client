# frozen_string_literal: true
require_relative "../../../requests"
require_relative "../../types/order_enum"
require_relative "../../types/export_setting_cursor_fields"
require "date"
require "date"
require "date"
require "date"
require "date"
require "date"
require "date"
require "date"
require_relative "../../types/extra_data_resource_list"
require_relative "../../types/supported_field_names"
require_relative "../../types/extra_data_resource"
require "async"
require "async"
require "async"
require "async"
require "async"
require_relative "../../../requests"

module Monite
  module DataExports
    class ExtraDataClient
    # @return [Monite::RequestClient] 
      attr_reader :request_client


      # @param request_client [Monite::RequestClient] 
      # @return [Monite::DataExports::ExtraDataClient]
      def initialize(request_client:)
        @request_client = request_client
      end
      # @param order [Monite::OrderEnum] Order by
      # @param limit [Integer] Max is 100
      # @param pagination_token [String] A token, obtained from previous page. Prior over other filters
      # @param sort [Monite::ExportSettingCursorFields] Allowed sort fields
      # @param created_at_gt [DateTime] 
      # @param created_at_lt [DateTime] 
      # @param created_at_gte [DateTime] 
      # @param created_at_lte [DateTime] 
      # @param updated_at_gt [DateTime] 
      # @param updated_at_lt [DateTime] 
      # @param updated_at_gte [DateTime] 
      # @param updated_at_lte [DateTime] 
      # @param object_id [String] 
      # @param field_name [String] 
      # @param field_value [String] 
      # @param request_options [Monite::RequestOptions] 
      # @return [Monite::ExtraDataResourceList]
      # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.data_exports.extra_data.get
      def get(order: nil, limit: nil, pagination_token: nil, sort: nil, created_at_gt: nil, created_at_lt: nil, created_at_gte: nil, created_at_lte: nil, updated_at_gt: nil, updated_at_lt: nil, updated_at_gte: nil, updated_at_lte: nil, object_id: nil, field_name: nil, field_value: nil, request_options: nil)
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
  req.params = { **(request_options&.additional_query_parameters || {}), "order": order, "limit": limit, "pagination_token": pagination_token, "sort": sort, "created_at__gt": created_at_gt, "created_at__lt": created_at_lt, "created_at__gte": created_at_gte, "created_at__lte": created_at_lte, "updated_at__gt": updated_at_gt, "updated_at__lt": updated_at_lt, "updated_at__gte": updated_at_gte, "updated_at__lte": updated_at_lte, "object_id": object_id, "field_name": field_name, "field_value": field_value }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/data_exports/extra_data"
end
        Monite::ExtraDataResourceList.from_json(json_object: response.body)
      end
      # @param field_name [Monite::SupportedFieldNames] 
      # @param field_value [String] 
      # @param object_id [String] 
      # @param request_options [Monite::RequestOptions] 
      # @return [Monite::ExtraDataResource]
      # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.data_exports.extra_data.create(
#    field_name: DEFAULT_ACCOUNT_CODE,
#    field_value: "field_value",
#    object_id: "object_id"
#  )
      def create(field_name:, field_value:, object_id:, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), "object_type": "counterpart", field_name: field_name, field_value: field_value, object_id: object_id }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/data_exports/extra_data"
end
        Monite::ExtraDataResource.from_json(json_object: response.body)
      end
      # @param extra_data_id [String] 
      # @param request_options [Monite::RequestOptions] 
      # @return [Monite::ExtraDataResource]
      # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.data_exports.extra_data.get_by_id(extra_data_id: "extra_data_id")
      def get_by_id(extra_data_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/data_exports/extra_data/#{extra_data_id}"
end
        Monite::ExtraDataResource.from_json(json_object: response.body)
      end
      # @param extra_data_id [String] 
      # @param request_options [Monite::RequestOptions] 
      # @return [Monite::ExtraDataResource]
      # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.data_exports.extra_data.delete_by_id(extra_data_id: "extra_data_id")
      def delete_by_id(extra_data_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/data_exports/extra_data/#{extra_data_id}"
end
        Monite::ExtraDataResource.from_json(json_object: response.body)
      end
      # @param extra_data_id [String] 
      # @param field_name [Monite::SupportedFieldNames] 
      # @param field_value [String] 
      # @param object_id [String] 
      # @param request_options [Monite::RequestOptions] 
      # @return [Monite::ExtraDataResource]
      # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.data_exports.extra_data.update_by_id(extra_data_id: "extra_data_id")
      def update_by_id(extra_data_id:, field_name: nil, field_value: nil, object_id: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), "object_type": "counterpart", field_name: field_name, field_value: field_value, object_id: object_id }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/data_exports/extra_data/#{extra_data_id}"
end
        Monite::ExtraDataResource.from_json(json_object: response.body)
      end
    end
    class AsyncExtraDataClient
    # @return [Monite::AsyncRequestClient] 
      attr_reader :request_client


      # @param request_client [Monite::RequestClient] 
      # @return [Monite::DataExports::AsyncExtraDataClient]
      def initialize(request_client:)
        @request_client = request_client
      end
      # @param order [Monite::OrderEnum] Order by
      # @param limit [Integer] Max is 100
      # @param pagination_token [String] A token, obtained from previous page. Prior over other filters
      # @param sort [Monite::ExportSettingCursorFields] Allowed sort fields
      # @param created_at_gt [DateTime] 
      # @param created_at_lt [DateTime] 
      # @param created_at_gte [DateTime] 
      # @param created_at_lte [DateTime] 
      # @param updated_at_gt [DateTime] 
      # @param updated_at_lt [DateTime] 
      # @param updated_at_gte [DateTime] 
      # @param updated_at_lte [DateTime] 
      # @param object_id [String] 
      # @param field_name [String] 
      # @param field_value [String] 
      # @param request_options [Monite::RequestOptions] 
      # @return [Monite::ExtraDataResourceList]
      # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.data_exports.extra_data.get
      def get(order: nil, limit: nil, pagination_token: nil, sort: nil, created_at_gt: nil, created_at_lt: nil, created_at_gte: nil, created_at_lte: nil, updated_at_gt: nil, updated_at_lt: nil, updated_at_gte: nil, updated_at_lte: nil, object_id: nil, field_name: nil, field_value: nil, request_options: nil)
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
  req.params = { **(request_options&.additional_query_parameters || {}), "order": order, "limit": limit, "pagination_token": pagination_token, "sort": sort, "created_at__gt": created_at_gt, "created_at__lt": created_at_lt, "created_at__gte": created_at_gte, "created_at__lte": created_at_lte, "updated_at__gt": updated_at_gt, "updated_at__lt": updated_at_lt, "updated_at__gte": updated_at_gte, "updated_at__lte": updated_at_lte, "object_id": object_id, "field_name": field_name, "field_value": field_value }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/data_exports/extra_data"
end
          Monite::ExtraDataResourceList.from_json(json_object: response.body)
        end
      end
      # @param field_name [Monite::SupportedFieldNames] 
      # @param field_value [String] 
      # @param object_id [String] 
      # @param request_options [Monite::RequestOptions] 
      # @return [Monite::ExtraDataResource]
      # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.data_exports.extra_data.create(
#    field_name: DEFAULT_ACCOUNT_CODE,
#    field_value: "field_value",
#    object_id: "object_id"
#  )
      def create(field_name:, field_value:, object_id:, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), "object_type": "counterpart", field_name: field_name, field_value: field_value, object_id: object_id }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/data_exports/extra_data"
end
          Monite::ExtraDataResource.from_json(json_object: response.body)
        end
      end
      # @param extra_data_id [String] 
      # @param request_options [Monite::RequestOptions] 
      # @return [Monite::ExtraDataResource]
      # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.data_exports.extra_data.get_by_id(extra_data_id: "extra_data_id")
      def get_by_id(extra_data_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/data_exports/extra_data/#{extra_data_id}"
end
          Monite::ExtraDataResource.from_json(json_object: response.body)
        end
      end
      # @param extra_data_id [String] 
      # @param request_options [Monite::RequestOptions] 
      # @return [Monite::ExtraDataResource]
      # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.data_exports.extra_data.delete_by_id(extra_data_id: "extra_data_id")
      def delete_by_id(extra_data_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/data_exports/extra_data/#{extra_data_id}"
end
          Monite::ExtraDataResource.from_json(json_object: response.body)
        end
      end
      # @param extra_data_id [String] 
      # @param field_name [Monite::SupportedFieldNames] 
      # @param field_value [String] 
      # @param object_id [String] 
      # @param request_options [Monite::RequestOptions] 
      # @return [Monite::ExtraDataResource]
      # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.data_exports.extra_data.update_by_id(extra_data_id: "extra_data_id")
      def update_by_id(extra_data_id:, field_name: nil, field_value: nil, object_id: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), "object_type": "counterpart", field_name: field_name, field_value: field_value, object_id: object_id }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/data_exports/extra_data/#{extra_data_id}"
end
          Monite::ExtraDataResource.from_json(json_object: response.body)
        end
      end
    end
  end
end