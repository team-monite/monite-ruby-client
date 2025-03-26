# frozen_string_literal: true
require "date"
require "date"
require "ostruct"
require "json"

module Monite
# Schema for credit note line item response. Includes all fields that can be
#  returned from the API.
  class CreditNoteLineItemResponse
  # @return [String] Unique identifier of the line item
    attr_reader :id
  # @return [DateTime] Timestamp when the line item was created
    attr_reader :created_at
  # @return [DateTime] Timestamp when the line item was last updated
    attr_reader :updated_at
  # @return [String] ID of the user who created the line item
    attr_reader :created_by_user_id
  # @return [String] ID of the parent credit note
    attr_reader :credit_note_id
  # @return [String] Detailed description of the line item
    attr_reader :description
  # @return [String] Name or title of the line item
    attr_reader :name
  # @return [Float] Quantity of items
    attr_reader :quantity
  # @return [Integer] Subtotal amount before tax
    attr_reader :subtotal
  # @return [Integer] Tax percentage
    attr_reader :tax
  # @return [Integer] Tax amount
    attr_reader :tax_amount
  # @return [Integer] Total amount including tax
    attr_reader :total
  # @return [String] Unit of measurement
    attr_reader :unit
  # @return [Integer] Price per unit in smallest currency unit
    attr_reader :unit_price
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] Unique identifier of the line item
    # @param created_at [DateTime] Timestamp when the line item was created
    # @param updated_at [DateTime] Timestamp when the line item was last updated
    # @param created_by_user_id [String] ID of the user who created the line item
    # @param credit_note_id [String] ID of the parent credit note
    # @param description [String] Detailed description of the line item
    # @param name [String] Name or title of the line item
    # @param quantity [Float] Quantity of items
    # @param subtotal [Integer] Subtotal amount before tax
    # @param tax [Integer] Tax percentage
    # @param tax_amount [Integer] Tax amount
    # @param total [Integer] Total amount including tax
    # @param unit [String] Unit of measurement
    # @param unit_price [Integer] Price per unit in smallest currency unit
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::CreditNoteLineItemResponse]
    def initialize(id:, created_at:, updated_at:, created_by_user_id: OMIT, credit_note_id:, description: OMIT, name: OMIT, quantity: OMIT, subtotal: OMIT, tax: OMIT, tax_amount: OMIT, total: OMIT, unit: OMIT, unit_price: OMIT, additional_properties: nil)
      @id = id
      @created_at = created_at
      @updated_at = updated_at
      @created_by_user_id = created_by_user_id if created_by_user_id != OMIT
      @credit_note_id = credit_note_id
      @description = description if description != OMIT
      @name = name if name != OMIT
      @quantity = quantity if quantity != OMIT
      @subtotal = subtotal if subtotal != OMIT
      @tax = tax if tax != OMIT
      @tax_amount = tax_amount if tax_amount != OMIT
      @total = total if total != OMIT
      @unit = unit if unit != OMIT
      @unit_price = unit_price if unit_price != OMIT
      @additional_properties = additional_properties
      @_field_set = { "id": id, "created_at": created_at, "updated_at": updated_at, "created_by_user_id": created_by_user_id, "credit_note_id": credit_note_id, "description": description, "name": name, "quantity": quantity, "subtotal": subtotal, "tax": tax, "tax_amount": tax_amount, "total": total, "unit": unit, "unit_price": unit_price }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of CreditNoteLineItemResponse
    #
    # @param json_object [String] 
    # @return [Monite::CreditNoteLineItemResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      created_at = unless parsed_json["created_at"].nil?
  DateTime.parse(parsed_json["created_at"])
else
  nil
end
      updated_at = unless parsed_json["updated_at"].nil?
  DateTime.parse(parsed_json["updated_at"])
else
  nil
end
      created_by_user_id = parsed_json["created_by_user_id"]
      credit_note_id = parsed_json["credit_note_id"]
      description = parsed_json["description"]
      name = parsed_json["name"]
      quantity = parsed_json["quantity"]
      subtotal = parsed_json["subtotal"]
      tax = parsed_json["tax"]
      tax_amount = parsed_json["tax_amount"]
      total = parsed_json["total"]
      unit = parsed_json["unit"]
      unit_price = parsed_json["unit_price"]
      new(
        id: id,
        created_at: created_at,
        updated_at: updated_at,
        created_by_user_id: created_by_user_id,
        credit_note_id: credit_note_id,
        description: description,
        name: name,
        quantity: quantity,
        subtotal: subtotal,
        tax: tax,
        tax_amount: tax_amount,
        total: total,
        unit: unit,
        unit_price: unit_price,
        additional_properties: struct
      )
    end
# Serialize an instance of CreditNoteLineItemResponse to a JSON object
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
      obj.created_at.is_a?(DateTime) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
      obj.updated_at.is_a?(DateTime) != false || raise("Passed value for field obj.updated_at is not the expected type, validation failed.")
      obj.created_by_user_id&.is_a?(String) != false || raise("Passed value for field obj.created_by_user_id is not the expected type, validation failed.")
      obj.credit_note_id.is_a?(String) != false || raise("Passed value for field obj.credit_note_id is not the expected type, validation failed.")
      obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
      obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.quantity&.is_a?(Float) != false || raise("Passed value for field obj.quantity is not the expected type, validation failed.")
      obj.subtotal&.is_a?(Integer) != false || raise("Passed value for field obj.subtotal is not the expected type, validation failed.")
      obj.tax&.is_a?(Integer) != false || raise("Passed value for field obj.tax is not the expected type, validation failed.")
      obj.tax_amount&.is_a?(Integer) != false || raise("Passed value for field obj.tax_amount is not the expected type, validation failed.")
      obj.total&.is_a?(Integer) != false || raise("Passed value for field obj.total is not the expected type, validation failed.")
      obj.unit&.is_a?(String) != false || raise("Passed value for field obj.unit is not the expected type, validation failed.")
      obj.unit_price&.is_a?(Integer) != false || raise("Passed value for field obj.unit_price is not the expected type, validation failed.")
    end
  end
end