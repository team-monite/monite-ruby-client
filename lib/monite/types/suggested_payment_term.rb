# frozen_string_literal: true
require "ostruct"
require "json"

module Monite
# Suggested payment date and corresponding discount
  class SuggestedPaymentTerm
  # @return [String] 
    attr_reader :date
  # @return [Integer] 
    attr_reader :discount
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param date [String] 
    # @param discount [Integer] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::SuggestedPaymentTerm]
    def initialize(date:, discount: OMIT, additional_properties: nil)
      @date = date
      @discount = discount if discount != OMIT
      @additional_properties = additional_properties
      @_field_set = { "date": date, "discount": discount }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of SuggestedPaymentTerm
    #
    # @param json_object [String] 
    # @return [Monite::SuggestedPaymentTerm]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      date = parsed_json["date"]
      discount = parsed_json["discount"]
      new(
        date: date,
        discount: discount,
        additional_properties: struct
      )
    end
# Serialize an instance of SuggestedPaymentTerm to a JSON object
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
      obj.date.is_a?(String) != false || raise("Passed value for field obj.date is not the expected type, validation failed.")
      obj.discount&.is_a?(Integer) != false || raise("Passed value for field obj.discount is not the expected type, validation failed.")
    end
  end
end