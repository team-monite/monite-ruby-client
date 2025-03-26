# frozen_string_literal: true
require_relative "../../requests"
require_relative "processes/client"
require_relative "../types/order_enum"
require_relative "../types/approval_policy_cursor_fields"
require_relative "types/approval_policies_get_request_status"
require_relative "types/approval_policies_get_request_status_in_item"
require "date"
require "date"
require "date"
require "date"
require "date"
require "date"
require "date"
require "date"
require_relative "../types/approval_policy_resource_list"
require "date"
require "date"
require_relative "types/approval_policy_create_script_item"
require_relative "types/approval_policy_create_trigger"
require_relative "../types/approval_policy_resource"
require "date"
require "date"
require_relative "types/approval_policy_update_script_item"
require_relative "types/approval_policy_update_trigger"
require_relative "../types/approval_policy_status"
require "async"
require "async"
require "async"
require "async"
require "async"
require_relative "../../requests"

module Monite
  class ApprovalPoliciesClient
  # @return [Monite::RequestClient] 
    attr_reader :request_client
  # @return [Monite::ApprovalPolicies::ProcessesClient] 
    attr_reader :processes


    # @param request_client [Monite::RequestClient] 
    # @return [Monite::ApprovalPoliciesClient]
    def initialize(request_client:)
      @request_client = request_client
      @processes = Monite::ApprovalPolicies::ProcessesClient.new(request_client: request_client)
    end
# Retrieve a list of all approval policies with pagination.
    #
    # @param process_id [String] 
    # @param order [Monite::OrderEnum] Order by
    # @param limit [Integer] Max is 100
    # @param pagination_token [String] A token, obtained from previous page. Prior over other filters
    # @param sort [Monite::ApprovalPolicyCursorFields] Allowed sort fields
    # @param id_in [String] 
    # @param status [Monite::ApprovalPolicies::ApprovalPoliciesGetRequestStatus] 
    # @param status_in [Monite::ApprovalPolicies::ApprovalPoliciesGetRequestStatusInItem] 
    # @param name [String] 
    # @param name_contains [String] 
    # @param name_ncontains [String] 
    # @param created_by [String] 
    # @param created_at_gt [DateTime] 
    # @param created_at_lt [DateTime] 
    # @param created_at_gte [DateTime] 
    # @param created_at_lte [DateTime] 
    # @param updated_at_gt [DateTime] 
    # @param updated_at_lt [DateTime] 
    # @param updated_at_gte [DateTime] 
    # @param updated_at_lte [DateTime] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::ApprovalPolicyResourceList]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.approval_policies.get
    def get(process_id: nil, order: nil, limit: nil, pagination_token: nil, sort: nil, id_in: nil, status: nil, status_in: nil, name: nil, name_contains: nil, name_ncontains: nil, created_by: nil, created_at_gt: nil, created_at_lt: nil, created_at_gte: nil, created_at_lte: nil, updated_at_gt: nil, updated_at_lt: nil, updated_at_gte: nil, updated_at_lte: nil, request_options: nil)
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
  req.params = { **(request_options&.additional_query_parameters || {}), "process_id": process_id, "order": order, "limit": limit, "pagination_token": pagination_token, "sort": sort, "id__in": id_in, "status": status, "status__in": status_in, "name": name, "name__contains": name_contains, "name__ncontains": name_ncontains, "created_by": created_by, "created_at__gt": created_at_gt, "created_at__lt": created_at_lt, "created_at__gte": created_at_gte, "created_at__lte": created_at_lte, "updated_at__gt": updated_at_gt, "updated_at__lt": updated_at_lt, "updated_at__gte": updated_at_gte, "updated_at__lte": updated_at_lte }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/approval_policies"
end
      Monite::ApprovalPolicyResourceList.from_json(json_object: response.body)
    end
# Create a new approval policy.
    #
    # @param starts_at [DateTime] The date and time (in the ISO 8601 format) when the approval policy becomes
#  active. Only payables submitted for approval during the policy's active period
#  will trigger this policy. If omitted or `null`, the policy is effective
#  immediately. The value will be converted to UTC.
    # @param ends_at [DateTime] The date and time (in the ISO 8601 format) when the approval policy stops being
#  active and stops triggering approval workflows.If `ends_at` is provided in the
#  request, then `starts_at` must also be provided and `ends_at` must be later than
#  `starts_at`. The value will be converted to UTC.
    # @param name [String] The name of the approval policy.
    # @param description [String] A brief description of the approval policy.
    # @param script [Array<Hash>] A list of JSON objects that represents the approval policy script. The script
#  contains the logic that determines whether an action should be sent to approval.
#  This field is required, and it should contain at least one script object.Request of type Array<Monite::ApprovalPolicies::ApprovalPolicyCreateScriptItem>, as a Hash
    # @param trigger [Boolean, Float, String, Array<Object>, Hash{String => Object}] A JSON object that represents the trigger for the approval policy. The trigger
#  specifies the event that will trigger the policy to be evaluated.
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::ApprovalPolicyResource]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.approval_policies.create(
#    name: "name",
#    description: "description",
#    script: [true]
#  )
    def create(starts_at: nil, ends_at: nil, name:, description:, script:, trigger: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), starts_at: starts_at, ends_at: ends_at, name: name, description: description, script: script, trigger: trigger }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/approval_policies"
end
      Monite::ApprovalPolicyResource.from_json(json_object: response.body)
    end
# Retrieve a specific approval policy.
    #
    # @param approval_policy_id [String] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::ApprovalPolicyResource]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.approval_policies.get_by_id(approval_policy_id: "approval_policy_id")
    def get_by_id(approval_policy_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/approval_policies/#{approval_policy_id}"
end
      Monite::ApprovalPolicyResource.from_json(json_object: response.body)
    end
# Delete an existing approval policy.
    #
    # @param approval_policy_id [String] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Void]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.approval_policies.delete_by_id(approval_policy_id: "approval_policy_id")
    def delete_by_id(approval_policy_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/approval_policies/#{approval_policy_id}"
end
    end
# Update an existing approval policy.
    #
    # @param approval_policy_id [String] 
    # @param starts_at [DateTime] The date and time (in the ISO 8601 format) when the approval policy becomes
#  active. Only payables submitted for approval during the policy's active period
#  will trigger this policy. If omitted or `null`, the policy is effective
#  immediately. The value will be converted to UTC.
    # @param ends_at [DateTime] The date and time (in the ISO 8601 format) when the approval policy stops being
#  active and stops triggering approval workflows.If `ends_at` is provided in the
#  request, then `starts_at` must also be provided and `ends_at` must be later than
#  `starts_at`. The value will be converted to UTC.
    # @param name [String] The name of the approval policy.
    # @param description [String] A brief description of the approval policy.
    # @param script [Array<Hash>] A list of JSON objects that represents the approval policy script. The script
#  contains the logic that determines whether an action should be sent to approval.
#  This field is required, and it should contain at least one script object.Request of type Array<Monite::ApprovalPolicies::ApprovalPolicyUpdateScriptItem>, as a Hash
    # @param trigger [Boolean, Float, String, Array<Object>, Hash{String => Object}] A JSON object that represents the trigger for the approval policy. The trigger
#  specifies the event that will trigger the policy to be evaluated.
    # @param status [Monite::ApprovalPolicyStatus] A string that represents the current status of the approval policy.
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::ApprovalPolicyResource]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.approval_policies.update_by_id(approval_policy_id: "approval_policy_id")
    def update_by_id(approval_policy_id:, starts_at: nil, ends_at: nil, name: nil, description: nil, script: nil, trigger: nil, status: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), starts_at: starts_at, ends_at: ends_at, name: name, description: description, script: script, trigger: trigger, status: status }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/approval_policies/#{approval_policy_id}"
end
      Monite::ApprovalPolicyResource.from_json(json_object: response.body)
    end
  end
  class AsyncApprovalPoliciesClient
  # @return [Monite::AsyncRequestClient] 
    attr_reader :request_client
  # @return [Monite::ApprovalPolicies::ProcessesClient] 
    attr_reader :processes


    # @param request_client [Monite::RequestClient] 
    # @return [Monite::AsyncApprovalPoliciesClient]
    def initialize(request_client:)
      @request_client = request_client
      @processes = Monite::ApprovalPolicies::AsyncProcessesClient.new(request_client: request_client)
    end
# Retrieve a list of all approval policies with pagination.
    #
    # @param process_id [String] 
    # @param order [Monite::OrderEnum] Order by
    # @param limit [Integer] Max is 100
    # @param pagination_token [String] A token, obtained from previous page. Prior over other filters
    # @param sort [Monite::ApprovalPolicyCursorFields] Allowed sort fields
    # @param id_in [String] 
    # @param status [Monite::ApprovalPolicies::ApprovalPoliciesGetRequestStatus] 
    # @param status_in [Monite::ApprovalPolicies::ApprovalPoliciesGetRequestStatusInItem] 
    # @param name [String] 
    # @param name_contains [String] 
    # @param name_ncontains [String] 
    # @param created_by [String] 
    # @param created_at_gt [DateTime] 
    # @param created_at_lt [DateTime] 
    # @param created_at_gte [DateTime] 
    # @param created_at_lte [DateTime] 
    # @param updated_at_gt [DateTime] 
    # @param updated_at_lt [DateTime] 
    # @param updated_at_gte [DateTime] 
    # @param updated_at_lte [DateTime] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::ApprovalPolicyResourceList]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.approval_policies.get
    def get(process_id: nil, order: nil, limit: nil, pagination_token: nil, sort: nil, id_in: nil, status: nil, status_in: nil, name: nil, name_contains: nil, name_ncontains: nil, created_by: nil, created_at_gt: nil, created_at_lt: nil, created_at_gte: nil, created_at_lte: nil, updated_at_gt: nil, updated_at_lt: nil, updated_at_gte: nil, updated_at_lte: nil, request_options: nil)
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
  req.params = { **(request_options&.additional_query_parameters || {}), "process_id": process_id, "order": order, "limit": limit, "pagination_token": pagination_token, "sort": sort, "id__in": id_in, "status": status, "status__in": status_in, "name": name, "name__contains": name_contains, "name__ncontains": name_ncontains, "created_by": created_by, "created_at__gt": created_at_gt, "created_at__lt": created_at_lt, "created_at__gte": created_at_gte, "created_at__lte": created_at_lte, "updated_at__gt": updated_at_gt, "updated_at__lt": updated_at_lt, "updated_at__gte": updated_at_gte, "updated_at__lte": updated_at_lte }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/approval_policies"
end
        Monite::ApprovalPolicyResourceList.from_json(json_object: response.body)
      end
    end
# Create a new approval policy.
    #
    # @param starts_at [DateTime] The date and time (in the ISO 8601 format) when the approval policy becomes
#  active. Only payables submitted for approval during the policy's active period
#  will trigger this policy. If omitted or `null`, the policy is effective
#  immediately. The value will be converted to UTC.
    # @param ends_at [DateTime] The date and time (in the ISO 8601 format) when the approval policy stops being
#  active and stops triggering approval workflows.If `ends_at` is provided in the
#  request, then `starts_at` must also be provided and `ends_at` must be later than
#  `starts_at`. The value will be converted to UTC.
    # @param name [String] The name of the approval policy.
    # @param description [String] A brief description of the approval policy.
    # @param script [Array<Hash>] A list of JSON objects that represents the approval policy script. The script
#  contains the logic that determines whether an action should be sent to approval.
#  This field is required, and it should contain at least one script object.Request of type Array<Monite::ApprovalPolicies::ApprovalPolicyCreateScriptItem>, as a Hash
    # @param trigger [Boolean, Float, String, Array<Object>, Hash{String => Object}] A JSON object that represents the trigger for the approval policy. The trigger
#  specifies the event that will trigger the policy to be evaluated.
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::ApprovalPolicyResource]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.approval_policies.create(
#    name: "name",
#    description: "description",
#    script: [true]
#  )
    def create(starts_at: nil, ends_at: nil, name:, description:, script:, trigger: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), starts_at: starts_at, ends_at: ends_at, name: name, description: description, script: script, trigger: trigger }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/approval_policies"
end
        Monite::ApprovalPolicyResource.from_json(json_object: response.body)
      end
    end
# Retrieve a specific approval policy.
    #
    # @param approval_policy_id [String] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::ApprovalPolicyResource]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.approval_policies.get_by_id(approval_policy_id: "approval_policy_id")
    def get_by_id(approval_policy_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/approval_policies/#{approval_policy_id}"
end
        Monite::ApprovalPolicyResource.from_json(json_object: response.body)
      end
    end
# Delete an existing approval policy.
    #
    # @param approval_policy_id [String] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Void]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.approval_policies.delete_by_id(approval_policy_id: "approval_policy_id")
    def delete_by_id(approval_policy_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/approval_policies/#{approval_policy_id}"
end
      end
    end
# Update an existing approval policy.
    #
    # @param approval_policy_id [String] 
    # @param starts_at [DateTime] The date and time (in the ISO 8601 format) when the approval policy becomes
#  active. Only payables submitted for approval during the policy's active period
#  will trigger this policy. If omitted or `null`, the policy is effective
#  immediately. The value will be converted to UTC.
    # @param ends_at [DateTime] The date and time (in the ISO 8601 format) when the approval policy stops being
#  active and stops triggering approval workflows.If `ends_at` is provided in the
#  request, then `starts_at` must also be provided and `ends_at` must be later than
#  `starts_at`. The value will be converted to UTC.
    # @param name [String] The name of the approval policy.
    # @param description [String] A brief description of the approval policy.
    # @param script [Array<Hash>] A list of JSON objects that represents the approval policy script. The script
#  contains the logic that determines whether an action should be sent to approval.
#  This field is required, and it should contain at least one script object.Request of type Array<Monite::ApprovalPolicies::ApprovalPolicyUpdateScriptItem>, as a Hash
    # @param trigger [Boolean, Float, String, Array<Object>, Hash{String => Object}] A JSON object that represents the trigger for the approval policy. The trigger
#  specifies the event that will trigger the policy to be evaluated.
    # @param status [Monite::ApprovalPolicyStatus] A string that represents the current status of the approval policy.
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::ApprovalPolicyResource]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.approval_policies.update_by_id(approval_policy_id: "approval_policy_id")
    def update_by_id(approval_policy_id:, starts_at: nil, ends_at: nil, name: nil, description: nil, script: nil, trigger: nil, status: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), starts_at: starts_at, ends_at: ends_at, name: name, description: description, script: script, trigger: trigger, status: status }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/approval_policies/#{approval_policy_id}"
end
        Monite::ApprovalPolicyResource.from_json(json_object: response.body)
      end
    end
  end
end