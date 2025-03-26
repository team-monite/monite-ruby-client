# frozen_string_literal: true
require_relative "currency_enum"
require "ostruct"
require "json"

module Monite
  class Price
  # @return [Monite::CurrencyEnum] The currency in which the price of the product is set.
    attr_reader :currency
  # @return [Integer] The actual price of the product.
    attr_reader :value
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param currency [Monite::CurrencyEnum] The currency in which the price of the product is set.
    # @param value [Integer] The actual price of the product.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::Price]
    def initialize(currency:, value:, additional_properties: nil)
      @currency = currency
      @value = value
      @additional_properties = additional_properties
      @_field_set = { "currency": currency, "value": value }
    end
# Deserialize a JSON object to an instance of Price
    #
    # @param json_object [String] 
    # @return [Monite::Price]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      currency = parsed_json["currency"]
      value = parsed_json["value"]
      new(
        currency: currency,
        value: value,
        additional_properties: struct
      )
    end
# Serialize an instance of Price to a JSON object
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
      obj.currency.is_a?(Monite::CurrencyEnum) != false || raise("Passed value for field obj.currency is not the expected type, validation failed.")
      obj.value.is_a?(Integer) != false || raise("Passed value for field obj.value is not the expected type, validation failed.")
    end
  end
end