# frozen_string_literal: true
require_relative "../../requests"
require_relative "../types/order_enum"
require_relative "../types/webhook_delivery_cursor_fields"
require_relative "../types/webhook_object_type"
require "date"
require "date"
require "date"
require "date"
require_relative "../types/webhook_delivery_pagination_resource"
require "async"
require_relative "../../requests"

module Monite
  class WebhookDeliveriesClient
  # @return [Monite::RequestClient] 
    attr_reader :request_client


    # @param request_client [Monite::RequestClient] 
    # @return [Monite::WebhookDeliveriesClient]
    def initialize(request_client:)
      @request_client = request_client
    end
# Returns an aggregated log of webhook delivery attempts. The data contains a list
#  of triggered webhook events, how many times Monite tried to send each event to
#  your server, the last HTTP status code returned by your webhook listener
#  endpoint, and whether the final attempt to deliver that event was successful.
#  We guarantee access to webhook delivery data only from the last three months.
#  Earlier data may be unavailable.
#  Note that if the same event type is included in multiple webhook subscriptions,
#  the results will include several entries for each occurrence of this event - one
#  entry per subscription.
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
    # @param sort [Monite::WebhookDeliveryCursorFields] The field to sort the results by. Typically used together with the `order`
#  parameter.
    # @param event_id [String] 
    # @param object_type [Monite::WebhookObjectType] 
    # @param event_action [String] 
    # @param created_at_gt [DateTime] 
    # @param created_at_lt [DateTime] 
    # @param created_at_gte [DateTime] 
    # @param created_at_lte [DateTime] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::WebhookDeliveryPaginationResource]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.webhook_deliveries.get
    def get(order: nil, limit: nil, pagination_token: nil, sort: nil, event_id: nil, object_type: nil, event_action: nil, created_at_gt: nil, created_at_lt: nil, created_at_gte: nil, created_at_lte: nil, request_options: nil)
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
  req.params = { **(request_options&.additional_query_parameters || {}), "order": order, "limit": limit, "pagination_token": pagination_token, "sort": sort, "event_id": event_id, "object_type": object_type, "event_action": event_action, "created_at__gt": created_at_gt, "created_at__lt": created_at_lt, "created_at__gte": created_at_gte, "created_at__lte": created_at_lte }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/webhook_deliveries"
end
      Monite::WebhookDeliveryPaginationResource.from_json(json_object: response.body)
    end
  end
  class AsyncWebhookDeliveriesClient
  # @return [Monite::AsyncRequestClient] 
    attr_reader :request_client


    # @param request_client [Monite::RequestClient] 
    # @return [Monite::AsyncWebhookDeliveriesClient]
    def initialize(request_client:)
      @request_client = request_client
    end
# Returns an aggregated log of webhook delivery attempts. The data contains a list
#  of triggered webhook events, how many times Monite tried to send each event to
#  your server, the last HTTP status code returned by your webhook listener
#  endpoint, and whether the final attempt to deliver that event was successful.
#  We guarantee access to webhook delivery data only from the last three months.
#  Earlier data may be unavailable.
#  Note that if the same event type is included in multiple webhook subscriptions,
#  the results will include several entries for each occurrence of this event - one
#  entry per subscription.
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
    # @param sort [Monite::WebhookDeliveryCursorFields] The field to sort the results by. Typically used together with the `order`
#  parameter.
    # @param event_id [String] 
    # @param object_type [Monite::WebhookObjectType] 
    # @param event_action [String] 
    # @param created_at_gt [DateTime] 
    # @param created_at_lt [DateTime] 
    # @param created_at_gte [DateTime] 
    # @param created_at_lte [DateTime] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::WebhookDeliveryPaginationResource]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.webhook_deliveries.get
    def get(order: nil, limit: nil, pagination_token: nil, sort: nil, event_id: nil, object_type: nil, event_action: nil, created_at_gt: nil, created_at_lt: nil, created_at_gte: nil, created_at_lte: nil, request_options: nil)
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
  req.params = { **(request_options&.additional_query_parameters || {}), "order": order, "limit": limit, "pagination_token": pagination_token, "sort": sort, "event_id": event_id, "object_type": object_type, "event_action": event_action, "created_at__gt": created_at_gt, "created_at__lt": created_at_lt, "created_at__gte": created_at_gte, "created_at__lte": created_at_lte }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/webhook_deliveries"
end
        Monite::WebhookDeliveryPaginationResource.from_json(json_object: response.body)
      end
    end
  end
end