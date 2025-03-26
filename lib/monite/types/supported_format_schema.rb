# frozen_string_literal: true
require_relative "supported_format_schema_object_type"
require "ostruct"
require "json"

module Monite
  class SupportedFormatSchema
  # @return [Hash{String => Array}] 
    attr_reader :available_types
  # @return [Monite::SupportedFormatSchemaObjectType] 
    attr_reader :object_type
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param available_types [Hash{String => Array}] 
    # @param object_type [Monite::SupportedFormatSchemaObjectType] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::SupportedFormatSchema]
    def initialize(available_types:, object_type:, additional_properties: nil)
      @available_types = available_types
      @object_type = object_type
      @additional_properties = additional_properties
      @_field_set = { "available_types": available_types, "object_type": object_type }
    end
# Deserialize a JSON object to an instance of SupportedFormatSchema
    #
    # @param json_object [String] 
    # @return [Monite::SupportedFormatSchema]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      available_types = parsed_json["available_types"]
      object_type = parsed_json["object_type"]
      new(
        available_types: available_types,
        object_type: object_type,
        additional_properties: struct
      )
    end
# Serialize an instance of SupportedFormatSchema to a JSON object
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
      obj.available_types.is_a?(Hash) != false || raise("Passed value for field obj.available_types is not the expected type, validation failed.")
      obj.object_type.is_a?(Monite::SupportedFormatSchemaObjectType) != false || raise("Passed value for field obj.object_type is not the expected type, validation failed.")
    end
  end
end