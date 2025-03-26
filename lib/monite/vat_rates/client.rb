# frozen_string_literal: true
require_relative "../../requests"
require_relative "../types/product_service_type_enum"
require_relative "../types/vat_rate_list_response"
require "async"
require_relative "../../requests"

module Monite
  class VatRatesClient
  # @return [Monite::RequestClient] 
    attr_reader :request_client


    # @param request_client [Monite::RequestClient] 
    # @return [Monite::VatRatesClient]
    def initialize(request_client:)
      @request_client = request_client
    end
    # @param counterpart_address_id [String] 
    # @param counterpart_id [String] 
    # @param counterpart_vat_id_id [String] 
    # @param entity_vat_id_id [String] 
    # @param product_type [Monite::ProductServiceTypeEnum] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::VatRateListResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.vat_rates.get
    def get(counterpart_address_id: nil, counterpart_id: nil, counterpart_vat_id_id: nil, entity_vat_id_id: nil, product_type: nil, request_options: nil)
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
  req.params = { **(request_options&.additional_query_parameters || {}), "counterpart_address_id": counterpart_address_id, "counterpart_id": counterpart_id, "counterpart_vat_id_id": counterpart_vat_id_id, "entity_vat_id_id": entity_vat_id_id, "product_type": product_type }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/vat_rates"
end
      Monite::VatRateListResponse.from_json(json_object: response.body)
    end
  end
  class AsyncVatRatesClient
  # @return [Monite::AsyncRequestClient] 
    attr_reader :request_client


    # @param request_client [Monite::RequestClient] 
    # @return [Monite::AsyncVatRatesClient]
    def initialize(request_client:)
      @request_client = request_client
    end
    # @param counterpart_address_id [String] 
    # @param counterpart_id [String] 
    # @param counterpart_vat_id_id [String] 
    # @param entity_vat_id_id [String] 
    # @param product_type [Monite::ProductServiceTypeEnum] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::VatRateListResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.vat_rates.get
    def get(counterpart_address_id: nil, counterpart_id: nil, counterpart_vat_id_id: nil, entity_vat_id_id: nil, product_type: nil, request_options: nil)
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
  req.params = { **(request_options&.additional_query_parameters || {}), "counterpart_address_id": counterpart_address_id, "counterpart_id": counterpart_id, "counterpart_vat_id_id": counterpart_vat_id_id, "entity_vat_id_id": entity_vat_id_id, "product_type": product_type }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/vat_rates"
end
        Monite::VatRateListResponse.from_json(json_object: response.body)
      end
    end
  end
end