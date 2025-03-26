# frozen_string_literal: true
require_relative "../../../requests"
require_relative "../../types/persons_response"
require_relative "../../types/person_address_request"
require_relative "../../types/person_relationship_request"
require_relative "../../types/allowed_countries"
require_relative "../../types/person_response"
require_relative "../../types/optional_person_address_request"
require_relative "../../types/optional_person_relationship"
require "async"
require "async"
require "async"
require "async"
require "async"
require "async"
require_relative "../../../requests"

module Monite
  module Entities
    class PersonsClient
    # @return [Monite::RequestClient] 
      attr_reader :request_client


      # @param request_client [Monite::RequestClient] 
      # @return [Monite::Entities::PersonsClient]
      def initialize(request_client:)
        @request_client = request_client
      end
      # @param request_options [Monite::RequestOptions] 
      # @return [Monite::PersonsResponse]
      # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.entities.persons.get
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
  req.url "#{@request_client.get_url(request_options: request_options)}/persons"
end
        Monite::PersonsResponse.from_json(json_object: response.body)
      end
      # @param address [Hash] The person's addressRequest of type Monite::PersonAddressRequest, as a Hash
      #   * :city (String) 
      #   * :country (Monite::AllowedCountries) 
      #   * :line_1 (String) 
      #   * :line_2 (String) 
      #   * :postal_code (String) 
      #   * :state (String) 
      # @param date_of_birth [String] The person's date of birth
      # @param first_name [String] The person's first name
      # @param last_name [String] The person's last name
      # @param email [String] The person's email address
      # @param phone [String] The person's phone number
      # @param relationship [Hash] Describes the person's relationship to the entityRequest of type Monite::PersonRelationshipRequest, as a Hash
      #   * :director (Boolean) 
      #   * :executive (Boolean) 
      #   * :owner (Boolean) 
      #   * :percent_ownership (Float) 
      #   * :representative (Boolean) 
      #   * :title (String) 
      # @param id_number [String] The person's ID number, as appropriate for their country
      # @param ssn_last_4 [String] The last four digits of the person's Social Security number
      # @param citizenship [Monite::AllowedCountries] Required for persons of US entities. The country of the person's citizenship, as
#  a two-letter country code (ISO 3166-1 alpha-2). In case of dual or multiple
#  citizenship, specify any.
      # @param request_options [Monite::RequestOptions] 
      # @return [Monite::PersonResponse]
      # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.entities.persons.create(
#    first_name: "first_name",
#    last_name: "last_name",
#    email: "email",
#    relationship: {  }
#  )
      def create(address: nil, date_of_birth: nil, first_name:, last_name:, email:, phone: nil, relationship:, id_number: nil, ssn_last_4: nil, citizenship: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), address: address, date_of_birth: date_of_birth, first_name: first_name, last_name: last_name, email: email, phone: phone, relationship: relationship, id_number: id_number, ssn_last_4: ssn_last_4, citizenship: citizenship }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/persons"
end
        Monite::PersonResponse.from_json(json_object: response.body)
      end
      # @param person_id [String] 
      # @param request_options [Monite::RequestOptions] 
      # @return [Monite::PersonResponse]
      # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.entities.persons.get_by_id(person_id: "person_id")
      def get_by_id(person_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/persons/#{person_id}"
end
        Monite::PersonResponse.from_json(json_object: response.body)
      end
      # @param person_id [String] 
      # @param request_options [Monite::RequestOptions] 
      # @return [Void]
      # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.entities.persons.delete_by_id(person_id: "person_id")
      def delete_by_id(person_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/persons/#{person_id}"
end
      end
      # @param person_id [String] 
      # @param address [Hash] The person's addressRequest of type Monite::OptionalPersonAddressRequest, as a Hash
      #   * :city (String) 
      #   * :country (Monite::AllowedCountries) 
      #   * :line_1 (String) 
      #   * :line_2 (String) 
      #   * :postal_code (String) 
      #   * :state (String) 
      # @param date_of_birth [String] The person's date of birth
      # @param first_name [String] The person's first name
      # @param last_name [String] The person's last name
      # @param email [String] The person's email address
      # @param phone [String] The person's phone number
      # @param relationship [Hash] Describes the person's relationship to the entityRequest of type Monite::OptionalPersonRelationship, as a Hash
      #   * :director (Boolean) 
      #   * :executive (Boolean) 
      #   * :owner (Boolean) 
      #   * :percent_ownership (Float) 
      #   * :representative (Boolean) 
      #   * :title (String) 
      # @param id_number [String] The person's ID number, as appropriate for their country
      # @param ssn_last_4 [String] The last four digits of the person's Social Security number
      # @param citizenship [Monite::AllowedCountries] Required for persons of US entities. The country of the person's citizenship, as
#  a two-letter country code (ISO 3166-1 alpha-2). In case of dual or multiple
#  citizenship, specify any.
      # @param request_options [Monite::RequestOptions] 
      # @return [Monite::PersonResponse]
      # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.entities.persons.update_by_id(person_id: "person_id")
      def update_by_id(person_id:, address: nil, date_of_birth: nil, first_name: nil, last_name: nil, email: nil, phone: nil, relationship: nil, id_number: nil, ssn_last_4: nil, citizenship: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), address: address, date_of_birth: date_of_birth, first_name: first_name, last_name: last_name, email: email, phone: phone, relationship: relationship, id_number: id_number, ssn_last_4: ssn_last_4, citizenship: citizenship }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/persons/#{person_id}"
end
        Monite::PersonResponse.from_json(json_object: response.body)
      end
# Provide files for person onboarding verification
      #
      # @param person_id [String] 
      # @param additional_verification_document_back [String] 
      # @param additional_verification_document_front [String] 
      # @param verification_document_back [String] 
      # @param verification_document_front [String] 
      # @param request_options [Monite::RequestOptions] 
      # @return [Void]
      # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.entities.persons.upload_onboarding_documents(person_id: "person_id")
      def upload_onboarding_documents(person_id:, additional_verification_document_back: nil, additional_verification_document_front: nil, verification_document_back: nil, verification_document_front: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), additional_verification_document_back: additional_verification_document_back, additional_verification_document_front: additional_verification_document_front, verification_document_back: verification_document_back, verification_document_front: verification_document_front }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/persons/#{person_id}/onboarding_documents"
end
      end
    end
    class AsyncPersonsClient
    # @return [Monite::AsyncRequestClient] 
      attr_reader :request_client


      # @param request_client [Monite::RequestClient] 
      # @return [Monite::Entities::AsyncPersonsClient]
      def initialize(request_client:)
        @request_client = request_client
      end
      # @param request_options [Monite::RequestOptions] 
      # @return [Monite::PersonsResponse]
      # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.entities.persons.get
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
  req.url "#{@request_client.get_url(request_options: request_options)}/persons"
end
          Monite::PersonsResponse.from_json(json_object: response.body)
        end
      end
      # @param address [Hash] The person's addressRequest of type Monite::PersonAddressRequest, as a Hash
      #   * :city (String) 
      #   * :country (Monite::AllowedCountries) 
      #   * :line_1 (String) 
      #   * :line_2 (String) 
      #   * :postal_code (String) 
      #   * :state (String) 
      # @param date_of_birth [String] The person's date of birth
      # @param first_name [String] The person's first name
      # @param last_name [String] The person's last name
      # @param email [String] The person's email address
      # @param phone [String] The person's phone number
      # @param relationship [Hash] Describes the person's relationship to the entityRequest of type Monite::PersonRelationshipRequest, as a Hash
      #   * :director (Boolean) 
      #   * :executive (Boolean) 
      #   * :owner (Boolean) 
      #   * :percent_ownership (Float) 
      #   * :representative (Boolean) 
      #   * :title (String) 
      # @param id_number [String] The person's ID number, as appropriate for their country
      # @param ssn_last_4 [String] The last four digits of the person's Social Security number
      # @param citizenship [Monite::AllowedCountries] Required for persons of US entities. The country of the person's citizenship, as
#  a two-letter country code (ISO 3166-1 alpha-2). In case of dual or multiple
#  citizenship, specify any.
      # @param request_options [Monite::RequestOptions] 
      # @return [Monite::PersonResponse]
      # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.entities.persons.create(
#    first_name: "first_name",
#    last_name: "last_name",
#    email: "email",
#    relationship: {  }
#  )
      def create(address: nil, date_of_birth: nil, first_name:, last_name:, email:, phone: nil, relationship:, id_number: nil, ssn_last_4: nil, citizenship: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), address: address, date_of_birth: date_of_birth, first_name: first_name, last_name: last_name, email: email, phone: phone, relationship: relationship, id_number: id_number, ssn_last_4: ssn_last_4, citizenship: citizenship }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/persons"
end
          Monite::PersonResponse.from_json(json_object: response.body)
        end
      end
      # @param person_id [String] 
      # @param request_options [Monite::RequestOptions] 
      # @return [Monite::PersonResponse]
      # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.entities.persons.get_by_id(person_id: "person_id")
      def get_by_id(person_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/persons/#{person_id}"
end
          Monite::PersonResponse.from_json(json_object: response.body)
        end
      end
      # @param person_id [String] 
      # @param request_options [Monite::RequestOptions] 
      # @return [Void]
      # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.entities.persons.delete_by_id(person_id: "person_id")
      def delete_by_id(person_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/persons/#{person_id}"
end
        end
      end
      # @param person_id [String] 
      # @param address [Hash] The person's addressRequest of type Monite::OptionalPersonAddressRequest, as a Hash
      #   * :city (String) 
      #   * :country (Monite::AllowedCountries) 
      #   * :line_1 (String) 
      #   * :line_2 (String) 
      #   * :postal_code (String) 
      #   * :state (String) 
      # @param date_of_birth [String] The person's date of birth
      # @param first_name [String] The person's first name
      # @param last_name [String] The person's last name
      # @param email [String] The person's email address
      # @param phone [String] The person's phone number
      # @param relationship [Hash] Describes the person's relationship to the entityRequest of type Monite::OptionalPersonRelationship, as a Hash
      #   * :director (Boolean) 
      #   * :executive (Boolean) 
      #   * :owner (Boolean) 
      #   * :percent_ownership (Float) 
      #   * :representative (Boolean) 
      #   * :title (String) 
      # @param id_number [String] The person's ID number, as appropriate for their country
      # @param ssn_last_4 [String] The last four digits of the person's Social Security number
      # @param citizenship [Monite::AllowedCountries] Required for persons of US entities. The country of the person's citizenship, as
#  a two-letter country code (ISO 3166-1 alpha-2). In case of dual or multiple
#  citizenship, specify any.
      # @param request_options [Monite::RequestOptions] 
      # @return [Monite::PersonResponse]
      # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.entities.persons.update_by_id(person_id: "person_id")
      def update_by_id(person_id:, address: nil, date_of_birth: nil, first_name: nil, last_name: nil, email: nil, phone: nil, relationship: nil, id_number: nil, ssn_last_4: nil, citizenship: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), address: address, date_of_birth: date_of_birth, first_name: first_name, last_name: last_name, email: email, phone: phone, relationship: relationship, id_number: id_number, ssn_last_4: ssn_last_4, citizenship: citizenship }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/persons/#{person_id}"
end
          Monite::PersonResponse.from_json(json_object: response.body)
        end
      end
# Provide files for person onboarding verification
      #
      # @param person_id [String] 
      # @param additional_verification_document_back [String] 
      # @param additional_verification_document_front [String] 
      # @param verification_document_back [String] 
      # @param verification_document_front [String] 
      # @param request_options [Monite::RequestOptions] 
      # @return [Void]
      # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.entities.persons.upload_onboarding_documents(person_id: "person_id")
      def upload_onboarding_documents(person_id:, additional_verification_document_back: nil, additional_verification_document_front: nil, verification_document_back: nil, verification_document_front: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), additional_verification_document_back: additional_verification_document_back, additional_verification_document_front: additional_verification_document_front, verification_document_back: verification_document_back, verification_document_front: verification_document_front }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/persons/#{person_id}/onboarding_documents"
end
        end
      end
    end
  end
end