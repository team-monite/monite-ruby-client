# frozen_string_literal: true
require_relative "../../requests"
require_relative "../types/get_all_recurrences"
require_relative "../types/day_of_month"
require_relative "../types/recipients"
require_relative "../types/recurrence"
require "async"
require "async"
require "async"
require "async"
require "async"
require_relative "../../requests"

module Monite
  class RecurrencesClient
  # @return [Monite::RequestClient] 
    attr_reader :request_client


    # @param request_client [Monite::RequestClient] 
    # @return [Monite::RecurrencesClient]
    def initialize(request_client:)
      @request_client = request_client
    end
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::GetAllRecurrences]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.recurrences.get
    def get(request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/recurrences"
end
      Monite::GetAllRecurrences.from_json(json_object: response.body)
    end
    # @param body_text [String] 
    # @param day_of_month [Monite::DayOfMonth] 
    # @param end_month [Integer] 
    # @param end_year [Integer] 
    # @param invoice_id [String] 
    # @param recipients [Hash] Request of type Monite::Recipients, as a Hash
    #   * :bcc (Array<String>) 
    #   * :cc (Array<String>) 
    #   * :to (Array<String>) 
    # @param start_month [Integer] 
    # @param start_year [Integer] 
    # @param subject_text [String] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::Recurrence]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.recurrences.create(
#    day_of_month: FIRST_DAY,
#    end_month: 1,
#    end_year: 1,
#    invoice_id: "invoice_id",
#    start_month: 1,
#    start_year: 1
#  )
    def create(body_text: nil, day_of_month:, end_month:, end_year:, invoice_id:, recipients: nil, start_month:, start_year:, subject_text: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), body_text: body_text, day_of_month: day_of_month, end_month: end_month, end_year: end_year, invoice_id: invoice_id, recipients: recipients, start_month: start_month, start_year: start_year, subject_text: subject_text }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/recurrences"
end
      Monite::Recurrence.from_json(json_object: response.body)
    end
    # @param recurrence_id [String] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::Recurrence]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.recurrences.get_by_id(recurrence_id: "recurrence_id")
    def get_by_id(recurrence_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/recurrences/#{recurrence_id}"
end
      Monite::Recurrence.from_json(json_object: response.body)
    end
    # @param recurrence_id [String] 
    # @param body_text [String] 
    # @param day_of_month [Monite::DayOfMonth] 
    # @param end_month [Integer] 
    # @param end_year [Integer] 
    # @param recipients [Hash] Request of type Monite::Recipients, as a Hash
    #   * :bcc (Array<String>) 
    #   * :cc (Array<String>) 
    #   * :to (Array<String>) 
    # @param subject_text [String] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::Recurrence]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.recurrences.update_by_id(recurrence_id: "recurrence_id")
    def update_by_id(recurrence_id:, body_text: nil, day_of_month: nil, end_month: nil, end_year: nil, recipients: nil, subject_text: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), body_text: body_text, day_of_month: day_of_month, end_month: end_month, end_year: end_year, recipients: recipients, subject_text: subject_text }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/recurrences/#{recurrence_id}"
end
      Monite::Recurrence.from_json(json_object: response.body)
    end
    # @param recurrence_id [String] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Void]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.recurrences.cancel_by_id(recurrence_id: "recurrence_id")
    def cancel_by_id(recurrence_id:, request_options: nil)
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
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/recurrences/#{recurrence_id}/cancel"
end
    end
  end
  class AsyncRecurrencesClient
  # @return [Monite::AsyncRequestClient] 
    attr_reader :request_client


    # @param request_client [Monite::RequestClient] 
    # @return [Monite::AsyncRecurrencesClient]
    def initialize(request_client:)
      @request_client = request_client
    end
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::GetAllRecurrences]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.recurrences.get
    def get(request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/recurrences"
end
        Monite::GetAllRecurrences.from_json(json_object: response.body)
      end
    end
    # @param body_text [String] 
    # @param day_of_month [Monite::DayOfMonth] 
    # @param end_month [Integer] 
    # @param end_year [Integer] 
    # @param invoice_id [String] 
    # @param recipients [Hash] Request of type Monite::Recipients, as a Hash
    #   * :bcc (Array<String>) 
    #   * :cc (Array<String>) 
    #   * :to (Array<String>) 
    # @param start_month [Integer] 
    # @param start_year [Integer] 
    # @param subject_text [String] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::Recurrence]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.recurrences.create(
#    day_of_month: FIRST_DAY,
#    end_month: 1,
#    end_year: 1,
#    invoice_id: "invoice_id",
#    start_month: 1,
#    start_year: 1
#  )
    def create(body_text: nil, day_of_month:, end_month:, end_year:, invoice_id:, recipients: nil, start_month:, start_year:, subject_text: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), body_text: body_text, day_of_month: day_of_month, end_month: end_month, end_year: end_year, invoice_id: invoice_id, recipients: recipients, start_month: start_month, start_year: start_year, subject_text: subject_text }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/recurrences"
end
        Monite::Recurrence.from_json(json_object: response.body)
      end
    end
    # @param recurrence_id [String] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::Recurrence]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.recurrences.get_by_id(recurrence_id: "recurrence_id")
    def get_by_id(recurrence_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/recurrences/#{recurrence_id}"
end
        Monite::Recurrence.from_json(json_object: response.body)
      end
    end
    # @param recurrence_id [String] 
    # @param body_text [String] 
    # @param day_of_month [Monite::DayOfMonth] 
    # @param end_month [Integer] 
    # @param end_year [Integer] 
    # @param recipients [Hash] Request of type Monite::Recipients, as a Hash
    #   * :bcc (Array<String>) 
    #   * :cc (Array<String>) 
    #   * :to (Array<String>) 
    # @param subject_text [String] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::Recurrence]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.recurrences.update_by_id(recurrence_id: "recurrence_id")
    def update_by_id(recurrence_id:, body_text: nil, day_of_month: nil, end_month: nil, end_year: nil, recipients: nil, subject_text: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), body_text: body_text, day_of_month: day_of_month, end_month: end_month, end_year: end_year, recipients: recipients, subject_text: subject_text }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/recurrences/#{recurrence_id}"
end
        Monite::Recurrence.from_json(json_object: response.body)
      end
    end
    # @param recurrence_id [String] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Void]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.recurrences.cancel_by_id(recurrence_id: "recurrence_id")
    def cancel_by_id(recurrence_id:, request_options: nil)
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
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/recurrences/#{recurrence_id}/cancel"
end
      end
    end
  end
end