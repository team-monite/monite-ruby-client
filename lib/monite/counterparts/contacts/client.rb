# frozen_string_literal: true
require_relative "../../../requests"
require_relative "../../types/counterpart_contacts_resource_list"
require_relative "../../types/counterpart_address"
require_relative "../../types/counterpart_contact_response"
require "async"
require "async"
require "async"
require "async"
require "async"
require "async"
require_relative "../../../requests"

module Monite
  module Counterparts
    class ContactsClient
    # @return [Monite::RequestClient] 
      attr_reader :request_client


      # @param request_client [Monite::RequestClient] 
      # @return [Monite::Counterparts::ContactsClient]
      def initialize(request_client:)
        @request_client = request_client
      end
      # @param counterpart_id [String] 
      # @param request_options [Monite::RequestOptions] 
      # @return [Monite::CounterpartContactsResourceList]
      # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.counterparts.contacts.get(counterpart_id: "counterpart_id")
      def get(counterpart_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/counterparts/#{counterpart_id}/contacts"
end
        Monite::CounterpartContactsResourceList.from_json(json_object: response.body)
      end
      # @param counterpart_id [String] 
      # @param address [Hash] The address of a contact person.Request of type Monite::CounterpartAddress, as a Hash
      #   * :city (String) 
      #   * :country (Monite::AllowedCountries) 
      #   * :line_1 (String) 
      #   * :line_2 (String) 
      #   * :postal_code (String) 
      #   * :state (String) 
      # @param email [String] The email address of a contact person.
      # @param first_name [String] The first name of a contact person.
      # @param last_name [String] The last name of a contact person.
      # @param phone [String] The phone number of a contact person
      # @param title [String] The title or honorific of a contact person. Examples: Mr., Ms., Dr., Prof.
      # @param request_options [Monite::RequestOptions] 
      # @return [Monite::CounterpartContactResponse]
      # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.counterparts.contacts.create(
#    counterpart_id: "counterpart_id",
#    address: { city: "Berlin", country: AF, line_1: "Flughafenstrasse 52", postal_code: "10115" },
#    first_name: "Mary",
#    last_name: "O'Brien"
#  )
      def create(counterpart_id:, address:, email: nil, first_name:, last_name:, phone: nil, title: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), address: address, email: email, first_name: first_name, last_name: last_name, phone: phone, title: title }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/counterparts/#{counterpart_id}/contacts"
end
        Monite::CounterpartContactResponse.from_json(json_object: response.body)
      end
      # @param contact_id [String] 
      # @param counterpart_id [String] 
      # @param request_options [Monite::RequestOptions] 
      # @return [Monite::CounterpartContactResponse]
      # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.counterparts.contacts.get_by_id(contact_id: "contact_id", counterpart_id: "counterpart_id")
      def get_by_id(contact_id:, counterpart_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/counterparts/#{contact_id}/contacts/#{counterpart_id}"
end
        Monite::CounterpartContactResponse.from_json(json_object: response.body)
      end
      # @param contact_id [String] 
      # @param counterpart_id [String] 
      # @param request_options [Monite::RequestOptions] 
      # @return [Void]
      # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.counterparts.contacts.delete_by_id(contact_id: "contact_id", counterpart_id: "counterpart_id")
      def delete_by_id(contact_id:, counterpart_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/counterparts/#{contact_id}/contacts/#{counterpart_id}"
end
      end
      # @param contact_id [String] 
      # @param counterpart_id [String] 
      # @param address [Hash] The address of a contact person.Request of type Monite::CounterpartAddress, as a Hash
      #   * :city (String) 
      #   * :country (Monite::AllowedCountries) 
      #   * :line_1 (String) 
      #   * :line_2 (String) 
      #   * :postal_code (String) 
      #   * :state (String) 
      # @param email [String] The email address of a contact person.
      # @param first_name [String] The first name of a contact person.
      # @param last_name [String] The last name of a contact person.
      # @param phone [String] The phone number of a contact person
      # @param title [String] The title or honorific of a contact person. Examples: Mr., Ms., Dr., Prof.
      # @param request_options [Monite::RequestOptions] 
      # @return [Monite::CounterpartContactResponse]
      # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.counterparts.contacts.update_by_id(contact_id: "contact_id", counterpart_id: "counterpart_id")
      def update_by_id(contact_id:, counterpart_id:, address: nil, email: nil, first_name: nil, last_name: nil, phone: nil, title: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), address: address, email: email, first_name: first_name, last_name: last_name, phone: phone, title: title }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/counterparts/#{contact_id}/contacts/#{counterpart_id}"
end
        Monite::CounterpartContactResponse.from_json(json_object: response.body)
      end
      # @param contact_id [String] 
      # @param counterpart_id [String] 
      # @param request_options [Monite::RequestOptions] 
      # @return [Monite::CounterpartContactResponse]
      # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.counterparts.contacts.make_default_by_id(contact_id: "contact_id", counterpart_id: "counterpart_id")
      def make_default_by_id(contact_id:, counterpart_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/counterparts/#{contact_id}/contacts/#{counterpart_id}/make_default"
end
        Monite::CounterpartContactResponse.from_json(json_object: response.body)
      end
    end
    class AsyncContactsClient
    # @return [Monite::AsyncRequestClient] 
      attr_reader :request_client


      # @param request_client [Monite::RequestClient] 
      # @return [Monite::Counterparts::AsyncContactsClient]
      def initialize(request_client:)
        @request_client = request_client
      end
      # @param counterpart_id [String] 
      # @param request_options [Monite::RequestOptions] 
      # @return [Monite::CounterpartContactsResourceList]
      # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.counterparts.contacts.get(counterpart_id: "counterpart_id")
      def get(counterpart_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/counterparts/#{counterpart_id}/contacts"
end
          Monite::CounterpartContactsResourceList.from_json(json_object: response.body)
        end
      end
      # @param counterpart_id [String] 
      # @param address [Hash] The address of a contact person.Request of type Monite::CounterpartAddress, as a Hash
      #   * :city (String) 
      #   * :country (Monite::AllowedCountries) 
      #   * :line_1 (String) 
      #   * :line_2 (String) 
      #   * :postal_code (String) 
      #   * :state (String) 
      # @param email [String] The email address of a contact person.
      # @param first_name [String] The first name of a contact person.
      # @param last_name [String] The last name of a contact person.
      # @param phone [String] The phone number of a contact person
      # @param title [String] The title or honorific of a contact person. Examples: Mr., Ms., Dr., Prof.
      # @param request_options [Monite::RequestOptions] 
      # @return [Monite::CounterpartContactResponse]
      # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.counterparts.contacts.create(
#    counterpart_id: "counterpart_id",
#    address: { city: "Berlin", country: AF, line_1: "Flughafenstrasse 52", postal_code: "10115" },
#    first_name: "Mary",
#    last_name: "O'Brien"
#  )
      def create(counterpart_id:, address:, email: nil, first_name:, last_name:, phone: nil, title: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), address: address, email: email, first_name: first_name, last_name: last_name, phone: phone, title: title }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/counterparts/#{counterpart_id}/contacts"
end
          Monite::CounterpartContactResponse.from_json(json_object: response.body)
        end
      end
      # @param contact_id [String] 
      # @param counterpart_id [String] 
      # @param request_options [Monite::RequestOptions] 
      # @return [Monite::CounterpartContactResponse]
      # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.counterparts.contacts.get_by_id(contact_id: "contact_id", counterpart_id: "counterpart_id")
      def get_by_id(contact_id:, counterpart_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/counterparts/#{contact_id}/contacts/#{counterpart_id}"
end
          Monite::CounterpartContactResponse.from_json(json_object: response.body)
        end
      end
      # @param contact_id [String] 
      # @param counterpart_id [String] 
      # @param request_options [Monite::RequestOptions] 
      # @return [Void]
      # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.counterparts.contacts.delete_by_id(contact_id: "contact_id", counterpart_id: "counterpart_id")
      def delete_by_id(contact_id:, counterpart_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/counterparts/#{contact_id}/contacts/#{counterpart_id}"
end
        end
      end
      # @param contact_id [String] 
      # @param counterpart_id [String] 
      # @param address [Hash] The address of a contact person.Request of type Monite::CounterpartAddress, as a Hash
      #   * :city (String) 
      #   * :country (Monite::AllowedCountries) 
      #   * :line_1 (String) 
      #   * :line_2 (String) 
      #   * :postal_code (String) 
      #   * :state (String) 
      # @param email [String] The email address of a contact person.
      # @param first_name [String] The first name of a contact person.
      # @param last_name [String] The last name of a contact person.
      # @param phone [String] The phone number of a contact person
      # @param title [String] The title or honorific of a contact person. Examples: Mr., Ms., Dr., Prof.
      # @param request_options [Monite::RequestOptions] 
      # @return [Monite::CounterpartContactResponse]
      # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.counterparts.contacts.update_by_id(contact_id: "contact_id", counterpart_id: "counterpart_id")
      def update_by_id(contact_id:, counterpart_id:, address: nil, email: nil, first_name: nil, last_name: nil, phone: nil, title: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), address: address, email: email, first_name: first_name, last_name: last_name, phone: phone, title: title }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/counterparts/#{contact_id}/contacts/#{counterpart_id}"
end
          Monite::CounterpartContactResponse.from_json(json_object: response.body)
        end
      end
      # @param contact_id [String] 
      # @param counterpart_id [String] 
      # @param request_options [Monite::RequestOptions] 
      # @return [Monite::CounterpartContactResponse]
      # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.counterparts.contacts.make_default_by_id(contact_id: "contact_id", counterpart_id: "counterpart_id")
      def make_default_by_id(contact_id:, counterpart_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/counterparts/#{contact_id}/contacts/#{counterpart_id}/make_default"
end
          Monite::CounterpartContactResponse.from_json(json_object: response.body)
        end
      end
    end
  end
end