# frozen_string_literal: true
require "ostruct"
require "json"

module Monite
  class UpdateEntityAddressSchema
  # @return [String] A city (a full name) where the entity is registered
    attr_reader :city
  # @return [String] A street where the entity is registered
    attr_reader :line_1
  # @return [String] An alternative street used by the entity
    attr_reader :line_2
  # @return [String] A postal code of the address where the entity is registered
    attr_reader :postal_code
  # @return [String] A state in a country where the entity is registered
    attr_reader :state
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param city [String] A city (a full name) where the entity is registered
    # @param line_1 [String] A street where the entity is registered
    # @param line_2 [String] An alternative street used by the entity
    # @param postal_code [String] A postal code of the address where the entity is registered
    # @param state [String] A state in a country where the entity is registered
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::UpdateEntityAddressSchema]
    def initialize(city: OMIT, line_1: OMIT, line_2: OMIT, postal_code: OMIT, state: OMIT, additional_properties: nil)
      @city = city if city != OMIT
      @line_1 = line_1 if line_1 != OMIT
      @line_2 = line_2 if line_2 != OMIT
      @postal_code = postal_code if postal_code != OMIT
      @state = state if state != OMIT
      @additional_properties = additional_properties
      @_field_set = { "city": city, "line1": line_1, "line2": line_2, "postal_code": postal_code, "state": state }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of UpdateEntityAddressSchema
    #
    # @param json_object [String] 
    # @return [Monite::UpdateEntityAddressSchema]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      city = parsed_json["city"]
      line_1 = parsed_json["line1"]
      line_2 = parsed_json["line2"]
      postal_code = parsed_json["postal_code"]
      state = parsed_json["state"]
      new(
        city: city,
        line_1: line_1,
        line_2: line_2,
        postal_code: postal_code,
        state: state,
        additional_properties: struct
      )
    end
# Serialize an instance of UpdateEntityAddressSchema to a JSON object
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
      obj.city&.is_a?(String) != false || raise("Passed value for field obj.city is not the expected type, validation failed.")
      obj.line_1&.is_a?(String) != false || raise("Passed value for field obj.line_1 is not the expected type, validation failed.")
      obj.line_2&.is_a?(String) != false || raise("Passed value for field obj.line_2 is not the expected type, validation failed.")
      obj.postal_code&.is_a?(String) != false || raise("Passed value for field obj.postal_code is not the expected type, validation failed.")
      obj.state&.is_a?(String) != false || raise("Passed value for field obj.state is not the expected type, validation failed.")
    end
  end
end