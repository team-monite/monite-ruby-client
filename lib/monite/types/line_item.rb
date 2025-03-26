# frozen_string_literal: true
require_relative "discount"
require_relative "line_item_product_create"
require "ostruct"
require "json"

module Monite
  class LineItem
  # @return [Monite::Discount] The discount for a product.
    attr_reader :discount
  # @return [Monite::LineItemProductCreate] Object of product. Can be used instead of product_id, created in product's
#  catalog
    attr_reader :product
  # @return [String] Unique identifier of the product.
    attr_reader :product_id
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
    # @param product [Monite::LineItemProductCreate] Object of product. Can be used instead of product_id, created in product's
#  catalog
    # @param product_id [String] Unique identifier of the product.
    # @param quantity [Float] The quantity of each of the goods, materials, or services listed in the
#  receivable.
    # @param tax_rate_value [Integer] Percent minor units. Example: 12.5% is 1250. This field is only required on
#  invoices issued by entities in the US, Pakistan, and other unsupported
#  countries.
    # @param vat_rate_id [String] Unique identifier of the vat rate object. This field is required for all
#  entities in supported countries except the US and Pakistan.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::LineItem]
    def initialize(discount: OMIT, product: OMIT, product_id: OMIT, quantity:, tax_rate_value: OMIT, vat_rate_id: OMIT, additional_properties: nil)
      @discount = discount if discount != OMIT
      @product = product if product != OMIT
      @product_id = product_id if product_id != OMIT
      @quantity = quantity
      @tax_rate_value = tax_rate_value if tax_rate_value != OMIT
      @vat_rate_id = vat_rate_id if vat_rate_id != OMIT
      @additional_properties = additional_properties
      @_field_set = { "discount": discount, "product": product, "product_id": product_id, "quantity": quantity, "tax_rate_value": tax_rate_value, "vat_rate_id": vat_rate_id }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of LineItem
    #
    # @param json_object [String] 
    # @return [Monite::LineItem]
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
        product = Monite::LineItemProductCreate.from_json(json_object: product)
      else
        product = nil
      end
      product_id = parsed_json["product_id"]
      quantity = parsed_json["quantity"]
      tax_rate_value = parsed_json["tax_rate_value"]
      vat_rate_id = parsed_json["vat_rate_id"]
      new(
        discount: discount,
        product: product,
        product_id: product_id,
        quantity: quantity,
        tax_rate_value: tax_rate_value,
        vat_rate_id: vat_rate_id,
        additional_properties: struct
      )
    end
# Serialize an instance of LineItem to a JSON object
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
      obj.product.nil? || Monite::LineItemProductCreate.validate_raw(obj: obj.product)
      obj.product_id&.is_a?(String) != false || raise("Passed value for field obj.product_id is not the expected type, validation failed.")
      obj.quantity.is_a?(Float) != false || raise("Passed value for field obj.quantity is not the expected type, validation failed.")
      obj.tax_rate_value&.is_a?(Integer) != false || raise("Passed value for field obj.tax_rate_value is not the expected type, validation failed.")
      obj.vat_rate_id&.is_a?(String) != false || raise("Passed value for field obj.vat_rate_id is not the expected type, validation failed.")
    end
  end
end