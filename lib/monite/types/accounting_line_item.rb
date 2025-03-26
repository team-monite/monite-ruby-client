# frozen_string_literal: true
require_relative "accounting_ref_object"
require "ostruct"
require "json"

module Monite
# Contains the details of an invoice line item retrieved from an accounting
#  system.
  class AccountingLineItem
  # @return [String] The name or description of the product or service being invoiced.
    attr_reader :description
  # @return [Float] Discount amount for this line item (if any).
    attr_reader :discount_amount
  # @return [Float] Discount percentage for this line item (if any).
    attr_reader :discount_percentage
  # @return [String] ID of the ledger account associated with this line item. You can use `GET
#  /ledger_accounts/{ledger_account_id}` to get further details about this ledger
#  account.
    attr_reader :ledger_account_id
  # @return [Float] The quantity of the product or service.
    attr_reader :quantity
  # @return [Monite::AccountingRefObject] An internal reference to the tax rate in the accounting system that the line
#  item is linked to.
    attr_reader :tax_rate_ref
  # @return [Float] The cost per unit of the product or service.
    attr_reader :unit_amount
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param description [String] The name or description of the product or service being invoiced.
    # @param discount_amount [Float] Discount amount for this line item (if any).
    # @param discount_percentage [Float] Discount percentage for this line item (if any).
    # @param ledger_account_id [String] ID of the ledger account associated with this line item. You can use `GET
#  /ledger_accounts/{ledger_account_id}` to get further details about this ledger
#  account.
    # @param quantity [Float] The quantity of the product or service.
    # @param tax_rate_ref [Monite::AccountingRefObject] An internal reference to the tax rate in the accounting system that the line
#  item is linked to.
    # @param unit_amount [Float] The cost per unit of the product or service.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::AccountingLineItem]
    def initialize(description: OMIT, discount_amount: OMIT, discount_percentage: OMIT, ledger_account_id: OMIT, quantity: OMIT, tax_rate_ref: OMIT, unit_amount: OMIT, additional_properties: nil)
      @description = description if description != OMIT
      @discount_amount = discount_amount if discount_amount != OMIT
      @discount_percentage = discount_percentage if discount_percentage != OMIT
      @ledger_account_id = ledger_account_id if ledger_account_id != OMIT
      @quantity = quantity if quantity != OMIT
      @tax_rate_ref = tax_rate_ref if tax_rate_ref != OMIT
      @unit_amount = unit_amount if unit_amount != OMIT
      @additional_properties = additional_properties
      @_field_set = { "description": description, "discount_amount": discount_amount, "discount_percentage": discount_percentage, "ledger_account_id": ledger_account_id, "quantity": quantity, "tax_rate_ref": tax_rate_ref, "unit_amount": unit_amount }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of AccountingLineItem
    #
    # @param json_object [String] 
    # @return [Monite::AccountingLineItem]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      description = parsed_json["description"]
      discount_amount = parsed_json["discount_amount"]
      discount_percentage = parsed_json["discount_percentage"]
      ledger_account_id = parsed_json["ledger_account_id"]
      quantity = parsed_json["quantity"]
      unless parsed_json["tax_rate_ref"].nil?
        tax_rate_ref = parsed_json["tax_rate_ref"].to_json
        tax_rate_ref = Monite::AccountingRefObject.from_json(json_object: tax_rate_ref)
      else
        tax_rate_ref = nil
      end
      unit_amount = parsed_json["unit_amount"]
      new(
        description: description,
        discount_amount: discount_amount,
        discount_percentage: discount_percentage,
        ledger_account_id: ledger_account_id,
        quantity: quantity,
        tax_rate_ref: tax_rate_ref,
        unit_amount: unit_amount,
        additional_properties: struct
      )
    end
# Serialize an instance of AccountingLineItem to a JSON object
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
      obj.discount_amount&.is_a?(Float) != false || raise("Passed value for field obj.discount_amount is not the expected type, validation failed.")
      obj.discount_percentage&.is_a?(Float) != false || raise("Passed value for field obj.discount_percentage is not the expected type, validation failed.")
      obj.ledger_account_id&.is_a?(String) != false || raise("Passed value for field obj.ledger_account_id is not the expected type, validation failed.")
      obj.quantity&.is_a?(Float) != false || raise("Passed value for field obj.quantity is not the expected type, validation failed.")
      obj.tax_rate_ref.nil? || Monite::AccountingRefObject.validate_raw(obj: obj.tax_rate_ref)
      obj.unit_amount&.is_a?(Float) != false || raise("Passed value for field obj.unit_amount is not the expected type, validation failed.")
    end
  end
end