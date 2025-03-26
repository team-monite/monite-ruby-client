# frozen_string_literal: true
require_relative "../../../requests"
require_relative "../../types/object_match_types"
require_relative "../../types/order_enum"
require_relative "../../types/sync_record_cursor_fields"
require "date"
require "date"
require "date"
require "date"
require "date"
require "date"
require "date"
require "date"
require_relative "../../types/sync_record_resource_list"
require_relative "../../types/sync_record_resource"
require "async"
require "async"
require "async"
require_relative "../../../requests"

module Monite
  module Accounting
    class SyncedRecordsClient
    # @return [Monite::RequestClient] 
      attr_reader :request_client


      # @param request_client [Monite::RequestClient] 
      # @return [Monite::Accounting::SyncedRecordsClient]
      def initialize(request_client:)
        @request_client = request_client
      end
# Get synchronized records
      #
      # @param object_type [Monite::ObjectMatchTypes] 
      # @param order [Monite::OrderEnum] Order by
      # @param limit [Integer] Max is 100
      # @param pagination_token [String] A token, obtained from previous page. Prior over other filters
      # @param sort [Monite::SyncRecordCursorFields] Allowed sort fields
      # @param object_id [String] 
      # @param object_id_in [String] 
      # @param created_at_gt [DateTime] 
      # @param created_at_lt [DateTime] 
      # @param created_at_gte [DateTime] 
      # @param created_at_lte [DateTime] 
      # @param updated_at_gt [DateTime] 
      # @param updated_at_lt [DateTime] 
      # @param updated_at_gte [DateTime] 
      # @param updated_at_lte [DateTime] 
      # @param request_options [Monite::RequestOptions] 
      # @return [Monite::SyncRecordResourceList]
      # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.accounting.synced_records.get(object_type: PRODUCT)
      def get(object_type:, order: nil, limit: nil, pagination_token: nil, sort: nil, object_id: nil, object_id_in: nil, created_at_gt: nil, created_at_lt: nil, created_at_gte: nil, created_at_lte: nil, updated_at_gt: nil, updated_at_lt: nil, updated_at_gte: nil, updated_at_lte: nil, request_options: nil)
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
  req.params = { **(request_options&.additional_query_parameters || {}), "object_type": object_type, "order": order, "limit": limit, "pagination_token": pagination_token, "sort": sort, "object_id": object_id, "object_id__in": object_id_in, "created_at__gt": created_at_gt, "created_at__lt": created_at_lt, "created_at__gte": created_at_gte, "created_at__lte": created_at_lte, "updated_at__gt": updated_at_gt, "updated_at__lt": updated_at_lt, "updated_at__gte": updated_at_gte, "updated_at__lte": updated_at_lte }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/accounting_synced_records"
end
        Monite::SyncRecordResourceList.from_json(json_object: response.body)
      end
# Get synchronized record by id
      #
      # @param synced_record_id [String] 
      # @param request_options [Monite::RequestOptions] 
      # @return [Monite::SyncRecordResource]
      # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.accounting.synced_records.get_by_id(synced_record_id: "synced_record_id")
      def get_by_id(synced_record_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/accounting_synced_records/#{synced_record_id}"
end
        Monite::SyncRecordResource.from_json(json_object: response.body)
      end
# Push object to the accounting system manually
      #
      # @param synced_record_id [String] 
      # @param request_options [Monite::RequestOptions] 
      # @return [Monite::SyncRecordResource]
      # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.accounting.synced_records.push_by_id(synced_record_id: "synced_record_id")
      def push_by_id(synced_record_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/accounting_synced_records/#{synced_record_id}/push"
end
        Monite::SyncRecordResource.from_json(json_object: response.body)
      end
    end
    class AsyncSyncedRecordsClient
    # @return [Monite::AsyncRequestClient] 
      attr_reader :request_client


      # @param request_client [Monite::RequestClient] 
      # @return [Monite::Accounting::AsyncSyncedRecordsClient]
      def initialize(request_client:)
        @request_client = request_client
      end
# Get synchronized records
      #
      # @param object_type [Monite::ObjectMatchTypes] 
      # @param order [Monite::OrderEnum] Order by
      # @param limit [Integer] Max is 100
      # @param pagination_token [String] A token, obtained from previous page. Prior over other filters
      # @param sort [Monite::SyncRecordCursorFields] Allowed sort fields
      # @param object_id [String] 
      # @param object_id_in [String] 
      # @param created_at_gt [DateTime] 
      # @param created_at_lt [DateTime] 
      # @param created_at_gte [DateTime] 
      # @param created_at_lte [DateTime] 
      # @param updated_at_gt [DateTime] 
      # @param updated_at_lt [DateTime] 
      # @param updated_at_gte [DateTime] 
      # @param updated_at_lte [DateTime] 
      # @param request_options [Monite::RequestOptions] 
      # @return [Monite::SyncRecordResourceList]
      # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.accounting.synced_records.get(object_type: PRODUCT)
      def get(object_type:, order: nil, limit: nil, pagination_token: nil, sort: nil, object_id: nil, object_id_in: nil, created_at_gt: nil, created_at_lt: nil, created_at_gte: nil, created_at_lte: nil, updated_at_gt: nil, updated_at_lt: nil, updated_at_gte: nil, updated_at_lte: nil, request_options: nil)
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
  req.params = { **(request_options&.additional_query_parameters || {}), "object_type": object_type, "order": order, "limit": limit, "pagination_token": pagination_token, "sort": sort, "object_id": object_id, "object_id__in": object_id_in, "created_at__gt": created_at_gt, "created_at__lt": created_at_lt, "created_at__gte": created_at_gte, "created_at__lte": created_at_lte, "updated_at__gt": updated_at_gt, "updated_at__lt": updated_at_lt, "updated_at__gte": updated_at_gte, "updated_at__lte": updated_at_lte }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/accounting_synced_records"
end
          Monite::SyncRecordResourceList.from_json(json_object: response.body)
        end
      end
# Get synchronized record by id
      #
      # @param synced_record_id [String] 
      # @param request_options [Monite::RequestOptions] 
      # @return [Monite::SyncRecordResource]
      # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.accounting.synced_records.get_by_id(synced_record_id: "synced_record_id")
      def get_by_id(synced_record_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/accounting_synced_records/#{synced_record_id}"
end
          Monite::SyncRecordResource.from_json(json_object: response.body)
        end
      end
# Push object to the accounting system manually
      #
      # @param synced_record_id [String] 
      # @param request_options [Monite::RequestOptions] 
      # @return [Monite::SyncRecordResource]
      # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.accounting.synced_records.push_by_id(synced_record_id: "synced_record_id")
      def push_by_id(synced_record_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/accounting_synced_records/#{synced_record_id}/push"
end
          Monite::SyncRecordResource.from_json(json_object: response.body)
        end
      end
    end
  end
end