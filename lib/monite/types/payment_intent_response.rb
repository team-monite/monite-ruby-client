# frozen_string_literal: true
require "date"
require_relative "invoice"
require_relative "payment_object"
require_relative "payer_account_response"
require_relative "monite_all_payment_methods_types"
require_relative "recipient_account_response"
require "ostruct"
require "json"

module Monite
  class PaymentIntentResponse
  # @return [String] 
    attr_reader :id
  # @return [DateTime] 
    attr_reader :updated_at
  # @return [Integer] 
    attr_reader :amount
  # @return [Integer] 
    attr_reader :application_fee_amount
  # @return [String] 
    attr_reader :batch_payment_id
  # @return [String] 
    attr_reader :currency
  # @return [Monite::Invoice] 
    attr_reader :invoice
  # @return [Monite::PaymentObject] 
    attr_reader :object
  # @return [Monite::PayerAccountResponse] 
    attr_reader :payer
  # @return [String] 
    attr_reader :payment_link_id
  # @return [Array<Monite::MoniteAllPaymentMethodsTypes>] 
    attr_reader :payment_methods
  # @return [String] 
    attr_reader :payment_reference
  # @return [String] 
    attr_reader :provider
  # @return [Monite::RecipientAccountResponse] 
    attr_reader :recipient
  # @return [Monite::MoniteAllPaymentMethodsTypes] 
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
    # @param amount [Integer] 
    # @param application_fee_amount [Integer] 
    # @param batch_payment_id [String] 
    # @param currency [String] 
    # @param invoice [Monite::Invoice] 
    # @param object [Monite::PaymentObject] 
    # @param payer [Monite::PayerAccountResponse] 
    # @param payment_link_id [String] 
    # @param payment_methods [Array<Monite::MoniteAllPaymentMethodsTypes>] 
    # @param payment_reference [String] 
    # @param provider [String] 
    # @param recipient [Monite::RecipientAccountResponse] 
    # @param selected_payment_method [Monite::MoniteAllPaymentMethodsTypes] 
    # @param status [String] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::PaymentIntentResponse]
    def initialize(id:, updated_at:, amount:, application_fee_amount: OMIT, batch_payment_id: OMIT, currency:, invoice: OMIT, object: OMIT, payer: OMIT, payment_link_id: OMIT, payment_methods:, payment_reference: OMIT, provider: OMIT, recipient:, selected_payment_method: OMIT, status:, additional_properties: nil)
      @id = id
      @updated_at = updated_at
      @amount = amount
      @application_fee_amount = application_fee_amount if application_fee_amount != OMIT
      @batch_payment_id = batch_payment_id if batch_payment_id != OMIT
      @currency = currency
      @invoice = invoice if invoice != OMIT
      @object = object if object != OMIT
      @payer = payer if payer != OMIT
      @payment_link_id = payment_link_id if payment_link_id != OMIT
      @payment_methods = payment_methods
      @payment_reference = payment_reference if payment_reference != OMIT
      @provider = provider if provider != OMIT
      @recipient = recipient
      @selected_payment_method = selected_payment_method if selected_payment_method != OMIT
      @status = status
      @additional_properties = additional_properties
      @_field_set = { "id": id, "updated_at": updated_at, "amount": amount, "application_fee_amount": application_fee_amount, "batch_payment_id": batch_payment_id, "currency": currency, "invoice": invoice, "object": object, "payer": payer, "payment_link_id": payment_link_id, "payment_methods": payment_methods, "payment_reference": payment_reference, "provider": provider, "recipient": recipient, "selected_payment_method": selected_payment_method, "status": status }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of PaymentIntentResponse
    #
    # @param json_object [String] 
    # @return [Monite::PaymentIntentResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      updated_at = unless parsed_json["updated_at"].nil?
  DateTime.parse(parsed_json["updated_at"])
else
  nil
end
      amount = parsed_json["amount"]
      application_fee_amount = parsed_json["application_fee_amount"]
      batch_payment_id = parsed_json["batch_payment_id"]
      currency = parsed_json["currency"]
      unless parsed_json["invoice"].nil?
        invoice = parsed_json["invoice"].to_json
        invoice = Monite::Invoice.from_json(json_object: invoice)
      else
        invoice = nil
      end
      unless parsed_json["object"].nil?
        object = parsed_json["object"].to_json
        object = Monite::PaymentObject.from_json(json_object: object)
      else
        object = nil
      end
      unless parsed_json["payer"].nil?
        payer = parsed_json["payer"].to_json
        payer = Monite::PayerAccountResponse.from_json(json_object: payer)
      else
        payer = nil
      end
      payment_link_id = parsed_json["payment_link_id"]
      payment_methods = parsed_json["payment_methods"]
      payment_reference = parsed_json["payment_reference"]
      provider = parsed_json["provider"]
      unless parsed_json["recipient"].nil?
        recipient = parsed_json["recipient"].to_json
        recipient = Monite::RecipientAccountResponse.from_json(json_object: recipient)
      else
        recipient = nil
      end
      selected_payment_method = parsed_json["selected_payment_method"]
      status = parsed_json["status"]
      new(
        id: id,
        updated_at: updated_at,
        amount: amount,
        application_fee_amount: application_fee_amount,
        batch_payment_id: batch_payment_id,
        currency: currency,
        invoice: invoice,
        object: object,
        payer: payer,
        payment_link_id: payment_link_id,
        payment_methods: payment_methods,
        payment_reference: payment_reference,
        provider: provider,
        recipient: recipient,
        selected_payment_method: selected_payment_method,
        status: status,
        additional_properties: struct
      )
    end
# Serialize an instance of PaymentIntentResponse to a JSON object
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
      obj.amount.is_a?(Integer) != false || raise("Passed value for field obj.amount is not the expected type, validation failed.")
      obj.application_fee_amount&.is_a?(Integer) != false || raise("Passed value for field obj.application_fee_amount is not the expected type, validation failed.")
      obj.batch_payment_id&.is_a?(String) != false || raise("Passed value for field obj.batch_payment_id is not the expected type, validation failed.")
      obj.currency.is_a?(String) != false || raise("Passed value for field obj.currency is not the expected type, validation failed.")
      obj.invoice.nil? || Monite::Invoice.validate_raw(obj: obj.invoice)
      obj.object.nil? || Monite::PaymentObject.validate_raw(obj: obj.object)
      obj.payer.nil? || Monite::PayerAccountResponse.validate_raw(obj: obj.payer)
      obj.payment_link_id&.is_a?(String) != false || raise("Passed value for field obj.payment_link_id is not the expected type, validation failed.")
      obj.payment_methods.is_a?(Array) != false || raise("Passed value for field obj.payment_methods is not the expected type, validation failed.")
      obj.payment_reference&.is_a?(String) != false || raise("Passed value for field obj.payment_reference is not the expected type, validation failed.")
      obj.provider&.is_a?(String) != false || raise("Passed value for field obj.provider is not the expected type, validation failed.")
      Monite::RecipientAccountResponse.validate_raw(obj: obj.recipient)
      obj.selected_payment_method&.is_a?(Monite::MoniteAllPaymentMethodsTypes) != false || raise("Passed value for field obj.selected_payment_method is not the expected type, validation failed.")
      obj.status.is_a?(String) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
    end
  end
end