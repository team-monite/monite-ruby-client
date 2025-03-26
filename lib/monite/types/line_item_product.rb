# frozen_string_literal: true
require_relative "line_item_product_measure_unit"
require_relative "price"
require_relative "product_service_type_enum"
require_relative "line_item_product_vat_rate"
require "ostruct"
require "json"

module Monite
  class LineItemProduct
  # @return [String] Unique ID of the product.
    attr_reader :id
  # @return [String] Description of the product.
    attr_reader :description
  # @return [Boolean] Indicates whether the product is inline
    attr_reader :is_inline
  # @return [String] 
    attr_reader :ledger_account_id
  # @return [Monite::LineItemProductMeasureUnit] 
    attr_reader :measure_unit
  # @return [String] Name of the product.
    attr_reader :name
  # @return [Monite::Price] 
    attr_reader :price
  # @return [Monite::Price] 
    attr_reader :price_after_vat
  # @return [Float] The smallest amount allowed for this product.
    attr_reader :smallest_amount
  # @return [Monite::ProductServiceTypeEnum] Specifies whether this offering is a product or service. This may affect the
#  applicable tax rates.
    attr_reader :type
  # @return [Monite::LineItemProductVatRate] 
    attr_reader :vat_rate
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] Unique ID of the product.
    # @param description [String] Description of the product.
    # @param is_inline [Boolean] Indicates whether the product is inline
    # @param ledger_account_id [String] 
    # @param measure_unit [Monite::LineItemProductMeasureUnit] 
    # @param name [String] Name of the product.
    # @param price [Monite::Price] 
    # @param price_after_vat [Monite::Price] 
    # @param smallest_amount [Float] The smallest amount allowed for this product.
    # @param type [Monite::ProductServiceTypeEnum] Specifies whether this offering is a product or service. This may affect the
#  applicable tax rates.
    # @param vat_rate [Monite::LineItemProductVatRate] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::LineItemProduct]
    def initialize(id:, description: OMIT, is_inline: OMIT, ledger_account_id: OMIT, measure_unit: OMIT, name:, price:, price_after_vat:, smallest_amount: OMIT, type: OMIT, vat_rate:, additional_properties: nil)
      @id = id
      @description = description if description != OMIT
      @is_inline = is_inline if is_inline != OMIT
      @ledger_account_id = ledger_account_id if ledger_account_id != OMIT
      @measure_unit = measure_unit if measure_unit != OMIT
      @name = name
      @price = price
      @price_after_vat = price_after_vat
      @smallest_amount = smallest_amount if smallest_amount != OMIT
      @type = type if type != OMIT
      @vat_rate = vat_rate
      @additional_properties = additional_properties
      @_field_set = { "id": id, "description": description, "is_inline": is_inline, "ledger_account_id": ledger_account_id, "measure_unit": measure_unit, "name": name, "price": price, "price_after_vat": price_after_vat, "smallest_amount": smallest_amount, "type": type, "vat_rate": vat_rate }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of LineItemProduct
    #
    # @param json_object [String] 
    # @return [Monite::LineItemProduct]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      description = parsed_json["description"]
      is_inline = parsed_json["is_inline"]
      ledger_account_id = parsed_json["ledger_account_id"]
      unless parsed_json["measure_unit"].nil?
        measure_unit = parsed_json["measure_unit"].to_json
        measure_unit = Monite::LineItemProductMeasureUnit.from_json(json_object: measure_unit)
      else
        measure_unit = nil
      end
      name = parsed_json["name"]
      unless parsed_json["price"].nil?
        price = parsed_json["price"].to_json
        price = Monite::Price.from_json(json_object: price)
      else
        price = nil
      end
      unless parsed_json["price_after_vat"].nil?
        price_after_vat = parsed_json["price_after_vat"].to_json
        price_after_vat = Monite::Price.from_json(json_object: price_after_vat)
      else
        price_after_vat = nil
      end
      smallest_amount = parsed_json["smallest_amount"]
      type = parsed_json["type"]
      unless parsed_json["vat_rate"].nil?
        vat_rate = parsed_json["vat_rate"].to_json
        vat_rate = Monite::LineItemProductVatRate.from_json(json_object: vat_rate)
      else
        vat_rate = nil
      end
      new(
        id: id,
        description: description,
        is_inline: is_inline,
        ledger_account_id: ledger_account_id,
        measure_unit: measure_unit,
        name: name,
        price: price,
        price_after_vat: price_after_vat,
        smallest_amount: smallest_amount,
        type: type,
        vat_rate: vat_rate,
        additional_properties: struct
      )
    end
# Serialize an instance of LineItemProduct to a JSON object
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
      obj.id.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
      obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
      obj.is_inline&.is_a?(Boolean) != false || raise("Passed value for field obj.is_inline is not the expected type, validation failed.")
      obj.ledger_account_id&.is_a?(String) != false || raise("Passed value for field obj.ledger_account_id is not the expected type, validation failed.")
      obj.measure_unit.nil? || Monite::LineItemProductMeasureUnit.validate_raw(obj: obj.measure_unit)
      obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      Monite::Price.validate_raw(obj: obj.price)
      Monite::Price.validate_raw(obj: obj.price_after_vat)
      obj.smallest_amount&.is_a?(Float) != false || raise("Passed value for field obj.smallest_amount is not the expected type, validation failed.")
      obj.type&.is_a?(Monite::ProductServiceTypeEnum) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
      Monite::LineItemProductVatRate.validate_raw(obj: obj.vat_rate)
    end
  end
end