# frozen_string_literal: true
require "json"
require_relative "quote_response_payload"
require_relative "invoice_response_payload"
require_relative "credit_note_response_payload"

module Monite
  class ReceivableResponse
  # @return [Object] 
    attr_reader :member
  # @return [String] 
    attr_reader :discriminant

    private_class_method :new
    alias kind_of? is_a?

    # @param member [Object] 
    # @param discriminant [String] 
    # @return [Monite::ReceivableResponse]
    def initialize(member:, discriminant:)
      @member = member
      @discriminant = discriminant
    end
# Deserialize a JSON object to an instance of ReceivableResponse
    #
    # @param json_object [String] 
    # @return [Monite::ReceivableResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      case struct.type
      when "quote"
        member = Monite::QuoteResponsePayload.from_json(json_object: json_object)
      when "invoice"
        member = Monite::InvoiceResponsePayload.from_json(json_object: json_object)
      when "credit_note"
        member = Monite::CreditNoteResponsePayload.from_json(json_object: json_object)
      else
        member = Monite::QuoteResponsePayload.from_json(json_object: json_object)
      end
      new(member: member, discriminant: struct.type)
    end
# For Union Types, to_json functionality is delegated to the wrapped member.
    #
    # @return [String]
    def to_json
      case @discriminant
      when "quote"
        { **@member.to_json, type: @discriminant }.to_json
      when "invoice"
        { **@member.to_json, type: @discriminant }.to_json
      when "credit_note"
        { **@member.to_json, type: @discriminant }.to_json
      else
        { "type": @discriminant, value: @member }.to_json
      end
      @member.to_json
    end
# Leveraged for Union-type generation, validate_raw attempts to parse the given
#  hash and check each fields type against the current object's property
#  definitions.
    #
    # @param obj [Object] 
    # @return [Void]
    def self.validate_raw(obj:)
      case obj.type
      when "quote"
        Monite::QuoteResponsePayload.validate_raw(obj: obj)
      when "invoice"
        Monite::InvoiceResponsePayload.validate_raw(obj: obj)
      when "credit_note"
        Monite::CreditNoteResponsePayload.validate_raw(obj: obj)
      else
        raise("Passed value matched no type within the union, validation failed.")
      end
    end
# For Union Types, is_a? functionality is delegated to the wrapped member.
    #
    # @param obj [Object] 
    # @return [Boolean]
    def is_a?(obj)
      @member.is_a?(obj)
    end
    # @param member [Monite::QuoteResponsePayload] 
    # @return [Monite::ReceivableResponse]
    def self.quote(member:)
      new(member: member, discriminant: "quote")
    end
    # @param member [Monite::InvoiceResponsePayload] 
    # @return [Monite::ReceivableResponse]
    def self.invoice(member:)
      new(member: member, discriminant: "invoice")
    end
    # @param member [Monite::CreditNoteResponsePayload] 
    # @return [Monite::ReceivableResponse]
    def self.credit_note(member:)
      new(member: member, discriminant: "credit_note")
    end
  end
end