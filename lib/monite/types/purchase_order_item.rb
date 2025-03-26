# frozen_string_literal: true
require_relative "currency_enum"
require "ostruct"
require "json"

module Monite
  class PurchaseOrderItem
  # @return [Monite::CurrencyEnum] The currency in which the price of the product is set.
    attr_reader :currency
  # @return [String] The name of the product to purchase
    attr_reader :name
  # @return [Integer] The subtotal cost (excluding VAT), in [minor
#  units](https://docs.monite.com/references/currencies#minor-units).
    attr_reader :price
  # @return [Integer] Number (quantity) of products
    attr_reader :quantity
  # @return [String] Units (hours, meters, unit)
    attr_reader :unit
  # @return [Integer] Percent minor units. Example: 12.5% is 1250
    attr_reader :vat_rate
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param currency [Monite::CurrencyEnum] The currency in which the price of the product is set.
    # @param name [String] The name of the product to purchase
    # @param price [Integer] The subtotal cost (excluding VAT), in [minor
#  units](https://docs.monite.com/references/currencies#minor-units).
    # @param quantity [Integer] Number (quantity) of products
    # @param unit [String] Units (hours, meters, unit)
    # @param vat_rate [Integer] Percent minor units. Example: 12.5% is 1250
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::PurchaseOrderItem]
    def initialize(currency:, name:, price:, quantity:, unit:, vat_rate:, additional_properties: nil)
      @currency = currency
      @name = name
      @price = price
      @quantity = quantity
      @unit = unit
      @vat_rate = vat_rate
      @additional_properties = additional_properties
      @_field_set = { "currency": currency, "name": name, "price": price, "quantity": quantity, "unit": unit, "vat_rate": vat_rate }
    end
# Deserialize a JSON object to an instance of PurchaseOrderItem
    #
    # @param json_object [String] 
    # @return [Monite::PurchaseOrderItem]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      currency = parsed_json["currency"]
      name = parsed_json["name"]
      price = parsed_json["price"]
      quantity = parsed_json["quantity"]
      unit = parsed_json["unit"]
      vat_rate = parsed_json["vat_rate"]
      new(
        currency: currency,
        name: name,
        price: price,
        quantity: quantity,
        unit: unit,
        vat_rate: vat_rate,
        additional_properties: struct
      )
    end
# Serialize an instance of PurchaseOrderItem to a JSON object
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
      obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.price.is_a?(Integer) != false || raise("Passed value for field obj.price is not the expected type, validation failed.")
      obj.quantity.is_a?(Integer) != false || raise("Passed value for field obj.quantity is not the expected type, validation failed.")
      obj.unit.is_a?(String) != false || raise("Passed value for field obj.unit is not the expected type, validation failed.")
      obj.vat_rate.is_a?(Integer) != false || raise("Passed value for field obj.vat_rate is not the expected type, validation failed.")
    end
  end
end