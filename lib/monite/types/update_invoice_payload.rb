# frozen_string_literal: true
require_relative "update_invoice"
require "ostruct"
require "json"

module Monite
  class UpdateInvoicePayload
  # @return [Monite::UpdateInvoice] 
    attr_reader :invoice
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param invoice [Monite::UpdateInvoice] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::UpdateInvoicePayload]
    def initialize(invoice:, additional_properties: nil)
      @invoice = invoice
      @additional_properties = additional_properties
      @_field_set = { "invoice": invoice }
    end
# Deserialize a JSON object to an instance of UpdateInvoicePayload
    #
    # @param json_object [String] 
    # @return [Monite::UpdateInvoicePayload]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["invoice"].nil?
        invoice = parsed_json["invoice"].to_json
        invoice = Monite::UpdateInvoice.from_json(json_object: invoice)
      else
        invoice = nil
      end
      new(invoice: invoice, additional_properties: struct)
    end
# Serialize an instance of UpdateInvoicePayload to a JSON object
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
      Monite::UpdateInvoice.validate_raw(obj: obj.invoice)
    end
  end
end