# frozen_string_literal: true
require "ostruct"
require "json"

module Monite
  class MissingLineItemFields
  # @return [Integer] Order number of line item.
    attr_reader :line_item_number
  # @return [Array<String>] Missing fields of line item.
    attr_reader :missing_fields
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param line_item_number [Integer] Order number of line item.
    # @param missing_fields [Array<String>] Missing fields of line item.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::MissingLineItemFields]
    def initialize(line_item_number:, missing_fields:, additional_properties: nil)
      @line_item_number = line_item_number
      @missing_fields = missing_fields
      @additional_properties = additional_properties
      @_field_set = { "line_item_number": line_item_number, "missing_fields": missing_fields }
    end
# Deserialize a JSON object to an instance of MissingLineItemFields
    #
    # @param json_object [String] 
    # @return [Monite::MissingLineItemFields]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      line_item_number = parsed_json["line_item_number"]
      missing_fields = parsed_json["missing_fields"]
      new(
        line_item_number: line_item_number,
        missing_fields: missing_fields,
        additional_properties: struct
      )
    end
# Serialize an instance of MissingLineItemFields to a JSON object
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
      obj.line_item_number.is_a?(Integer) != false || raise("Passed value for field obj.line_item_number is not the expected type, validation failed.")
      obj.missing_fields.is_a?(Array) != false || raise("Passed value for field obj.missing_fields is not the expected type, validation failed.")
    end
  end
end