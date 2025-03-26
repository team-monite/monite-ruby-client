# frozen_string_literal: true
require "ostruct"
require "json"

module Monite
  class ButtonTheme
  # @return [String] 
    attr_reader :primary_color
  # @return [String] 
    attr_reader :primary_hover_color
  # @return [String] 
    attr_reader :secondary_color
  # @return [String] 
    attr_reader :secondary_hover_color
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param primary_color [String] 
    # @param primary_hover_color [String] 
    # @param secondary_color [String] 
    # @param secondary_hover_color [String] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::ButtonTheme]
    def initialize(primary_color: OMIT, primary_hover_color: OMIT, secondary_color: OMIT, secondary_hover_color: OMIT, additional_properties: nil)
      @primary_color = primary_color if primary_color != OMIT
      @primary_hover_color = primary_hover_color if primary_hover_color != OMIT
      @secondary_color = secondary_color if secondary_color != OMIT
      @secondary_hover_color = secondary_hover_color if secondary_hover_color != OMIT
      @additional_properties = additional_properties
      @_field_set = { "primary_color": primary_color, "primary_hover_color": primary_hover_color, "secondary_color": secondary_color, "secondary_hover_color": secondary_hover_color }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of ButtonTheme
    #
    # @param json_object [String] 
    # @return [Monite::ButtonTheme]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      primary_color = parsed_json["primary_color"]
      primary_hover_color = parsed_json["primary_hover_color"]
      secondary_color = parsed_json["secondary_color"]
      secondary_hover_color = parsed_json["secondary_hover_color"]
      new(
        primary_color: primary_color,
        primary_hover_color: primary_hover_color,
        secondary_color: secondary_color,
        secondary_hover_color: secondary_hover_color,
        additional_properties: struct
      )
    end
# Serialize an instance of ButtonTheme to a JSON object
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
      obj.primary_color&.is_a?(String) != false || raise("Passed value for field obj.primary_color is not the expected type, validation failed.")
      obj.primary_hover_color&.is_a?(String) != false || raise("Passed value for field obj.primary_hover_color is not the expected type, validation failed.")
      obj.secondary_color&.is_a?(String) != false || raise("Passed value for field obj.secondary_color is not the expected type, validation failed.")
      obj.secondary_hover_color&.is_a?(String) != false || raise("Passed value for field obj.secondary_hover_color is not the expected type, validation failed.")
    end
  end
end