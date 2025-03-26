# frozen_string_literal: true
require_relative "payables_fields_allowed_for_validate"
require "ostruct"
require "json"

module Monite
  class PayableValidationsResource
  # @return [Array<Monite::PayablesFieldsAllowedForValidate>] 
    attr_reader :required_fields
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param required_fields [Array<Monite::PayablesFieldsAllowedForValidate>] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::PayableValidationsResource]
    def initialize(required_fields:, additional_properties: nil)
      @required_fields = required_fields
      @additional_properties = additional_properties
      @_field_set = { "required_fields": required_fields }
    end
# Deserialize a JSON object to an instance of PayableValidationsResource
    #
    # @param json_object [String] 
    # @return [Monite::PayableValidationsResource]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      required_fields = parsed_json["required_fields"]
      new(required_fields: required_fields, additional_properties: struct)
    end
# Serialize an instance of PayableValidationsResource to a JSON object
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
      obj.required_fields.is_a?(Array) != false || raise("Passed value for field obj.required_fields is not the expected type, validation failed.")
    end
  end
end