# frozen_string_literal: true
require_relative "currency_enum"
require "ostruct"
require "json"

module Monite
# Represents a general ledger account retrieved from an accounting system.
  class LedgerAccountResponse
  # @return [String] A unique identifier of the ledger account.
    attr_reader :id
  # @return [Monite::CurrencyEnum] The currency of the ledger account, specified as a three-letter [currency
#  code](https://docs.monite.com/references/currencies) (ISO 4217).
    attr_reader :currency
  # @return [Integer] The current balance in the account.
    attr_reader :current_balance
  # @return [String] User-defined description of the ledger account.
    attr_reader :description
  # @return [Boolean] Indicates whether this ledger account represents a bank account.
    attr_reader :is_bank_account
  # @return [String] A user-defined name of the ledger account. Examples: Accounts Receivable, Office
#  Equipment, Advertising, Salaries.
    attr_reader :name
  # @return [String] The account code in the accounting system.
    attr_reader :nominal_code
  # @return [String] The status of the ledger account. Possible values: Active, Archived, Pending,
#  Unknown.
    attr_reader :status
  # @return [String] The subtype or category of the ledger account. Possible values vary based on the
#  accounting system used. Examples: Current, Fixed, Expense, Inventory, Equity.
    attr_reader :subtype
  # @return [String] The type of the ledger account. It determines whether the account is a credit
#  account or a debit account and where it appears in financial reports within the
#  accounting system. Possible values: Asset, Equity, Expense, Income, Liability,
#  Unknown.
    attr_reader :type
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] A unique identifier of the ledger account.
    # @param currency [Monite::CurrencyEnum] The currency of the ledger account, specified as a three-letter [currency
#  code](https://docs.monite.com/references/currencies) (ISO 4217).
    # @param current_balance [Integer] The current balance in the account.
    # @param description [String] User-defined description of the ledger account.
    # @param is_bank_account [Boolean] Indicates whether this ledger account represents a bank account.
    # @param name [String] A user-defined name of the ledger account. Examples: Accounts Receivable, Office
#  Equipment, Advertising, Salaries.
    # @param nominal_code [String] The account code in the accounting system.
    # @param status [String] The status of the ledger account. Possible values: Active, Archived, Pending,
#  Unknown.
    # @param subtype [String] The subtype or category of the ledger account. Possible values vary based on the
#  accounting system used. Examples: Current, Fixed, Expense, Inventory, Equity.
    # @param type [String] The type of the ledger account. It determines whether the account is a credit
#  account or a debit account and where it appears in financial reports within the
#  accounting system. Possible values: Asset, Equity, Expense, Income, Liability,
#  Unknown.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::LedgerAccountResponse]
    def initialize(id:, currency: OMIT, current_balance: OMIT, description: OMIT, is_bank_account:, name:, nominal_code: OMIT, status:, subtype: OMIT, type:, additional_properties: nil)
      @id = id
      @currency = currency if currency != OMIT
      @current_balance = current_balance if current_balance != OMIT
      @description = description if description != OMIT
      @is_bank_account = is_bank_account
      @name = name
      @nominal_code = nominal_code if nominal_code != OMIT
      @status = status
      @subtype = subtype if subtype != OMIT
      @type = type
      @additional_properties = additional_properties
      @_field_set = { "id": id, "currency": currency, "current_balance": current_balance, "description": description, "is_bank_account": is_bank_account, "name": name, "nominal_code": nominal_code, "status": status, "subtype": subtype, "type": type }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of LedgerAccountResponse
    #
    # @param json_object [String] 
    # @return [Monite::LedgerAccountResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      currency = parsed_json["currency"]
      current_balance = parsed_json["current_balance"]
      description = parsed_json["description"]
      is_bank_account = parsed_json["is_bank_account"]
      name = parsed_json["name"]
      nominal_code = parsed_json["nominal_code"]
      status = parsed_json["status"]
      subtype = parsed_json["subtype"]
      type = parsed_json["type"]
      new(
        id: id,
        currency: currency,
        current_balance: current_balance,
        description: description,
        is_bank_account: is_bank_account,
        name: name,
        nominal_code: nominal_code,
        status: status,
        subtype: subtype,
        type: type,
        additional_properties: struct
      )
    end
# Serialize an instance of LedgerAccountResponse to a JSON object
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
      obj.currency&.is_a?(Monite::CurrencyEnum) != false || raise("Passed value for field obj.currency is not the expected type, validation failed.")
      obj.current_balance&.is_a?(Integer) != false || raise("Passed value for field obj.current_balance is not the expected type, validation failed.")
      obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
      obj.is_bank_account.is_a?(Boolean) != false || raise("Passed value for field obj.is_bank_account is not the expected type, validation failed.")
      obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.nominal_code&.is_a?(String) != false || raise("Passed value for field obj.nominal_code is not the expected type, validation failed.")
      obj.status.is_a?(String) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
      obj.subtype&.is_a?(String) != false || raise("Passed value for field obj.subtype is not the expected type, validation failed.")
      obj.type.is_a?(String) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
    end
  end
end