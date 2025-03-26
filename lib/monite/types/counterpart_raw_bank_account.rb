# frozen_string_literal: true
require "ostruct"
require "json"

module Monite
  class CounterpartRawBankAccount
  # @return [String] Vendor's bank account name.
    attr_reader :account_holder_name
  # @return [String] Vendor's bank account number, IBAN, or similar (if specified in the payable
#  document).
    attr_reader :account_number
  # @return [String] SWIFT code (BIC) of the vendor's bank.
    attr_reader :bic
  # @return [String] required for non-GB bank accounts
    attr_reader :iban
  # @return [String] required for GB bank accounts
    attr_reader :sort_code
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param account_holder_name [String] Vendor's bank account name.
    # @param account_number [String] Vendor's bank account number, IBAN, or similar (if specified in the payable
#  document).
    # @param bic [String] SWIFT code (BIC) of the vendor's bank.
    # @param iban [String] required for non-GB bank accounts
    # @param sort_code [String] required for GB bank accounts
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::CounterpartRawBankAccount]
    def initialize(account_holder_name: OMIT, account_number: OMIT, bic: OMIT, iban: OMIT, sort_code: OMIT, additional_properties: nil)
      @account_holder_name = account_holder_name if account_holder_name != OMIT
      @account_number = account_number if account_number != OMIT
      @bic = bic if bic != OMIT
      @iban = iban if iban != OMIT
      @sort_code = sort_code if sort_code != OMIT
      @additional_properties = additional_properties
      @_field_set = { "account_holder_name": account_holder_name, "account_number": account_number, "bic": bic, "iban": iban, "sort_code": sort_code }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of CounterpartRawBankAccount
    #
    # @param json_object [String] 
    # @return [Monite::CounterpartRawBankAccount]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      account_holder_name = parsed_json["account_holder_name"]
      account_number = parsed_json["account_number"]
      bic = parsed_json["bic"]
      iban = parsed_json["iban"]
      sort_code = parsed_json["sort_code"]
      new(
        account_holder_name: account_holder_name,
        account_number: account_number,
        bic: bic,
        iban: iban,
        sort_code: sort_code,
        additional_properties: struct
      )
    end
# Serialize an instance of CounterpartRawBankAccount to a JSON object
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
      obj.account_holder_name&.is_a?(String) != false || raise("Passed value for field obj.account_holder_name is not the expected type, validation failed.")
      obj.account_number&.is_a?(String) != false || raise("Passed value for field obj.account_number is not the expected type, validation failed.")
      obj.bic&.is_a?(String) != false || raise("Passed value for field obj.bic is not the expected type, validation failed.")
      obj.iban&.is_a?(String) != false || raise("Passed value for field obj.iban is not the expected type, validation failed.")
      obj.sort_code&.is_a?(String) != false || raise("Passed value for field obj.sort_code is not the expected type, validation failed.")
    end
  end
end