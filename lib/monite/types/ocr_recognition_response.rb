# frozen_string_literal: true
require_relative "label_n_value"
require "ostruct"
require "json"

module Monite
# Contains information about all text blocks extracted from an uploaded invoice by
#  OCR.
#  The text blocks are grouped into `line_items` (invoice line items) and `summary`
#  (all other information).
#  Legacy schema used for AWS textract recognition.
  class OcrRecognitionResponse
  # @return [Array<Monite::LabelNValue>] Invoice text content other than the line items. Such as the invoice issue and
#  due dates, vendor name and address, and other general information.
    attr_reader :summary
  # @return [Array<Monite::LabelNValue>] Text content of the invoice line items as recognized by OCR.
    attr_reader :line_items
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param summary [Array<Monite::LabelNValue>] Invoice text content other than the line items. Such as the invoice issue and
#  due dates, vendor name and address, and other general information.
    # @param line_items [Array<Monite::LabelNValue>] Text content of the invoice line items as recognized by OCR.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::OcrRecognitionResponse]
    def initialize(summary: OMIT, line_items: OMIT, additional_properties: nil)
      @summary = summary if summary != OMIT
      @line_items = line_items if line_items != OMIT
      @additional_properties = additional_properties
      @_field_set = { "summary": summary, "line_items": line_items }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of OcrRecognitionResponse
    #
    # @param json_object [String] 
    # @return [Monite::OcrRecognitionResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      summary = parsed_json["summary"]&.map do | item |
  item = item.to_json
  Monite::LabelNValue.from_json(json_object: item)
end
      line_items = parsed_json["line_items"]&.map do | item |
  item = item.to_json
  Monite::LabelNValue.from_json(json_object: item)
end
      new(
        summary: summary,
        line_items: line_items,
        additional_properties: struct
      )
    end
# Serialize an instance of OcrRecognitionResponse to a JSON object
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
      obj.summary&.is_a?(Array) != false || raise("Passed value for field obj.summary is not the expected type, validation failed.")
      obj.line_items&.is_a?(Array) != false || raise("Passed value for field obj.line_items is not the expected type, validation failed.")
    end
  end
end