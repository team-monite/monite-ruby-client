# frozen_string_literal: true
require_relative "../../requests"
require_relative "bank_accounts/client"
require_relative "onboarding_data/client"
require_relative "payment_methods/client"
require_relative "vat_ids/client"
require_relative "persons/client"
require_relative "../types/order_enum"
require_relative "../types/entity_cursor_fields"
require_relative "../types/entity_type_enum"
require "date"
require "date"
require "date"
require "date"
require_relative "../types/entity_pagination_response"
require_relative "../types/entity_address_schema"
require_relative "../types/organization_schema"
require_relative "../types/individual_schema"
require_relative "../types/entity_response"
require_relative "../types/update_entity_request"
require_relative "../types/file_schema_3"
require_relative "../../core/file_utilities"
require_relative "../types/partner_metadata_response"
require_relative "../types/partner_metadata"
require_relative "../types/settings_response"
require_relative "../types/language_code_enum"
require_relative "../types/currency_settings_input"
require_relative "../types/reminders_settings"
require_relative "../types/vat_mode_enum"
require_relative "../types/payment_priority_enum"
require_relative "../types/receivable_edit_flow"
require_relative "../types/document_i_ds_settings_request"
require_relative "../types/ocr_auto_tagging_settings_request"
require_relative "../types/accounting_settings"
require_relative "../types/get_onboarding_requirements_response"
require "async"
require "async"
require "async"
require "async"
require "async"
require "async"
require "async"
require "async"
require "async"
require "async"
require "async"
require "async"
require "async"
require "async"
require "async"
require "async"
require_relative "../../requests"

module Monite
  class EntitiesClient
  # @return [Monite::RequestClient] 
    attr_reader :request_client
  # @return [Monite::Entities::BankAccountsClient] 
    attr_reader :bank_accounts
  # @return [Monite::Entities::OnboardingDataClient] 
    attr_reader :onboarding_data
  # @return [Monite::Entities::PaymentMethodsClient] 
    attr_reader :payment_methods
  # @return [Monite::Entities::VatIdsClient] 
    attr_reader :vat_ids
  # @return [Monite::Entities::PersonsClient] 
    attr_reader :persons


    # @param request_client [Monite::RequestClient] 
    # @return [Monite::EntitiesClient]
    def initialize(request_client:)
      @request_client = request_client
      @bank_accounts = Monite::Entities::BankAccountsClient.new(request_client: request_client)
      @onboarding_data = Monite::Entities::OnboardingDataClient.new(request_client: request_client)
      @payment_methods = Monite::Entities::PaymentMethodsClient.new(request_client: request_client)
      @vat_ids = Monite::Entities::VatIdsClient.new(request_client: request_client)
      @persons = Monite::Entities::PersonsClient.new(request_client: request_client)
    end
# Retrieve a list of all entities.
    #
    # @param order [Monite::OrderEnum] Sort order (ascending by default). Typically used together with the `sort`
#  parameter.
    # @param limit [Integer] The number of items (0 .. 100) to return in a single page of the response. The
#  response may contain fewer items if it is the last or only page.
    # @param pagination_token [String] A pagination token obtained from a previous call to this endpoint. Use it to get
#  the next or previous page of results for your initial query. If
#  `pagination_token` is specified, all other query parameters are ignored and
#  inferred from the initial query.
#  If not specified, the first page of results will be returned.
    # @param sort [Monite::EntityCursorFields] The field to sort the results by. Typically used together with the `order`
#  parameter.
    # @param type [Monite::EntityTypeEnum] 
    # @param created_at_gt [DateTime] 
    # @param created_at_lt [DateTime] 
    # @param created_at_gte [DateTime] 
    # @param created_at_lte [DateTime] 
    # @param id_in [String] 
    # @param id_not_in [String] 
    # @param email [String] 
    # @param email_in [String] 
    # @param email_not_in [String] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::EntityPaginationResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.entities.get
    def get(order: nil, limit: nil, pagination_token: nil, sort: nil, type: nil, created_at_gt: nil, created_at_lt: nil, created_at_gte: nil, created_at_lte: nil, id_in: nil, id_not_in: nil, email: nil, email_in: nil, email_not_in: nil, request_options: nil)
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
  req.params = { **(request_options&.additional_query_parameters || {}), "order": order, "limit": limit, "pagination_token": pagination_token, "sort": sort, "type": type, "created_at__gt": created_at_gt, "created_at__lt": created_at_lt, "created_at__gte": created_at_gte, "created_at__lte": created_at_lte, "id__in": id_in, "id__not_in": id_not_in, "email": email, "email__in": email_in, "email__not_in": email_not_in }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/entities"
end
      Monite::EntityPaginationResponse.from_json(json_object: response.body)
    end
# Create a new entity from the specified values.
    #
    # @param address [Hash] An address description of the entityRequest of type Monite::EntityAddressSchema, as a Hash
    #   * :city (String) 
    #   * :country (Monite::AllowedCountries) 
    #   * :line_1 (String) 
    #   * :line_2 (String) 
    #   * :postal_code (String) 
    #   * :state (String) 
    # @param email [String] An official email address of the entity
    # @param phone [String] The contact phone number of the entity. Required for US organizations to use
#  payments.
    # @param website [String] A website of the entity
    # @param organization [Hash] A set of meta data describing the organizationRequest of type Monite::OrganizationSchema, as a Hash
    #   * :business_structure (Monite::EntityBusinessStructure) 
    #   * :directors_provided (Boolean) 
    #   * :executives_provided (Boolean) 
    #   * :legal_entity_id (String) 
    #   * :legal_name (String) 
    #   * :owners_provided (Boolean) 
    #   * :representative_provided (Boolean) 
    # @param individual [Hash] A set of meta data describing the individualRequest of type Monite::IndividualSchema, as a Hash
    #   * :date_of_birth (String) 
    #   * :first_name (String) 
    #   * :id_number (String) 
    #   * :last_name (String) 
    #   * :ssn_last_4 (String) 
    #   * :title (String) 
    # @param tax_id [String] The entity's taxpayer identification number or tax ID. This field is required
#  for entities that are non-VAT registered.
    # @param type [Monite::EntityTypeEnum] A type for an entity
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::EntityResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.entities.create(
#    address: { city: "city", country: AF, line_1: "line1", postal_code: "postal_code" },
#    email: "email",
#    type: INDIVIDUAL
#  )
    def create(address:, email:, phone: nil, website: nil, organization: nil, individual: nil, tax_id: nil, type:, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), address: address, email: email, phone: phone, website: website, organization: organization, individual: individual, tax_id: tax_id, type: type }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/entities"
end
      Monite::EntityResponse.from_json(json_object: response.body)
    end
# Deprecated. Use `GET /entity_users/my_entity` instead.
    #
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::EntityResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.entities.get_entities_me
    def get_entities_me(request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/entities/me"
end
      Monite::EntityResponse.from_json(json_object: response.body)
    end
# Deprecated. Use `PATCH /entity_users/my_entity` instead.
    #
    # @param request [Hash] Request of type Monite::UpdateEntityRequest, as a Hash
    #   * :address (Hash)
    #     * :city (String) 
    #     * :line_1 (String) 
    #     * :line_2 (String) 
    #     * :postal_code (String) 
    #     * :state (String) 
    #   * :email (String) 
    #   * :phone (String) 
    #   * :website (String) 
    #   * :tax_id (String) 
    #   * :organization (Hash)
    #     * :business_structure (Monite::EntityBusinessStructure) 
    #     * :directors_provided (Boolean) 
    #     * :executives_provided (Boolean) 
    #     * :legal_entity_id (String) 
    #     * :legal_name (String) 
    #     * :owners_provided (Boolean) 
    #     * :representative_provided (Boolean) 
    #   * :individual (Hash)
    #     * :date_of_birth (String) 
    #     * :first_name (String) 
    #     * :id_number (String) 
    #     * :last_name (String) 
    #     * :ssn_last_4 (String) 
    #     * :title (String) 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::EntityResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.entities.patch_entities_me(request: {  })
    def patch_entities_me(request:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/entities/me"
end
      Monite::EntityResponse.from_json(json_object: response.body)
    end
# Retrieve an entity by its ID.
    #
    # @param entity_id [String] A unique ID to specify the entity.
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::EntityResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.entities.get_by_id(entity_id: "ea837e28-509b-4b6a-a600-d54b6aa0b1f5")
    def get_by_id(entity_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/entities/#{entity_id}"
end
      Monite::EntityResponse.from_json(json_object: response.body)
    end
# Change the specified fields with the provided values.
    #
    # @param entity_id [String] A unique ID to specify the entity.
    # @param request [Hash] Request of type Monite::UpdateEntityRequest, as a Hash
    #   * :address (Hash)
    #     * :city (String) 
    #     * :line_1 (String) 
    #     * :line_2 (String) 
    #     * :postal_code (String) 
    #     * :state (String) 
    #   * :email (String) 
    #   * :phone (String) 
    #   * :website (String) 
    #   * :tax_id (String) 
    #   * :organization (Hash)
    #     * :business_structure (Monite::EntityBusinessStructure) 
    #     * :directors_provided (Boolean) 
    #     * :executives_provided (Boolean) 
    #     * :legal_entity_id (String) 
    #     * :legal_name (String) 
    #     * :owners_provided (Boolean) 
    #     * :representative_provided (Boolean) 
    #   * :individual (Hash)
    #     * :date_of_birth (String) 
    #     * :first_name (String) 
    #     * :id_number (String) 
    #     * :last_name (String) 
    #     * :ssn_last_4 (String) 
    #     * :title (String) 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::EntityResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.entities.update_by_id(entity_id: "ea837e28-509b-4b6a-a600-d54b6aa0b1f5", request: {  })
    def update_by_id(entity_id:, request:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/entities/#{entity_id}"
end
      Monite::EntityResponse.from_json(json_object: response.body)
    end
# Activate an entity to allow it to perform any operations.
    #
    # @param entity_id [String] A unique ID to specify the entity.
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::EntityResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.entities.post_entities_id_activate(entity_id: "ea837e28-509b-4b6a-a600-d54b6aa0b1f5")
    def post_entities_id_activate(entity_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/entities/#{entity_id}/activate"
end
      Monite::EntityResponse.from_json(json_object: response.body)
    end
# Deactivate an entity to stop it from performing any operations.
    #
    # @param entity_id [String] A unique ID to specify the entity.
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::EntityResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.entities.post_entities_id_deactivate(entity_id: "ea837e28-509b-4b6a-a600-d54b6aa0b1f5")
    def post_entities_id_deactivate(entity_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/entities/#{entity_id}/deactivate"
end
      Monite::EntityResponse.from_json(json_object: response.body)
    end
# Entity logo can be PNG, JPG, or GIF, up to 10 MB in size. The logo is used, for
#  example, in PDF documents created by this entity.
    #
    # @param entity_id [String] A unique ID to specify the entity.
    # @param file [String, IO] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::FileSchema3]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.entities.upload_logo_by_id(entity_id: "ea837e28-509b-4b6a-a600-d54b6aa0b1f5", file: my_file.txt)
    def upload_logo_by_id(entity_id:, file:, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), file: Monite::FileUtilities.as_faraday_multipart(file_like: file) }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/entities/#{entity_id}/logo"
end
      Monite::FileSchema3.from_json(json_object: response.body)
    end
    # @param entity_id [String] A unique ID to specify the entity.
    # @param request_options [Monite::RequestOptions] 
    # @return [Void]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.entities.delete_logo_by_id(entity_id: "ea837e28-509b-4b6a-a600-d54b6aa0b1f5")
    def delete_logo_by_id(entity_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/entities/#{entity_id}/logo"
end
    end
# Retrieve a metadata object associated with this entity, usually in a JSON
#  format.
    #
    # @param entity_id [String] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::PartnerMetadataResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.entities.get_partner_metadata_by_id(entity_id: "entity_id")
    def get_partner_metadata_by_id(entity_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/entities/#{entity_id}/partner_metadata"
end
      Monite::PartnerMetadataResponse.from_json(json_object: response.body)
    end
# Fully replace the current metadata object with the specified instance.
    #
    # @param entity_id [String] 
    # @param request [Hash] Request of type Monite::PartnerMetadata, as a Hash
    #   * :metadata (Hash{String => Object}) 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::PartnerMetadataResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.entities.update_partner_metadata_by_id(entity_id: "entity_id", request: { metadata: { "key": "value" } })
    def update_partner_metadata_by_id(entity_id:, request:, request_options: nil)
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
  req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/entities/#{entity_id}/partner_metadata"
end
      Monite::PartnerMetadataResponse.from_json(json_object: response.body)
    end
# Retrieve all settings for this entity.
    #
    # @param entity_id [String] A unique ID to specify the entity.
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::SettingsResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.entities.get_settings_by_id(entity_id: "ea837e28-509b-4b6a-a600-d54b6aa0b1f5")
    def get_settings_by_id(entity_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/entities/#{entity_id}/settings"
end
      Monite::SettingsResponse.from_json(json_object: response.body)
    end
# Change the specified fields with the provided values.
    #
    # @param entity_id [String] A unique ID to specify the entity.
    # @param language [Monite::LanguageCodeEnum] 
    # @param currency [Hash] Request of type Monite::CurrencySettingsInput, as a Hash
    #   * :default (Monite::CurrencyEnum) 
    #   * :exchange_rates (Array<Monite::ExchangeRate>) 
    # @param reminder [Hash] Request of type Monite::RemindersSettings, as a Hash
    #   * :enabled (Boolean) 
    # @param vat_mode [Monite::VatModeEnum] Defines whether the prices of products in receivables will already include VAT
#  or not.
    # @param payment_priority [Monite::PaymentPriorityEnum] Payment preferences for entity to automate calculating suggested payment date
#  based on payment terms and entity preferences.
    # @param allow_purchase_order_autolinking [Boolean] Automatically attempt to find a corresponding purchase order for all incoming
#  payables.
    # @param receivable_edit_flow [Monite::ReceivableEditFlow] 
    # @param document_ids [Hash] Request of type Monite::DocumentIDsSettingsRequest, as a Hash
    #   * :document_type_prefix (Hash)
    #     * :credit_note (String) 
    #     * :invoice (String) 
    #     * :purchase_order (String) 
    #     * :quote (String) 
    #   * :include_date (Boolean) 
    #   * :min_digits (Integer) 
    #   * :next_number (Hash)
    #     * :credit_note (Integer) 
    #     * :invoice (Integer) 
    #     * :purchase_order (Integer) 
    #     * :quote (Integer) 
    #   * :prefix (String) 
    #   * :separator (Monite::DocumentIdSeparators) 
    # @param payables_ocr_auto_tagging [Array<Hash>] Auto tagging settings for all incoming OCR payable documents.Request of type Array<Monite::OcrAutoTaggingSettingsRequest>, as a Hash
    #   * :enabled (Boolean) 
    #   * :keywords (Array<String>) 
    #   * :tag_id (String) 
    # @param quote_signature_required [Boolean] Sets the default behavior of whether a signature is required to accept quotes.
    # @param generate_paid_invoice_pdf [Boolean] If enabled, the paid invoice's PDF will be in a new layout set by the user.
    # @param accounting [Hash] Request of type Monite::AccountingSettings, as a Hash
    #   * :ledger_account_ids (Hash)
    #     * :payments (String) 
    #     * :products (String) 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::SettingsResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.entities.update_settings_by_id(entity_id: "ea837e28-509b-4b6a-a600-d54b6aa0b1f5")
    def update_settings_by_id(entity_id:, language: nil, currency: nil, reminder: nil, vat_mode: nil, payment_priority: nil, allow_purchase_order_autolinking: nil, receivable_edit_flow: nil, document_ids: nil, payables_ocr_auto_tagging: nil, quote_signature_required: nil, generate_paid_invoice_pdf: nil, accounting: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), language: language, currency: currency, reminder: reminder, vat_mode: vat_mode, payment_priority: payment_priority, allow_purchase_order_autolinking: allow_purchase_order_autolinking, receivable_edit_flow: receivable_edit_flow, document_ids: document_ids, payables_ocr_auto_tagging: payables_ocr_auto_tagging, quote_signature_required: quote_signature_required, generate_paid_invoice_pdf: generate_paid_invoice_pdf, accounting: accounting }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/entities/#{entity_id}/settings"
end
      Monite::SettingsResponse.from_json(json_object: response.body)
    end
# Provide files for entity onboarding verification
    #
    # @param additional_verification_document_back [String] 
    # @param additional_verification_document_front [String] 
    # @param bank_account_ownership_verification [Array<String>] 
    # @param company_license [Array<String>] 
    # @param company_memorandum_of_association [Array<String>] 
    # @param company_ministerial_decree [Array<String>] 
    # @param company_registration_verification [Array<String>] 
    # @param company_tax_id_verification [Array<String>] 
    # @param proof_of_registration [Array<String>] 
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
#  api.entities.upload_onboarding_documents
    def upload_onboarding_documents(additional_verification_document_back: nil, additional_verification_document_front: nil, bank_account_ownership_verification: nil, company_license: nil, company_memorandum_of_association: nil, company_ministerial_decree: nil, company_registration_verification: nil, company_tax_id_verification: nil, proof_of_registration: nil, verification_document_back: nil, verification_document_front: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), additional_verification_document_back: additional_verification_document_back, additional_verification_document_front: additional_verification_document_front, bank_account_ownership_verification: bank_account_ownership_verification, company_license: company_license, company_memorandum_of_association: company_memorandum_of_association, company_ministerial_decree: company_ministerial_decree, company_registration_verification: company_registration_verification, company_tax_id_verification: company_tax_id_verification, proof_of_registration: proof_of_registration, verification_document_back: verification_document_back, verification_document_front: verification_document_front }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/onboarding_documents"
end
    end
# Get onboarding requirements for the entity
    #
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::GetOnboardingRequirementsResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.entities.get_onboarding_requirements
    def get_onboarding_requirements(request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/onboarding_requirements"
end
      Monite::GetOnboardingRequirementsResponse.from_json(json_object: response.body)
    end
  end
  class AsyncEntitiesClient
  # @return [Monite::AsyncRequestClient] 
    attr_reader :request_client
  # @return [Monite::Entities::BankAccountsClient] 
    attr_reader :bank_accounts
  # @return [Monite::Entities::OnboardingDataClient] 
    attr_reader :onboarding_data
  # @return [Monite::Entities::PaymentMethodsClient] 
    attr_reader :payment_methods
  # @return [Monite::Entities::VatIdsClient] 
    attr_reader :vat_ids
  # @return [Monite::Entities::PersonsClient] 
    attr_reader :persons


    # @param request_client [Monite::RequestClient] 
    # @return [Monite::AsyncEntitiesClient]
    def initialize(request_client:)
      @request_client = request_client
      @bank_accounts = Monite::Entities::AsyncBankAccountsClient.new(request_client: request_client)
      @onboarding_data = Monite::Entities::AsyncOnboardingDataClient.new(request_client: request_client)
      @payment_methods = Monite::Entities::AsyncPaymentMethodsClient.new(request_client: request_client)
      @vat_ids = Monite::Entities::AsyncVatIdsClient.new(request_client: request_client)
      @persons = Monite::Entities::AsyncPersonsClient.new(request_client: request_client)
    end
# Retrieve a list of all entities.
    #
    # @param order [Monite::OrderEnum] Sort order (ascending by default). Typically used together with the `sort`
#  parameter.
    # @param limit [Integer] The number of items (0 .. 100) to return in a single page of the response. The
#  response may contain fewer items if it is the last or only page.
    # @param pagination_token [String] A pagination token obtained from a previous call to this endpoint. Use it to get
#  the next or previous page of results for your initial query. If
#  `pagination_token` is specified, all other query parameters are ignored and
#  inferred from the initial query.
#  If not specified, the first page of results will be returned.
    # @param sort [Monite::EntityCursorFields] The field to sort the results by. Typically used together with the `order`
#  parameter.
    # @param type [Monite::EntityTypeEnum] 
    # @param created_at_gt [DateTime] 
    # @param created_at_lt [DateTime] 
    # @param created_at_gte [DateTime] 
    # @param created_at_lte [DateTime] 
    # @param id_in [String] 
    # @param id_not_in [String] 
    # @param email [String] 
    # @param email_in [String] 
    # @param email_not_in [String] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::EntityPaginationResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.entities.get
    def get(order: nil, limit: nil, pagination_token: nil, sort: nil, type: nil, created_at_gt: nil, created_at_lt: nil, created_at_gte: nil, created_at_lte: nil, id_in: nil, id_not_in: nil, email: nil, email_in: nil, email_not_in: nil, request_options: nil)
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
  req.params = { **(request_options&.additional_query_parameters || {}), "order": order, "limit": limit, "pagination_token": pagination_token, "sort": sort, "type": type, "created_at__gt": created_at_gt, "created_at__lt": created_at_lt, "created_at__gte": created_at_gte, "created_at__lte": created_at_lte, "id__in": id_in, "id__not_in": id_not_in, "email": email, "email__in": email_in, "email__not_in": email_not_in }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/entities"
end
        Monite::EntityPaginationResponse.from_json(json_object: response.body)
      end
    end
# Create a new entity from the specified values.
    #
    # @param address [Hash] An address description of the entityRequest of type Monite::EntityAddressSchema, as a Hash
    #   * :city (String) 
    #   * :country (Monite::AllowedCountries) 
    #   * :line_1 (String) 
    #   * :line_2 (String) 
    #   * :postal_code (String) 
    #   * :state (String) 
    # @param email [String] An official email address of the entity
    # @param phone [String] The contact phone number of the entity. Required for US organizations to use
#  payments.
    # @param website [String] A website of the entity
    # @param organization [Hash] A set of meta data describing the organizationRequest of type Monite::OrganizationSchema, as a Hash
    #   * :business_structure (Monite::EntityBusinessStructure) 
    #   * :directors_provided (Boolean) 
    #   * :executives_provided (Boolean) 
    #   * :legal_entity_id (String) 
    #   * :legal_name (String) 
    #   * :owners_provided (Boolean) 
    #   * :representative_provided (Boolean) 
    # @param individual [Hash] A set of meta data describing the individualRequest of type Monite::IndividualSchema, as a Hash
    #   * :date_of_birth (String) 
    #   * :first_name (String) 
    #   * :id_number (String) 
    #   * :last_name (String) 
    #   * :ssn_last_4 (String) 
    #   * :title (String) 
    # @param tax_id [String] The entity's taxpayer identification number or tax ID. This field is required
#  for entities that are non-VAT registered.
    # @param type [Monite::EntityTypeEnum] A type for an entity
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::EntityResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.entities.create(
#    address: { city: "city", country: AF, line_1: "line1", postal_code: "postal_code" },
#    email: "email",
#    type: INDIVIDUAL
#  )
    def create(address:, email:, phone: nil, website: nil, organization: nil, individual: nil, tax_id: nil, type:, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), address: address, email: email, phone: phone, website: website, organization: organization, individual: individual, tax_id: tax_id, type: type }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/entities"
end
        Monite::EntityResponse.from_json(json_object: response.body)
      end
    end
# Deprecated. Use `GET /entity_users/my_entity` instead.
    #
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::EntityResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.entities.get_entities_me
    def get_entities_me(request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/entities/me"
end
        Monite::EntityResponse.from_json(json_object: response.body)
      end
    end
# Deprecated. Use `PATCH /entity_users/my_entity` instead.
    #
    # @param request [Hash] Request of type Monite::UpdateEntityRequest, as a Hash
    #   * :address (Hash)
    #     * :city (String) 
    #     * :line_1 (String) 
    #     * :line_2 (String) 
    #     * :postal_code (String) 
    #     * :state (String) 
    #   * :email (String) 
    #   * :phone (String) 
    #   * :website (String) 
    #   * :tax_id (String) 
    #   * :organization (Hash)
    #     * :business_structure (Monite::EntityBusinessStructure) 
    #     * :directors_provided (Boolean) 
    #     * :executives_provided (Boolean) 
    #     * :legal_entity_id (String) 
    #     * :legal_name (String) 
    #     * :owners_provided (Boolean) 
    #     * :representative_provided (Boolean) 
    #   * :individual (Hash)
    #     * :date_of_birth (String) 
    #     * :first_name (String) 
    #     * :id_number (String) 
    #     * :last_name (String) 
    #     * :ssn_last_4 (String) 
    #     * :title (String) 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::EntityResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.entities.patch_entities_me(request: {  })
    def patch_entities_me(request:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/entities/me"
end
        Monite::EntityResponse.from_json(json_object: response.body)
      end
    end
# Retrieve an entity by its ID.
    #
    # @param entity_id [String] A unique ID to specify the entity.
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::EntityResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.entities.get_by_id(entity_id: "ea837e28-509b-4b6a-a600-d54b6aa0b1f5")
    def get_by_id(entity_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/entities/#{entity_id}"
end
        Monite::EntityResponse.from_json(json_object: response.body)
      end
    end
# Change the specified fields with the provided values.
    #
    # @param entity_id [String] A unique ID to specify the entity.
    # @param request [Hash] Request of type Monite::UpdateEntityRequest, as a Hash
    #   * :address (Hash)
    #     * :city (String) 
    #     * :line_1 (String) 
    #     * :line_2 (String) 
    #     * :postal_code (String) 
    #     * :state (String) 
    #   * :email (String) 
    #   * :phone (String) 
    #   * :website (String) 
    #   * :tax_id (String) 
    #   * :organization (Hash)
    #     * :business_structure (Monite::EntityBusinessStructure) 
    #     * :directors_provided (Boolean) 
    #     * :executives_provided (Boolean) 
    #     * :legal_entity_id (String) 
    #     * :legal_name (String) 
    #     * :owners_provided (Boolean) 
    #     * :representative_provided (Boolean) 
    #   * :individual (Hash)
    #     * :date_of_birth (String) 
    #     * :first_name (String) 
    #     * :id_number (String) 
    #     * :last_name (String) 
    #     * :ssn_last_4 (String) 
    #     * :title (String) 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::EntityResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.entities.update_by_id(entity_id: "ea837e28-509b-4b6a-a600-d54b6aa0b1f5", request: {  })
    def update_by_id(entity_id:, request:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/entities/#{entity_id}"
end
        Monite::EntityResponse.from_json(json_object: response.body)
      end
    end
# Activate an entity to allow it to perform any operations.
    #
    # @param entity_id [String] A unique ID to specify the entity.
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::EntityResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.entities.post_entities_id_activate(entity_id: "ea837e28-509b-4b6a-a600-d54b6aa0b1f5")
    def post_entities_id_activate(entity_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/entities/#{entity_id}/activate"
end
        Monite::EntityResponse.from_json(json_object: response.body)
      end
    end
# Deactivate an entity to stop it from performing any operations.
    #
    # @param entity_id [String] A unique ID to specify the entity.
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::EntityResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.entities.post_entities_id_deactivate(entity_id: "ea837e28-509b-4b6a-a600-d54b6aa0b1f5")
    def post_entities_id_deactivate(entity_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/entities/#{entity_id}/deactivate"
end
        Monite::EntityResponse.from_json(json_object: response.body)
      end
    end
# Entity logo can be PNG, JPG, or GIF, up to 10 MB in size. The logo is used, for
#  example, in PDF documents created by this entity.
    #
    # @param entity_id [String] A unique ID to specify the entity.
    # @param file [String, IO] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::FileSchema3]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.entities.upload_logo_by_id(entity_id: "ea837e28-509b-4b6a-a600-d54b6aa0b1f5", file: my_file.txt)
    def upload_logo_by_id(entity_id:, file:, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), file: Monite::FileUtilities.as_faraday_multipart(file_like: file) }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/entities/#{entity_id}/logo"
end
        Monite::FileSchema3.from_json(json_object: response.body)
      end
    end
    # @param entity_id [String] A unique ID to specify the entity.
    # @param request_options [Monite::RequestOptions] 
    # @return [Void]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.entities.delete_logo_by_id(entity_id: "ea837e28-509b-4b6a-a600-d54b6aa0b1f5")
    def delete_logo_by_id(entity_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/entities/#{entity_id}/logo"
end
      end
    end
# Retrieve a metadata object associated with this entity, usually in a JSON
#  format.
    #
    # @param entity_id [String] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::PartnerMetadataResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.entities.get_partner_metadata_by_id(entity_id: "entity_id")
    def get_partner_metadata_by_id(entity_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/entities/#{entity_id}/partner_metadata"
end
        Monite::PartnerMetadataResponse.from_json(json_object: response.body)
      end
    end
# Fully replace the current metadata object with the specified instance.
    #
    # @param entity_id [String] 
    # @param request [Hash] Request of type Monite::PartnerMetadata, as a Hash
    #   * :metadata (Hash{String => Object}) 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::PartnerMetadataResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.entities.update_partner_metadata_by_id(entity_id: "entity_id", request: { metadata: { "key": "value" } })
    def update_partner_metadata_by_id(entity_id:, request:, request_options: nil)
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
  req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/entities/#{entity_id}/partner_metadata"
end
        Monite::PartnerMetadataResponse.from_json(json_object: response.body)
      end
    end
# Retrieve all settings for this entity.
    #
    # @param entity_id [String] A unique ID to specify the entity.
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::SettingsResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.entities.get_settings_by_id(entity_id: "ea837e28-509b-4b6a-a600-d54b6aa0b1f5")
    def get_settings_by_id(entity_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/entities/#{entity_id}/settings"
end
        Monite::SettingsResponse.from_json(json_object: response.body)
      end
    end
# Change the specified fields with the provided values.
    #
    # @param entity_id [String] A unique ID to specify the entity.
    # @param language [Monite::LanguageCodeEnum] 
    # @param currency [Hash] Request of type Monite::CurrencySettingsInput, as a Hash
    #   * :default (Monite::CurrencyEnum) 
    #   * :exchange_rates (Array<Monite::ExchangeRate>) 
    # @param reminder [Hash] Request of type Monite::RemindersSettings, as a Hash
    #   * :enabled (Boolean) 
    # @param vat_mode [Monite::VatModeEnum] Defines whether the prices of products in receivables will already include VAT
#  or not.
    # @param payment_priority [Monite::PaymentPriorityEnum] Payment preferences for entity to automate calculating suggested payment date
#  based on payment terms and entity preferences.
    # @param allow_purchase_order_autolinking [Boolean] Automatically attempt to find a corresponding purchase order for all incoming
#  payables.
    # @param receivable_edit_flow [Monite::ReceivableEditFlow] 
    # @param document_ids [Hash] Request of type Monite::DocumentIDsSettingsRequest, as a Hash
    #   * :document_type_prefix (Hash)
    #     * :credit_note (String) 
    #     * :invoice (String) 
    #     * :purchase_order (String) 
    #     * :quote (String) 
    #   * :include_date (Boolean) 
    #   * :min_digits (Integer) 
    #   * :next_number (Hash)
    #     * :credit_note (Integer) 
    #     * :invoice (Integer) 
    #     * :purchase_order (Integer) 
    #     * :quote (Integer) 
    #   * :prefix (String) 
    #   * :separator (Monite::DocumentIdSeparators) 
    # @param payables_ocr_auto_tagging [Array<Hash>] Auto tagging settings for all incoming OCR payable documents.Request of type Array<Monite::OcrAutoTaggingSettingsRequest>, as a Hash
    #   * :enabled (Boolean) 
    #   * :keywords (Array<String>) 
    #   * :tag_id (String) 
    # @param quote_signature_required [Boolean] Sets the default behavior of whether a signature is required to accept quotes.
    # @param generate_paid_invoice_pdf [Boolean] If enabled, the paid invoice's PDF will be in a new layout set by the user.
    # @param accounting [Hash] Request of type Monite::AccountingSettings, as a Hash
    #   * :ledger_account_ids (Hash)
    #     * :payments (String) 
    #     * :products (String) 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::SettingsResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.entities.update_settings_by_id(entity_id: "ea837e28-509b-4b6a-a600-d54b6aa0b1f5")
    def update_settings_by_id(entity_id:, language: nil, currency: nil, reminder: nil, vat_mode: nil, payment_priority: nil, allow_purchase_order_autolinking: nil, receivable_edit_flow: nil, document_ids: nil, payables_ocr_auto_tagging: nil, quote_signature_required: nil, generate_paid_invoice_pdf: nil, accounting: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), language: language, currency: currency, reminder: reminder, vat_mode: vat_mode, payment_priority: payment_priority, allow_purchase_order_autolinking: allow_purchase_order_autolinking, receivable_edit_flow: receivable_edit_flow, document_ids: document_ids, payables_ocr_auto_tagging: payables_ocr_auto_tagging, quote_signature_required: quote_signature_required, generate_paid_invoice_pdf: generate_paid_invoice_pdf, accounting: accounting }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/entities/#{entity_id}/settings"
end
        Monite::SettingsResponse.from_json(json_object: response.body)
      end
    end
# Provide files for entity onboarding verification
    #
    # @param additional_verification_document_back [String] 
    # @param additional_verification_document_front [String] 
    # @param bank_account_ownership_verification [Array<String>] 
    # @param company_license [Array<String>] 
    # @param company_memorandum_of_association [Array<String>] 
    # @param company_ministerial_decree [Array<String>] 
    # @param company_registration_verification [Array<String>] 
    # @param company_tax_id_verification [Array<String>] 
    # @param proof_of_registration [Array<String>] 
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
#  api.entities.upload_onboarding_documents
    def upload_onboarding_documents(additional_verification_document_back: nil, additional_verification_document_front: nil, bank_account_ownership_verification: nil, company_license: nil, company_memorandum_of_association: nil, company_ministerial_decree: nil, company_registration_verification: nil, company_tax_id_verification: nil, proof_of_registration: nil, verification_document_back: nil, verification_document_front: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), additional_verification_document_back: additional_verification_document_back, additional_verification_document_front: additional_verification_document_front, bank_account_ownership_verification: bank_account_ownership_verification, company_license: company_license, company_memorandum_of_association: company_memorandum_of_association, company_ministerial_decree: company_ministerial_decree, company_registration_verification: company_registration_verification, company_tax_id_verification: company_tax_id_verification, proof_of_registration: proof_of_registration, verification_document_back: verification_document_back, verification_document_front: verification_document_front }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/onboarding_documents"
end
      end
    end
# Get onboarding requirements for the entity
    #
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::GetOnboardingRequirementsResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.entities.get_onboarding_requirements
    def get_onboarding_requirements(request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/onboarding_requirements"
end
        Monite::GetOnboardingRequirementsResponse.from_json(json_object: response.body)
      end
    end
  end
end