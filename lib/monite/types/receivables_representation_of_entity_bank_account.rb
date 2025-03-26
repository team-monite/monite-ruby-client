# frozen_string_literal: true
require "ostruct"
require "json"

module Monite
  class ReceivablesRepresentationOfEntityBankAccount
  # @return [String] Unique ID of the entity bank account.
    attr_reader :id
  # @return [String] Account holder's name
    attr_reader :account_holder_name
  # @return [String] Account number (required if IBAN is not provided)
    attr_reader :account_number
  # @return [String] The name of the entity's bank account.
    attr_reader :bank_name
  # @return [String] The BIC of the entity's bank account.
    attr_reader :bic
  # @return [String] The IBAN of the entity's bank account.
    attr_reader :iban
  # @return [String] Routing number (US)
    attr_reader :routing_number
  # @return [String] Sort code (GB)
    attr_reader :sort_code
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] Unique ID of the entity bank account.
    # @param account_holder_name [String] Account holder's name
    # @param account_number [String] Account number (required if IBAN is not provided)
    # @param bank_name [String] The name of the entity's bank account.
    # @param bic [String] The BIC of the entity's bank account.
    # @param iban [String] The IBAN of the entity's bank account.
    # @param routing_number [String] Routing number (US)
    # @param sort_code [String] Sort code (GB)
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::ReceivablesRepresentationOfEntityBankAccount]
    def initialize(id: OMIT, account_holder_name: OMIT, account_number: OMIT, bank_name: OMIT, bic: OMIT, iban: OMIT, routing_number: OMIT, sort_code: OMIT, additional_properties: nil)
      @id = id if id != OMIT
      @account_holder_name = account_holder_name if account_holder_name != OMIT
      @account_number = account_number if account_number != OMIT
      @bank_name = bank_name if bank_name != OMIT
      @bic = bic if bic != OMIT
      @iban = iban if iban != OMIT
      @routing_number = routing_number if routing_number != OMIT
      @sort_code = sort_code if sort_code != OMIT
      @additional_properties = additional_properties
      @_field_set = { "id": id, "account_holder_name": account_holder_name, "account_number": account_number, "bank_name": bank_name, "bic": bic, "iban": iban, "routing_number": routing_number, "sort_code": sort_code }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of
#  ReceivablesRepresentationOfEntityBankAccount
    #
    # @param json_object [String] 
    # @return [Monite::ReceivablesRepresentationOfEntityBankAccount]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      account_holder_name = parsed_json["account_holder_name"]
      account_number = parsed_json["account_number"]
      bank_name = parsed_json["bank_name"]
      bic = parsed_json["bic"]
      iban = parsed_json["iban"]
      routing_number = parsed_json["routing_number"]
      sort_code = parsed_json["sort_code"]
      new(
        id: id,
        account_holder_name: account_holder_name,
        account_number: account_number,
        bank_name: bank_name,
        bic: bic,
        iban: iban,
        routing_number: routing_number,
        sort_code: sort_code,
        additional_properties: struct
      )
    end
# Serialize an instance of ReceivablesRepresentationOfEntityBankAccount to a JSON
#  object
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
      obj.id&.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
      obj.account_holder_name&.is_a?(String) != false || raise("Passed value for field obj.account_holder_name is not the expected type, validation failed.")
      obj.account_number&.is_a?(String) != false || raise("Passed value for field obj.account_number is not the expected type, validation failed.")
      obj.bank_name&.is_a?(String) != false || raise("Passed value for field obj.bank_name is not the expected type, validation failed.")
      obj.bic&.is_a?(String) != false || raise("Passed value for field obj.bic is not the expected type, validation failed.")
      obj.iban&.is_a?(String) != false || raise("Passed value for field obj.iban is not the expected type, validation failed.")
      obj.routing_number&.is_a?(String) != false || raise("Passed value for field obj.routing_number is not the expected type, validation failed.")
      obj.sort_code&.is_a?(String) != false || raise("Passed value for field obj.sort_code is not the expected type, validation failed.")
    end
  end
end