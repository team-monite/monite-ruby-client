# frozen_string_literal: true
require "date"
require_relative "single_payment_intent_response"
require_relative "payments_batch_payment_status"
require "ostruct"
require "json"

module Monite
  class PaymentsBatchPaymentResponse
  # @return [String] 
    attr_reader :id
  # @return [DateTime] 
    attr_reader :created_at
  # @return [Hash{String => Object}] 
    attr_reader :error
  # @return [String] 
    attr_reader :payer_bank_account_id
  # @return [Array<Monite::SinglePaymentIntentResponse>] 
    attr_reader :payment_intents
  # @return [String] 
    attr_reader :payment_method
  # @return [Monite::PaymentsBatchPaymentStatus] 
    attr_reader :status
  # @return [Integer] 
    attr_reader :total_amount
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] 
    # @param created_at [DateTime] 
    # @param error [Hash{String => Object}] 
    # @param payer_bank_account_id [String] 
    # @param payment_intents [Array<Monite::SinglePaymentIntentResponse>] 
    # @param payment_method [String] 
    # @param status [Monite::PaymentsBatchPaymentStatus] 
    # @param total_amount [Integer] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::PaymentsBatchPaymentResponse]
    def initialize(id:, created_at:, error: OMIT, payer_bank_account_id:, payment_intents:, payment_method:, status:, total_amount: OMIT, additional_properties: nil)
      @id = id
      @created_at = created_at
      @error = error if error != OMIT
      @payer_bank_account_id = payer_bank_account_id
      @payment_intents = payment_intents
      @payment_method = payment_method
      @status = status
      @total_amount = total_amount if total_amount != OMIT
      @additional_properties = additional_properties
      @_field_set = { "id": id, "created_at": created_at, "error": error, "payer_bank_account_id": payer_bank_account_id, "payment_intents": payment_intents, "payment_method": payment_method, "status": status, "total_amount": total_amount }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of PaymentsBatchPaymentResponse
    #
    # @param json_object [String] 
    # @return [Monite::PaymentsBatchPaymentResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      created_at = unless parsed_json["created_at"].nil?
  DateTime.parse(parsed_json["created_at"])
else
  nil
end
      error = parsed_json["error"]
      payer_bank_account_id = parsed_json["payer_bank_account_id"]
      payment_intents = parsed_json["payment_intents"]&.map do | item |
  item = item.to_json
  Monite::SinglePaymentIntentResponse.from_json(json_object: item)
end
      payment_method = parsed_json["payment_method"]
      status = parsed_json["status"]
      total_amount = parsed_json["total_amount"]
      new(
        id: id,
        created_at: created_at,
        error: error,
        payer_bank_account_id: payer_bank_account_id,
        payment_intents: payment_intents,
        payment_method: payment_method,
        status: status,
        total_amount: total_amount,
        additional_properties: struct
      )
    end
# Serialize an instance of PaymentsBatchPaymentResponse to a JSON object
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
      obj.created_at.is_a?(DateTime) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
      obj.error&.is_a?(Hash) != false || raise("Passed value for field obj.error is not the expected type, validation failed.")
      obj.payer_bank_account_id.is_a?(String) != false || raise("Passed value for field obj.payer_bank_account_id is not the expected type, validation failed.")
      obj.payment_intents.is_a?(Array) != false || raise("Passed value for field obj.payment_intents is not the expected type, validation failed.")
      obj.payment_method.is_a?(String) != false || raise("Passed value for field obj.payment_method is not the expected type, validation failed.")
      obj.status.is_a?(Monite::PaymentsBatchPaymentStatus) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
      obj.total_amount&.is_a?(Integer) != false || raise("Passed value for field obj.total_amount is not the expected type, validation failed.")
    end
  end
end