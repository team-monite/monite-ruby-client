# frozen_string_literal: true
require "ostruct"
require "json"

module Monite
  class TermFinalWithDate
  # @return [String] 
    attr_reader :end_date
  # @return [Integer] The amount of days after the invoice issue date.
    attr_reader :number_of_days
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param end_date [String] 
    # @param number_of_days [Integer] The amount of days after the invoice issue date.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::TermFinalWithDate]
    def initialize(end_date: OMIT, number_of_days:, additional_properties: nil)
      @end_date = end_date if end_date != OMIT
      @number_of_days = number_of_days
      @additional_properties = additional_properties
      @_field_set = { "end_date": end_date, "number_of_days": number_of_days }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of TermFinalWithDate
    #
    # @param json_object [String] 
    # @return [Monite::TermFinalWithDate]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      end_date = parsed_json["end_date"]
      number_of_days = parsed_json["number_of_days"]
      new(
        end_date: end_date,
        number_of_days: number_of_days,
        additional_properties: struct
      )
    end
# Serialize an instance of TermFinalWithDate to a JSON object
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
      obj.end_date&.is_a?(String) != false || raise("Passed value for field obj.end_date is not the expected type, validation failed.")
      obj.number_of_days.is_a?(Integer) != false || raise("Passed value for field obj.number_of_days is not the expected type, validation failed.")
    end
  end
end