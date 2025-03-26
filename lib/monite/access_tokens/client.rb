# frozen_string_literal: true
require_relative "../../requests"
require_relative "../types/message_response"
require_relative "../types/grant_type"
require_relative "../types/access_token_response"
require "async"
require "async"
require_relative "../../requests"

module Monite
  class AccessTokensClient
  # @return [Monite::RequestClient] 
    attr_reader :request_client


    # @param request_client [Monite::RequestClient] 
    # @return [Monite::AccessTokensClient]
    def initialize(request_client:)
      @request_client = request_client
    end
# Revoke an existing token immediately.
    #
    # @param client_id [String] 
    # @param client_secret [String] 
    # @param token [String] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::MessageResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.access_tokens.revoke(
#    client_id: "client_id",
#    client_secret: "client_secret",
#    token: "token"
#  )
    def revoke(client_id:, client_secret:, token:, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), client_id: client_id, client_secret: client_secret, token: token }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/auth/revoke"
end
      Monite::MessageResponse.from_json(json_object: response.body)
    end
# Create a new access token based on client ID and client secret.
    #
    # @param client_id [String] 
    # @param client_secret [String] 
    # @param entity_user_id [String] 
    # @param grant_type [Monite::GrantType] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::AccessTokenResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.access_tokens.create(
#    client_id: "client_id",
#    client_secret: "client_secret",
#    grant_type: CLIENT_CREDENTIALS
#  )
    def create(client_id:, client_secret:, entity_user_id: nil, grant_type:, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), client_id: client_id, client_secret: client_secret, entity_user_id: entity_user_id, grant_type: grant_type }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/auth/token"
end
      Monite::AccessTokenResponse.from_json(json_object: response.body)
    end
  end
  class AsyncAccessTokensClient
  # @return [Monite::AsyncRequestClient] 
    attr_reader :request_client


    # @param request_client [Monite::RequestClient] 
    # @return [Monite::AsyncAccessTokensClient]
    def initialize(request_client:)
      @request_client = request_client
    end
# Revoke an existing token immediately.
    #
    # @param client_id [String] 
    # @param client_secret [String] 
    # @param token [String] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::MessageResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.access_tokens.revoke(
#    client_id: "client_id",
#    client_secret: "client_secret",
#    token: "token"
#  )
    def revoke(client_id:, client_secret:, token:, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), client_id: client_id, client_secret: client_secret, token: token }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/auth/revoke"
end
        Monite::MessageResponse.from_json(json_object: response.body)
      end
    end
# Create a new access token based on client ID and client secret.
    #
    # @param client_id [String] 
    # @param client_secret [String] 
    # @param entity_user_id [String] 
    # @param grant_type [Monite::GrantType] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::AccessTokenResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.access_tokens.create(
#    client_id: "client_id",
#    client_secret: "client_secret",
#    grant_type: CLIENT_CREDENTIALS
#  )
    def create(client_id:, client_secret:, entity_user_id: nil, grant_type:, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), client_id: client_id, client_secret: client_secret, entity_user_id: entity_user_id, grant_type: grant_type }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/auth/token"
end
        Monite::AccessTokenResponse.from_json(json_object: response.body)
      end
    end
  end
end