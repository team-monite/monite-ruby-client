# frozen_string_literal: true
require_relative "../../../requests"
require_relative "../../types/entity_onboarding_data_response"
require_relative "../../types/business_profile_input"
require_relative "../../types/ownership_declaration_input"
require_relative "../../types/terms_of_service_acceptance_input"
require "async"
require "async"
require_relative "../../../requests"

module Monite
  module Entities
    class OnboardingDataClient
    # @return [Monite::RequestClient] 
      attr_reader :request_client


      # @param request_client [Monite::RequestClient] 
      # @return [Monite::Entities::OnboardingDataClient]
      def initialize(request_client:)
        @request_client = request_client
      end
      # @param entity_id [String] 
      # @param request_options [Monite::RequestOptions] 
      # @return [Monite::EntityOnboardingDataResponse]
      # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.entities.onboarding_data.get(entity_id: "entity_id")
      def get(entity_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/entities/#{entity_id}/onboarding_data"
end
        Monite::EntityOnboardingDataResponse.from_json(json_object: response.body)
      end
      # @param entity_id [String] 
      # @param business_profile [Hash] Business information about the entity.Request of type Monite::BusinessProfileInput, as a Hash
      #   * :description_of_goods_or_services (String) 
      #   * :estimated_monthly_revenue (Hash)
      #     * :amount (Integer) 
      #     * :currency (Monite::CurrencyEnum) 
      #   * :mcc (String) 
      #   * :operating_countries (Array<Monite::AllowedCountries>) 
      #   * :url (String) 
      # @param ownership_declaration [Hash] Used to attest that the beneficial owner information provided is both current
#  and correct.Request of type Monite::OwnershipDeclarationInput, as a Hash
      #   * :date (DateTime) 
      #   * :ip (String) 
      # @param tos_acceptance [Hash] Details on the entity's acceptance of the service agreement.Request of type Monite::TermsOfServiceAcceptanceInput, as a Hash
      #   * :date (DateTime) 
      #   * :ip (String) 
      # @param request_options [Monite::RequestOptions] 
      # @return [Monite::EntityOnboardingDataResponse]
      # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.entities.onboarding_data.update(entity_id: "entity_id")
      def update(entity_id:, business_profile: nil, ownership_declaration: nil, tos_acceptance: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), business_profile: business_profile, ownership_declaration: ownership_declaration, tos_acceptance: tos_acceptance }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/entities/#{entity_id}/onboarding_data"
end
        Monite::EntityOnboardingDataResponse.from_json(json_object: response.body)
      end
    end
    class AsyncOnboardingDataClient
    # @return [Monite::AsyncRequestClient] 
      attr_reader :request_client


      # @param request_client [Monite::RequestClient] 
      # @return [Monite::Entities::AsyncOnboardingDataClient]
      def initialize(request_client:)
        @request_client = request_client
      end
      # @param entity_id [String] 
      # @param request_options [Monite::RequestOptions] 
      # @return [Monite::EntityOnboardingDataResponse]
      # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.entities.onboarding_data.get(entity_id: "entity_id")
      def get(entity_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/entities/#{entity_id}/onboarding_data"
end
          Monite::EntityOnboardingDataResponse.from_json(json_object: response.body)
        end
      end
      # @param entity_id [String] 
      # @param business_profile [Hash] Business information about the entity.Request of type Monite::BusinessProfileInput, as a Hash
      #   * :description_of_goods_or_services (String) 
      #   * :estimated_monthly_revenue (Hash)
      #     * :amount (Integer) 
      #     * :currency (Monite::CurrencyEnum) 
      #   * :mcc (String) 
      #   * :operating_countries (Array<Monite::AllowedCountries>) 
      #   * :url (String) 
      # @param ownership_declaration [Hash] Used to attest that the beneficial owner information provided is both current
#  and correct.Request of type Monite::OwnershipDeclarationInput, as a Hash
      #   * :date (DateTime) 
      #   * :ip (String) 
      # @param tos_acceptance [Hash] Details on the entity's acceptance of the service agreement.Request of type Monite::TermsOfServiceAcceptanceInput, as a Hash
      #   * :date (DateTime) 
      #   * :ip (String) 
      # @param request_options [Monite::RequestOptions] 
      # @return [Monite::EntityOnboardingDataResponse]
      # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.entities.onboarding_data.update(entity_id: "entity_id")
      def update(entity_id:, business_profile: nil, ownership_declaration: nil, tos_acceptance: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), business_profile: business_profile, ownership_declaration: ownership_declaration, tos_acceptance: tos_acceptance }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/entities/#{entity_id}/onboarding_data"
end
          Monite::EntityOnboardingDataResponse.from_json(json_object: response.body)
        end
      end
    end
  end
end