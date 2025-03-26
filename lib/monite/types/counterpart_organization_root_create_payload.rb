# frozen_string_literal: true
require_relative "language_code_enum"
require_relative "counterpart_organization_create_payload"
require "ostruct"
require "json"

module Monite
# This schema is used to create counterparts that are organizations (juridical
#  persons).
  class CounterpartOrganizationRootCreatePayload
  # @return [Monite::LanguageCodeEnum] The language used to generate PDF documents for this counterpart.
    attr_reader :language
  # @return [Monite::CounterpartOrganizationCreatePayload] 
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

    # @param language [Monite::LanguageCodeEnum] The language used to generate PDF documents for this counterpart.
    # @param organization [Monite::CounterpartOrganizationCreatePayload] 
    # @param reminders_enabled [Boolean] 
    # @param tax_id [String] The counterpart's taxpayer identification number or tax ID. For identification
#  purposes, this field may be required for counterparts that are not
#  VAT-registered.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::CounterpartOrganizationRootCreatePayload]
    def initialize(language: OMIT, organization:, reminders_enabled: OMIT, tax_id: OMIT, additional_properties: nil)
      @language = language if language != OMIT
      @organization = organization
      @reminders_enabled = reminders_enabled if reminders_enabled != OMIT
      @tax_id = tax_id if tax_id != OMIT
      @additional_properties = additional_properties
      @_field_set = { "language": language, "organization": organization, "reminders_enabled": reminders_enabled, "tax_id": tax_id }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of
#  CounterpartOrganizationRootCreatePayload
    #
    # @param json_object [String] 
    # @return [Monite::CounterpartOrganizationRootCreatePayload]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      language = parsed_json["language"]
      unless parsed_json["organization"].nil?
        organization = parsed_json["organization"].to_json
        organization = Monite::CounterpartOrganizationCreatePayload.from_json(json_object: organization)
      else
        organization = nil
      end
      reminders_enabled = parsed_json["reminders_enabled"]
      tax_id = parsed_json["tax_id"]
      new(
        language: language,
        organization: organization,
        reminders_enabled: reminders_enabled,
        tax_id: tax_id,
        additional_properties: struct
      )
    end
# Serialize an instance of CounterpartOrganizationRootCreatePayload to a JSON
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
      obj.language&.is_a?(Monite::LanguageCodeEnum) != false || raise("Passed value for field obj.language is not the expected type, validation failed.")
      Monite::CounterpartOrganizationCreatePayload.validate_raw(obj: obj.organization)
      obj.reminders_enabled&.is_a?(Boolean) != false || raise("Passed value for field obj.reminders_enabled is not the expected type, validation failed.")
      obj.tax_id&.is_a?(String) != false || raise("Passed value for field obj.tax_id is not the expected type, validation failed.")
    end
  end
end