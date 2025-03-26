# frozen_string_literal: true
require "date"
require_relative "payment_object"
require "ostruct"
require "json"

module Monite
  class PaymentIntent
  # @return [String] 
    attr_reader :id
  # @return [DateTime] 
    attr_reader :updated_at
  # @return [Integer] 
    attr_reader :application_fee_amount
  # @return [Monite::PaymentObject] 
    attr_reader :object
  # @return [String] 
    attr_reader :provider
  # @return [String] 
    attr_reader :selected_payment_method
  # @return [String] 
    attr_reader :status
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] 
    # @param updated_at [DateTime] 
    # @param application_fee_amount [Integer] 
    # @param object [Monite::PaymentObject] 
    # @param provider [String] 
    # @param selected_payment_method [String] 
    # @param status [String] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::PaymentIntent]
    def initialize(id:, updated_at:, application_fee_amount: OMIT, object: OMIT, provider: OMIT, selected_payment_method: OMIT, status:, additional_properties: nil)
      @id = id
      @updated_at = updated_at
      @application_fee_amount = application_fee_amount if application_fee_amount != OMIT
      @object = object if object != OMIT
      @provider = provider if provider != OMIT
      @selected_payment_method = selected_payment_method if selected_payment_method != OMIT
      @status = status
      @additional_properties = additional_properties
      @_field_set = { "id": id, "updated_at": updated_at, "application_fee_amount": application_fee_amount, "object": object, "provider": provider, "selected_payment_method": selected_payment_method, "status": status }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of PaymentIntent
    #
    # @param json_object [String] 
    # @return [Monite::PaymentIntent]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      updated_at = unless parsed_json["updated_at"].nil?
  DateTime.parse(parsed_json["updated_at"])
else
  nil
end
      application_fee_amount = parsed_json["application_fee_amount"]
      unless parsed_json["object"].nil?
        object = parsed_json["object"].to_json
        object = Monite::PaymentObject.from_json(json_object: object)
      else
        object = nil
      end
      provider = parsed_json["provider"]
      selected_payment_method = parsed_json["selected_payment_method"]
      status = parsed_json["status"]
      new(
        id: id,
        updated_at: updated_at,
        application_fee_amount: application_fee_amount,
        object: object,
        provider: provider,
        selected_payment_method: selected_payment_method,
        status: status,
        additional_properties: struct
      )
    end
# Serialize an instance of PaymentIntent to a JSON object
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
      obj.updated_at.is_a?(DateTime) != false || raise("Passed value for field obj.updated_at is not the expected type, validation failed.")
      obj.application_fee_amount&.is_a?(Integer) != false || raise("Passed value for field obj.application_fee_amount is not the expected type, validation failed.")
      obj.object.nil? || Monite::PaymentObject.validate_raw(obj: obj.object)
      obj.provider&.is_a?(String) != false || raise("Passed value for field obj.provider is not the expected type, validation failed.")
      obj.selected_payment_method&.is_a?(String) != false || raise("Passed value for field obj.selected_payment_method is not the expected type, validation failed.")
      obj.status.is_a?(String) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
    end
  end
end