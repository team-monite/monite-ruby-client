# frozen_string_literal: true
require_relative "recurrence"
require "ostruct"
require "json"

module Monite
  class GetAllRecurrences
  # @return [Array<Monite::Recurrence>] 
    attr_reader :data
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param data [Array<Monite::Recurrence>] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::GetAllRecurrences]
    def initialize(data:, additional_properties: nil)
      @data = data
      @additional_properties = additional_properties
      @_field_set = { "data": data }
    end
# Deserialize a JSON object to an instance of GetAllRecurrences
    #
    # @param json_object [String] 
    # @return [Monite::GetAllRecurrences]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      data = parsed_json["data"]&.map do | item |
  item = item.to_json
  Monite::Recurrence.from_json(json_object: item)
end
      new(data: data, additional_properties: struct)
    end
# Serialize an instance of GetAllRecurrences to a JSON object
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
      obj.data.is_a?(Array) != false || raise("Passed value for field obj.data is not the expected type, validation failed.")
    end
  end
end