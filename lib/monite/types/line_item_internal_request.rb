# frozen_string_literal: true
require "ostruct"
require "json"

module Monite
  class LineItemInternalRequest
  # @return [String] ID of the tax rate reference used for accounting integration. May be used to
#  override auto-picked tax rate reference in accounting platform in case of any
#  platform-specific constraints.
    attr_reader :accounting_tax_rate_id
  # @return [String] Description of the product.
    attr_reader :description
  # @return [String] ID of the account record used to store bookkeeping entries for balance-sheet and
#  income-statement transactions.
    attr_reader :ledger_account_id
  # @return [String] Name of the product.
    attr_reader :name
  # @return [Float] The quantity of each of the goods, materials, or services listed in the payable.
    attr_reader :quantity
  # @return [Integer] 
    attr_reader :subtotal
  # @return [Integer] VAT rate in percent [minor
#  units](https://docs.monite.com/references/currencies#minor-units). Example:
#  12.5% is 1250.
    attr_reader :tax
  # @return [Integer] 
    attr_reader :total
  # @return [String] The unit of the product
    attr_reader :unit
  # @return [Integer] The unit price of the product, in [minor
#  units](https://docs.monite.com/references/currencies#minor-units). For example,
#  $12.50 is represented as 1250.
    attr_reader :unit_price
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param accounting_tax_rate_id [String] ID of the tax rate reference used for accounting integration. May be used to
#  override auto-picked tax rate reference in accounting platform in case of any
#  platform-specific constraints.
    # @param description [String] Description of the product.
    # @param ledger_account_id [String] ID of the account record used to store bookkeeping entries for balance-sheet and
#  income-statement transactions.
    # @param name [String] Name of the product.
    # @param quantity [Float] The quantity of each of the goods, materials, or services listed in the payable.
    # @param subtotal [Integer] 
    # @param tax [Integer] VAT rate in percent [minor
#  units](https://docs.monite.com/references/currencies#minor-units). Example:
#  12.5% is 1250.
    # @param total [Integer] 
    # @param unit [String] The unit of the product
    # @param unit_price [Integer] The unit price of the product, in [minor
#  units](https://docs.monite.com/references/currencies#minor-units). For example,
#  $12.50 is represented as 1250.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::LineItemInternalRequest]
    def initialize(accounting_tax_rate_id: OMIT, description: OMIT, ledger_account_id: OMIT, name: OMIT, quantity: OMIT, subtotal: OMIT, tax: OMIT, total: OMIT, unit: OMIT, unit_price: OMIT, additional_properties: nil)
      @accounting_tax_rate_id = accounting_tax_rate_id if accounting_tax_rate_id != OMIT
      @description = description if description != OMIT
      @ledger_account_id = ledger_account_id if ledger_account_id != OMIT
      @name = name if name != OMIT
      @quantity = quantity if quantity != OMIT
      @subtotal = subtotal if subtotal != OMIT
      @tax = tax if tax != OMIT
      @total = total if total != OMIT
      @unit = unit if unit != OMIT
      @unit_price = unit_price if unit_price != OMIT
      @additional_properties = additional_properties
      @_field_set = { "accounting_tax_rate_id": accounting_tax_rate_id, "description": description, "ledger_account_id": ledger_account_id, "name": name, "quantity": quantity, "subtotal": subtotal, "tax": tax, "total": total, "unit": unit, "unit_price": unit_price }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of LineItemInternalRequest
    #
    # @param json_object [String] 
    # @return [Monite::LineItemInternalRequest]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      accounting_tax_rate_id = parsed_json["accounting_tax_rate_id"]
      description = parsed_json["description"]
      ledger_account_id = parsed_json["ledger_account_id"]
      name = parsed_json["name"]
      quantity = parsed_json["quantity"]
      subtotal = parsed_json["subtotal"]
      tax = parsed_json["tax"]
      total = parsed_json["total"]
      unit = parsed_json["unit"]
      unit_price = parsed_json["unit_price"]
      new(
        accounting_tax_rate_id: accounting_tax_rate_id,
        description: description,
        ledger_account_id: ledger_account_id,
        name: name,
        quantity: quantity,
        subtotal: subtotal,
        tax: tax,
        total: total,
        unit: unit,
        unit_price: unit_price,
        additional_properties: struct
      )
    end
# Serialize an instance of LineItemInternalRequest to a JSON object
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
      obj.accounting_tax_rate_id&.is_a?(String) != false || raise("Passed value for field obj.accounting_tax_rate_id is not the expected type, validation failed.")
      obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
      obj.ledger_account_id&.is_a?(String) != false || raise("Passed value for field obj.ledger_account_id is not the expected type, validation failed.")
      obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.quantity&.is_a?(Float) != false || raise("Passed value for field obj.quantity is not the expected type, validation failed.")
      obj.subtotal&.is_a?(Integer) != false || raise("Passed value for field obj.subtotal is not the expected type, validation failed.")
      obj.tax&.is_a?(Integer) != false || raise("Passed value for field obj.tax is not the expected type, validation failed.")
      obj.total&.is_a?(Integer) != false || raise("Passed value for field obj.total is not the expected type, validation failed.")
      obj.unit&.is_a?(String) != false || raise("Passed value for field obj.unit is not the expected type, validation failed.")
      obj.unit_price&.is_a?(Integer) != false || raise("Passed value for field obj.unit_price is not the expected type, validation failed.")
    end
  end
end