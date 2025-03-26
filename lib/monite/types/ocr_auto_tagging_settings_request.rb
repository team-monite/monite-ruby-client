# frozen_string_literal: true
require "ostruct"
require "json"

module Monite
  class OcrAutoTaggingSettingsRequest
  # @return [Boolean] A switch to temporarily disable a keyword without removing it from the list.
    attr_reader :enabled
  # @return [Array<String>] A list of words that will be searched for assigning a tag in the recognized
#  fields of the document after OCR processing. If at least one match is found, the
#  tag will be assigned. Each keyword must be between 2 and 25 characters long.
    attr_reader :keywords
  # @return [String] Tag identifier that will be assigned to the payable document if one of the words
#  listed in keywords is found during OCR.
    attr_reader :tag_id
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param enabled [Boolean] A switch to temporarily disable a keyword without removing it from the list.
    # @param keywords [Array<String>] A list of words that will be searched for assigning a tag in the recognized
#  fields of the document after OCR processing. If at least one match is found, the
#  tag will be assigned. Each keyword must be between 2 and 25 characters long.
    # @param tag_id [String] Tag identifier that will be assigned to the payable document if one of the words
#  listed in keywords is found during OCR.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::OcrAutoTaggingSettingsRequest]
    def initialize(enabled:, keywords:, tag_id:, additional_properties: nil)
      @enabled = enabled
      @keywords = keywords
      @tag_id = tag_id
      @additional_properties = additional_properties
      @_field_set = { "enabled": enabled, "keywords": keywords, "tag_id": tag_id }
    end
# Deserialize a JSON object to an instance of OcrAutoTaggingSettingsRequest
    #
    # @param json_object [String] 
    # @return [Monite::OcrAutoTaggingSettingsRequest]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      enabled = parsed_json["enabled"]
      keywords = parsed_json["keywords"]
      tag_id = parsed_json["tag_id"]
      new(
        enabled: enabled,
        keywords: keywords,
        tag_id: tag_id,
        additional_properties: struct
      )
    end
# Serialize an instance of OcrAutoTaggingSettingsRequest to a JSON object
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
      obj.enabled.is_a?(Boolean) != false || raise("Passed value for field obj.enabled is not the expected type, validation failed.")
      obj.keywords.is_a?(Array) != false || raise("Passed value for field obj.keywords is not the expected type, validation failed.")
      obj.tag_id.is_a?(String) != false || raise("Passed value for field obj.tag_id is not the expected type, validation failed.")
    end
  end
end