# frozen_string_literal: true
require_relative "../../requests"
require_relative "../types/order_enum"
require_relative "../types/tag_cursor_fields"
require_relative "../types/tags_pagination_response"
require_relative "../types/tag_category"
require_relative "../types/tag_read_schema"
require "async"
require "async"
require "async"
require "async"
require "async"
require_relative "../../requests"

module Monite
  class TagsClient
  # @return [Monite::RequestClient] 
    attr_reader :request_client


    # @param request_client [Monite::RequestClient] 
    # @return [Monite::TagsClient]
    def initialize(request_client:)
      @request_client = request_client
    end
# Get a list of all tags. Tags can be assigned to resources to assist with
#  searching and filtering.
#  Tags can also be used as trigger conditions in payable approval policies.
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
    # @param sort [Monite::TagCursorFields] The field to sort the results by. Typically used together with the `order`
#  parameter.
    # @param created_by_entity_user_id [String] 
    # @param name_in [String] 
    # @param id_in [String] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::TagsPaginationResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.tags.get
    def get(order: nil, limit: nil, pagination_token: nil, sort: nil, created_by_entity_user_id: nil, name_in: nil, id_in: nil, request_options: nil)
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
  req.params = { **(request_options&.additional_query_parameters || {}), "order": order, "limit": limit, "pagination_token": pagination_token, "sort": sort, "created_by_entity_user_id": created_by_entity_user_id, "name__in": name_in, "id__in": id_in }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/tags"
end
      Monite::TagsPaginationResponse.from_json(json_object: response.body)
    end
# Create a new tag. The tag name must be unique.
#  Tag names are case-sensitive, that is `Marketing` and `marketing` are two
#  different tags.
#  The response returns an auto-generated ID assigned to this tag.
#  To assign this tag to a resource, send the tag ID in the `tag_ids` list when
#  creating or updating a resource.
    #
    # @param category [Monite::TagCategory] The tag category.
    # @param description [String] The tag description.
    # @param name [String] The tag name. Must be unique.
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::TagReadSchema]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.tags.create(name: "Marketing")
    def create(category: nil, description: nil, name:, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), category: category, description: description, name: name }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/tags"
end
      Monite::TagReadSchema.from_json(json_object: response.body)
    end
# Get information about a tag with the given ID.
    #
    # @param tag_id [String] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::TagReadSchema]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.tags.get_by_id(tag_id: "tag_id")
    def get_by_id(tag_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/tags/#{tag_id}"
end
      Monite::TagReadSchema.from_json(json_object: response.body)
    end
# Delete a tag with the given ID. This tag will be automatically deleted from all
#  resources where it was used.
    #
    # @param tag_id [String] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Void]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.tags.delete_by_id(tag_id: "tag_id")
    def delete_by_id(tag_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/tags/#{tag_id}"
end
    end
# Change the tag name. The new name must be unique among existing tags.
#  Tag names are case-sensitive, that is `Marketing` and `marketing` are two
#  different tags.
    #
    # @param tag_id [String] 
    # @param category [Monite::TagCategory] The tag category.
    # @param description [String] The tag description.
    # @param name [String] The tag name. Must be unique.
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::TagReadSchema]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.tags.update_by_id(tag_id: "tag_id")
    def update_by_id(tag_id:, category: nil, description: nil, name: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), category: category, description: description, name: name }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/tags/#{tag_id}"
end
      Monite::TagReadSchema.from_json(json_object: response.body)
    end
  end
  class AsyncTagsClient
  # @return [Monite::AsyncRequestClient] 
    attr_reader :request_client


    # @param request_client [Monite::RequestClient] 
    # @return [Monite::AsyncTagsClient]
    def initialize(request_client:)
      @request_client = request_client
    end
# Get a list of all tags. Tags can be assigned to resources to assist with
#  searching and filtering.
#  Tags can also be used as trigger conditions in payable approval policies.
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
    # @param sort [Monite::TagCursorFields] The field to sort the results by. Typically used together with the `order`
#  parameter.
    # @param created_by_entity_user_id [String] 
    # @param name_in [String] 
    # @param id_in [String] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::TagsPaginationResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.tags.get
    def get(order: nil, limit: nil, pagination_token: nil, sort: nil, created_by_entity_user_id: nil, name_in: nil, id_in: nil, request_options: nil)
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
  req.params = { **(request_options&.additional_query_parameters || {}), "order": order, "limit": limit, "pagination_token": pagination_token, "sort": sort, "created_by_entity_user_id": created_by_entity_user_id, "name__in": name_in, "id__in": id_in }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/tags"
end
        Monite::TagsPaginationResponse.from_json(json_object: response.body)
      end
    end
# Create a new tag. The tag name must be unique.
#  Tag names are case-sensitive, that is `Marketing` and `marketing` are two
#  different tags.
#  The response returns an auto-generated ID assigned to this tag.
#  To assign this tag to a resource, send the tag ID in the `tag_ids` list when
#  creating or updating a resource.
    #
    # @param category [Monite::TagCategory] The tag category.
    # @param description [String] The tag description.
    # @param name [String] The tag name. Must be unique.
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::TagReadSchema]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.tags.create(name: "Marketing")
    def create(category: nil, description: nil, name:, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), category: category, description: description, name: name }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/tags"
end
        Monite::TagReadSchema.from_json(json_object: response.body)
      end
    end
# Get information about a tag with the given ID.
    #
    # @param tag_id [String] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::TagReadSchema]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.tags.get_by_id(tag_id: "tag_id")
    def get_by_id(tag_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/tags/#{tag_id}"
end
        Monite::TagReadSchema.from_json(json_object: response.body)
      end
    end
# Delete a tag with the given ID. This tag will be automatically deleted from all
#  resources where it was used.
    #
    # @param tag_id [String] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Void]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.tags.delete_by_id(tag_id: "tag_id")
    def delete_by_id(tag_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/tags/#{tag_id}"
end
      end
    end
# Change the tag name. The new name must be unique among existing tags.
#  Tag names are case-sensitive, that is `Marketing` and `marketing` are two
#  different tags.
    #
    # @param tag_id [String] 
    # @param category [Monite::TagCategory] The tag category.
    # @param description [String] The tag description.
    # @param name [String] The tag name. Must be unique.
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::TagReadSchema]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.tags.update_by_id(tag_id: "tag_id")
    def update_by_id(tag_id:, category: nil, description: nil, name: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), category: category, description: description, name: name }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/tags/#{tag_id}"
end
        Monite::TagReadSchema.from_json(json_object: response.body)
      end
    end
  end
end