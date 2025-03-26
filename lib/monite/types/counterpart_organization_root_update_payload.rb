# frozen_string_literal: true
require_relative "language_code_enum"
require_relative "counterpart_organization_update_payload"
require "ostruct"
require "json"

module Monite
# Represents counterparts that are organizations (juridical persons).
  class CounterpartOrganizationRootUpdatePayload
  # @return [String] ID of the counterpart's billing address. If the counterpart is US-based and
#  needs to accept ACH payments, this address must have all fields filled in. If
#  `default_billing_address_id` is not defined, the default address is instead used
#  as the billing address for ACH payments.
    attr_reader :default_billing_address_id
  # @return [String] ID of the shipping address.
    attr_reader :default_shipping_address_id
  # @return [Monite::LanguageCodeEnum] The language used to generate PDF documents for this counterpart.
    attr_reader :language
  # @return [Monite::CounterpartOrganizationUpdatePayload] 
    attr_reader :organization
  # @return [Boolean] 
    attr_reader :reminders_enabled
  # @return [String] The counterpart's taxpayer identification number or tax ID. For identification
#  purposes, this field may be required for counterparts that are not
#  VAT-registered.
    attr_reader :tax_id
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param default_billing_address_id [String] ID of the counterpart's billing address. If the counterpart is US-based and
#  needs to accept ACH payments, this address must have all fields filled in. If
#  `default_billing_address_id` is not defined, the default address is instead used
#  as the billing address for ACH payments.
    # @param default_shipping_address_id [String] ID of the shipping address.
    # @param language [Monite::LanguageCodeEnum] The language used to generate PDF documents for this counterpart.
    # @param organization [Monite::CounterpartOrganizationUpdatePayload] 
    # @param reminders_enabled [Boolean] 
    # @param tax_id [String] The counterpart's taxpayer identification number or tax ID. For identification
#  purposes, this field may be required for counterparts that are not
#  VAT-registered.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::CounterpartOrganizationRootUpdatePayload]
    def initialize(default_billing_address_id: OMIT, default_shipping_address_id: OMIT, language: OMIT, organization:, reminders_enabled: OMIT, tax_id: OMIT, additional_properties: nil)
      @default_billing_address_id = default_billing_address_id if default_billing_address_id != OMIT
      @default_shipping_address_id = default_shipping_address_id if default_shipping_address_id != OMIT
      @language = language if language != OMIT
      @organization = organization
      @reminders_enabled = reminders_enabled if reminders_enabled != OMIT
      @tax_id = tax_id if tax_id != OMIT
      @additional_properties = additional_properties
      @_field_set = { "default_billing_address_id": default_billing_address_id, "default_shipping_address_id": default_shipping_address_id, "language": language, "organization": organization, "reminders_enabled": reminders_enabled, "tax_id": tax_id }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of
#  CounterpartOrganizationRootUpdatePayload
    #
    # @param json_object [String] 
    # @return [Monite::CounterpartOrganizationRootUpdatePayload]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      default_billing_address_id = parsed_json["default_billing_address_id"]
      default_shipping_address_id = parsed_json["default_shipping_address_id"]
      language = parsed_json["language"]
      unless parsed_json["organization"].nil?
        organization = parsed_json["organization"].to_json
        organization = Monite::CounterpartOrganizationUpdatePayload.from_json(json_object: organization)
      else
        organization = nil
      end
      reminders_enabled = parsed_json["reminders_enabled"]
      tax_id = parsed_json["tax_id"]
      new(
        default_billing_address_id: default_billing_address_id,
        default_shipping_address_id: default_shipping_address_id,
        language: language,
        organization: organization,
        reminders_enabled: reminders_enabled,
        tax_id: tax_id,
        additional_properties: struct
      )
    end
# Serialize an instance of CounterpartOrganizationRootUpdatePayload to a JSON
#  object
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
      obj.default_billing_address_id&.is_a?(String) != false || raise("Passed value for field obj.default_billing_address_id is not the expected type, validation failed.")
      obj.default_shipping_address_id&.is_a?(String) != false || raise("Passed value for field obj.default_shipping_address_id is not the expected type, validation failed.")
      obj.language&.is_a?(Monite::LanguageCodeEnum) != false || raise("Passed value for field obj.language is not the expected type, validation failed.")
      Monite::CounterpartOrganizationUpdatePayload.validate_raw(obj: obj.organization)
      obj.reminders_enabled&.is_a?(Boolean) != false || raise("Passed value for field obj.reminders_enabled is not the expected type, validation failed.")
      obj.tax_id&.is_a?(String) != false || raise("Passed value for field obj.tax_id is not the expected type, validation failed.")
    end
  end
end