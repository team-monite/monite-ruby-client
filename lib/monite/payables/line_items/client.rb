# frozen_string_literal: true
require_relative "../../../requests"
require_relative "../../types/order_enum"
require_relative "../../types/line_item_cursor_fields"
require_relative "../../types/line_item_pagination_response"
require_relative "../../types/line_item_request"
require_relative "../../types/line_item_response"
require_relative "../../types/line_item_internal_request"
require_relative "../../types/line_items_replace_response"
require "async"
require "async"
require "async"
require "async"
require "async"
require "async"
require_relative "../../../requests"

module Monite
  module Payables
    class LineItemsClient
    # @return [Monite::RequestClient] 
      attr_reader :request_client


      # @param request_client [Monite::RequestClient] 
      # @return [Monite::Payables::LineItemsClient]
      def initialize(request_client:)
        @request_client = request_client
      end
# Get a list of all line items related to a specific payable.
#  Related guide: [List all payable line
#  onite.com/accounts-payable/payables/line-items#list-all-line-items-of-a-payable)
#  See also:
#  [Manage line
#  items](https://docs.monite.com/accounts-payable/payables/line-items)
#  [Collect payables](https://docs.monite.com/accounts-payable/payables/collect)
      #
      # @param payable_id [String] 
      # @param order [Monite::OrderEnum] Sort order (ascending by default). Typically used together with the `sort`
#  parameter.
      # @param limit [Integer] The number of items (0 .. 100) to return in a single page of the response. The
#  response may contain fewer items if it is the last or only page.
      # @param pagination_token [String] A pagination token obtained from a previous call to this endpoint. Use it to get
#  the next or previous page of results for your initial query. If
#  `pagination_token` is specified, all other query parameters are ignored and
#  inferred from the initial query.
#  If not specified, the first page of results will be returned.
      # @param sort [Monite::LineItemCursorFields] The field to sort the results by. Typically used together with the `order`
#  parameter.
      # @param was_created_by_user_id [String] 
      # @param request_options [Monite::RequestOptions] 
      # @return [Monite::LineItemPaginationResponse]
      # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.payables.line_items.get(payable_id: "payable_id")
      def get(payable_id:, order: nil, limit: nil, pagination_token: nil, sort: nil, was_created_by_user_id: nil, request_options: nil)
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
  req.params = { **(request_options&.additional_query_parameters || {}), "order": order, "limit": limit, "pagination_token": pagination_token, "sort": sort, "was_created_by_user_id": was_created_by_user_id }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/payables/#{payable_id}/line_items"
end
        Monite::LineItemPaginationResponse.from_json(json_object: response.body)
      end
# Add a new line item to a specific payable.
#  The `subtotal` and `total` fields of line items are automatically calculated
#  based on the `unit_price`,
#  `quantity`, and `tax` fields, therefore, are read-only and appear only in the
#  response schema. The field
#  `ledger_account_id` is required **only** for account integration, otherwise,
#  it is optional.
#  Related guide: [Add line items to a
#  ocs.monite.com/accounts-payable/payables/line-items#add-line-items-to-a-payable)
#  See also:
#  [Manage line
#  items](https://docs.monite.com/accounts-payable/payables/line-items)
#  [Collect payables](https://docs.monite.com/accounts-payable/payables/collect)
      #
      # @param payable_id [String] 
      # @param request [Hash] Request of type Monite::LineItemRequest, as a Hash
      #   * :accounting_tax_rate_id (String) 
      #   * :description (String) 
      #   * :ledger_account_id (String) 
      #   * :name (String) 
      #   * :quantity (Float) 
      #   * :tax (Integer) 
      #   * :unit (String) 
      #   * :unit_price (Integer) 
      # @param request_options [Monite::RequestOptions] 
      # @return [Monite::LineItemResponse]
      # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.payables.line_items.create(payable_id: "payable_id", request: {  })
      def create(payable_id:, request:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/payables/#{payable_id}/line_items"
end
        Monite::LineItemResponse.from_json(json_object: response.body)
      end
# Replaces the information of all line items of a specific payable.
#  Related guide: [Replace all line
#  s://docs.monite.com/accounts-payable/payables/line-items#replace-all-line-items)
#  See also:
#  [Manage line
#  items](https://docs.monite.com/accounts-payable/payables/line-items)
#  [Collect payables](https://docs.monite.com/accounts-payable/payables/collect)
      #
      # @param payable_id [String] 
      # @param data [Array<Hash>] Request of type Array<Monite::LineItemInternalRequest>, as a Hash
      #   * :accounting_tax_rate_id (String) 
      #   * :description (String) 
      #   * :ledger_account_id (String) 
      #   * :name (String) 
      #   * :quantity (Float) 
      #   * :subtotal (Integer) 
      #   * :tax (Integer) 
      #   * :total (Integer) 
      #   * :unit (String) 
      #   * :unit_price (Integer) 
      # @param request_options [Monite::RequestOptions] 
      # @return [Monite::LineItemsReplaceResponse]
      # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.payables.line_items.replace(payable_id: "payable_id", data: [{  }])
      def replace(payable_id:, data:, request_options: nil)
        response = @request_client.conn.put do | req |
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
  req.body = { **(request_options&.additional_body_parameters || {}), data: data }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/payables/#{payable_id}/line_items"
end
        Monite::LineItemsReplaceResponse.from_json(json_object: response.body)
      end
# Get information about a specific line item with a given ID.
#  Related guide: [Retrieve a line
#  tps://docs.monite.com/accounts-payable/payables/line-items#retrieve-a-line-item)
#  See also:
#  [Manage line
#  items](https://docs.monite.com/accounts-payable/payables/line-items)
#  [Collect payables](https://docs.monite.com/accounts-payable/payables/collect)
      #
      # @param line_item_id [String] 
      # @param payable_id [String] 
      # @param request_options [Monite::RequestOptions] 
      # @return [Monite::LineItemResponse]
      # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.payables.line_items.get_by_id(line_item_id: "line_item_id", payable_id: "payable_id")
      def get_by_id(line_item_id:, payable_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/payables/#{line_item_id}/line_items/#{payable_id}"
end
        Monite::LineItemResponse.from_json(json_object: response.body)
      end
# Delete the line item with the given ID.
#  Related guide: [Remove a line
#  https://docs.monite.com/accounts-payable/payables/line-items#remove-a-line-item)
#  See also:
#  [Manage line
#  items](https://docs.monite.com/accounts-payable/payables/line-items)
#  [Collect payables](https://docs.monite.com/accounts-payable/payables/collect)
      #
      # @param line_item_id [String] 
      # @param payable_id [String] 
      # @param request_options [Monite::RequestOptions] 
      # @return [Void]
      # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.payables.line_items.delete_by_id(line_item_id: "line_item_id", payable_id: "payable_id")
      def delete_by_id(line_item_id:, payable_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/payables/#{line_item_id}/line_items/#{payable_id}"
end
      end
# Edits the information of a specific line item.
#  Related guide: [Update a line
#  https://docs.monite.com/accounts-payable/payables/line-items#update-a-line-item)
#  See also:
#  [Manage line
#  items](https://docs.monite.com/accounts-payable/payables/line-items)
#  [Collect payables](https://docs.monite.com/accounts-payable/payables/collect)
      #
      # @param line_item_id [String] 
      # @param payable_id [String] 
      # @param request [Hash] Request of type Monite::LineItemRequest, as a Hash
      #   * :accounting_tax_rate_id (String) 
      #   * :description (String) 
      #   * :ledger_account_id (String) 
      #   * :name (String) 
      #   * :quantity (Float) 
      #   * :tax (Integer) 
      #   * :unit (String) 
      #   * :unit_price (Integer) 
      # @param request_options [Monite::RequestOptions] 
      # @return [Monite::LineItemResponse]
      # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.payables.line_items.update_by_id(
#    line_item_id: "line_item_id",
#    payable_id: "payable_id",
#    request: {  }
#  )
      def update_by_id(line_item_id:, payable_id:, request:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/payables/#{line_item_id}/line_items/#{payable_id}"
end
        Monite::LineItemResponse.from_json(json_object: response.body)
      end
    end
    class AsyncLineItemsClient
    # @return [Monite::AsyncRequestClient] 
      attr_reader :request_client


      # @param request_client [Monite::RequestClient] 
      # @return [Monite::Payables::AsyncLineItemsClient]
      def initialize(request_client:)
        @request_client = request_client
      end
# Get a list of all line items related to a specific payable.
#  Related guide: [List all payable line
#  onite.com/accounts-payable/payables/line-items#list-all-line-items-of-a-payable)
#  See also:
#  [Manage line
#  items](https://docs.monite.com/accounts-payable/payables/line-items)
#  [Collect payables](https://docs.monite.com/accounts-payable/payables/collect)
      #
      # @param payable_id [String] 
      # @param order [Monite::OrderEnum] Sort order (ascending by default). Typically used together with the `sort`
#  parameter.
      # @param limit [Integer] The number of items (0 .. 100) to return in a single page of the response. The
#  response may contain fewer items if it is the last or only page.
      # @param pagination_token [String] A pagination token obtained from a previous call to this endpoint. Use it to get
#  the next or previous page of results for your initial query. If
#  `pagination_token` is specified, all other query parameters are ignored and
#  inferred from the initial query.
#  If not specified, the first page of results will be returned.
      # @param sort [Monite::LineItemCursorFields] The field to sort the results by. Typically used together with the `order`
#  parameter.
      # @param was_created_by_user_id [String] 
      # @param request_options [Monite::RequestOptions] 
      # @return [Monite::LineItemPaginationResponse]
      # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.payables.line_items.get(payable_id: "payable_id")
      def get(payable_id:, order: nil, limit: nil, pagination_token: nil, sort: nil, was_created_by_user_id: nil, request_options: nil)
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
  req.params = { **(request_options&.additional_query_parameters || {}), "order": order, "limit": limit, "pagination_token": pagination_token, "sort": sort, "was_created_by_user_id": was_created_by_user_id }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/payables/#{payable_id}/line_items"
end
          Monite::LineItemPaginationResponse.from_json(json_object: response.body)
        end
      end
# Add a new line item to a specific payable.
#  The `subtotal` and `total` fields of line items are automatically calculated
#  based on the `unit_price`,
#  `quantity`, and `tax` fields, therefore, are read-only and appear only in the
#  response schema. The field
#  `ledger_account_id` is required **only** for account integration, otherwise,
#  it is optional.
#  Related guide: [Add line items to a
#  ocs.monite.com/accounts-payable/payables/line-items#add-line-items-to-a-payable)
#  See also:
#  [Manage line
#  items](https://docs.monite.com/accounts-payable/payables/line-items)
#  [Collect payables](https://docs.monite.com/accounts-payable/payables/collect)
      #
      # @param payable_id [String] 
      # @param request [Hash] Request of type Monite::LineItemRequest, as a Hash
      #   * :accounting_tax_rate_id (String) 
      #   * :description (String) 
      #   * :ledger_account_id (String) 
      #   * :name (String) 
      #   * :quantity (Float) 
      #   * :tax (Integer) 
      #   * :unit (String) 
      #   * :unit_price (Integer) 
      # @param request_options [Monite::RequestOptions] 
      # @return [Monite::LineItemResponse]
      # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.payables.line_items.create(payable_id: "payable_id", request: {  })
      def create(payable_id:, request:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/payables/#{payable_id}/line_items"
end
          Monite::LineItemResponse.from_json(json_object: response.body)
        end
      end
# Replaces the information of all line items of a specific payable.
#  Related guide: [Replace all line
#  s://docs.monite.com/accounts-payable/payables/line-items#replace-all-line-items)
#  See also:
#  [Manage line
#  items](https://docs.monite.com/accounts-payable/payables/line-items)
#  [Collect payables](https://docs.monite.com/accounts-payable/payables/collect)
      #
      # @param payable_id [String] 
      # @param data [Array<Hash>] Request of type Array<Monite::LineItemInternalRequest>, as a Hash
      #   * :accounting_tax_rate_id (String) 
      #   * :description (String) 
      #   * :ledger_account_id (String) 
      #   * :name (String) 
      #   * :quantity (Float) 
      #   * :subtotal (Integer) 
      #   * :tax (Integer) 
      #   * :total (Integer) 
      #   * :unit (String) 
      #   * :unit_price (Integer) 
      # @param request_options [Monite::RequestOptions] 
      # @return [Monite::LineItemsReplaceResponse]
      # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.payables.line_items.replace(payable_id: "payable_id", data: [{  }])
      def replace(payable_id:, data:, request_options: nil)
        Async do
          response = @request_client.conn.put do | req |
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
  req.body = { **(request_options&.additional_body_parameters || {}), data: data }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/payables/#{payable_id}/line_items"
end
          Monite::LineItemsReplaceResponse.from_json(json_object: response.body)
        end
      end
# Get information about a specific line item with a given ID.
#  Related guide: [Retrieve a line
#  tps://docs.monite.com/accounts-payable/payables/line-items#retrieve-a-line-item)
#  See also:
#  [Manage line
#  items](https://docs.monite.com/accounts-payable/payables/line-items)
#  [Collect payables](https://docs.monite.com/accounts-payable/payables/collect)
      #
      # @param line_item_id [String] 
      # @param payable_id [String] 
      # @param request_options [Monite::RequestOptions] 
      # @return [Monite::LineItemResponse]
      # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.payables.line_items.get_by_id(line_item_id: "line_item_id", payable_id: "payable_id")
      def get_by_id(line_item_id:, payable_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/payables/#{line_item_id}/line_items/#{payable_id}"
end
          Monite::LineItemResponse.from_json(json_object: response.body)
        end
      end
# Delete the line item with the given ID.
#  Related guide: [Remove a line
#  https://docs.monite.com/accounts-payable/payables/line-items#remove-a-line-item)
#  See also:
#  [Manage line
#  items](https://docs.monite.com/accounts-payable/payables/line-items)
#  [Collect payables](https://docs.monite.com/accounts-payable/payables/collect)
      #
      # @param line_item_id [String] 
      # @param payable_id [String] 
      # @param request_options [Monite::RequestOptions] 
      # @return [Void]
      # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.payables.line_items.delete_by_id(line_item_id: "line_item_id", payable_id: "payable_id")
      def delete_by_id(line_item_id:, payable_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/payables/#{line_item_id}/line_items/#{payable_id}"
end
        end
      end
# Edits the information of a specific line item.
#  Related guide: [Update a line
#  https://docs.monite.com/accounts-payable/payables/line-items#update-a-line-item)
#  See also:
#  [Manage line
#  items](https://docs.monite.com/accounts-payable/payables/line-items)
#  [Collect payables](https://docs.monite.com/accounts-payable/payables/collect)
      #
      # @param line_item_id [String] 
      # @param payable_id [String] 
      # @param request [Hash] Request of type Monite::LineItemRequest, as a Hash
      #   * :accounting_tax_rate_id (String) 
      #   * :description (String) 
      #   * :ledger_account_id (String) 
      #   * :name (String) 
      #   * :quantity (Float) 
      #   * :tax (Integer) 
      #   * :unit (String) 
      #   * :unit_price (Integer) 
      # @param request_options [Monite::RequestOptions] 
      # @return [Monite::LineItemResponse]
      # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.payables.line_items.update_by_id(
#    line_item_id: "line_item_id",
#    payable_id: "payable_id",
#    request: {  }
#  )
      def update_by_id(line_item_id:, payable_id:, request:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/payables/#{line_item_id}/line_items/#{payable_id}"
end
          Monite::LineItemResponse.from_json(json_object: response.body)
        end
      end
    end
  end
end