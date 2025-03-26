# frozen_string_literal: true
require_relative "discount_type"
require "ostruct"
require "json"

module Monite
  class Discount
  # @return [Integer] The actual discount of the product in [minor
#  units](https://docs.monite.com/references/currencies#minor-units) if type field
#  equals amount, else in percent minor units
    attr_reader :amount
  # @return [Monite::DiscountType] The field specifies whether to use product currency or %.
    attr_reader :type
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param amount [Integer] The actual discount of the product in [minor
#  units](https://docs.monite.com/references/currencies#minor-units) if type field
#  equals amount, else in percent minor units
    # @param type [Monite::DiscountType] The field specifies whether to use product currency or %.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::Discount]
    def initialize(amount:, type:, additional_properties: nil)
      @amount = amount
      @type = type
      @additional_properties = additional_properties
      @_field_set = { "amount": amount, "type": type }
    end
# Deserialize a JSON object to an instance of Discount
    #
    # @param json_object [String] 
    # @return [Monite::Discount]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      amount = parsed_json["amount"]
      type = parsed_json["type"]
      new(
        amount: amount,
        type: type,
        additional_properties: struct
      )
    end
# Serialize an instance of Discount to a JSON object
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
      obj.amount.is_a?(Integer) != false || raise("Passed value for field obj.amount is not the expected type, validation failed.")
      obj.type.is_a?(Monite::DiscountType) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
    end
  end
end