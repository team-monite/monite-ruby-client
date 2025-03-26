# frozen_string_literal: true
require "ostruct"
require "json"

module Monite
  class PayablePaymentTermDiscount
  # @return [Integer] The discount percentage in minor units. E.g., 200 means 2%, 1050 means 10.5%.
    attr_reader :discount
  # @return [Integer] The amount of days after the invoice issue date.
    attr_reader :number_of_days
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param discount [Integer] The discount percentage in minor units. E.g., 200 means 2%, 1050 means 10.5%.
    # @param number_of_days [Integer] The amount of days after the invoice issue date.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::PayablePaymentTermDiscount]
    def initialize(discount:, number_of_days:, additional_properties: nil)
      @discount = discount
      @number_of_days = number_of_days
      @additional_properties = additional_properties
      @_field_set = { "discount": discount, "number_of_days": number_of_days }
    end
# Deserialize a JSON object to an instance of PayablePaymentTermDiscount
    #
    # @param json_object [String] 
    # @return [Monite::PayablePaymentTermDiscount]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      discount = parsed_json["discount"]
      number_of_days = parsed_json["number_of_days"]
      new(
        discount: discount,
        number_of_days: number_of_days,
        additional_properties: struct
      )
    end
# Serialize an instance of PayablePaymentTermDiscount to a JSON object
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
      obj.discount.is_a?(Integer) != false || raise("Passed value for field obj.discount is not the expected type, validation failed.")
      obj.number_of_days.is_a?(Integer) != false || raise("Passed value for field obj.number_of_days is not the expected type, validation failed.")
    end
  end
end