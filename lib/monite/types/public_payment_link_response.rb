# frozen_string_literal: true
require_relative "currency_enum"
require "date"
require_relative "invoice"
require_relative "payer_account_response"
require_relative "payment_intent"
require_relative "recipient_account_response"
require "ostruct"
require "json"

module Monite
  class PublicPaymentLinkResponse
  # @return [String] 
    attr_reader :id
  # @return [Integer] 
    attr_reader :amount
  # @return [Monite::CurrencyEnum] 
    attr_reader :currency
  # @return [DateTime] 
    attr_reader :expires_at
  # @return [Monite::Invoice] 
    attr_reader :invoice
  # @return [Monite::PayerAccountResponse] 
    attr_reader :payer
  # @return [Monite::PaymentIntent] 
    attr_reader :payment_intent
  # @return [String] 
    attr_reader :payment_intent_id
  # @return [Array<String>] 
    attr_reader :payment_methods
  # @return [String] 
    attr_reader :payment_page_url
  # @return [String] 
    attr_reader :payment_reference
  # @return [Monite::RecipientAccountResponse] 
    attr_reader :recipient
  # @return [String] The URL where to redirect the payer after the payment. If `return_url` is
#  specified, then after the payment is completed the payment page will display the
#  "Return to platform" link that navigates to this URL.
    attr_reader :return_url
  # @return [String] 
    attr_reader :status
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] 
    # @param amount [Integer] 
    # @param currency [Monite::CurrencyEnum] 
    # @param expires_at [DateTime] 
    # @param invoice [Monite::Invoice] 
    # @param payer [Monite::PayerAccountResponse] 
    # @param payment_intent [Monite::PaymentIntent] 
    # @param payment_intent_id [String] 
    # @param payment_methods [Array<String>] 
    # @param payment_page_url [String] 
    # @param payment_reference [String] 
    # @param recipient [Monite::RecipientAccountResponse] 
    # @param return_url [String] The URL where to redirect the payer after the payment. If `return_url` is
#  specified, then after the payment is completed the payment page will display the
#  "Return to platform" link that navigates to this URL.
    # @param status [String] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::PublicPaymentLinkResponse]
    def initialize(id:, amount:, currency:, expires_at:, invoice: OMIT, payer: OMIT, payment_intent: OMIT, payment_intent_id:, payment_methods:, payment_page_url:, payment_reference: OMIT, recipient:, return_url: OMIT, status:, additional_properties: nil)
      @id = id
      @amount = amount
      @currency = currency
      @expires_at = expires_at
      @invoice = invoice if invoice != OMIT
      @payer = payer if payer != OMIT
      @payment_intent = payment_intent if payment_intent != OMIT
      @payment_intent_id = payment_intent_id
      @payment_methods = payment_methods
      @payment_page_url = payment_page_url
      @payment_reference = payment_reference if payment_reference != OMIT
      @recipient = recipient
      @return_url = return_url if return_url != OMIT
      @status = status
      @additional_properties = additional_properties
      @_field_set = { "id": id, "amount": amount, "currency": currency, "expires_at": expires_at, "invoice": invoice, "payer": payer, "payment_intent": payment_intent, "payment_intent_id": payment_intent_id, "payment_methods": payment_methods, "payment_page_url": payment_page_url, "payment_reference": payment_reference, "recipient": recipient, "return_url": return_url, "status": status }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of PublicPaymentLinkResponse
    #
    # @param json_object [String] 
    # @return [Monite::PublicPaymentLinkResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      amount = parsed_json["amount"]
      currency = parsed_json["currency"]
      expires_at = unless parsed_json["expires_at"].nil?
  DateTime.parse(parsed_json["expires_at"])
else
  nil
end
      unless parsed_json["invoice"].nil?
        invoice = parsed_json["invoice"].to_json
        invoice = Monite::Invoice.from_json(json_object: invoice)
      else
        invoice = nil
      end
      unless parsed_json["payer"].nil?
        payer = parsed_json["payer"].to_json
        payer = Monite::PayerAccountResponse.from_json(json_object: payer)
      else
        payer = nil
      end
      unless parsed_json["payment_intent"].nil?
        payment_intent = parsed_json["payment_intent"].to_json
        payment_intent = Monite::PaymentIntent.from_json(json_object: payment_intent)
      else
        payment_intent = nil
      end
      payment_intent_id = parsed_json["payment_intent_id"]
      payment_methods = parsed_json["payment_methods"]
      payment_page_url = parsed_json["payment_page_url"]
      payment_reference = parsed_json["payment_reference"]
      unless parsed_json["recipient"].nil?
        recipient = parsed_json["recipient"].to_json
        recipient = Monite::RecipientAccountResponse.from_json(json_object: recipient)
      else
        recipient = nil
      end
      return_url = parsed_json["return_url"]
      status = parsed_json["status"]
      new(
        id: id,
        amount: amount,
        currency: currency,
        expires_at: expires_at,
        invoice: invoice,
        payer: payer,
        payment_intent: payment_intent,
        payment_intent_id: payment_intent_id,
        payment_methods: payment_methods,
        payment_page_url: payment_page_url,
        payment_reference: payment_reference,
        recipient: recipient,
        return_url: return_url,
        status: status,
        additional_properties: struct
      )
    end
# Serialize an instance of PublicPaymentLinkResponse to a JSON object
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
      obj.expires_at.is_a?(DateTime) != false || raise("Passed value for field obj.expires_at is not the expected type, validation failed.")
      obj.invoice.nil? || Monite::Invoice.validate_raw(obj: obj.invoice)
      obj.payer.nil? || Monite::PayerAccountResponse.validate_raw(obj: obj.payer)
      obj.payment_intent.nil? || Monite::PaymentIntent.validate_raw(obj: obj.payment_intent)
      obj.payment_intent_id.is_a?(String) != false || raise("Passed value for field obj.payment_intent_id is not the expected type, validation failed.")
      obj.payment_methods.is_a?(Array) != false || raise("Passed value for field obj.payment_methods is not the expected type, validation failed.")
      obj.payment_page_url.is_a?(String) != false || raise("Passed value for field obj.payment_page_url is not the expected type, validation failed.")
      obj.payment_reference&.is_a?(String) != false || raise("Passed value for field obj.payment_reference is not the expected type, validation failed.")
      Monite::RecipientAccountResponse.validate_raw(obj: obj.recipient)
      obj.return_url&.is_a?(String) != false || raise("Passed value for field obj.return_url is not the expected type, validation failed.")
      obj.status.is_a?(String) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
    end
  end
end