# frozen_string_literal: true
require "date"
require_relative "currency_enum"
require_relative "payment_object_payable"
require_relative "payment_intents_recipient"
require "ostruct"
require "json"

module Monite
  class SinglePaymentIntentResponse
  # @return [String] 
    attr_reader :id
  # @return [DateTime] 
    attr_reader :created_at
  # @return [Integer] 
    attr_reader :amount
  # @return [Monite::CurrencyEnum] 
    attr_reader :currency
  # @return [Hash{String => Object}] 
    attr_reader :error
  # @return [Monite::PaymentObjectPayable] 
    attr_reader :object
  # @return [String] 
    attr_reader :payment_reference
  # @return [Monite::PaymentIntentsRecipient] 
    attr_reader :recipient
  # @return [String] 
    attr_reader :status
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] 
    # @param created_at [DateTime] 
    # @param amount [Integer] 
    # @param currency [Monite::CurrencyEnum] 
    # @param error [Hash{String => Object}] 
    # @param object [Monite::PaymentObjectPayable] 
    # @param payment_reference [String] 
    # @param recipient [Monite::PaymentIntentsRecipient] 
    # @param status [String] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::SinglePaymentIntentResponse]
    def initialize(id:, created_at:, amount:, currency:, error: OMIT, object:, payment_reference:, recipient:, status:, additional_properties: nil)
      @id = id
      @created_at = created_at
      @amount = amount
      @currency = currency
      @error = error if error != OMIT
      @object = object
      @payment_reference = payment_reference
      @recipient = recipient
      @status = status
      @additional_properties = additional_properties
      @_field_set = { "id": id, "created_at": created_at, "amount": amount, "currency": currency, "error": error, "object": object, "payment_reference": payment_reference, "recipient": recipient, "status": status }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of SinglePaymentIntentResponse
    #
    # @param json_object [String] 
    # @return [Monite::SinglePaymentIntentResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      created_at = unless parsed_json["created_at"].nil?
  DateTime.parse(parsed_json["created_at"])
else
  nil
end
      amount = parsed_json["amount"]
      currency = parsed_json["currency"]
      error = parsed_json["error"]
      unless parsed_json["object"].nil?
        object = parsed_json["object"].to_json
        object = Monite::PaymentObjectPayable.from_json(json_object: object)
      else
        object = nil
      end
      payment_reference = parsed_json["payment_reference"]
      unless parsed_json["recipient"].nil?
        recipient = parsed_json["recipient"].to_json
        recipient = Monite::PaymentIntentsRecipient.from_json(json_object: recipient)
      else
        recipient = nil
      end
      status = parsed_json["status"]
      new(
        id: id,
        created_at: created_at,
        amount: amount,
        currency: currency,
        error: error,
        object: object,
        payment_reference: payment_reference,
        recipient: recipient,
        status: status,
        additional_properties: struct
      )
    end
# Serialize an instance of SinglePaymentIntentResponse to a JSON object
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
      obj.amount.is_a?(Integer) != false || raise("Passed value for field obj.amount is not the expected type, validation failed.")
      obj.currency.is_a?(Monite::CurrencyEnum) != false || raise("Passed value for field obj.currency is not the expected type, validation failed.")
      obj.error&.is_a?(Hash) != false || raise("Passed value for field obj.error is not the expected type, validation failed.")
      Monite::PaymentObjectPayable.validate_raw(obj: obj.object)
      obj.payment_reference.is_a?(String) != false || raise("Passed value for field obj.payment_reference is not the expected type, validation failed.")
      Monite::PaymentIntentsRecipient.validate_raw(obj: obj.recipient)
      obj.status.is_a?(String) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
    end
  end
end