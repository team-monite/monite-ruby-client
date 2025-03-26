# frozen_string_literal: true
require "ostruct"
require "json"

module Monite
  class DocumentTypePrefix
  # @return [String] 
    attr_reader :credit_note
  # @return [String] 
    attr_reader :invoice
  # @return [String] 
    attr_reader :purchase_order
  # @return [String] 
    attr_reader :quote
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param credit_note [String] 
    # @param invoice [String] 
    # @param purchase_order [String] 
    # @param quote [String] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::DocumentTypePrefix]
    def initialize(credit_note: OMIT, invoice: OMIT, purchase_order: OMIT, quote: OMIT, additional_properties: nil)
      @credit_note = credit_note if credit_note != OMIT
      @invoice = invoice if invoice != OMIT
      @purchase_order = purchase_order if purchase_order != OMIT
      @quote = quote if quote != OMIT
      @additional_properties = additional_properties
      @_field_set = { "credit_note": credit_note, "invoice": invoice, "purchase_order": purchase_order, "quote": quote }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of DocumentTypePrefix
    #
    # @param json_object [String] 
    # @return [Monite::DocumentTypePrefix]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      credit_note = parsed_json["credit_note"]
      invoice = parsed_json["invoice"]
      purchase_order = parsed_json["purchase_order"]
      quote = parsed_json["quote"]
      new(
        credit_note: credit_note,
        invoice: invoice,
        purchase_order: purchase_order,
        quote: quote,
        additional_properties: struct
      )
    end
# Serialize an instance of DocumentTypePrefix to a JSON object
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
      obj.credit_note&.is_a?(String) != false || raise("Passed value for field obj.credit_note is not the expected type, validation failed.")
      obj.invoice&.is_a?(String) != false || raise("Passed value for field obj.invoice is not the expected type, validation failed.")
      obj.purchase_order&.is_a?(String) != false || raise("Passed value for field obj.purchase_order is not the expected type, validation failed.")
      obj.quote&.is_a?(String) != false || raise("Passed value for field obj.quote is not the expected type, validation failed.")
    end
  end
end