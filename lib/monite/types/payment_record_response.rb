# frozen_string_literal: true
require_relative "currency_enum"
require_relative "payment_record_object_response"
require "date"
require "ostruct"
require "json"

module Monite
  class PaymentRecordResponse
  # @return [String] 
    attr_reader :id
  # @return [Integer] 
    attr_reader :amount
  # @return [Monite::CurrencyEnum] 
    attr_reader :currency
  # @return [String] 
    attr_reader :entity_user_id
  # @return [Boolean] 
    attr_reader :is_external
  # @return [Monite::PaymentRecordObjectResponse] 
    attr_reader :object
  # @return [Integer] Filled in a case, if payment amount is more, than total_amount
    attr_reader :overpaid_amount
  # @return [DateTime] 
    attr_reader :paid_at
  # @return [String] 
    attr_reader :payment_intent_id
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] 
    # @param amount [Integer] 
    # @param currency [Monite::CurrencyEnum] 
    # @param entity_user_id [String] 
    # @param is_external [Boolean] 
    # @param object [Monite::PaymentRecordObjectResponse] 
    # @param overpaid_amount [Integer] Filled in a case, if payment amount is more, than total_amount
    # @param paid_at [DateTime] 
    # @param payment_intent_id [String] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::PaymentRecordResponse]
    def initialize(id:, amount:, currency:, entity_user_id: OMIT, is_external:, object:, overpaid_amount: OMIT, paid_at:, payment_intent_id:, additional_properties: nil)
      @id = id
      @amount = amount
      @currency = currency
      @entity_user_id = entity_user_id if entity_user_id != OMIT
      @is_external = is_external
      @object = object
      @overpaid_amount = overpaid_amount if overpaid_amount != OMIT
      @paid_at = paid_at
      @payment_intent_id = payment_intent_id
      @additional_properties = additional_properties
      @_field_set = { "id": id, "amount": amount, "currency": currency, "entity_user_id": entity_user_id, "is_external": is_external, "object": object, "overpaid_amount": overpaid_amount, "paid_at": paid_at, "payment_intent_id": payment_intent_id }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of PaymentRecordResponse
    #
    # @param json_object [String] 
    # @return [Monite::PaymentRecordResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      amount = parsed_json["amount"]
      currency = parsed_json["currency"]
      entity_user_id = parsed_json["entity_user_id"]
      is_external = parsed_json["is_external"]
      unless parsed_json["object"].nil?
        object = parsed_json["object"].to_json
        object = Monite::PaymentRecordObjectResponse.from_json(json_object: object)
      else
        object = nil
      end
      overpaid_amount = parsed_json["overpaid_amount"]
      paid_at = unless parsed_json["paid_at"].nil?
  DateTime.parse(parsed_json["paid_at"])
else
  nil
end
      payment_intent_id = parsed_json["payment_intent_id"]
      new(
        id: id,
        amount: amount,
        currency: currency,
        entity_user_id: entity_user_id,
        is_external: is_external,
        object: object,
        overpaid_amount: overpaid_amount,
        paid_at: paid_at,
        payment_intent_id: payment_intent_id,
        additional_properties: struct
      )
    end
# Serialize an instance of PaymentRecordResponse to a JSON object
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
      obj.amount.is_a?(Integer) != false || raise("Passed value for field obj.amount is not the expected type, validation failed.")
      obj.currency.is_a?(Monite::CurrencyEnum) != false || raise("Passed value for field obj.currency is not the expected type, validation failed.")
      obj.entity_user_id&.is_a?(String) != false || raise("Passed value for field obj.entity_user_id is not the expected type, validation failed.")
      obj.is_external.is_a?(Boolean) != false || raise("Passed value for field obj.is_external is not the expected type, validation failed.")
      Monite::PaymentRecordObjectResponse.validate_raw(obj: obj.object)
      obj.overpaid_amount&.is_a?(Integer) != false || raise("Passed value for field obj.overpaid_amount is not the expected type, validation failed.")
      obj.paid_at.is_a?(DateTime) != false || raise("Passed value for field obj.paid_at is not the expected type, validation failed.")
      obj.payment_intent_id.is_a?(String) != false || raise("Passed value for field obj.payment_intent_id is not the expected type, validation failed.")
    end
  end
end