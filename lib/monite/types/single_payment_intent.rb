# frozen_string_literal: true
require_relative "payment_object_payable"
require_relative "payment_intents_recipient"
require "ostruct"
require "json"

module Monite
  class SinglePaymentIntent
  # @return [Monite::PaymentObjectPayable] 
    attr_reader :object
  # @return [String] Must be provided if payable's document id is missing.
    attr_reader :payment_reference
  # @return [Monite::PaymentIntentsRecipient] 
    attr_reader :recipient
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param object [Monite::PaymentObjectPayable] 
    # @param payment_reference [String] Must be provided if payable's document id is missing.
    # @param recipient [Monite::PaymentIntentsRecipient] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::SinglePaymentIntent]
    def initialize(object:, payment_reference: OMIT, recipient:, additional_properties: nil)
      @object = object
      @payment_reference = payment_reference if payment_reference != OMIT
      @recipient = recipient
      @additional_properties = additional_properties
      @_field_set = { "object": object, "payment_reference": payment_reference, "recipient": recipient }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of SinglePaymentIntent
    #
    # @param json_object [String] 
    # @return [Monite::SinglePaymentIntent]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
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
      new(
        object: object,
        payment_reference: payment_reference,
        recipient: recipient,
        additional_properties: struct
      )
    end
# Serialize an instance of SinglePaymentIntent to a JSON object
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
      Monite::PaymentObjectPayable.validate_raw(obj: obj.object)
      obj.payment_reference&.is_a?(String) != false || raise("Passed value for field obj.payment_reference is not the expected type, validation failed.")
      Monite::PaymentIntentsRecipient.validate_raw(obj: obj.recipient)
    end
  end
end