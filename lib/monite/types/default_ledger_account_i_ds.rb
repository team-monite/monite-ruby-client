# frozen_string_literal: true
require "ostruct"
require "json"

module Monite
  class DefaultLedgerAccountIDs
  # @return [String] ID of the ledger account to which all payment records will be pushed. Changing
#  this value affects only future data pushes and does not affect payment records
#  that already exist in the accounting system.
    attr_reader :payments
  # @return [String] ID of the ledger account to which products without a `ledger_account_id`
#  specified will be pushed. Changing this value affects only future data pushes
#  and does not affect products that already exist in the accounting system.
    attr_reader :products
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param payments [String] ID of the ledger account to which all payment records will be pushed. Changing
#  this value affects only future data pushes and does not affect payment records
#  that already exist in the accounting system.
    # @param products [String] ID of the ledger account to which products without a `ledger_account_id`
#  specified will be pushed. Changing this value affects only future data pushes
#  and does not affect products that already exist in the accounting system.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::DefaultLedgerAccountIDs]
    def initialize(payments: OMIT, products: OMIT, additional_properties: nil)
      @payments = payments if payments != OMIT
      @products = products if products != OMIT
      @additional_properties = additional_properties
      @_field_set = { "payments": payments, "products": products }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of DefaultLedgerAccountIDs
    #
    # @param json_object [String] 
    # @return [Monite::DefaultLedgerAccountIDs]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      payments = parsed_json["payments"]
      products = parsed_json["products"]
      new(
        payments: payments,
        products: products,
        additional_properties: struct
      )
    end
# Serialize an instance of DefaultLedgerAccountIDs to a JSON object
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
      obj.payments&.is_a?(String) != false || raise("Passed value for field obj.payments is not the expected type, validation failed.")
      obj.products&.is_a?(String) != false || raise("Passed value for field obj.products is not the expected type, validation failed.")
    end
  end
end