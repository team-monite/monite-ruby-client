# frozen_string_literal: true
require_relative "root_schema_input"
require "ostruct"
require "json"

module Monite
  class BizObjectsSchemaInput
  # @return [Array<Monite::RootSchemaInput>] List of objects
    attr_reader :objects
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param objects [Array<Monite::RootSchemaInput>] List of objects
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::BizObjectsSchemaInput]
    def initialize(objects: OMIT, additional_properties: nil)
      @objects = objects if objects != OMIT
      @additional_properties = additional_properties
      @_field_set = { "objects": objects }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of BizObjectsSchemaInput
    #
    # @param json_object [String] 
    # @return [Monite::BizObjectsSchemaInput]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      objects = parsed_json["objects"]&.map do | item |
  item = item.to_json
  Monite::RootSchemaInput.from_json(json_object: item)
end
      new(objects: objects, additional_properties: struct)
    end
# Serialize an instance of BizObjectsSchemaInput to a JSON object
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
      obj.objects&.is_a?(Array) != false || raise("Passed value for field obj.objects is not the expected type, validation failed.")
    end
  end
end