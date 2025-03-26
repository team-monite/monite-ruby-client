# frozen_string_literal: true
require_relative "missing_fields"
require_relative "receivables_reminders_warning_message"
require "ostruct"
require "json"

module Monite
# A schema for returning a response with validation results
  class ReceivablesVerifyResponse
  # @return [Monite::MissingFields] Missing fields of receivable
    attr_reader :errors
  # @return [Monite::ReceivablesRemindersWarningMessage] Warning message for payment reminder
    attr_reader :warnings
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param errors [Monite::MissingFields] Missing fields of receivable
    # @param warnings [Monite::ReceivablesRemindersWarningMessage] Warning message for payment reminder
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::ReceivablesVerifyResponse]
    def initialize(errors: OMIT, warnings: OMIT, additional_properties: nil)
      @errors = errors if errors != OMIT
      @warnings = warnings if warnings != OMIT
      @additional_properties = additional_properties
      @_field_set = { "errors": errors, "warnings": warnings }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of ReceivablesVerifyResponse
    #
    # @param json_object [String] 
    # @return [Monite::ReceivablesVerifyResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["errors"].nil?
        errors = parsed_json["errors"].to_json
        errors = Monite::MissingFields.from_json(json_object: errors)
      else
        errors = nil
      end
      unless parsed_json["warnings"].nil?
        warnings = parsed_json["warnings"].to_json
        warnings = Monite::ReceivablesRemindersWarningMessage.from_json(json_object: warnings)
      else
        warnings = nil
      end
      new(
        errors: errors,
        warnings: warnings,
        additional_properties: struct
      )
    end
# Serialize an instance of ReceivablesVerifyResponse to a JSON object
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
      obj.errors.nil? || Monite::MissingFields.validate_raw(obj: obj.errors)
      obj.warnings.nil? || Monite::ReceivablesRemindersWarningMessage.validate_raw(obj: obj.warnings)
    end
  end
end