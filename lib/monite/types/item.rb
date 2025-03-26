# frozen_string_literal: true
require "ostruct"
require "json"

module Monite
# Contains information about a text block or line extracted from an uploaded
#  document by OCR.
  class Item
  # @return [String] The text as recognized by OCR.
    attr_reader :text
  # @return [Float] OCR confidence score - the estimated accuracy percentage of character
#  recognition of the extracted text, from 0 to 100%.
    attr_reader :confidence
  # @return [Object] 
    attr_reader :processed_text
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param text [String] The text as recognized by OCR.
    # @param confidence [Float] OCR confidence score - the estimated accuracy percentage of character
#  recognition of the extracted text, from 0 to 100%.
    # @param processed_text [Object] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::Item]
    def initialize(text:, confidence:, processed_text: OMIT, additional_properties: nil)
      @text = text
      @confidence = confidence
      @processed_text = processed_text if processed_text != OMIT
      @additional_properties = additional_properties
      @_field_set = { "text": text, "confidence": confidence, "processed_text": processed_text }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of Item
    #
    # @param json_object [String] 
    # @return [Monite::Item]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      text = parsed_json["text"]
      confidence = parsed_json["confidence"]
      processed_text = parsed_json["processed_text"]
      new(
        text: text,
        confidence: confidence,
        processed_text: processed_text,
        additional_properties: struct
      )
    end
# Serialize an instance of Item to a JSON object
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
      obj.text.is_a?(String) != false || raise("Passed value for field obj.text is not the expected type, validation failed.")
      obj.confidence.is_a?(Float) != false || raise("Passed value for field obj.confidence is not the expected type, validation failed.")
      obj.processed_text&.is_a?(Object) != false || raise("Passed value for field obj.processed_text is not the expected type, validation failed.")
    end
  end
end