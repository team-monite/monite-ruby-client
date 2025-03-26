# frozen_string_literal: true
require_relative "../../requests"
require_relative "extra_data/client"
require_relative "../types/order_enum"
require_relative "../types/data_export_cursor_fields"
require "date"
require "date"
require "date"
require "date"
require_relative "../types/all_document_export_response_schema"
require_relative "../types/export_format"
require_relative "../types/export_object_schema"
require_relative "../types/create_export_task_response_schema"
require_relative "../types/supported_format_schema"
require "json"
require_relative "../types/document_export_response_schema"
require "async"
require "async"
require "async"
require "async"
require_relative "../../requests"

module Monite
  class DataExportsClient
  # @return [Monite::RequestClient] 
    attr_reader :request_client
  # @return [Monite::DataExports::ExtraDataClient] 
    attr_reader :extra_data


    # @param request_client [Monite::RequestClient] 
    # @return [Monite::DataExportsClient]
    def initialize(request_client:)
      @request_client = request_client
      @extra_data = Monite::DataExports::ExtraDataClient.new(request_client: request_client)
    end
    # @param order [Monite::OrderEnum] Order by
    # @param limit [Integer] Max is 100
    # @param pagination_token [String] A token, obtained from previous page. Prior over other filters
    # @param sort [Monite::DATA_EXPORT_CURSOR_FIELDS] Allowed sort fields
    # @param created_at_gt [DateTime] 
    # @param created_at_lt [DateTime] 
    # @param created_at_gte [DateTime] 
    # @param created_at_lte [DateTime] 
    # @param created_by_entity_user_id [String] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::AllDocumentExportResponseSchema]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.data_exports.get
    def get(order: nil, limit: nil, pagination_token: nil, sort: nil, created_at_gt: nil, created_at_lt: nil, created_at_gte: nil, created_at_lte: nil, created_by_entity_user_id: nil, request_options: nil)
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
  req.params = { **(request_options&.additional_query_parameters || {}), "order": order, "limit": limit, "pagination_token": pagination_token, "sort": sort, "created_at__gt": created_at_gt, "created_at__lt": created_at_lt, "created_at__gte": created_at_gte, "created_at__lte": created_at_lte, "created_by_entity_user_id": created_by_entity_user_id }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/data_exports"
end
      Monite::AllDocumentExportResponseSchema.from_json(json_object: response.body)
    end
# Request the export of payable and receivable documents with the specified
#  statuses.
    #
    # @param date_from [String] 
    # @param date_to [String] 
    # @param format [Monite::ExportFormat] 
    # @param objects [Array<Hash>] Request of type Array<Monite::ExportObjectSchema>, as a Hash
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::CreateExportTaskResponseSchema]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.data_exports.create(
#    date_from: "date_from",
#    date_to: "date_to",
#    format: CSV,
#    objects: 
#  )
    def create(date_from:, date_to:, format:, objects:, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), date_from: date_from, date_to: date_to, format: format, objects: objects }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/data_exports"
end
      Monite::CreateExportTaskResponseSchema.from_json(json_object: response.body)
    end
    # @param request_options [Monite::RequestOptions] 
    # @return [Array<Monite::SupportedFormatSchema>]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.data_exports.get_supported_formats
    def get_supported_formats(request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/data_exports/supported_formats"
end
      parsed_json = JSON.parse(response.body)
      parsed_json&.map do | item |
        item = item.to_json
        Monite::SupportedFormatSchema.from_json(json_object: item)
      end
    end
    # @param document_export_id [String] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::DocumentExportResponseSchema]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.data_exports.get_by_id(document_export_id: "document_export_id")
    def get_by_id(document_export_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/data_exports/#{document_export_id}"
end
      Monite::DocumentExportResponseSchema.from_json(json_object: response.body)
    end
  end
  class AsyncDataExportsClient
  # @return [Monite::AsyncRequestClient] 
    attr_reader :request_client
  # @return [Monite::DataExports::ExtraDataClient] 
    attr_reader :extra_data


    # @param request_client [Monite::RequestClient] 
    # @return [Monite::AsyncDataExportsClient]
    def initialize(request_client:)
      @request_client = request_client
      @extra_data = Monite::DataExports::AsyncExtraDataClient.new(request_client: request_client)
    end
    # @param order [Monite::OrderEnum] Order by
    # @param limit [Integer] Max is 100
    # @param pagination_token [String] A token, obtained from previous page. Prior over other filters
    # @param sort [Monite::DATA_EXPORT_CURSOR_FIELDS] Allowed sort fields
    # @param created_at_gt [DateTime] 
    # @param created_at_lt [DateTime] 
    # @param created_at_gte [DateTime] 
    # @param created_at_lte [DateTime] 
    # @param created_by_entity_user_id [String] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::AllDocumentExportResponseSchema]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.data_exports.get
    def get(order: nil, limit: nil, pagination_token: nil, sort: nil, created_at_gt: nil, created_at_lt: nil, created_at_gte: nil, created_at_lte: nil, created_by_entity_user_id: nil, request_options: nil)
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
  req.params = { **(request_options&.additional_query_parameters || {}), "order": order, "limit": limit, "pagination_token": pagination_token, "sort": sort, "created_at__gt": created_at_gt, "created_at__lt": created_at_lt, "created_at__gte": created_at_gte, "created_at__lte": created_at_lte, "created_by_entity_user_id": created_by_entity_user_id }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/data_exports"
end
        Monite::AllDocumentExportResponseSchema.from_json(json_object: response.body)
      end
    end
# Request the export of payable and receivable documents with the specified
#  statuses.
    #
    # @param date_from [String] 
    # @param date_to [String] 
    # @param format [Monite::ExportFormat] 
    # @param objects [Array<Hash>] Request of type Array<Monite::ExportObjectSchema>, as a Hash
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::CreateExportTaskResponseSchema]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.data_exports.create(
#    date_from: "date_from",
#    date_to: "date_to",
#    format: CSV,
#    objects: 
#  )
    def create(date_from:, date_to:, format:, objects:, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), date_from: date_from, date_to: date_to, format: format, objects: objects }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/data_exports"
end
        Monite::CreateExportTaskResponseSchema.from_json(json_object: response.body)
      end
    end
    # @param request_options [Monite::RequestOptions] 
    # @return [Array<Monite::SupportedFormatSchema>]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.data_exports.get_supported_formats
    def get_supported_formats(request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/data_exports/supported_formats"
end
        parsed_json = JSON.parse(response.body)
        parsed_json&.map do | item |
          item = item.to_json
          Monite::SupportedFormatSchema.from_json(json_object: item)
        end
      end
    end
    # @param document_export_id [String] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::DocumentExportResponseSchema]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.data_exports.get_by_id(document_export_id: "document_export_id")
    def get_by_id(document_export_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/data_exports/#{document_export_id}"
end
        Monite::DocumentExportResponseSchema.from_json(json_object: response.body)
      end
    end
  end
end