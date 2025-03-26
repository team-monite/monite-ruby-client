# frozen_string_literal: true
require "ostruct"
require "json"

module Monite
# A preview image generated for a file.
  class PreviewSchema3
  # @return [Integer] The image height in pixels.
    attr_reader :height
  # @return [String] The image URL.
    attr_reader :url
  # @return [Integer] The image width in pixels.
    attr_reader :width
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param height [Integer] The image height in pixels.
    # @param url [String] The image URL.
    # @param width [Integer] The image width in pixels.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::PreviewSchema3]
    def initialize(height:, url:, width:, additional_properties: nil)
      @height = height
      @url = url
      @width = width
      @additional_properties = additional_properties
      @_field_set = { "height": height, "url": url, "width": width }
    end
# Deserialize a JSON object to an instance of PreviewSchema3
    #
    # @param json_object [String] 
    # @return [Monite::PreviewSchema3]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      height = parsed_json["height"]
      url = parsed_json["url"]
      width = parsed_json["width"]
      new(
        height: height,
        url: url,
        width: width,
        additional_properties: struct
      )
    end
# Serialize an instance of PreviewSchema3 to a JSON object
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
      obj.height.is_a?(Integer) != false || raise("Passed value for field obj.height is not the expected type, validation failed.")
      obj.url.is_a?(String) != false || raise("Passed value for field obj.url is not the expected type, validation failed.")
      obj.width.is_a?(Integer) != false || raise("Passed value for field obj.width is not the expected type, validation failed.")
    end
  end
end