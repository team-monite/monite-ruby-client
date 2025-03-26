# frozen_string_literal: true
require_relative "bank_account"
require_relative "payment_account_type"
require "ostruct"
require "json"

module Monite
  class RecipientAccountResponse
  # @return [String] ID of a payment account
    attr_reader :id
  # @return [Array<Monite::BankAccount>] List of bank accounts
    attr_reader :bank_accounts
  # @return [String] Display name of a payment account
    attr_reader :name
  # @return [Monite::PaymentAccountType] Type of a payment account. Can be `entity` or `counterpart`
    attr_reader :type
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] ID of a payment account
    # @param bank_accounts [Array<Monite::BankAccount>] List of bank accounts
    # @param name [String] Display name of a payment account
    # @param type [Monite::PaymentAccountType] Type of a payment account. Can be `entity` or `counterpart`
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::RecipientAccountResponse]
    def initialize(id:, bank_accounts: OMIT, name: OMIT, type:, additional_properties: nil)
      @id = id
      @bank_accounts = bank_accounts if bank_accounts != OMIT
      @name = name if name != OMIT
      @type = type
      @additional_properties = additional_properties
      @_field_set = { "id": id, "bank_accounts": bank_accounts, "name": name, "type": type }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of RecipientAccountResponse
    #
    # @param json_object [String] 
    # @return [Monite::RecipientAccountResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      bank_accounts = parsed_json["bank_accounts"]&.map do | item |
  item = item.to_json
  Monite::BankAccount.from_json(json_object: item)
end
      name = parsed_json["name"]
      type = parsed_json["type"]
      new(
        id: id,
        bank_accounts: bank_accounts,
        name: name,
        type: type,
        additional_properties: struct
      )
    end
# Serialize an instance of RecipientAccountResponse to a JSON object
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
      obj.bank_accounts&.is_a?(Array) != false || raise("Passed value for field obj.bank_accounts is not the expected type, validation failed.")
      obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.type.is_a?(Monite::PaymentAccountType) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
    end
  end
end