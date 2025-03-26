# frozen_string_literal: true
require_relative "currency_settings_output"
require_relative "payable_settings"
require_relative "receivable_settings"
require_relative "mail_settings"
require_relative "unit"
require_relative "payments_settings_output"
require_relative "api_version"
require "ostruct"
require "json"

module Monite
  class PartnerProjectSettingsPayloadOutput
  # @return [Monite::CurrencySettingsOutput] Custom currency exchange rates.
    attr_reader :currency
  # @return [Monite::PayableSettings] Settings for the payables module.
    attr_reader :payable
  # @return [Monite::ReceivableSettings] Settings for the receivables module.
    attr_reader :receivable
  # @return [Monite::MailSettings] Settings for email and mailboxes.
    attr_reader :mail
  # @return [Array<String>] Commercial conditions for receivables.
    attr_reader :commercial_conditions
  # @return [Array<Monite::Unit>] Measurement units.
    attr_reader :units
  # @return [String] 
    attr_reader :website
  # @return [Hash{String => Object}] A default role to provision upon new entity creation.
    attr_reader :default_role
  # @return [Monite::PaymentsSettingsOutput] Settings for the payments module.
    attr_reader :payments
  # @return [Monite::ApiVersion] Default API version for partner.
    attr_reader :api_version
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param currency [Monite::CurrencySettingsOutput] Custom currency exchange rates.
    # @param payable [Monite::PayableSettings] Settings for the payables module.
    # @param receivable [Monite::ReceivableSettings] Settings for the receivables module.
    # @param mail [Monite::MailSettings] Settings for email and mailboxes.
    # @param commercial_conditions [Array<String>] Commercial conditions for receivables.
    # @param units [Array<Monite::Unit>] Measurement units.
    # @param website [String] 
    # @param default_role [Hash{String => Object}] A default role to provision upon new entity creation.
    # @param payments [Monite::PaymentsSettingsOutput] Settings for the payments module.
    # @param api_version [Monite::ApiVersion] Default API version for partner.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::PartnerProjectSettingsPayloadOutput]
    def initialize(currency: OMIT, payable: OMIT, receivable: OMIT, mail: OMIT, commercial_conditions: OMIT, units: OMIT, website: OMIT, default_role: OMIT, payments: OMIT, api_version: OMIT, additional_properties: nil)
      @currency = currency if currency != OMIT
      @payable = payable if payable != OMIT
      @receivable = receivable if receivable != OMIT
      @mail = mail if mail != OMIT
      @commercial_conditions = commercial_conditions if commercial_conditions != OMIT
      @units = units if units != OMIT
      @website = website if website != OMIT
      @default_role = default_role if default_role != OMIT
      @payments = payments if payments != OMIT
      @api_version = api_version if api_version != OMIT
      @additional_properties = additional_properties
      @_field_set = { "currency": currency, "payable": payable, "receivable": receivable, "mail": mail, "commercial_conditions": commercial_conditions, "units": units, "website": website, "default_role": default_role, "payments": payments, "api_version": api_version }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of PartnerProjectSettingsPayloadOutput
    #
    # @param json_object [String] 
    # @return [Monite::PartnerProjectSettingsPayloadOutput]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["currency"].nil?
        currency = parsed_json["currency"].to_json
        currency = Monite::CurrencySettingsOutput.from_json(json_object: currency)
      else
        currency = nil
      end
      unless parsed_json["payable"].nil?
        payable = parsed_json["payable"].to_json
        payable = Monite::PayableSettings.from_json(json_object: payable)
      else
        payable = nil
      end
      unless parsed_json["receivable"].nil?
        receivable = parsed_json["receivable"].to_json
        receivable = Monite::ReceivableSettings.from_json(json_object: receivable)
      else
        receivable = nil
      end
      unless parsed_json["mail"].nil?
        mail = parsed_json["mail"].to_json
        mail = Monite::MailSettings.from_json(json_object: mail)
      else
        mail = nil
      end
      commercial_conditions = parsed_json["commercial_conditions"]
      units = parsed_json["units"]&.map do | item |
  item = item.to_json
  Monite::Unit.from_json(json_object: item)
end
      website = parsed_json["website"]
      default_role = parsed_json["default_role"]
      unless parsed_json["payments"].nil?
        payments = parsed_json["payments"].to_json
        payments = Monite::PaymentsSettingsOutput.from_json(json_object: payments)
      else
        payments = nil
      end
      api_version = parsed_json["api_version"]
      new(
        currency: currency,
        payable: payable,
        receivable: receivable,
        mail: mail,
        commercial_conditions: commercial_conditions,
        units: units,
        website: website,
        default_role: default_role,
        payments: payments,
        api_version: api_version,
        additional_properties: struct
      )
    end
# Serialize an instance of PartnerProjectSettingsPayloadOutput to a JSON object
    #
    # @return [String]
    def to_json
      @_field_set&.to_json
    end
# Leveraged for Union-type generation, validate_raw attempts to parse the given
#  hash and check each fields type against the current object's property
#  definitions.
    #
    # @param obj [Object] 
    # @return [Void]
    def self.validate_raw(obj:)
      obj.currency.nil? || Monite::CurrencySettingsOutput.validate_raw(obj: obj.currency)
      obj.payable.nil? || Monite::PayableSettings.validate_raw(obj: obj.payable)
      obj.receivable.nil? || Monite::ReceivableSettings.validate_raw(obj: obj.receivable)
      obj.mail.nil? || Monite::MailSettings.validate_raw(obj: obj.mail)
      obj.commercial_conditions&.is_a?(Array) != false || raise("Passed value for field obj.commercial_conditions is not the expected type, validation failed.")
      obj.units&.is_a?(Array) != false || raise("Passed value for field obj.units is not the expected type, validation failed.")
      obj.website&.is_a?(String) != false || raise("Passed value for field obj.website is not the expected type, validation failed.")
      obj.default_role&.is_a?(Hash) != false || raise("Passed value for field obj.default_role is not the expected type, validation failed.")
      obj.payments.nil? || Monite::PaymentsSettingsOutput.validate_raw(obj: obj.payments)
      obj.api_version&.is_a?(Monite::ApiVersion) != false || raise("Passed value for field obj.api_version is not the expected type, validation failed.")
    end
  end
end