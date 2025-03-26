# frozen_string_literal: true
require "ostruct"
require "json"

module Monite
  class CardTheme
  # @return [String] 
    attr_reader :background_color
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param background_color [String] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::CardTheme]
    def initialize(background_color: OMIT, additional_properties: nil)
      @background_color = background_color if background_color != OMIT
      @additional_properties = additional_properties
      @_field_set = { "background_color": background_color }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of CardTheme
    #
    # @param json_object [String] 
    # @return [Monite::CardTheme]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      background_color = parsed_json["background_color"]
      new(background_color: background_color, additional_properties: struct)
    end
# Serialize an instance of CardTheme to a JSON object
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
      obj.background_color&.is_a?(String) != false || raise("Passed value for field obj.background_color is not the expected type, validation failed.")
    end
  end
end