# frozen_string_literal: true
require_relative "environment"
require "faraday"
require "faraday/multipart"
require "faraday/retry"
require "faraday"
require "faraday"
require "faraday/multipart"
require "async/http/faraday"
require "faraday/retry"

module Monite
  class RequestClient
  # @return [Faraday] 
    attr_reader :conn
  # @return [String] 
    attr_reader :base_url
  # @return [String] 
    attr_reader :token
  # @return [String] 
    attr_reader :default_environment


    # @param base_url [String] 
    # @param environment [Monite::Environment] 
    # @param max_retries [Long] The number of times to retry a failed request, defaults to 2.
    # @param timeout_in_seconds [Long] 
    # @param token [String] 
    # @param monite_version [String] 
    # @param monite_entity_id [String] The ID of the entity that owns the requested resource.
    # @return [Monite::RequestClient]
    def initialize(base_url: nil, environment: Monite::Environment::SANDBOX, max_retries: nil, timeout_in_seconds: nil, token:, monite_version:, monite_entity_id: nil)
      @default_environment = environment
      @base_url = environment || base_url
      @token = "Bearer #{token}"
      @headers = {  }
      unless monite_version.nil?
        @headers["x-monite-version"] = monite_version
      end
      unless monite_entity_id.nil?
        @headers["x-monite-entity-id"] = monite_entity_id
      end
      @conn = Faraday.new(headers: @headers) do | faraday |
  faraday.request :multipart
  faraday.request :json
  faraday.response :raise_error, include_request: true
  unless max_retries.nil?
    faraday.request :retry ,  { max: max_retries }
  end
  unless timeout_in_seconds.nil?
    faraday.options.timeout = timeout_in_seconds
  end
end
    end
    # @param request_options [Monite::RequestOptions] 
    # @return [String]
    def get_url(request_options: nil)
      request_options&.base_url || @default_environment || @base_url
    end
    # @return [Hash{String => String}]
    def get_headers
      headers = { "X-Fern-Language": 'Ruby', "X-Fern-SDK-Name": 'monite', "X-Fern-SDK-Version": '0.1.0' }
      headers["Authorization"] = ((@token.is_a? Method) ? @token.call : @token) unless @token.nil?
 headers
    end
  end
  class AsyncRequestClient
  # @return [Faraday] 
    attr_reader :conn
  # @return [String] 
    attr_reader :base_url
  # @return [String] 
    attr_reader :token
  # @return [String] 
    attr_reader :default_environment


    # @param base_url [String] 
    # @param environment [Monite::Environment] 
    # @param max_retries [Long] The number of times to retry a failed request, defaults to 2.
    # @param timeout_in_seconds [Long] 
    # @param token [String] 
    # @param monite_version [String] 
    # @param monite_entity_id [String] The ID of the entity that owns the requested resource.
    # @return [Monite::AsyncRequestClient]
    def initialize(base_url: nil, environment: Monite::Environment::SANDBOX, max_retries: nil, timeout_in_seconds: nil, token:, monite_version:, monite_entity_id: nil)
      @default_environment = environment
      @base_url = environment || base_url
      @token = "Bearer #{token}"
      @headers = {  }
      unless monite_version.nil?
        @headers["x-monite-version"] = monite_version
      end
      unless monite_entity_id.nil?
        @headers["x-monite-entity-id"] = monite_entity_id
      end
      @conn = Faraday.new(headers: @headers) do | faraday |
  faraday.request :multipart
  faraday.request :json
  faraday.response :raise_error, include_request: true
  faraday.adapter :async_http
  unless max_retries.nil?
    faraday.request :retry ,  { max: max_retries }
  end
  unless timeout_in_seconds.nil?
    faraday.options.timeout = timeout_in_seconds
  end
end
    end
    # @param request_options [Monite::RequestOptions] 
    # @return [String]
    def get_url(request_options: nil)
      request_options&.base_url || @default_environment || @base_url
    end
    # @return [Hash{String => String}]
    def get_headers
      headers = { "X-Fern-Language": 'Ruby', "X-Fern-SDK-Name": 'monite', "X-Fern-SDK-Version": '0.1.0' }
      headers["Authorization"] = ((@token.is_a? Method) ? @token.call : @token) unless @token.nil?
 headers
    end
  end
# Additional options for request-specific configuration when calling APIs via the
#  SDK.
  class RequestOptions
  # @return [String] 
    attr_reader :base_url
  # @return [String] 
    attr_reader :token
  # @return [String] 
    attr_reader :monite_version
  # @return [String] The ID of the entity that owns the requested resource.
    attr_reader :monite_entity_id
  # @return [Hash{String => Object}] 
    attr_reader :additional_headers
  # @return [Hash{String => Object}] 
    attr_reader :additional_query_parameters
  # @return [Hash{String => Object}] 
    attr_reader :additional_body_parameters
  # @return [Long] 
    attr_reader :timeout_in_seconds


    # @param base_url [String] 
    # @param token [String] 
    # @param monite_version [String] 
    # @param monite_entity_id [String] The ID of the entity that owns the requested resource.
    # @param additional_headers [Hash{String => Object}] 
    # @param additional_query_parameters [Hash{String => Object}] 
    # @param additional_body_parameters [Hash{String => Object}] 
    # @param timeout_in_seconds [Long] 
    # @return [Monite::RequestOptions]
    def initialize(base_url: nil, token: nil, monite_version: nil, monite_entity_id: nil, additional_headers: nil, additional_query_parameters: nil, additional_body_parameters: nil, timeout_in_seconds: nil)
      @base_url = base_url
      @token = token
      @monite_version = monite_version
      @monite_entity_id = monite_entity_id
      @additional_headers = additional_headers
      @additional_query_parameters = additional_query_parameters
      @additional_body_parameters = additional_body_parameters
      @timeout_in_seconds = timeout_in_seconds
    end
  end
# Additional options for request-specific configuration when calling APIs via the
#  SDK.
  class IdempotencyRequestOptions
  # @return [String] 
    attr_reader :base_url
  # @return [String] 
    attr_reader :token
  # @return [String] 
    attr_reader :monite_version
  # @return [String] The ID of the entity that owns the requested resource.
    attr_reader :monite_entity_id
  # @return [Hash{String => Object}] 
    attr_reader :additional_headers
  # @return [Hash{String => Object}] 
    attr_reader :additional_query_parameters
  # @return [Hash{String => Object}] 
    attr_reader :additional_body_parameters
  # @return [Long] 
    attr_reader :timeout_in_seconds


    # @param base_url [String] 
    # @param token [String] 
    # @param monite_version [String] 
    # @param monite_entity_id [String] The ID of the entity that owns the requested resource.
    # @param additional_headers [Hash{String => Object}] 
    # @param additional_query_parameters [Hash{String => Object}] 
    # @param additional_body_parameters [Hash{String => Object}] 
    # @param timeout_in_seconds [Long] 
    # @return [Monite::IdempotencyRequestOptions]
    def initialize(base_url: nil, token: nil, monite_version: nil, monite_entity_id: nil, additional_headers: nil, additional_query_parameters: nil, additional_body_parameters: nil, timeout_in_seconds: nil)
      @base_url = base_url
      @token = token
      @monite_version = monite_version
      @monite_entity_id = monite_entity_id
      @additional_headers = additional_headers
      @additional_query_parameters = additional_query_parameters
      @additional_body_parameters = additional_body_parameters
      @timeout_in_seconds = timeout_in_seconds
    end
  end
end