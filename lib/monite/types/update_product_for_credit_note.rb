# frozen_string_literal: true
require "ostruct"
require "json"

module Monite
  class UpdateProductForCreditNote
  # @return [Integer] The old price of the line item. Used to choose for which line item new price
#  should be applied
    attr_reader :old_price
  # @return [Integer] The price diff of the line item, i.e. applied discount
    attr_reader :price_diff
  # @return [Float] The quantity of each of the goods, materials, or services listed in the
#  receivable.
    attr_reader :quantity
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param old_price [Integer] The old price of the line item. Used to choose for which line item new price
#  should be applied
    # @param price_diff [Integer] The price diff of the line item, i.e. applied discount
    # @param quantity [Float] The quantity of each of the goods, materials, or services listed in the
#  receivable.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::UpdateProductForCreditNote]
    def initialize(old_price: OMIT, price_diff: OMIT, quantity:, additional_properties: nil)
      @old_price = old_price if old_price != OMIT
      @price_diff = price_diff if price_diff != OMIT
      @quantity = quantity
      @additional_properties = additional_properties
      @_field_set = { "old_price": old_price, "price_diff": price_diff, "quantity": quantity }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of UpdateProductForCreditNote
    #
    # @param json_object [String] 
    # @return [Monite::UpdateProductForCreditNote]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      old_price = parsed_json["old_price"]
      price_diff = parsed_json["price_diff"]
      quantity = parsed_json["quantity"]
      new(
        old_price: old_price,
        price_diff: price_diff,
        quantity: quantity,
        additional_properties: struct
      )
    end
# Serialize an instance of UpdateProductForCreditNote to a JSON object
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
      obj.old_price&.is_a?(Integer) != false || raise("Passed value for field obj.old_price is not the expected type, validation failed.")
      obj.price_diff&.is_a?(Integer) != false || raise("Passed value for field obj.price_diff is not the expected type, validation failed.")
      obj.quantity.is_a?(Float) != false || raise("Passed value for field obj.quantity is not the expected type, validation failed.")
    end
  end
end