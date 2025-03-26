# frozen_string_literal: true
require "ostruct"
require "json"

module Monite
  class RelatedDocuments
  # @return [Array<String>] 
    attr_reader :credit_note_ids
  # @return [String] 
    attr_reader :proforma_invoice_id
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param credit_note_ids [Array<String>] 
    # @param proforma_invoice_id [String] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::RelatedDocuments]
    def initialize(credit_note_ids: OMIT, proforma_invoice_id: OMIT, additional_properties: nil)
      @credit_note_ids = credit_note_ids if credit_note_ids != OMIT
      @proforma_invoice_id = proforma_invoice_id if proforma_invoice_id != OMIT
      @additional_properties = additional_properties
      @_field_set = { "credit_note_ids": credit_note_ids, "proforma_invoice_id": proforma_invoice_id }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of RelatedDocuments
    #
    # @param json_object [String] 
    # @return [Monite::RelatedDocuments]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      credit_note_ids = parsed_json["credit_note_ids"]
      proforma_invoice_id = parsed_json["proforma_invoice_id"]
      new(
        credit_note_ids: credit_note_ids,
        proforma_invoice_id: proforma_invoice_id,
        additional_properties: struct
      )
    end
# Serialize an instance of RelatedDocuments to a JSON object
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
      obj.credit_note_ids&.is_a?(Array) != false || raise("Passed value for field obj.credit_note_ids is not the expected type, validation failed.")
      obj.proforma_invoice_id&.is_a?(String) != false || raise("Passed value for field obj.proforma_invoice_id is not the expected type, validation failed.")
    end
  end
end