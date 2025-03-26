# frozen_string_literal: true
require_relative "counterpart_individual_create_payload"
require_relative "language_code_enum"
require "ostruct"
require "json"

module Monite
# This schema is used to create counterparts that are individuals (natural
#  persons).
  class CounterpartIndividualRootCreatePayload
  # @return [Monite::CounterpartIndividualCreatePayload] 
    attr_reader :individual
  # @return [Monite::LanguageCodeEnum] The language used to generate PDF documents for this counterpart.
    attr_reader :language
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

    # @param individual [Monite::CounterpartIndividualCreatePayload] 
    # @param language [Monite::LanguageCodeEnum] The language used to generate PDF documents for this counterpart.
    # @param reminders_enabled [Boolean] 
    # @param tax_id [String] The counterpart's taxpayer identification number or tax ID. For identification
#  purposes, this field may be required for counterparts that are not
#  VAT-registered.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::CounterpartIndividualRootCreatePayload]
    def initialize(individual:, language: OMIT, reminders_enabled: OMIT, tax_id: OMIT, additional_properties: nil)
      @individual = individual
      @language = language if language != OMIT
      @reminders_enabled = reminders_enabled if reminders_enabled != OMIT
      @tax_id = tax_id if tax_id != OMIT
      @additional_properties = additional_properties
      @_field_set = { "individual": individual, "language": language, "reminders_enabled": reminders_enabled, "tax_id": tax_id }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of
#  CounterpartIndividualRootCreatePayload
    #
    # @param json_object [String] 
    # @return [Monite::CounterpartIndividualRootCreatePayload]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["individual"].nil?
        individual = parsed_json["individual"].to_json
        individual = Monite::CounterpartIndividualCreatePayload.from_json(json_object: individual)
      else
        individual = nil
      end
      language = parsed_json["language"]
      reminders_enabled = parsed_json["reminders_enabled"]
      tax_id = parsed_json["tax_id"]
      new(
        individual: individual,
        language: language,
        reminders_enabled: reminders_enabled,
        tax_id: tax_id,
        additional_properties: struct
      )
    end
# Serialize an instance of CounterpartIndividualRootCreatePayload to a JSON object
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
      Monite::CounterpartIndividualCreatePayload.validate_raw(obj: obj.individual)
      obj.language&.is_a?(Monite::LanguageCodeEnum) != false || raise("Passed value for field obj.language is not the expected type, validation failed.")
      obj.reminders_enabled&.is_a?(Boolean) != false || raise("Passed value for field obj.reminders_enabled is not the expected type, validation failed.")
      obj.tax_id&.is_a?(String) != false || raise("Passed value for field obj.tax_id is not the expected type, validation failed.")
    end
  end
end