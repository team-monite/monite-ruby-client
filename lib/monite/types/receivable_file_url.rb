# frozen_string_literal: true
require "ostruct"
require "json"

module Monite
  class ReceivableFileUrl
  # @return [String] The receivable's PDF URL in the counterpart's default language.
    attr_reader :file_url
  # @return [String] The receivable's PDF URL in the entity's default language.
    attr_reader :original_file_url
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param file_url [String] The receivable's PDF URL in the counterpart's default language.
    # @param original_file_url [String] The receivable's PDF URL in the entity's default language.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::ReceivableFileUrl]
    def initialize(file_url: OMIT, original_file_url: OMIT, additional_properties: nil)
      @file_url = file_url if file_url != OMIT
      @original_file_url = original_file_url if original_file_url != OMIT
      @additional_properties = additional_properties
      @_field_set = { "file_url": file_url, "original_file_url": original_file_url }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of ReceivableFileUrl
    #
    # @param json_object [String] 
    # @return [Monite::ReceivableFileUrl]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      file_url = parsed_json["file_url"]
      original_file_url = parsed_json["original_file_url"]
      new(
        file_url: file_url,
        original_file_url: original_file_url,
        additional_properties: struct
      )
    end
# Serialize an instance of ReceivableFileUrl to a JSON object
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
      obj.file_url&.is_a?(String) != false || raise("Passed value for field obj.file_url is not the expected type, validation failed.")
      obj.original_file_url&.is_a?(String) != false || raise("Passed value for field obj.original_file_url is not the expected type, validation failed.")
    end
  end
end