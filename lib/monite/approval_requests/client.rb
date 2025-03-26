# frozen_string_literal: true
require_relative "../../requests"
require_relative "../types/order_enum"
require_relative "../types/approval_request_cursor_fields"
require "date"
require "date"
require "date"
require "date"
require "date"
require "date"
require "date"
require "date"
require_relative "../types/approval_request_status"
require_relative "../types/object_type"
require_relative "../types/approval_request_resource_list"
require_relative "../types/approval_request_create_request"
require_relative "../types/approval_request_resource_with_metadata"
require "async"
require "async"
require "async"
require "async"
require "async"
require "async"
require_relative "../../requests"

module Monite
  class ApprovalRequestsClient
  # @return [Monite::RequestClient] 
    attr_reader :request_client


    # @param request_client [Monite::RequestClient] 
    # @return [Monite::ApprovalRequestsClient]
    def initialize(request_client:)
      @request_client = request_client
    end
    # @param order [Monite::OrderEnum] Order by
    # @param limit [Integer] Max is 100
    # @param pagination_token [String] A token, obtained from previous page. Prior over other filters
    # @param sort [Monite::ApprovalRequestCursorFields] Allowed sort fields
    # @param created_at_gt [DateTime] 
    # @param created_at_lt [DateTime] 
    # @param created_at_gte [DateTime] 
    # @param created_at_lte [DateTime] 
    # @param updated_at_gt [DateTime] 
    # @param updated_at_lt [DateTime] 
    # @param updated_at_gte [DateTime] 
    # @param updated_at_lte [DateTime] 
    # @param object_id [String] 
    # @param object_id_in [String] 
    # @param status [Monite::ApprovalRequestStatus] 
    # @param status_in [Monite::ApprovalRequestStatus] 
    # @param user_id [String] 
    # @param role_id [String] 
    # @param object_type [Monite::ObjectType] 
    # @param object_type_in [Monite::ObjectType] 
    # @param created_by [String] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::ApprovalRequestResourceList]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.approval_requests.get
    def get(order: nil, limit: nil, pagination_token: nil, sort: nil, created_at_gt: nil, created_at_lt: nil, created_at_gte: nil, created_at_lte: nil, updated_at_gt: nil, updated_at_lt: nil, updated_at_gte: nil, updated_at_lte: nil, object_id: nil, object_id_in: nil, status: nil, status_in: nil, user_id: nil, role_id: nil, object_type: nil, object_type_in: nil, created_by: nil, request_options: nil)
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
  req.params = { **(request_options&.additional_query_parameters || {}), "order": order, "limit": limit, "pagination_token": pagination_token, "sort": sort, "created_at__gt": created_at_gt, "created_at__lt": created_at_lt, "created_at__gte": created_at_gte, "created_at__lte": created_at_lte, "updated_at__gt": updated_at_gt, "updated_at__lt": updated_at_lt, "updated_at__gte": updated_at_gte, "updated_at__lte": updated_at_lte, "object_id": object_id, "object_id__in": object_id_in, "status": status, "status__in": status_in, "user_id": user_id, "role_id": role_id, "object_type": object_type, "object_type__in": object_type_in, "created_by": created_by }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/approval_requests"
end
      Monite::ApprovalRequestResourceList.from_json(json_object: response.body)
    end
    # @param request [Monite::ApprovalRequestCreateByRoleRequest, Monite::ApprovalRequestCreateByUserRequest] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::ApprovalRequestResourceWithMetadata]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.approval_requests.create(request: { object_id: "object_id", object_type: ACCOUNT, required_approval_count: 1, role_ids: ["role_ids"] })
    def create(request:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/approval_requests"
end
      Monite::ApprovalRequestResourceWithMetadata.from_json(json_object: response.body)
    end
    # @param approval_request_id [String] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::ApprovalRequestResourceWithMetadata]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.approval_requests.get_by_id(approval_request_id: "approval_request_id")
    def get_by_id(approval_request_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/approval_requests/#{approval_request_id}"
end
      Monite::ApprovalRequestResourceWithMetadata.from_json(json_object: response.body)
    end
    # @param approval_request_id [String] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::ApprovalRequestResourceWithMetadata]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.approval_requests.approve_by_id(approval_request_id: "approval_request_id")
    def approve_by_id(approval_request_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/approval_requests/#{approval_request_id}/approve"
end
      Monite::ApprovalRequestResourceWithMetadata.from_json(json_object: response.body)
    end
    # @param approval_request_id [String] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::ApprovalRequestResourceWithMetadata]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.approval_requests.cancel_by_id(approval_request_id: "approval_request_id")
    def cancel_by_id(approval_request_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/approval_requests/#{approval_request_id}/cancel"
end
      Monite::ApprovalRequestResourceWithMetadata.from_json(json_object: response.body)
    end
    # @param approval_request_id [String] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::ApprovalRequestResourceWithMetadata]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.approval_requests.reject_by_id(approval_request_id: "approval_request_id")
    def reject_by_id(approval_request_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/approval_requests/#{approval_request_id}/reject"
end
      Monite::ApprovalRequestResourceWithMetadata.from_json(json_object: response.body)
    end
  end
  class AsyncApprovalRequestsClient
  # @return [Monite::AsyncRequestClient] 
    attr_reader :request_client


    # @param request_client [Monite::RequestClient] 
    # @return [Monite::AsyncApprovalRequestsClient]
    def initialize(request_client:)
      @request_client = request_client
    end
    # @param order [Monite::OrderEnum] Order by
    # @param limit [Integer] Max is 100
    # @param pagination_token [String] A token, obtained from previous page. Prior over other filters
    # @param sort [Monite::ApprovalRequestCursorFields] Allowed sort fields
    # @param created_at_gt [DateTime] 
    # @param created_at_lt [DateTime] 
    # @param created_at_gte [DateTime] 
    # @param created_at_lte [DateTime] 
    # @param updated_at_gt [DateTime] 
    # @param updated_at_lt [DateTime] 
    # @param updated_at_gte [DateTime] 
    # @param updated_at_lte [DateTime] 
    # @param object_id [String] 
    # @param object_id_in [String] 
    # @param status [Monite::ApprovalRequestStatus] 
    # @param status_in [Monite::ApprovalRequestStatus] 
    # @param user_id [String] 
    # @param role_id [String] 
    # @param object_type [Monite::ObjectType] 
    # @param object_type_in [Monite::ObjectType] 
    # @param created_by [String] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::ApprovalRequestResourceList]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.approval_requests.get
    def get(order: nil, limit: nil, pagination_token: nil, sort: nil, created_at_gt: nil, created_at_lt: nil, created_at_gte: nil, created_at_lte: nil, updated_at_gt: nil, updated_at_lt: nil, updated_at_gte: nil, updated_at_lte: nil, object_id: nil, object_id_in: nil, status: nil, status_in: nil, user_id: nil, role_id: nil, object_type: nil, object_type_in: nil, created_by: nil, request_options: nil)
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
  req.params = { **(request_options&.additional_query_parameters || {}), "order": order, "limit": limit, "pagination_token": pagination_token, "sort": sort, "created_at__gt": created_at_gt, "created_at__lt": created_at_lt, "created_at__gte": created_at_gte, "created_at__lte": created_at_lte, "updated_at__gt": updated_at_gt, "updated_at__lt": updated_at_lt, "updated_at__gte": updated_at_gte, "updated_at__lte": updated_at_lte, "object_id": object_id, "object_id__in": object_id_in, "status": status, "status__in": status_in, "user_id": user_id, "role_id": role_id, "object_type": object_type, "object_type__in": object_type_in, "created_by": created_by }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/approval_requests"
end
        Monite::ApprovalRequestResourceList.from_json(json_object: response.body)
      end
    end
    # @param request [Monite::ApprovalRequestCreateByRoleRequest, Monite::ApprovalRequestCreateByUserRequest] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::ApprovalRequestResourceWithMetadata]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.approval_requests.create(request: { object_id: "object_id", object_type: ACCOUNT, required_approval_count: 1, role_ids: ["role_ids"] })
    def create(request:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/approval_requests"
end
        Monite::ApprovalRequestResourceWithMetadata.from_json(json_object: response.body)
      end
    end
    # @param approval_request_id [String] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::ApprovalRequestResourceWithMetadata]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.approval_requests.get_by_id(approval_request_id: "approval_request_id")
    def get_by_id(approval_request_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/approval_requests/#{approval_request_id}"
end
        Monite::ApprovalRequestResourceWithMetadata.from_json(json_object: response.body)
      end
    end
    # @param approval_request_id [String] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::ApprovalRequestResourceWithMetadata]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.approval_requests.approve_by_id(approval_request_id: "approval_request_id")
    def approve_by_id(approval_request_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/approval_requests/#{approval_request_id}/approve"
end
        Monite::ApprovalRequestResourceWithMetadata.from_json(json_object: response.body)
      end
    end
    # @param approval_request_id [String] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::ApprovalRequestResourceWithMetadata]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.approval_requests.cancel_by_id(approval_request_id: "approval_request_id")
    def cancel_by_id(approval_request_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/approval_requests/#{approval_request_id}/cancel"
end
        Monite::ApprovalRequestResourceWithMetadata.from_json(json_object: response.body)
      end
    end
    # @param approval_request_id [String] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::ApprovalRequestResourceWithMetadata]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.approval_requests.reject_by_id(approval_request_id: "approval_request_id")
    def reject_by_id(approval_request_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/approval_requests/#{approval_request_id}/reject"
end
        Monite::ApprovalRequestResourceWithMetadata.from_json(json_object: response.body)
      end
    end
  end
end