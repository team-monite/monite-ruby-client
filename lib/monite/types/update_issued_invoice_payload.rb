# frozen_string_literal: true
require_relative "update_issued_invoice"
require "ostruct"
require "json"

module Monite
  class UpdateIssuedInvoicePayload
  # @return [Monite::UpdateIssuedInvoice] 
    attr_reader :issued_invoice
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param issued_invoice [Monite::UpdateIssuedInvoice] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::UpdateIssuedInvoicePayload]
    def initialize(issued_invoice:, additional_properties: nil)
      @issued_invoice = issued_invoice
      @additional_properties = additional_properties
      @_field_set = { "issued_invoice": issued_invoice }
    end
# Deserialize a JSON object to an instance of UpdateIssuedInvoicePayload
    #
    # @param json_object [String] 
    # @return [Monite::UpdateIssuedInvoicePayload]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["issued_invoice"].nil?
        issued_invoice = parsed_json["issued_invoice"].to_json
        issued_invoice = Monite::UpdateIssuedInvoice.from_json(json_object: issued_invoice)
      else
        issued_invoice = nil
      end
      new(issued_invoice: issued_invoice, additional_properties: struct)
    end
# Serialize an instance of UpdateIssuedInvoicePayload to a JSON object
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
      Monite::UpdateIssuedInvoice.validate_raw(obj: obj.issued_invoice)
    end
  end
end