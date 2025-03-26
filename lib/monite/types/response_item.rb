# frozen_string_literal: true
require_relative "discount"
require_relative "line_item_product"
require "ostruct"
require "json"

module Monite
  class ResponseItem
  # @return [Monite::Discount] The discount for a product.
    attr_reader :discount
  # @return [Monite::LineItemProduct] 
    attr_reader :product
  # @return [Float] The quantity of each of the goods, materials, or services listed in the
#  receivable.
    attr_reader :quantity
  # @return [Integer] Total of line_item before VAT in [minor
#  units](https://docs.monite.com/references/currencies#minor-units).
    attr_reader :total_before_vat
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param discount [Monite::Discount] The discount for a product.
    # @param product [Monite::LineItemProduct] 
    # @param quantity [Float] The quantity of each of the goods, materials, or services listed in the
#  receivable.
    # @param total_before_vat [Integer] Total of line_item before VAT in [minor
#  units](https://docs.monite.com/references/currencies#minor-units).
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::ResponseItem]
    def initialize(discount: OMIT, product:, quantity:, total_before_vat:, additional_properties: nil)
      @discount = discount if discount != OMIT
      @product = product
      @quantity = quantity
      @total_before_vat = total_before_vat
      @additional_properties = additional_properties
      @_field_set = { "discount": discount, "product": product, "quantity": quantity, "total_before_vat": total_before_vat }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of ResponseItem
    #
    # @param json_object [String] 
    # @return [Monite::ResponseItem]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["discount"].nil?
        discount = parsed_json["discount"].to_json
        discount = Monite::Discount.from_json(json_object: discount)
      else
        discount = nil
      end
      unless parsed_json["product"].nil?
        product = parsed_json["product"].to_json
        product = Monite::LineItemProduct.from_json(json_object: product)
      else
        product = nil
      end
      quantity = parsed_json["quantity"]
      total_before_vat = parsed_json["total_before_vat"]
      new(
        discount: discount,
        product: product,
        quantity: quantity,
        total_before_vat: total_before_vat,
        additional_properties: struct
      )
    end
# Serialize an instance of ResponseItem to a JSON object
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
      Monite::LineItemProduct.validate_raw(obj: obj.product)
      obj.quantity.is_a?(Float) != false || raise("Passed value for field obj.quantity is not the expected type, validation failed.")
      obj.total_before_vat.is_a?(Integer) != false || raise("Passed value for field obj.total_before_vat is not the expected type, validation failed.")
    end
  end
end