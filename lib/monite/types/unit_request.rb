# frozen_string_literal: true
require "ostruct"
require "json"

module Monite
  class UnitRequest
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
    # @return [Monite::UnitRequest]
    def initialize(description: OMIT, name:, additional_properties: nil)
      @description = description if description != OMIT
      @name = name
      @additional_properties = additional_properties
      @_field_set = { "description": description, "name": name }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of UnitRequest
    #
    # @param json_object [String] 
    # @return [Monite::UnitRequest]
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
# Serialize an instance of UnitRequest to a JSON object
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
      obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
      obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
    end
  end
end