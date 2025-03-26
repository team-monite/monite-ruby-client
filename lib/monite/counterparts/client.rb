# frozen_string_literal: true
require_relative "../../requests"
require_relative "addresses/client"
require_relative "bank_accounts/client"
require_relative "contacts/client"
require_relative "vat_ids/client"
require_relative "../types/order_enum"
require_relative "../types/counterpart_cursor_fields"
require_relative "../types/counterpart_type"
require "date"
require "date"
require "date"
require "date"
require_relative "../types/counterpart_pagination_response"
require_relative "../types/counterpart_create_payload"
require_relative "../types/counterpart_response"
require_relative "../types/counterpart_update_payload"
require_relative "../types/partner_metadata_response"
require_relative "../types/partner_metadata"
require "async"
require "async"
require "async"
require "async"
require "async"
require "async"
require "async"
require_relative "../../requests"

module Monite
  class CounterpartsClient
  # @return [Monite::RequestClient] 
    attr_reader :request_client
  # @return [Monite::Counterparts::AddressesClient] 
    attr_reader :addresses
  # @return [Monite::Counterparts::BankAccountsClient] 
    attr_reader :bank_accounts
  # @return [Monite::Counterparts::ContactsClient] 
    attr_reader :contacts
  # @return [Monite::Counterparts::VatIdsClient] 
    attr_reader :vat_ids


    # @param request_client [Monite::RequestClient] 
    # @return [Monite::CounterpartsClient]
    def initialize(request_client:)
      @request_client = request_client
      @addresses = Monite::Counterparts::AddressesClient.new(request_client: request_client)
      @bank_accounts = Monite::Counterparts::BankAccountsClient.new(request_client: request_client)
      @contacts = Monite::Counterparts::ContactsClient.new(request_client: request_client)
      @vat_ids = Monite::Counterparts::VatIdsClient.new(request_client: request_client)
    end
    # @param iban [String] The IBAN of the counterpart's bank account.
    # @param sort_code [String] The bank's sort code.
    # @param account_number [String] The bank account number. Required for US bank accounts to accept ACH payments.
#  US account numbers contain 9 to 12 digits. UK account numbers typically contain
#  8 digits.
    # @param tax_id [String] The tax ID of the counterpart.
    # @param vat_id [String] The VAT ID of the counterpart.
    # @param id_in [String] A list of counterpart IDs to search through.
    # @param order [Monite::OrderEnum] Order by
    # @param limit [Integer] Max is 100
    # @param pagination_token [String] A token, obtained from previous page. Prior over other filters
    # @param sort [Monite::COUNTERPART_CURSOR_FIELDS] Allowed sort fields
    # @param type [Monite::CounterpartType] 
    # @param counterpart_name [String] 
    # @param counterpart_name_iexact [String] 
    # @param counterpart_name_contains [String] 
    # @param counterpart_name_icontains [String] 
    # @param is_vendor [Boolean] 
    # @param is_customer [Boolean] 
    # @param email [String] 
    # @param email_contains [String] 
    # @param email_icontains [String] 
    # @param created_at_gt [DateTime] 
    # @param created_at_lt [DateTime] 
    # @param created_at_gte [DateTime] 
    # @param created_at_lte [DateTime] 
    # @param address_country [String] 
    # @param address_city [String] 
    # @param address_postal_code [String] 
    # @param address_state [String] 
    # @param address_line_1 [String] 
    # @param address_line_2 [String] 
    # @param tag_ids_in [String] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::CounterpartPaginationResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.counterparts.get(sort_code: "123456")
    def get(iban: nil, sort_code: nil, account_number: nil, tax_id: nil, vat_id: nil, id_in: nil, order: nil, limit: nil, pagination_token: nil, sort: nil, type: nil, counterpart_name: nil, counterpart_name_iexact: nil, counterpart_name_contains: nil, counterpart_name_icontains: nil, is_vendor: nil, is_customer: nil, email: nil, email_contains: nil, email_icontains: nil, created_at_gt: nil, created_at_lt: nil, created_at_gte: nil, created_at_lte: nil, address_country: nil, address_city: nil, address_postal_code: nil, address_state: nil, address_line_1: nil, address_line_2: nil, tag_ids_in: nil, request_options: nil)
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
  req.params = { **(request_options&.additional_query_parameters || {}), "iban": iban, "sort_code": sort_code, "account_number": account_number, "tax_id": tax_id, "vat_id": vat_id, "id__in": id_in, "order": order, "limit": limit, "pagination_token": pagination_token, "sort": sort, "type": type, "counterpart_name": counterpart_name, "counterpart_name__iexact": counterpart_name_iexact, "counterpart_name__contains": counterpart_name_contains, "counterpart_name__icontains": counterpart_name_icontains, "is_vendor": is_vendor, "is_customer": is_customer, "email": email, "email__contains": email_contains, "email__icontains": email_icontains, "created_at__gt": created_at_gt, "created_at__lt": created_at_lt, "created_at__gte": created_at_gte, "created_at__lte": created_at_lte, "address.country": address_country, "address.city": address_city, "address.postal_code": address_postal_code, "address.state": address_state, "address.line1": address_line_1, "address.line2": address_line_2, "tag_ids__in": tag_ids_in }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/counterparts"
end
      Monite::CounterpartPaginationResponse.from_json(json_object: response.body)
    end
    # @param request [Monite::CounterpartCreatePayload] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::CounterpartIndividualRootResponse, Monite::CounterpartOrganizationRootResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.counterparts.create
    def create(request:, request_options: nil)
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
  req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/counterparts"
end
      Monite::CounterpartResponse.from_json(json_object: response.body)
    end
    # @param counterpart_id [String] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::CounterpartIndividualRootResponse, Monite::CounterpartOrganizationRootResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.counterparts.get_by_id(counterpart_id: "counterpart_id")
    def get_by_id(counterpart_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/counterparts/#{counterpart_id}"
end
      Monite::CounterpartResponse.from_json(json_object: response.body)
    end
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
#  api.counterparts.delete_by_id(counterpart_id: "counterpart_id")
    def delete_by_id(counterpart_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/counterparts/#{counterpart_id}"
end
    end
    # @param counterpart_id [String] 
    # @param request [Monite::CounterpartIndividualRootUpdatePayload, Monite::CounterpartOrganizationRootUpdatePayload] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::CounterpartIndividualRootResponse, Monite::CounterpartOrganizationRootResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.counterparts.update_by_id(counterpart_id: "counterpart_id", request: { individual: {  } })
    def update_by_id(counterpart_id:, request:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/counterparts/#{counterpart_id}"
end
      Monite::CounterpartResponse.from_json(json_object: response.body)
    end
    # @param counterpart_id [String] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::PartnerMetadataResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.counterparts.get_partner_metadata_by_id(counterpart_id: "counterpart_id")
    def get_partner_metadata_by_id(counterpart_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/counterparts/#{counterpart_id}/partner_metadata"
end
      Monite::PartnerMetadataResponse.from_json(json_object: response.body)
    end
    # @param counterpart_id [String] 
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
#  api.counterparts.update_partner_metadata_by_id(counterpart_id: "counterpart_id", request: { metadata: { "key": "value" } })
    def update_partner_metadata_by_id(counterpart_id:, request:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/counterparts/#{counterpart_id}/partner_metadata"
end
      Monite::PartnerMetadataResponse.from_json(json_object: response.body)
    end
  end
  class AsyncCounterpartsClient
  # @return [Monite::AsyncRequestClient] 
    attr_reader :request_client
  # @return [Monite::Counterparts::AddressesClient] 
    attr_reader :addresses
  # @return [Monite::Counterparts::BankAccountsClient] 
    attr_reader :bank_accounts
  # @return [Monite::Counterparts::ContactsClient] 
    attr_reader :contacts
  # @return [Monite::Counterparts::VatIdsClient] 
    attr_reader :vat_ids


    # @param request_client [Monite::RequestClient] 
    # @return [Monite::AsyncCounterpartsClient]
    def initialize(request_client:)
      @request_client = request_client
      @addresses = Monite::Counterparts::AsyncAddressesClient.new(request_client: request_client)
      @bank_accounts = Monite::Counterparts::AsyncBankAccountsClient.new(request_client: request_client)
      @contacts = Monite::Counterparts::AsyncContactsClient.new(request_client: request_client)
      @vat_ids = Monite::Counterparts::AsyncVatIdsClient.new(request_client: request_client)
    end
    # @param iban [String] The IBAN of the counterpart's bank account.
    # @param sort_code [String] The bank's sort code.
    # @param account_number [String] The bank account number. Required for US bank accounts to accept ACH payments.
#  US account numbers contain 9 to 12 digits. UK account numbers typically contain
#  8 digits.
    # @param tax_id [String] The tax ID of the counterpart.
    # @param vat_id [String] The VAT ID of the counterpart.
    # @param id_in [String] A list of counterpart IDs to search through.
    # @param order [Monite::OrderEnum] Order by
    # @param limit [Integer] Max is 100
    # @param pagination_token [String] A token, obtained from previous page. Prior over other filters
    # @param sort [Monite::COUNTERPART_CURSOR_FIELDS] Allowed sort fields
    # @param type [Monite::CounterpartType] 
    # @param counterpart_name [String] 
    # @param counterpart_name_iexact [String] 
    # @param counterpart_name_contains [String] 
    # @param counterpart_name_icontains [String] 
    # @param is_vendor [Boolean] 
    # @param is_customer [Boolean] 
    # @param email [String] 
    # @param email_contains [String] 
    # @param email_icontains [String] 
    # @param created_at_gt [DateTime] 
    # @param created_at_lt [DateTime] 
    # @param created_at_gte [DateTime] 
    # @param created_at_lte [DateTime] 
    # @param address_country [String] 
    # @param address_city [String] 
    # @param address_postal_code [String] 
    # @param address_state [String] 
    # @param address_line_1 [String] 
    # @param address_line_2 [String] 
    # @param tag_ids_in [String] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::CounterpartPaginationResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.counterparts.get(sort_code: "123456")
    def get(iban: nil, sort_code: nil, account_number: nil, tax_id: nil, vat_id: nil, id_in: nil, order: nil, limit: nil, pagination_token: nil, sort: nil, type: nil, counterpart_name: nil, counterpart_name_iexact: nil, counterpart_name_contains: nil, counterpart_name_icontains: nil, is_vendor: nil, is_customer: nil, email: nil, email_contains: nil, email_icontains: nil, created_at_gt: nil, created_at_lt: nil, created_at_gte: nil, created_at_lte: nil, address_country: nil, address_city: nil, address_postal_code: nil, address_state: nil, address_line_1: nil, address_line_2: nil, tag_ids_in: nil, request_options: nil)
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
  req.params = { **(request_options&.additional_query_parameters || {}), "iban": iban, "sort_code": sort_code, "account_number": account_number, "tax_id": tax_id, "vat_id": vat_id, "id__in": id_in, "order": order, "limit": limit, "pagination_token": pagination_token, "sort": sort, "type": type, "counterpart_name": counterpart_name, "counterpart_name__iexact": counterpart_name_iexact, "counterpart_name__contains": counterpart_name_contains, "counterpart_name__icontains": counterpart_name_icontains, "is_vendor": is_vendor, "is_customer": is_customer, "email": email, "email__contains": email_contains, "email__icontains": email_icontains, "created_at__gt": created_at_gt, "created_at__lt": created_at_lt, "created_at__gte": created_at_gte, "created_at__lte": created_at_lte, "address.country": address_country, "address.city": address_city, "address.postal_code": address_postal_code, "address.state": address_state, "address.line1": address_line_1, "address.line2": address_line_2, "tag_ids__in": tag_ids_in }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/counterparts"
end
        Monite::CounterpartPaginationResponse.from_json(json_object: response.body)
      end
    end
    # @param request [Monite::CounterpartCreatePayload] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::CounterpartIndividualRootResponse, Monite::CounterpartOrganizationRootResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.counterparts.create
    def create(request:, request_options: nil)
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
  req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/counterparts"
end
        Monite::CounterpartResponse.from_json(json_object: response.body)
      end
    end
    # @param counterpart_id [String] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::CounterpartIndividualRootResponse, Monite::CounterpartOrganizationRootResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.counterparts.get_by_id(counterpart_id: "counterpart_id")
    def get_by_id(counterpart_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/counterparts/#{counterpart_id}"
end
        Monite::CounterpartResponse.from_json(json_object: response.body)
      end
    end
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
#  api.counterparts.delete_by_id(counterpart_id: "counterpart_id")
    def delete_by_id(counterpart_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/counterparts/#{counterpart_id}"
end
      end
    end
    # @param counterpart_id [String] 
    # @param request [Monite::CounterpartIndividualRootUpdatePayload, Monite::CounterpartOrganizationRootUpdatePayload] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::CounterpartIndividualRootResponse, Monite::CounterpartOrganizationRootResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.counterparts.update_by_id(counterpart_id: "counterpart_id", request: { individual: {  } })
    def update_by_id(counterpart_id:, request:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/counterparts/#{counterpart_id}"
end
        Monite::CounterpartResponse.from_json(json_object: response.body)
      end
    end
    # @param counterpart_id [String] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::PartnerMetadataResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.counterparts.get_partner_metadata_by_id(counterpart_id: "counterpart_id")
    def get_partner_metadata_by_id(counterpart_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/counterparts/#{counterpart_id}/partner_metadata"
end
        Monite::PartnerMetadataResponse.from_json(json_object: response.body)
      end
    end
    # @param counterpart_id [String] 
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
#  api.counterparts.update_partner_metadata_by_id(counterpart_id: "counterpart_id", request: { metadata: { "key": "value" } })
    def update_partner_metadata_by_id(counterpart_id:, request:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/counterparts/#{counterpart_id}/partner_metadata"
end
        Monite::PartnerMetadataResponse.from_json(json_object: response.body)
      end
    end
  end
end