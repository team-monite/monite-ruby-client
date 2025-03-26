# frozen_string_literal: true
require_relative "../../requests"
require_relative "../types/all_overdue_reminders_response"
require_relative "../types/recipients"
require_relative "../types/overdue_reminder_term"
require_relative "../types/overdue_reminder_response"
require "async"
require "async"
require "async"
require "async"
require "async"
require_relative "../../requests"

module Monite
  class OverdueRemindersClient
  # @return [Monite::RequestClient] 
    attr_reader :request_client


    # @param request_client [Monite::RequestClient] 
    # @return [Monite::OverdueRemindersClient]
    def initialize(request_client:)
      @request_client = request_client
    end
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::AllOverdueRemindersResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.overdue_reminders.get
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
  req.url "#{@request_client.get_url(request_options: request_options)}/overdue_reminders"
end
      Monite::AllOverdueRemindersResponse.from_json(json_object: response.body)
    end
    # @param name [String] 
    # @param recipients [Hash] Request of type Monite::Recipients, as a Hash
    #   * :bcc (Array<String>) 
    #   * :cc (Array<String>) 
    #   * :to (Array<String>) 
    # @param terms [Array<Hash>] Overdue reminder terms to send for paymentRequest of type Array<Monite::OverdueReminderTerm>, as a Hash
    #   * :body (String) 
    #   * :days_after (Integer) 
    #   * :subject (String) 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::OverdueReminderResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.overdue_reminders.create(name: "name")
    def create(name:, recipients: nil, terms: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), name: name, recipients: recipients, terms: terms }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/overdue_reminders"
end
      Monite::OverdueReminderResponse.from_json(json_object: response.body)
    end
    # @param overdue_reminder_id [String] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::OverdueReminderResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.overdue_reminders.get_by_id(overdue_reminder_id: "overdue_reminder_id")
    def get_by_id(overdue_reminder_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/overdue_reminders/#{overdue_reminder_id}"
end
      Monite::OverdueReminderResponse.from_json(json_object: response.body)
    end
    # @param overdue_reminder_id [String] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Void]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.overdue_reminders.delete_by_id(overdue_reminder_id: "overdue_reminder_id")
    def delete_by_id(overdue_reminder_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/overdue_reminders/#{overdue_reminder_id}"
end
    end
    # @param overdue_reminder_id [String] 
    # @param name [String] 
    # @param recipients [Hash] Request of type Monite::Recipients, as a Hash
    #   * :bcc (Array<String>) 
    #   * :cc (Array<String>) 
    #   * :to (Array<String>) 
    # @param terms [Array<Hash>] Overdue reminder terms to send for paymentRequest of type Array<Monite::OverdueReminderTerm>, as a Hash
    #   * :body (String) 
    #   * :days_after (Integer) 
    #   * :subject (String) 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::OverdueReminderResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.overdue_reminders.update_by_id(overdue_reminder_id: "overdue_reminder_id")
    def update_by_id(overdue_reminder_id:, name: nil, recipients: nil, terms: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), name: name, recipients: recipients, terms: terms }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/overdue_reminders/#{overdue_reminder_id}"
end
      Monite::OverdueReminderResponse.from_json(json_object: response.body)
    end
  end
  class AsyncOverdueRemindersClient
  # @return [Monite::AsyncRequestClient] 
    attr_reader :request_client


    # @param request_client [Monite::RequestClient] 
    # @return [Monite::AsyncOverdueRemindersClient]
    def initialize(request_client:)
      @request_client = request_client
    end
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::AllOverdueRemindersResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.overdue_reminders.get
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
  req.url "#{@request_client.get_url(request_options: request_options)}/overdue_reminders"
end
        Monite::AllOverdueRemindersResponse.from_json(json_object: response.body)
      end
    end
    # @param name [String] 
    # @param recipients [Hash] Request of type Monite::Recipients, as a Hash
    #   * :bcc (Array<String>) 
    #   * :cc (Array<String>) 
    #   * :to (Array<String>) 
    # @param terms [Array<Hash>] Overdue reminder terms to send for paymentRequest of type Array<Monite::OverdueReminderTerm>, as a Hash
    #   * :body (String) 
    #   * :days_after (Integer) 
    #   * :subject (String) 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::OverdueReminderResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.overdue_reminders.create(name: "name")
    def create(name:, recipients: nil, terms: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), name: name, recipients: recipients, terms: terms }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/overdue_reminders"
end
        Monite::OverdueReminderResponse.from_json(json_object: response.body)
      end
    end
    # @param overdue_reminder_id [String] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::OverdueReminderResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.overdue_reminders.get_by_id(overdue_reminder_id: "overdue_reminder_id")
    def get_by_id(overdue_reminder_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/overdue_reminders/#{overdue_reminder_id}"
end
        Monite::OverdueReminderResponse.from_json(json_object: response.body)
      end
    end
    # @param overdue_reminder_id [String] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Void]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.overdue_reminders.delete_by_id(overdue_reminder_id: "overdue_reminder_id")
    def delete_by_id(overdue_reminder_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/overdue_reminders/#{overdue_reminder_id}"
end
      end
    end
    # @param overdue_reminder_id [String] 
    # @param name [String] 
    # @param recipients [Hash] Request of type Monite::Recipients, as a Hash
    #   * :bcc (Array<String>) 
    #   * :cc (Array<String>) 
    #   * :to (Array<String>) 
    # @param terms [Array<Hash>] Overdue reminder terms to send for paymentRequest of type Array<Monite::OverdueReminderTerm>, as a Hash
    #   * :body (String) 
    #   * :days_after (Integer) 
    #   * :subject (String) 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::OverdueReminderResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.overdue_reminders.update_by_id(overdue_reminder_id: "overdue_reminder_id")
    def update_by_id(overdue_reminder_id:, name: nil, recipients: nil, terms: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), name: name, recipients: recipients, terms: terms }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/overdue_reminders/#{overdue_reminder_id}"
end
        Monite::OverdueReminderResponse.from_json(json_object: response.body)
      end
    end
  end
end