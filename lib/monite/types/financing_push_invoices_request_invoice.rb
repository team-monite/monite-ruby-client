# frozen_string_literal: true
require_relative "financing_invoice_type"
require "ostruct"
require "json"

module Monite
  class FinancingPushInvoicesRequestInvoice
  # @return [String] The invoice ID.
    attr_reader :id
  # @return [Monite::FinancingInvoiceType] The invoice type.
    attr_reader :type
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] The invoice ID.
    # @param type [Monite::FinancingInvoiceType] The invoice type.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::FinancingPushInvoicesRequestInvoice]
    def initialize(id:, type:, additional_properties: nil)
      @id = id
      @type = type
      @additional_properties = additional_properties
      @_field_set = { "id": id, "type": type }
    end
# Deserialize a JSON object to an instance of FinancingPushInvoicesRequestInvoice
    #
    # @param json_object [String] 
    # @return [Monite::FinancingPushInvoicesRequestInvoice]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      type = parsed_json["type"]
      new(
        id: id,
        type: type,
        additional_properties: struct
      )
    end
# Serialize an instance of FinancingPushInvoicesRequestInvoice to a JSON object
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
      obj.type.is_a?(Monite::FinancingInvoiceType) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
    end
  end
end