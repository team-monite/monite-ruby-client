# frozen_string_literal: true
require_relative "item"
require "ostruct"
require "json"

module Monite
# A label-value pair extracted from an uploaded document by OCR.
#  For example, the label could be "Total" and the value could be a currency
#  amount.
  class LabelNValue
  # @return [Monite::Item] Text label.
    attr_reader :label
  # @return [Monite::Item] The value (if any).
    attr_reader :value
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param label [Monite::Item] Text label.
    # @param value [Monite::Item] The value (if any).
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::LabelNValue]
    def initialize(label:, value:, additional_properties: nil)
      @label = label
      @value = value
      @additional_properties = additional_properties
      @_field_set = { "label": label, "value": value }
    end
# Deserialize a JSON object to an instance of LabelNValue
    #
    # @param json_object [String] 
    # @return [Monite::LabelNValue]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["label"].nil?
        label = parsed_json["label"].to_json
        label = Monite::Item.from_json(json_object: label)
      else
        label = nil
      end
      unless parsed_json["value"].nil?
        value = parsed_json["value"].to_json
        value = Monite::Item.from_json(json_object: value)
      else
        value = nil
      end
      new(
        label: label,
        value: value,
        additional_properties: struct
      )
    end
# Serialize an instance of LabelNValue to a JSON object
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
      Monite::Item.validate_raw(obj: obj.label)
      Monite::Item.validate_raw(obj: obj.value)
    end
  end
end