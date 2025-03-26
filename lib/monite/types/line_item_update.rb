# frozen_string_literal: true
require_relative "discount"
require "ostruct"
require "json"

module Monite
  class LineItemUpdate
  # @return [Monite::Discount] The discount for a product.
    attr_reader :discount
  # @return [Integer] The actual price of the product in [minor
#  units](https://docs.monite.com/references/currencies#minor-units).
    attr_reader :price
  # @return [Float] The quantity of each of the goods, materials, or services listed in the
#  receivable.
    attr_reader :quantity
  # @return [Integer] Percent minor units. Example: 12.5% is 1250. This field is only required on
#  invoices issued by entities in the US, Pakistan, and other unsupported
#  countries.
    attr_reader :tax_rate_value
  # @return [String] Unique identifier of the vat rate object. This field is required for all
#  entities in supported countries except the US and Pakistan.
    attr_reader :vat_rate_id
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param discount [Monite::Discount] The discount for a product.
    # @param price [Integer] The actual price of the product in [minor
#  units](https://docs.monite.com/references/currencies#minor-units).
    # @param quantity [Float] The quantity of each of the goods, materials, or services listed in the
#  receivable.
    # @param tax_rate_value [Integer] Percent minor units. Example: 12.5% is 1250. This field is only required on
#  invoices issued by entities in the US, Pakistan, and other unsupported
#  countries.
    # @param vat_rate_id [String] Unique identifier of the vat rate object. This field is required for all
#  entities in supported countries except the US and Pakistan.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::LineItemUpdate]
    def initialize(discount: OMIT, price: OMIT, quantity: OMIT, tax_rate_value: OMIT, vat_rate_id: OMIT, additional_properties: nil)
      @discount = discount if discount != OMIT
      @price = price if price != OMIT
      @quantity = quantity if quantity != OMIT
      @tax_rate_value = tax_rate_value if tax_rate_value != OMIT
      @vat_rate_id = vat_rate_id if vat_rate_id != OMIT
      @additional_properties = additional_properties
      @_field_set = { "discount": discount, "price": price, "quantity": quantity, "tax_rate_value": tax_rate_value, "vat_rate_id": vat_rate_id }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of LineItemUpdate
    #
    # @param json_object [String] 
    # @return [Monite::LineItemUpdate]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["discount"].nil?
        discount = parsed_json["discount"].to_json
        discount = Monite::Discount.from_json(json_object: discount)
      else
        discount = nil
      end
      price = parsed_json["price"]
      quantity = parsed_json["quantity"]
      tax_rate_value = parsed_json["tax_rate_value"]
      vat_rate_id = parsed_json["vat_rate_id"]
      new(
        discount: discount,
        price: price,
        quantity: quantity,
        tax_rate_value: tax_rate_value,
        vat_rate_id: vat_rate_id,
        additional_properties: struct
      )
    end
# Serialize an instance of LineItemUpdate to a JSON object
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
      obj.discount.nil? || Monite::Discount.validate_raw(obj: obj.discount)
      obj.price&.is_a?(Integer) != false || raise("Passed value for field obj.price is not the expected type, validation failed.")
      obj.quantity&.is_a?(Float) != false || raise("Passed value for field obj.quantity is not the expected type, validation failed.")
      obj.tax_rate_value&.is_a?(Integer) != false || raise("Passed value for field obj.tax_rate_value is not the expected type, validation failed.")
      obj.vat_rate_id&.is_a?(String) != false || raise("Passed value for field obj.vat_rate_id is not the expected type, validation failed.")
    end
  end
end