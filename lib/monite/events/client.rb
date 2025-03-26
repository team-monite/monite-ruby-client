# frozen_string_literal: true
require_relative "../../requests"
require_relative "../types/order_enum"
require_relative "../types/event_cursor_fields"
require_relative "../types/webhook_object_type"
require "date"
require "date"
require "date"
require "date"
require_relative "../types/event_pagination_resource"
require_relative "../types/event_resource"
require "async"
require "async"
require_relative "../../requests"

module Monite
  class EventsClient
  # @return [Monite::RequestClient] 
    attr_reader :request_client


    # @param request_client [Monite::RequestClient] 
    # @return [Monite::EventsClient]
    def initialize(request_client:)
      @request_client = request_client
    end
# Returns all webhook events that were triggered for the specified entity based on
#  your enabled webhook subscriptions. These are the same events that were sent to
#  your configured webhook listener endpoints, aggregated into a single list.
#  Results can be filtered by the related object type or time period.
#  You can use this to get the missed events for the time periods when your webhook
#  listener was temporarily unavailable.
#  We guarantee access to event data only from the last three months. Earlier
#  events may be unavailable.
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
    # @param sort [Monite::EventCursorFields] The field to sort the results by. Typically used together with the `order`
#  parameter.
    # @param object_type [Monite::WebhookObjectType] 
    # @param created_at_gt [DateTime] 
    # @param created_at_lt [DateTime] 
    # @param created_at_gte [DateTime] 
    # @param created_at_lte [DateTime] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::EventPaginationResource]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.events.get
    def get(order: nil, limit: nil, pagination_token: nil, sort: nil, object_type: nil, created_at_gt: nil, created_at_lt: nil, created_at_gte: nil, created_at_lte: nil, request_options: nil)
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
  req.params = { **(request_options&.additional_query_parameters || {}), "order": order, "limit": limit, "pagination_token": pagination_token, "sort": sort, "object_type": object_type, "created_at__gt": created_at_gt, "created_at__lt": created_at_lt, "created_at__gte": created_at_gte, "created_at__lte": created_at_lte }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/events"
end
      Monite::EventPaginationResource.from_json(json_object: response.body)
    end
# Get a webhook event by its ID. The data is the same as you might have previously
#  received in a webhook sent by Monite to your server.
    #
    # @param event_id [String] ID of the webhook event. This is the `id` value you might have received in a
#  webhook or retrieved from `GET /events`.
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::EventResource]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.events.get_by_id(event_id: "event_id")
    def get_by_id(event_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/events/#{event_id}"
end
      Monite::EventResource.from_json(json_object: response.body)
    end
  end
  class AsyncEventsClient
  # @return [Monite::AsyncRequestClient] 
    attr_reader :request_client


    # @param request_client [Monite::RequestClient] 
    # @return [Monite::AsyncEventsClient]
    def initialize(request_client:)
      @request_client = request_client
    end
# Returns all webhook events that were triggered for the specified entity based on
#  your enabled webhook subscriptions. These are the same events that were sent to
#  your configured webhook listener endpoints, aggregated into a single list.
#  Results can be filtered by the related object type or time period.
#  You can use this to get the missed events for the time periods when your webhook
#  listener was temporarily unavailable.
#  We guarantee access to event data only from the last three months. Earlier
#  events may be unavailable.
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
    # @param sort [Monite::EventCursorFields] The field to sort the results by. Typically used together with the `order`
#  parameter.
    # @param object_type [Monite::WebhookObjectType] 
    # @param created_at_gt [DateTime] 
    # @param created_at_lt [DateTime] 
    # @param created_at_gte [DateTime] 
    # @param created_at_lte [DateTime] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::EventPaginationResource]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.events.get
    def get(order: nil, limit: nil, pagination_token: nil, sort: nil, object_type: nil, created_at_gt: nil, created_at_lt: nil, created_at_gte: nil, created_at_lte: nil, request_options: nil)
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
  req.params = { **(request_options&.additional_query_parameters || {}), "order": order, "limit": limit, "pagination_token": pagination_token, "sort": sort, "object_type": object_type, "created_at__gt": created_at_gt, "created_at__lt": created_at_lt, "created_at__gte": created_at_gte, "created_at__lte": created_at_lte }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/events"
end
        Monite::EventPaginationResource.from_json(json_object: response.body)
      end
    end
# Get a webhook event by its ID. The data is the same as you might have previously
#  received in a webhook sent by Monite to your server.
    #
    # @param event_id [String] ID of the webhook event. This is the `id` value you might have received in a
#  webhook or retrieved from `GET /events`.
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::EventResource]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.events.get_by_id(event_id: "event_id")
    def get_by_id(event_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/events/#{event_id}"
end
        Monite::EventResource.from_json(json_object: response.body)
      end
    end
  end
end