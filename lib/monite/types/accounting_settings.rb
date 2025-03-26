# frozen_string_literal: true
require_relative "default_ledger_account_i_ds"
require "ostruct"
require "json"

module Monite
  class AccountingSettings
  # @return [Monite::DefaultLedgerAccountIDs] Default ledger accounts that will be used for various objects pushed into an
#  accounting system. Use `GET /ledger_accounts` to get the IDs of these ledger
#  accounts.
    attr_reader :ledger_account_ids
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param ledger_account_ids [Monite::DefaultLedgerAccountIDs] Default ledger accounts that will be used for various objects pushed into an
#  accounting system. Use `GET /ledger_accounts` to get the IDs of these ledger
#  accounts.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::AccountingSettings]
    def initialize(ledger_account_ids: OMIT, additional_properties: nil)
      @ledger_account_ids = ledger_account_ids if ledger_account_ids != OMIT
      @additional_properties = additional_properties
      @_field_set = { "ledger_account_ids": ledger_account_ids }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of AccountingSettings
    #
    # @param json_object [String] 
    # @return [Monite::AccountingSettings]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["ledger_account_ids"].nil?
        ledger_account_ids = parsed_json["ledger_account_ids"].to_json
        ledger_account_ids = Monite::DefaultLedgerAccountIDs.from_json(json_object: ledger_account_ids)
      else
        ledger_account_ids = nil
      end
      new(ledger_account_ids: ledger_account_ids, additional_properties: struct)
    end
# Serialize an instance of AccountingSettings to a JSON object
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
      obj.ledger_account_ids.nil? || Monite::DefaultLedgerAccountIDs.validate_raw(obj: obj.ledger_account_ids)
    end
  end
end