# frozen_string_literal: true
require_relative "payment_intent_payout_method"
require "ostruct"
require "json"

module Monite
  class PaymentIntentsRecipient
  # @return [String] 
    attr_reader :id
  # @return [String] 
    attr_reader :bank_account_id
  # @return [Monite::PaymentIntentPayoutMethod] 
    attr_reader :payout_method
  # @return [String] 
    attr_reader :type
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] 
    # @param bank_account_id [String] 
    # @param payout_method [Monite::PaymentIntentPayoutMethod] 
    # @param type [String] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::PaymentIntentsRecipient]
    def initialize(id:, bank_account_id: OMIT, payout_method: OMIT, type:, additional_properties: nil)
      @id = id
      @bank_account_id = bank_account_id if bank_account_id != OMIT
      @payout_method = payout_method if payout_method != OMIT
      @type = type
      @additional_properties = additional_properties
      @_field_set = { "id": id, "bank_account_id": bank_account_id, "payout_method": payout_method, "type": type }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of PaymentIntentsRecipient
    #
    # @param json_object [String] 
    # @return [Monite::PaymentIntentsRecipient]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      bank_account_id = parsed_json["bank_account_id"]
      payout_method = parsed_json["payout_method"]
      type = parsed_json["type"]
      new(
        id: id,
        bank_account_id: bank_account_id,
        payout_method: payout_method,
        type: type,
        additional_properties: struct
      )
    end
# Serialize an instance of PaymentIntentsRecipient to a JSON object
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
      obj.bank_account_id&.is_a?(String) != false || raise("Passed value for field obj.bank_account_id is not the expected type, validation failed.")
      obj.payout_method&.is_a?(Monite::PaymentIntentPayoutMethod) != false || raise("Passed value for field obj.payout_method is not the expected type, validation failed.")
      obj.type.is_a?(String) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
    end
  end
end