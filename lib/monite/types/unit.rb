# frozen_string_literal: true
require "ostruct"
require "json"

module Monite
  class Unit
  # @return [String] 
    attr_reader :designation
  # @return [String] 
    attr_reader :name
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param designation [String] 
    # @param name [String] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::Unit]
    def initialize(designation:, name:, additional_properties: nil)
      @designation = designation
      @name = name
      @additional_properties = additional_properties
      @_field_set = { "designation": designation, "name": name }
    end
# Deserialize a JSON object to an instance of Unit
    #
    # @param json_object [String] 
    # @return [Monite::Unit]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      designation = parsed_json["designation"]
      name = parsed_json["name"]
      new(
        designation: designation,
        name: name,
        additional_properties: struct
      )
    end
# Serialize an instance of Unit to a JSON object
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
      obj.designation.is_a?(String) != false || raise("Passed value for field obj.designation is not the expected type, validation failed.")
      obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
    end
  end
end