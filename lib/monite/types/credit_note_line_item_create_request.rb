# frozen_string_literal: true
require "ostruct"
require "json"

module Monite
# Schema for creating a new credit note line item.
  class CreditNoteLineItemCreateRequest
  # @return [String] Detailed description of the line item
    attr_reader :description
  # @return [String] Name or title of the line item
    attr_reader :name
  # @return [Float] Quantity of items
    attr_reader :quantity
  # @return [Integer] VAT rate in percent [minor
#  units](https://docs.monite.com/references/currencies#minor-units). Example:
#  12.5% is 1250.
    attr_reader :tax
  # @return [String] Unit of measurement
    attr_reader :unit
  # @return [Integer] Price per unit in smallest currency unit (e.g. cents)
    attr_reader :unit_price
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param description [String] Detailed description of the line item
    # @param name [String] Name or title of the line item
    # @param quantity [Float] Quantity of items
    # @param tax [Integer] VAT rate in percent [minor
#  units](https://docs.monite.com/references/currencies#minor-units). Example:
#  12.5% is 1250.
    # @param unit [String] Unit of measurement
    # @param unit_price [Integer] Price per unit in smallest currency unit (e.g. cents)
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::CreditNoteLineItemCreateRequest]
    def initialize(description: OMIT, name: OMIT, quantity: OMIT, tax: OMIT, unit: OMIT, unit_price: OMIT, additional_properties: nil)
      @description = description if description != OMIT
      @name = name if name != OMIT
      @quantity = quantity if quantity != OMIT
      @tax = tax if tax != OMIT
      @unit = unit if unit != OMIT
      @unit_price = unit_price if unit_price != OMIT
      @additional_properties = additional_properties
      @_field_set = { "description": description, "name": name, "quantity": quantity, "tax": tax, "unit": unit, "unit_price": unit_price }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of CreditNoteLineItemCreateRequest
    #
    # @param json_object [String] 
    # @return [Monite::CreditNoteLineItemCreateRequest]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      description = parsed_json["description"]
      name = parsed_json["name"]
      quantity = parsed_json["quantity"]
      tax = parsed_json["tax"]
      unit = parsed_json["unit"]
      unit_price = parsed_json["unit_price"]
      new(
        description: description,
        name: name,
        quantity: quantity,
        tax: tax,
        unit: unit,
        unit_price: unit_price,
        additional_properties: struct
      )
    end
# Serialize an instance of CreditNoteLineItemCreateRequest to a JSON object
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
      obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
      obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.quantity&.is_a?(Float) != false || raise("Passed value for field obj.quantity is not the expected type, validation failed.")
      obj.tax&.is_a?(Integer) != false || raise("Passed value for field obj.tax is not the expected type, validation failed.")
      obj.unit&.is_a?(String) != false || raise("Passed value for field obj.unit is not the expected type, validation failed.")
      obj.unit_price&.is_a?(Integer) != false || raise("Passed value for field obj.unit_price is not the expected type, validation failed.")
    end
  end
end