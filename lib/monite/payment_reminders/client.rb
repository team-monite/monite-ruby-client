# frozen_string_literal: true
require_relative "../../requests"
require_relative "../types/get_all_payment_reminders"
require_relative "../types/recipients"
require_relative "../types/reminder"
require_relative "../types/payment_reminder_response"
require "async"
require "async"
require "async"
require "async"
require "async"
require_relative "../../requests"

module Monite
  class PaymentRemindersClient
  # @return [Monite::RequestClient] 
    attr_reader :request_client


    # @param request_client [Monite::RequestClient] 
    # @return [Monite::PaymentRemindersClient]
    def initialize(request_client:)
      @request_client = request_client
    end
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::GetAllPaymentReminders]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.payment_reminders.get
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
  req.url "#{@request_client.get_url(request_options: request_options)}/payment_reminders"
end
      Monite::GetAllPaymentReminders.from_json(json_object: response.body)
    end
    # @param name [String] 
    # @param recipients [Hash] Request of type Monite::Recipients, as a Hash
    #   * :bcc (Array<String>) 
    #   * :cc (Array<String>) 
    #   * :to (Array<String>) 
    # @param term_1_reminder [Hash] Reminder to send for first payment termRequest of type Monite::Reminder, as a Hash
    #   * :body (String) 
    #   * :days_before (Integer) 
    #   * :subject (String) 
    # @param term_2_reminder [Hash] Reminder to send for second payment termRequest of type Monite::Reminder, as a Hash
    #   * :body (String) 
    #   * :days_before (Integer) 
    #   * :subject (String) 
    # @param term_final_reminder [Hash] Reminder to send for final payment termRequest of type Monite::Reminder, as a Hash
    #   * :body (String) 
    #   * :days_before (Integer) 
    #   * :subject (String) 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::PaymentReminderResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.payment_reminders.create(name: "name")
    def create(name:, recipients: nil, term_1_reminder: nil, term_2_reminder: nil, term_final_reminder: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), name: name, recipients: recipients, term_1_reminder: term_1_reminder, term_2_reminder: term_2_reminder, term_final_reminder: term_final_reminder }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/payment_reminders"
end
      Monite::PaymentReminderResponse.from_json(json_object: response.body)
    end
    # @param payment_reminder_id [String] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::PaymentReminderResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.payment_reminders.get_by_id(payment_reminder_id: "payment_reminder_id")
    def get_by_id(payment_reminder_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/payment_reminders/#{payment_reminder_id}"
end
      Monite::PaymentReminderResponse.from_json(json_object: response.body)
    end
    # @param payment_reminder_id [String] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Void]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.payment_reminders.delete_by_id(payment_reminder_id: "payment_reminder_id")
    def delete_by_id(payment_reminder_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/payment_reminders/#{payment_reminder_id}"
end
    end
    # @param payment_reminder_id [String] 
    # @param name [String] 
    # @param recipients [Hash] Request of type Monite::Recipients, as a Hash
    #   * :bcc (Array<String>) 
    #   * :cc (Array<String>) 
    #   * :to (Array<String>) 
    # @param term_1_reminder [Hash] Reminder to send for first payment termRequest of type Monite::Reminder, as a Hash
    #   * :body (String) 
    #   * :days_before (Integer) 
    #   * :subject (String) 
    # @param term_2_reminder [Hash] Reminder to send for second payment termRequest of type Monite::Reminder, as a Hash
    #   * :body (String) 
    #   * :days_before (Integer) 
    #   * :subject (String) 
    # @param term_final_reminder [Hash] Reminder to send for final payment termRequest of type Monite::Reminder, as a Hash
    #   * :body (String) 
    #   * :days_before (Integer) 
    #   * :subject (String) 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::PaymentReminderResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.payment_reminders.update_by_id(payment_reminder_id: "payment_reminder_id")
    def update_by_id(payment_reminder_id:, name: nil, recipients: nil, term_1_reminder: nil, term_2_reminder: nil, term_final_reminder: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), name: name, recipients: recipients, term_1_reminder: term_1_reminder, term_2_reminder: term_2_reminder, term_final_reminder: term_final_reminder }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/payment_reminders/#{payment_reminder_id}"
end
      Monite::PaymentReminderResponse.from_json(json_object: response.body)
    end
  end
  class AsyncPaymentRemindersClient
  # @return [Monite::AsyncRequestClient] 
    attr_reader :request_client


    # @param request_client [Monite::RequestClient] 
    # @return [Monite::AsyncPaymentRemindersClient]
    def initialize(request_client:)
      @request_client = request_client
    end
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::GetAllPaymentReminders]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.payment_reminders.get
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
  req.url "#{@request_client.get_url(request_options: request_options)}/payment_reminders"
end
        Monite::GetAllPaymentReminders.from_json(json_object: response.body)
      end
    end
    # @param name [String] 
    # @param recipients [Hash] Request of type Monite::Recipients, as a Hash
    #   * :bcc (Array<String>) 
    #   * :cc (Array<String>) 
    #   * :to (Array<String>) 
    # @param term_1_reminder [Hash] Reminder to send for first payment termRequest of type Monite::Reminder, as a Hash
    #   * :body (String) 
    #   * :days_before (Integer) 
    #   * :subject (String) 
    # @param term_2_reminder [Hash] Reminder to send for second payment termRequest of type Monite::Reminder, as a Hash
    #   * :body (String) 
    #   * :days_before (Integer) 
    #   * :subject (String) 
    # @param term_final_reminder [Hash] Reminder to send for final payment termRequest of type Monite::Reminder, as a Hash
    #   * :body (String) 
    #   * :days_before (Integer) 
    #   * :subject (String) 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::PaymentReminderResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.payment_reminders.create(name: "name")
    def create(name:, recipients: nil, term_1_reminder: nil, term_2_reminder: nil, term_final_reminder: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), name: name, recipients: recipients, term_1_reminder: term_1_reminder, term_2_reminder: term_2_reminder, term_final_reminder: term_final_reminder }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/payment_reminders"
end
        Monite::PaymentReminderResponse.from_json(json_object: response.body)
      end
    end
    # @param payment_reminder_id [String] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::PaymentReminderResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.payment_reminders.get_by_id(payment_reminder_id: "payment_reminder_id")
    def get_by_id(payment_reminder_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/payment_reminders/#{payment_reminder_id}"
end
        Monite::PaymentReminderResponse.from_json(json_object: response.body)
      end
    end
    # @param payment_reminder_id [String] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Void]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.payment_reminders.delete_by_id(payment_reminder_id: "payment_reminder_id")
    def delete_by_id(payment_reminder_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/payment_reminders/#{payment_reminder_id}"
end
      end
    end
    # @param payment_reminder_id [String] 
    # @param name [String] 
    # @param recipients [Hash] Request of type Monite::Recipients, as a Hash
    #   * :bcc (Array<String>) 
    #   * :cc (Array<String>) 
    #   * :to (Array<String>) 
    # @param term_1_reminder [Hash] Reminder to send for first payment termRequest of type Monite::Reminder, as a Hash
    #   * :body (String) 
    #   * :days_before (Integer) 
    #   * :subject (String) 
    # @param term_2_reminder [Hash] Reminder to send for second payment termRequest of type Monite::Reminder, as a Hash
    #   * :body (String) 
    #   * :days_before (Integer) 
    #   * :subject (String) 
    # @param term_final_reminder [Hash] Reminder to send for final payment termRequest of type Monite::Reminder, as a Hash
    #   * :body (String) 
    #   * :days_before (Integer) 
    #   * :subject (String) 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::PaymentReminderResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.payment_reminders.update_by_id(payment_reminder_id: "payment_reminder_id")
    def update_by_id(payment_reminder_id:, name: nil, recipients: nil, term_1_reminder: nil, term_2_reminder: nil, term_final_reminder: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), name: name, recipients: recipients, term_1_reminder: term_1_reminder, term_2_reminder: term_2_reminder, term_final_reminder: term_final_reminder }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/payment_reminders/#{payment_reminder_id}"
end
        Monite::PaymentReminderResponse.from_json(json_object: response.body)
      end
    end
  end
end