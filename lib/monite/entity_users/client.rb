# frozen_string_literal: true
require_relative "../../requests"
require_relative "../types/order_enum"
require_relative "../types/entity_user_cursor_fields"
require "date"
require "date"
require "date"
require "date"
require_relative "../types/entity_user_pagination_response"
require_relative "../types/entity_user_response"
require_relative "../types/entity_response"
require_relative "../types/update_entity_request"
require_relative "../types/role_response"
require "async"
require "async"
require "async"
require "async"
require "async"
require "async"
require "async"
require "async"
require "async"
require "async"
require_relative "../../requests"

module Monite
  class EntityUsersClient
  # @return [Monite::RequestClient] 
    attr_reader :request_client


    # @param request_client [Monite::RequestClient] 
    # @return [Monite::EntityUsersClient]
    def initialize(request_client:)
      @request_client = request_client
    end
# Retrieve a list of all entity users.
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
    # @param sort [Monite::ENTITY_USER_CURSOR_FIELDS] The field to sort the results by. Typically used together with the `order`
#  parameter.
    # @param id_in [String] 
    # @param id_not_in [String] 
    # @param role_id [String] 
    # @param role_id_in [String] 
    # @param login [String] 
    # @param status [String] 
    # @param first_name [String] 
    # @param name_istartswith [String] 
    # @param created_at_gt [DateTime] 
    # @param created_at_lt [DateTime] 
    # @param created_at_gte [DateTime] 
    # @param created_at_lte [DateTime] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::EntityUserPaginationResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.entity_users.get
    def get(order: nil, limit: nil, pagination_token: nil, sort: nil, id_in: nil, id_not_in: nil, role_id: nil, role_id_in: nil, login: nil, status: nil, first_name: nil, name_istartswith: nil, created_at_gt: nil, created_at_lt: nil, created_at_gte: nil, created_at_lte: nil, request_options: nil)
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
  req.params = { **(request_options&.additional_query_parameters || {}), "order": order, "limit": limit, "pagination_token": pagination_token, "sort": sort, "id__in": id_in, "id__not_in": id_not_in, "role_id": role_id, "role_id__in": role_id_in, "login": login, "status": status, "first_name": first_name, "name__istartswith": name_istartswith, "created_at__gt": created_at_gt, "created_at__lt": created_at_lt, "created_at__gte": created_at_gte, "created_at__lte": created_at_lte }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/entity_users"
end
      Monite::EntityUserPaginationResponse.from_json(json_object: response.body)
    end
# Create a new entity user from the specified values.
    #
    # @param email [String] An entity user business email
    # @param first_name [String] First name
    # @param last_name [String] Last name
    # @param login [String] 
    # @param phone [String] An entity user phone number in the international format
    # @param role_id [String] UUID of the role assigned to this entity user
    # @param title [String] Title
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::EntityUserResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.entity_users.create(first_name: "Casey", login: "login")
    def create(email: nil, first_name:, last_name: nil, login:, phone: nil, role_id: nil, title: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), email: email, first_name: first_name, last_name: last_name, login: login, phone: phone, role_id: role_id, title: title }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/entity_users"
end
      Monite::EntityUserResponse.from_json(json_object: response.body)
    end
# Retrieve an entity user by its ID.
    #
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::EntityUserResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.entity_users.get_current
    def get_current(request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/entity_users/me"
end
      Monite::EntityUserResponse.from_json(json_object: response.body)
    end
# Change the specified fields with provided values.
    #
    # @param email [String] An entity user business email
    # @param first_name [String] First name
    # @param last_name [String] Last name
    # @param phone [String] An entity user phone number in the international format
    # @param title [String] Title
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::EntityUserResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.entity_users.update_current
    def update_current(email: nil, first_name: nil, last_name: nil, phone: nil, title: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), email: email, first_name: first_name, last_name: last_name, phone: phone, title: title }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/entity_users/me"
end
      Monite::EntityUserResponse.from_json(json_object: response.body)
    end
# Retrieves information of an entity, which this entity user belongs to.
    #
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::EntityResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.entity_users.get_current_entity
    def get_current_entity(request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/entity_users/my_entity"
end
      Monite::EntityResponse.from_json(json_object: response.body)
    end
# Update information of an entity, which this entity user belongs to.
    #
    # @param request [Hash] Request of type Monite::UpdateEntityRequest, as a Hash
    #   * :address (Hash)
    #     * :city (String) 
    #     * :line_1 (String) 
    #     * :line_2 (String) 
    #     * :postal_code (String) 
    #     * :state (String) 
    #   * :email (String) 
    #   * :phone (String) 
    #   * :website (String) 
    #   * :tax_id (String) 
    #   * :organization (Hash)
    #     * :business_structure (Monite::EntityBusinessStructure) 
    #     * :directors_provided (Boolean) 
    #     * :executives_provided (Boolean) 
    #     * :legal_entity_id (String) 
    #     * :legal_name (String) 
    #     * :owners_provided (Boolean) 
    #     * :representative_provided (Boolean) 
    #   * :individual (Hash)
    #     * :date_of_birth (String) 
    #     * :first_name (String) 
    #     * :id_number (String) 
    #     * :last_name (String) 
    #     * :ssn_last_4 (String) 
    #     * :title (String) 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::EntityResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.entity_users.update_current_entity(request: {  })
    def update_current_entity(request:, request_options: nil)
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
  req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/entity_users/my_entity"
end
      Monite::EntityResponse.from_json(json_object: response.body)
    end
# Retrieves information of a role assigned to this entity user.
    #
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::RoleResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.entity_users.get_current_role
    def get_current_role(request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/entity_users/my_role"
end
      Monite::RoleResponse.from_json(json_object: response.body)
    end
# Retrieve an entity user by its ID.
    #
    # @param entity_user_id [String] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::EntityUserResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.entity_users.get_by_id(entity_user_id: "entity_user_id")
    def get_by_id(entity_user_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/entity_users/#{entity_user_id}"
end
      Monite::EntityUserResponse.from_json(json_object: response.body)
    end
    # @param entity_user_id [String] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Void]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.entity_users.delete_by_id(entity_user_id: "entity_user_id")
    def delete_by_id(entity_user_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/entity_users/#{entity_user_id}"
end
    end
# Change the specified fields with provided values.
    #
    # @param entity_user_id [String] 
    # @param email [String] An entity user business email
    # @param first_name [String] First name
    # @param last_name [String] Last name
    # @param login [String] Login
    # @param phone [String] An entity user phone number in the international format
    # @param role_id [String] UUID of the role assigned to this entity user
    # @param title [String] Title
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::EntityUserResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.entity_users.update_by_id(entity_user_id: "entity_user_id")
    def update_by_id(entity_user_id:, email: nil, first_name: nil, last_name: nil, login: nil, phone: nil, role_id: nil, title: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), email: email, first_name: first_name, last_name: last_name, login: login, phone: phone, role_id: role_id, title: title }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/entity_users/#{entity_user_id}"
end
      Monite::EntityUserResponse.from_json(json_object: response.body)
    end
  end
  class AsyncEntityUsersClient
  # @return [Monite::AsyncRequestClient] 
    attr_reader :request_client


    # @param request_client [Monite::RequestClient] 
    # @return [Monite::AsyncEntityUsersClient]
    def initialize(request_client:)
      @request_client = request_client
    end
# Retrieve a list of all entity users.
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
    # @param sort [Monite::ENTITY_USER_CURSOR_FIELDS] The field to sort the results by. Typically used together with the `order`
#  parameter.
    # @param id_in [String] 
    # @param id_not_in [String] 
    # @param role_id [String] 
    # @param role_id_in [String] 
    # @param login [String] 
    # @param status [String] 
    # @param first_name [String] 
    # @param name_istartswith [String] 
    # @param created_at_gt [DateTime] 
    # @param created_at_lt [DateTime] 
    # @param created_at_gte [DateTime] 
    # @param created_at_lte [DateTime] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::EntityUserPaginationResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.entity_users.get
    def get(order: nil, limit: nil, pagination_token: nil, sort: nil, id_in: nil, id_not_in: nil, role_id: nil, role_id_in: nil, login: nil, status: nil, first_name: nil, name_istartswith: nil, created_at_gt: nil, created_at_lt: nil, created_at_gte: nil, created_at_lte: nil, request_options: nil)
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
  req.params = { **(request_options&.additional_query_parameters || {}), "order": order, "limit": limit, "pagination_token": pagination_token, "sort": sort, "id__in": id_in, "id__not_in": id_not_in, "role_id": role_id, "role_id__in": role_id_in, "login": login, "status": status, "first_name": first_name, "name__istartswith": name_istartswith, "created_at__gt": created_at_gt, "created_at__lt": created_at_lt, "created_at__gte": created_at_gte, "created_at__lte": created_at_lte }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/entity_users"
end
        Monite::EntityUserPaginationResponse.from_json(json_object: response.body)
      end
    end
# Create a new entity user from the specified values.
    #
    # @param email [String] An entity user business email
    # @param first_name [String] First name
    # @param last_name [String] Last name
    # @param login [String] 
    # @param phone [String] An entity user phone number in the international format
    # @param role_id [String] UUID of the role assigned to this entity user
    # @param title [String] Title
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::EntityUserResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.entity_users.create(first_name: "Casey", login: "login")
    def create(email: nil, first_name:, last_name: nil, login:, phone: nil, role_id: nil, title: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), email: email, first_name: first_name, last_name: last_name, login: login, phone: phone, role_id: role_id, title: title }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/entity_users"
end
        Monite::EntityUserResponse.from_json(json_object: response.body)
      end
    end
# Retrieve an entity user by its ID.
    #
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::EntityUserResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.entity_users.get_current
    def get_current(request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/entity_users/me"
end
        Monite::EntityUserResponse.from_json(json_object: response.body)
      end
    end
# Change the specified fields with provided values.
    #
    # @param email [String] An entity user business email
    # @param first_name [String] First name
    # @param last_name [String] Last name
    # @param phone [String] An entity user phone number in the international format
    # @param title [String] Title
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::EntityUserResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.entity_users.update_current
    def update_current(email: nil, first_name: nil, last_name: nil, phone: nil, title: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), email: email, first_name: first_name, last_name: last_name, phone: phone, title: title }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/entity_users/me"
end
        Monite::EntityUserResponse.from_json(json_object: response.body)
      end
    end
# Retrieves information of an entity, which this entity user belongs to.
    #
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::EntityResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.entity_users.get_current_entity
    def get_current_entity(request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/entity_users/my_entity"
end
        Monite::EntityResponse.from_json(json_object: response.body)
      end
    end
# Update information of an entity, which this entity user belongs to.
    #
    # @param request [Hash] Request of type Monite::UpdateEntityRequest, as a Hash
    #   * :address (Hash)
    #     * :city (String) 
    #     * :line_1 (String) 
    #     * :line_2 (String) 
    #     * :postal_code (String) 
    #     * :state (String) 
    #   * :email (String) 
    #   * :phone (String) 
    #   * :website (String) 
    #   * :tax_id (String) 
    #   * :organization (Hash)
    #     * :business_structure (Monite::EntityBusinessStructure) 
    #     * :directors_provided (Boolean) 
    #     * :executives_provided (Boolean) 
    #     * :legal_entity_id (String) 
    #     * :legal_name (String) 
    #     * :owners_provided (Boolean) 
    #     * :representative_provided (Boolean) 
    #   * :individual (Hash)
    #     * :date_of_birth (String) 
    #     * :first_name (String) 
    #     * :id_number (String) 
    #     * :last_name (String) 
    #     * :ssn_last_4 (String) 
    #     * :title (String) 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::EntityResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.entity_users.update_current_entity(request: {  })
    def update_current_entity(request:, request_options: nil)
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
  req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/entity_users/my_entity"
end
        Monite::EntityResponse.from_json(json_object: response.body)
      end
    end
# Retrieves information of a role assigned to this entity user.
    #
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::RoleResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.entity_users.get_current_role
    def get_current_role(request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/entity_users/my_role"
end
        Monite::RoleResponse.from_json(json_object: response.body)
      end
    end
# Retrieve an entity user by its ID.
    #
    # @param entity_user_id [String] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::EntityUserResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.entity_users.get_by_id(entity_user_id: "entity_user_id")
    def get_by_id(entity_user_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/entity_users/#{entity_user_id}"
end
        Monite::EntityUserResponse.from_json(json_object: response.body)
      end
    end
    # @param entity_user_id [String] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Void]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.entity_users.delete_by_id(entity_user_id: "entity_user_id")
    def delete_by_id(entity_user_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/entity_users/#{entity_user_id}"
end
      end
    end
# Change the specified fields with provided values.
    #
    # @param entity_user_id [String] 
    # @param email [String] An entity user business email
    # @param first_name [String] First name
    # @param last_name [String] Last name
    # @param login [String] Login
    # @param phone [String] An entity user phone number in the international format
    # @param role_id [String] UUID of the role assigned to this entity user
    # @param title [String] Title
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::EntityUserResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.entity_users.update_by_id(entity_user_id: "entity_user_id")
    def update_by_id(entity_user_id:, email: nil, first_name: nil, last_name: nil, login: nil, phone: nil, role_id: nil, title: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), email: email, first_name: first_name, last_name: last_name, login: login, phone: phone, role_id: role_id, title: title }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/entity_users/#{entity_user_id}"
end
        Monite::EntityUserResponse.from_json(json_object: response.body)
      end
    end
  end
end