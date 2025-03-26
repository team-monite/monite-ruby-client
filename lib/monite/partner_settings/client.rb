# frozen_string_literal: true
require_relative "../../requests"
require_relative "../types/partner_project_settings_payload_output"
require_relative "../types/currency_settings_input"
require_relative "../types/payable_settings"
require_relative "../types/receivable_settings"
require_relative "../types/mail_settings"
require_relative "../types/unit"
require_relative "../types/payments_settings_input"
require_relative "../types/api_version"
require "async"
require "async"
require_relative "../../requests"

module Monite
  class PartnerSettingsClient
  # @return [Monite::RequestClient] 
    attr_reader :request_client


    # @param request_client [Monite::RequestClient] 
    # @return [Monite::PartnerSettingsClient]
    def initialize(request_client:)
      @request_client = request_client
    end
# Retrieve all settings for this partner.
    #
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::PartnerProjectSettingsPayloadOutput]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.partner_settings.get
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
  req.url "#{@request_client.get_url(request_options: request_options)}/settings"
end
      Monite::PartnerProjectSettingsPayloadOutput.from_json(json_object: response.body)
    end
# Change the specified fields with the provided values.
    #
    # @param currency [Hash] Custom currency exchange rates.Request of type Monite::CurrencySettingsInput, as a Hash
    #   * :default (Monite::CurrencyEnum) 
    #   * :exchange_rates (Array<Monite::ExchangeRate>) 
    # @param payable [Hash] Settings for the payables module.Request of type Monite::PayableSettings, as a Hash
    #   * :allow_cancel_duplicates_automatically (Boolean) 
    #   * :allow_counterpart_autocreation (Boolean) 
    #   * :allow_counterpart_autolinking (Boolean) 
    #   * :allow_credit_note_autolinking (Boolean) 
    #   * :approve_page_url (String) 
    #   * :default_state (String) 
    #   * :enable_line_items (Boolean) 
    #   * :skip_approval_for_paid_invoice (Boolean) 
    # @param receivable [Hash] Settings for the receivables module.Request of type Monite::ReceivableSettings, as a Hash
    #   * :create_without_personal_info (Boolean) 
    #   * :deduction_title (String) 
    # @param mail [Hash] Settings for email and mailboxes.Request of type Monite::MailSettings, as a Hash
    #   * :attach_documents_as_pdf (Boolean) 
    #   * :from_email_username (String) 
    #   * :from_name (String) 
    # @param commercial_conditions [Array<String>] Commercial conditions for receivables.
    # @param units [Array<Hash>] Measurement units.Request of type Array<Monite::Unit>, as a Hash
    #   * :designation (String) 
    #   * :name (String) 
    # @param website [String] 
    # @param default_role [Hash{String => Object}] A default role to provision upon new entity creation.
    # @param payments [Hash] Settings for the payments module.Request of type Monite::PaymentsSettingsInput, as a Hash
    #   * :payment_page_domain (String) 
    #   * :payment_page_theme (Hash)
    #     * :background_color (String) 
    #     * :border_radius (String) 
    #     * :button (Hash)
    #       * :primary_color (String) 
    #       * :primary_hover_color (String) 
    #       * :secondary_color (String) 
    #       * :secondary_hover_color (String) 
    #     * :card (Hash)
    #       * :background_color (String) 
    #     * :font_color (String) 
    #     * :font_family (String) 
    #     * :font_link_href (String) 
    #     * :logo_src (String) 
    #   * :support_email (String) 
    # @param api_version [Monite::ApiVersion] Default API version for partner.
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::PartnerProjectSettingsPayloadOutput]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.partner_settings.update
    def update(currency: nil, payable: nil, receivable: nil, mail: nil, commercial_conditions: nil, units: nil, website: nil, default_role: nil, payments: nil, api_version: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), currency: currency, payable: payable, receivable: receivable, mail: mail, commercial_conditions: commercial_conditions, units: units, website: website, default_role: default_role, payments: payments, api_version: api_version }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/settings"
end
      Monite::PartnerProjectSettingsPayloadOutput.from_json(json_object: response.body)
    end
  end
  class AsyncPartnerSettingsClient
  # @return [Monite::AsyncRequestClient] 
    attr_reader :request_client


    # @param request_client [Monite::RequestClient] 
    # @return [Monite::AsyncPartnerSettingsClient]
    def initialize(request_client:)
      @request_client = request_client
    end
# Retrieve all settings for this partner.
    #
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::PartnerProjectSettingsPayloadOutput]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.partner_settings.get
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
  req.url "#{@request_client.get_url(request_options: request_options)}/settings"
end
        Monite::PartnerProjectSettingsPayloadOutput.from_json(json_object: response.body)
      end
    end
# Change the specified fields with the provided values.
    #
    # @param currency [Hash] Custom currency exchange rates.Request of type Monite::CurrencySettingsInput, as a Hash
    #   * :default (Monite::CurrencyEnum) 
    #   * :exchange_rates (Array<Monite::ExchangeRate>) 
    # @param payable [Hash] Settings for the payables module.Request of type Monite::PayableSettings, as a Hash
    #   * :allow_cancel_duplicates_automatically (Boolean) 
    #   * :allow_counterpart_autocreation (Boolean) 
    #   * :allow_counterpart_autolinking (Boolean) 
    #   * :allow_credit_note_autolinking (Boolean) 
    #   * :approve_page_url (String) 
    #   * :default_state (String) 
    #   * :enable_line_items (Boolean) 
    #   * :skip_approval_for_paid_invoice (Boolean) 
    # @param receivable [Hash] Settings for the receivables module.Request of type Monite::ReceivableSettings, as a Hash
    #   * :create_without_personal_info (Boolean) 
    #   * :deduction_title (String) 
    # @param mail [Hash] Settings for email and mailboxes.Request of type Monite::MailSettings, as a Hash
    #   * :attach_documents_as_pdf (Boolean) 
    #   * :from_email_username (String) 
    #   * :from_name (String) 
    # @param commercial_conditions [Array<String>] Commercial conditions for receivables.
    # @param units [Array<Hash>] Measurement units.Request of type Array<Monite::Unit>, as a Hash
    #   * :designation (String) 
    #   * :name (String) 
    # @param website [String] 
    # @param default_role [Hash{String => Object}] A default role to provision upon new entity creation.
    # @param payments [Hash] Settings for the payments module.Request of type Monite::PaymentsSettingsInput, as a Hash
    #   * :payment_page_domain (String) 
    #   * :payment_page_theme (Hash)
    #     * :background_color (String) 
    #     * :border_radius (String) 
    #     * :button (Hash)
    #       * :primary_color (String) 
    #       * :primary_hover_color (String) 
    #       * :secondary_color (String) 
    #       * :secondary_hover_color (String) 
    #     * :card (Hash)
    #       * :background_color (String) 
    #     * :font_color (String) 
    #     * :font_family (String) 
    #     * :font_link_href (String) 
    #     * :logo_src (String) 
    #   * :support_email (String) 
    # @param api_version [Monite::ApiVersion] Default API version for partner.
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::PartnerProjectSettingsPayloadOutput]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.partner_settings.update
    def update(currency: nil, payable: nil, receivable: nil, mail: nil, commercial_conditions: nil, units: nil, website: nil, default_role: nil, payments: nil, api_version: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), currency: currency, payable: payable, receivable: receivable, mail: mail, commercial_conditions: commercial_conditions, units: units, website: website, default_role: default_role, payments: payments, api_version: api_version }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/settings"
end
        Monite::PartnerProjectSettingsPayloadOutput.from_json(json_object: response.body)
      end
    end
  end
end