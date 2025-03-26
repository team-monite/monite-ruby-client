# frozen_string_literal: true
require_relative "document_type_enum"
require_relative "variable"
require "ostruct"
require "json"

module Monite
  class VariablesObject
  # @return [Monite::DocumentTypeEnum] 
    attr_reader :object_subtype
  # @return [String] 
    attr_reader :object_type
  # @return [Array<Monite::Variable>] 
    attr_reader :variables
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param object_subtype [Monite::DocumentTypeEnum] 
    # @param object_type [String] 
    # @param variables [Array<Monite::Variable>] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::VariablesObject]
    def initialize(object_subtype:, object_type:, variables:, additional_properties: nil)
      @object_subtype = object_subtype
      @object_type = object_type
      @variables = variables
      @additional_properties = additional_properties
      @_field_set = { "object_subtype": object_subtype, "object_type": object_type, "variables": variables }
    end
# Deserialize a JSON object to an instance of VariablesObject
    #
    # @param json_object [String] 
    # @return [Monite::VariablesObject]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      object_subtype = parsed_json["object_subtype"]
      object_type = parsed_json["object_type"]
      variables = parsed_json["variables"]&.map do | item |
  item = item.to_json
  Monite::Variable.from_json(json_object: item)
end
      new(
        object_subtype: object_subtype,
        object_type: object_type,
        variables: variables,
        additional_properties: struct
      )
    end
# Serialize an instance of VariablesObject to a JSON object
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
      obj.object_subtype.is_a?(Monite::DocumentTypeEnum) != false || raise("Passed value for field obj.object_subtype is not the expected type, validation failed.")
      obj.object_type.is_a?(String) != false || raise("Passed value for field obj.object_type is not the expected type, validation failed.")
      obj.variables.is_a?(Array) != false || raise("Passed value for field obj.variables is not the expected type, validation failed.")
    end
  end
end