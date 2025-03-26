# frozen_string_literal: true
require_relative "single_payment_intent"
require "ostruct"
require "json"

module Monite
  class PaymentsBatchPaymentRequest
  # @return [String] 
    attr_reader :payer_bank_account_id
  # @return [Array<Monite::SinglePaymentIntent>] 
    attr_reader :payment_intents
  # @return [String] 
    attr_reader :payment_method
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param payer_bank_account_id [String] 
    # @param payment_intents [Array<Monite::SinglePaymentIntent>] 
    # @param payment_method [String] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::PaymentsBatchPaymentRequest]
    def initialize(payer_bank_account_id:, payment_intents:, payment_method:, additional_properties: nil)
      @payer_bank_account_id = payer_bank_account_id
      @payment_intents = payment_intents
      @payment_method = payment_method
      @additional_properties = additional_properties
      @_field_set = { "payer_bank_account_id": payer_bank_account_id, "payment_intents": payment_intents, "payment_method": payment_method }
    end
# Deserialize a JSON object to an instance of PaymentsBatchPaymentRequest
    #
    # @param json_object [String] 
    # @return [Monite::PaymentsBatchPaymentRequest]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      payer_bank_account_id = parsed_json["payer_bank_account_id"]
      payment_intents = parsed_json["payment_intents"]&.map do | item |
  item = item.to_json
  Monite::SinglePaymentIntent.from_json(json_object: item)
end
      payment_method = parsed_json["payment_method"]
      new(
        payer_bank_account_id: payer_bank_account_id,
        payment_intents: payment_intents,
        payment_method: payment_method,
        additional_properties: struct
      )
    end
# Serialize an instance of PaymentsBatchPaymentRequest to a JSON object
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
      obj.payer_bank_account_id.is_a?(String) != false || raise("Passed value for field obj.payer_bank_account_id is not the expected type, validation failed.")
      obj.payment_intents.is_a?(Array) != false || raise("Passed value for field obj.payment_intents is not the expected type, validation failed.")
      obj.payment_method.is_a?(String) != false || raise("Passed value for field obj.payment_method is not the expected type, validation failed.")
    end
  end
end