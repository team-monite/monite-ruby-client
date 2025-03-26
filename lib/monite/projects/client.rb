# frozen_string_literal: true
require_relative "../../requests"
require_relative "../types/order_enum"
require_relative "../types/project_cursor_fields"
require "date"
require "date"
require "date"
require "date"
require_relative "../types/project_pagination_response"
require_relative "../types/project_resource"
require "async"
require "async"
require "async"
require "async"
require "async"
require_relative "../../requests"

module Monite
  class ProjectsClient
  # @return [Monite::RequestClient] 
    attr_reader :request_client


    # @param request_client [Monite::RequestClient] 
    # @return [Monite::ProjectsClient]
    def initialize(request_client:)
      @request_client = request_client
    end
# Get all projects for an entity
    #
    # @param order [Monite::OrderEnum] Sort order (ascending by default). Typically used together with the `sort`
#  parameter.
    # @param limit [Integer] The number of items (0 .. 100) to return in a single page of the response. The
#  response may contain fewer items if it is the last or only page.
    # @param pagination_token [String] A pagination token obtained from a previous call to this endpoint. Use it to get
#  the next or previous page of results for your initial query. If
#  `pagination_token` is specified, all other query parameters are ignored and
#  inferred from the initial query.
#  If not specified, the first page of results will be returned.
    # @param sort [Monite::ProjectCursorFields] The field to sort the results by. Typically used together with the `order`
#  parameter.
    # @param created_at_gt [DateTime] 
    # @param created_at_lt [DateTime] 
    # @param created_at_gte [DateTime] 
    # @param created_at_lte [DateTime] 
    # @param start_date [String] 
    # @param start_date_gt [String] 
    # @param start_date_lt [String] 
    # @param start_date_gte [String] 
    # @param start_date_lte [String] 
    # @param end_date [String] 
    # @param end_date_gt [String] 
    # @param end_date_lt [String] 
    # @param end_date_gte [String] 
    # @param end_date_lte [String] 
    # @param name [String] 
    # @param name_iexact [String] 
    # @param name_contains [String] 
    # @param name_icontains [String] 
    # @param code [String] 
    # @param created_by_entity_user_id [String] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::ProjectPaginationResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.projects.get
    def get(order: nil, limit: nil, pagination_token: nil, sort: nil, created_at_gt: nil, created_at_lt: nil, created_at_gte: nil, created_at_lte: nil, start_date: nil, start_date_gt: nil, start_date_lt: nil, start_date_gte: nil, start_date_lte: nil, end_date: nil, end_date_gt: nil, end_date_lt: nil, end_date_gte: nil, end_date_lte: nil, name: nil, name_iexact: nil, name_contains: nil, name_icontains: nil, code: nil, created_by_entity_user_id: nil, request_options: nil)
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
  req.params = { **(request_options&.additional_query_parameters || {}), "order": order, "limit": limit, "pagination_token": pagination_token, "sort": sort, "created_at__gt": created_at_gt, "created_at__lt": created_at_lt, "created_at__gte": created_at_gte, "created_at__lte": created_at_lte, "start_date": start_date, "start_date__gt": start_date_gt, "start_date__lt": start_date_lt, "start_date__gte": start_date_gte, "start_date__lte": start_date_lte, "end_date": end_date, "end_date__gt": end_date_gt, "end_date__lt": end_date_lt, "end_date__gte": end_date_gte, "end_date__lte": end_date_lte, "name": name, "name__iexact": name_iexact, "name__contains": name_contains, "name__icontains": name_icontains, "code": code, "created_by_entity_user_id": created_by_entity_user_id }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/projects"
end
      Monite::ProjectPaginationResponse.from_json(json_object: response.body)
    end
# Create a new project.
    #
    # @param code [String] Project code
    # @param color [String] Project color
    # @param description [String] Description of project
    # @param end_date [String] Project end date
    # @param name [String] The project name.
    # @param parent_id [String] Parent project ID
    # @param partner_metadata [Hash{String => Object}] Project metadata
    # @param start_date [String] Project start date
    # @param tag_ids [Array<String>] A list of IDs of user-defined tags (labels) assigned to this project.
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::ProjectResource]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.projects.create(name: "Marketing")
    def create(code: nil, color: nil, description: nil, end_date: nil, name:, parent_id: nil, partner_metadata: nil, start_date: nil, tag_ids: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), code: code, color: color, description: description, end_date: end_date, name: name, parent_id: parent_id, partner_metadata: partner_metadata, start_date: start_date, tag_ids: tag_ids }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/projects"
end
      Monite::ProjectResource.from_json(json_object: response.body)
    end
# Get a project with the given ID.
    #
    # @param project_id [String] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::ProjectResource]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.projects.get_by_id(project_id: "project_id")
    def get_by_id(project_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/projects/#{project_id}"
end
      Monite::ProjectResource.from_json(json_object: response.body)
    end
# Delete a project.
    #
    # @param project_id [String] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Void]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.projects.delete_by_id(project_id: "project_id")
    def delete_by_id(project_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/projects/#{project_id}"
end
    end
# Update a project.
    #
    # @param project_id [String] 
    # @param code [String] Project code
    # @param color [String] Project color
    # @param description [String] Description of project
    # @param end_date [String] Project end date
    # @param name [String] The project name.
    # @param parent_id [String] Parent project ID
    # @param partner_metadata [Hash{String => Object}] Project metadata
    # @param start_date [String] Project start date
    # @param tag_ids [Array<String>] A list of IDs of user-defined tags (labels) assigned to this project.
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::ProjectResource]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.projects.update_by_id(project_id: "project_id")
    def update_by_id(project_id:, code: nil, color: nil, description: nil, end_date: nil, name: nil, parent_id: nil, partner_metadata: nil, start_date: nil, tag_ids: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), code: code, color: color, description: description, end_date: end_date, name: name, parent_id: parent_id, partner_metadata: partner_metadata, start_date: start_date, tag_ids: tag_ids }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/projects/#{project_id}"
end
      Monite::ProjectResource.from_json(json_object: response.body)
    end
  end
  class AsyncProjectsClient
  # @return [Monite::AsyncRequestClient] 
    attr_reader :request_client


    # @param request_client [Monite::RequestClient] 
    # @return [Monite::AsyncProjectsClient]
    def initialize(request_client:)
      @request_client = request_client
    end
# Get all projects for an entity
    #
    # @param order [Monite::OrderEnum] Sort order (ascending by default). Typically used together with the `sort`
#  parameter.
    # @param limit [Integer] The number of items (0 .. 100) to return in a single page of the response. The
#  response may contain fewer items if it is the last or only page.
    # @param pagination_token [String] A pagination token obtained from a previous call to this endpoint. Use it to get
#  the next or previous page of results for your initial query. If
#  `pagination_token` is specified, all other query parameters are ignored and
#  inferred from the initial query.
#  If not specified, the first page of results will be returned.
    # @param sort [Monite::ProjectCursorFields] The field to sort the results by. Typically used together with the `order`
#  parameter.
    # @param created_at_gt [DateTime] 
    # @param created_at_lt [DateTime] 
    # @param created_at_gte [DateTime] 
    # @param created_at_lte [DateTime] 
    # @param start_date [String] 
    # @param start_date_gt [String] 
    # @param start_date_lt [String] 
    # @param start_date_gte [String] 
    # @param start_date_lte [String] 
    # @param end_date [String] 
    # @param end_date_gt [String] 
    # @param end_date_lt [String] 
    # @param end_date_gte [String] 
    # @param end_date_lte [String] 
    # @param name [String] 
    # @param name_iexact [String] 
    # @param name_contains [String] 
    # @param name_icontains [String] 
    # @param code [String] 
    # @param created_by_entity_user_id [String] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::ProjectPaginationResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.projects.get
    def get(order: nil, limit: nil, pagination_token: nil, sort: nil, created_at_gt: nil, created_at_lt: nil, created_at_gte: nil, created_at_lte: nil, start_date: nil, start_date_gt: nil, start_date_lt: nil, start_date_gte: nil, start_date_lte: nil, end_date: nil, end_date_gt: nil, end_date_lt: nil, end_date_gte: nil, end_date_lte: nil, name: nil, name_iexact: nil, name_contains: nil, name_icontains: nil, code: nil, created_by_entity_user_id: nil, request_options: nil)
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
  req.params = { **(request_options&.additional_query_parameters || {}), "order": order, "limit": limit, "pagination_token": pagination_token, "sort": sort, "created_at__gt": created_at_gt, "created_at__lt": created_at_lt, "created_at__gte": created_at_gte, "created_at__lte": created_at_lte, "start_date": start_date, "start_date__gt": start_date_gt, "start_date__lt": start_date_lt, "start_date__gte": start_date_gte, "start_date__lte": start_date_lte, "end_date": end_date, "end_date__gt": end_date_gt, "end_date__lt": end_date_lt, "end_date__gte": end_date_gte, "end_date__lte": end_date_lte, "name": name, "name__iexact": name_iexact, "name__contains": name_contains, "name__icontains": name_icontains, "code": code, "created_by_entity_user_id": created_by_entity_user_id }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/projects"
end
        Monite::ProjectPaginationResponse.from_json(json_object: response.body)
      end
    end
# Create a new project.
    #
    # @param code [String] Project code
    # @param color [String] Project color
    # @param description [String] Description of project
    # @param end_date [String] Project end date
    # @param name [String] The project name.
    # @param parent_id [String] Parent project ID
    # @param partner_metadata [Hash{String => Object}] Project metadata
    # @param start_date [String] Project start date
    # @param tag_ids [Array<String>] A list of IDs of user-defined tags (labels) assigned to this project.
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::ProjectResource]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.projects.create(name: "Marketing")
    def create(code: nil, color: nil, description: nil, end_date: nil, name:, parent_id: nil, partner_metadata: nil, start_date: nil, tag_ids: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), code: code, color: color, description: description, end_date: end_date, name: name, parent_id: parent_id, partner_metadata: partner_metadata, start_date: start_date, tag_ids: tag_ids }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/projects"
end
        Monite::ProjectResource.from_json(json_object: response.body)
      end
    end
# Get a project with the given ID.
    #
    # @param project_id [String] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::ProjectResource]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.projects.get_by_id(project_id: "project_id")
    def get_by_id(project_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/projects/#{project_id}"
end
        Monite::ProjectResource.from_json(json_object: response.body)
      end
    end
# Delete a project.
    #
    # @param project_id [String] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Void]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.projects.delete_by_id(project_id: "project_id")
    def delete_by_id(project_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/projects/#{project_id}"
end
      end
    end
# Update a project.
    #
    # @param project_id [String] 
    # @param code [String] Project code
    # @param color [String] Project color
    # @param description [String] Description of project
    # @param end_date [String] Project end date
    # @param name [String] The project name.
    # @param parent_id [String] Parent project ID
    # @param partner_metadata [Hash{String => Object}] Project metadata
    # @param start_date [String] Project start date
    # @param tag_ids [Array<String>] A list of IDs of user-defined tags (labels) assigned to this project.
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::ProjectResource]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.projects.update_by_id(project_id: "project_id")
    def update_by_id(project_id:, code: nil, color: nil, description: nil, end_date: nil, name: nil, parent_id: nil, partner_metadata: nil, start_date: nil, tag_ids: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), code: code, color: color, description: description, end_date: end_date, name: name, parent_id: parent_id, partner_metadata: partner_metadata, start_date: start_date, tag_ids: tag_ids }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/projects/#{project_id}"
end
        Monite::ProjectResource.from_json(json_object: response.body)
      end
    end
  end
end