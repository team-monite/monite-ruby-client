# frozen_string_literal: true
require "ostruct"
require "json"

module Monite
  class OcrResponseInvoiceReceiptLineItem
  # @return [String] OCR Id of line item
    attr_reader :line_item_ocr_id
  # @return [String] Human-readable line item description
    attr_reader :description
  # @return [Float] Quanity
    attr_reader :quantity
  # @return [Integer] Price in  cents/eurocents
    attr_reader :unit_price
  # @return [String] Unit
    attr_reader :unit
  # @return [Integer] VAT Percent minor units. Example: 12.5% is 1250.
    attr_reader :vat_percentage
  # @return [Integer] VAT Amount minor units.
    attr_reader :vat_amount
  # @return [Integer] Total excl VAT
    attr_reader :total_excl_vat
  # @return [Integer] Total included VAT
    attr_reader :total_incl_vat
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param line_item_ocr_id [String] OCR Id of line item
    # @param description [String] Human-readable line item description
    # @param quantity [Float] Quanity
    # @param unit_price [Integer] Price in  cents/eurocents
    # @param unit [String] Unit
    # @param vat_percentage [Integer] VAT Percent minor units. Example: 12.5% is 1250.
    # @param vat_amount [Integer] VAT Amount minor units.
    # @param total_excl_vat [Integer] Total excl VAT
    # @param total_incl_vat [Integer] Total included VAT
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::OcrResponseInvoiceReceiptLineItem]
    def initialize(line_item_ocr_id: OMIT, description: OMIT, quantity: OMIT, unit_price: OMIT, unit: OMIT, vat_percentage: OMIT, vat_amount: OMIT, total_excl_vat: OMIT, total_incl_vat: OMIT, additional_properties: nil)
      @line_item_ocr_id = line_item_ocr_id if line_item_ocr_id != OMIT
      @description = description if description != OMIT
      @quantity = quantity if quantity != OMIT
      @unit_price = unit_price if unit_price != OMIT
      @unit = unit if unit != OMIT
      @vat_percentage = vat_percentage if vat_percentage != OMIT
      @vat_amount = vat_amount if vat_amount != OMIT
      @total_excl_vat = total_excl_vat if total_excl_vat != OMIT
      @total_incl_vat = total_incl_vat if total_incl_vat != OMIT
      @additional_properties = additional_properties
      @_field_set = { "line_item_ocr_id": line_item_ocr_id, "description": description, "quantity": quantity, "unit_price": unit_price, "unit": unit, "vat_percentage": vat_percentage, "vat_amount": vat_amount, "total_excl_vat": total_excl_vat, "total_incl_vat": total_incl_vat }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of OcrResponseInvoiceReceiptLineItem
    #
    # @param json_object [String] 
    # @return [Monite::OcrResponseInvoiceReceiptLineItem]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      line_item_ocr_id = parsed_json["line_item_ocr_id"]
      description = parsed_json["description"]
      quantity = parsed_json["quantity"]
      unit_price = parsed_json["unit_price"]
      unit = parsed_json["unit"]
      vat_percentage = parsed_json["vat_percentage"]
      vat_amount = parsed_json["vat_amount"]
      total_excl_vat = parsed_json["total_excl_vat"]
      total_incl_vat = parsed_json["total_incl_vat"]
      new(
        line_item_ocr_id: line_item_ocr_id,
        description: description,
        quantity: quantity,
        unit_price: unit_price,
        unit: unit,
        vat_percentage: vat_percentage,
        vat_amount: vat_amount,
        total_excl_vat: total_excl_vat,
        total_incl_vat: total_incl_vat,
        additional_properties: struct
      )
    end
# Serialize an instance of OcrResponseInvoiceReceiptLineItem to a JSON object
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
      obj.line_item_ocr_id&.is_a?(String) != false || raise("Passed value for field obj.line_item_ocr_id is not the expected type, validation failed.")
      obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
      obj.quantity&.is_a?(Float) != false || raise("Passed value for field obj.quantity is not the expected type, validation failed.")
      obj.unit_price&.is_a?(Integer) != false || raise("Passed value for field obj.unit_price is not the expected type, validation failed.")
      obj.unit&.is_a?(String) != false || raise("Passed value for field obj.unit is not the expected type, validation failed.")
      obj.vat_percentage&.is_a?(Integer) != false || raise("Passed value for field obj.vat_percentage is not the expected type, validation failed.")
      obj.vat_amount&.is_a?(Integer) != false || raise("Passed value for field obj.vat_amount is not the expected type, validation failed.")
      obj.total_excl_vat&.is_a?(Integer) != false || raise("Passed value for field obj.total_excl_vat is not the expected type, validation failed.")
      obj.total_incl_vat&.is_a?(Integer) != false || raise("Passed value for field obj.total_incl_vat is not the expected type, validation failed.")
    end
  end
end