# frozen_string_literal: true
require "ostruct"
require "json"

module Monite
  class Variable
  # @return [String] 
    attr_reader :description
  # @return [String] 
    attr_reader :name
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param description [String] 
    # @param name [String] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::Variable]
    def initialize(description:, name:, additional_properties: nil)
      @description = description
      @name = name
      @additional_properties = additional_properties
      @_field_set = { "description": description, "name": name }
    end
# Deserialize a JSON object to an instance of Variable
    #
    # @param json_object [String] 
    # @return [Monite::Variable]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      description = parsed_json["description"]
      name = parsed_json["name"]
      new(
        description: description,
        name: name,
        additional_properties: struct
      )
    end
# Serialize an instance of Variable to a JSON object
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
      obj.description.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
      obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
    end
  end
end