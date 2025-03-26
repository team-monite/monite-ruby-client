# frozen_string_literal: true
require "ostruct"
require "json"

module Monite
  class PayableCreditNoteData
  # @return [String] The unique identifier of the credit note.
    attr_reader :id
  # @return [String] The credit note's unique document number.
    attr_reader :document_id
  # @return [String] The date when the credit note was issued, in the YYYY-MM-DD format
    attr_reader :issued_at
  # @return [String] The current status of the credit note in its lifecycle
    attr_reader :status
  # @return [Integer] Credit note total amount.
    attr_reader :total_amount
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] The unique identifier of the credit note.
    # @param document_id [String] The credit note's unique document number.
    # @param issued_at [String] The date when the credit note was issued, in the YYYY-MM-DD format
    # @param status [String] The current status of the credit note in its lifecycle
    # @param total_amount [Integer] Credit note total amount.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::PayableCreditNoteData]
    def initialize(id:, document_id: OMIT, issued_at: OMIT, status:, total_amount: OMIT, additional_properties: nil)
      @id = id
      @document_id = document_id if document_id != OMIT
      @issued_at = issued_at if issued_at != OMIT
      @status = status
      @total_amount = total_amount if total_amount != OMIT
      @additional_properties = additional_properties
      @_field_set = { "id": id, "document_id": document_id, "issued_at": issued_at, "status": status, "total_amount": total_amount }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of PayableCreditNoteData
    #
    # @param json_object [String] 
    # @return [Monite::PayableCreditNoteData]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      document_id = parsed_json["document_id"]
      issued_at = parsed_json["issued_at"]
      status = parsed_json["status"]
      total_amount = parsed_json["total_amount"]
      new(
        id: id,
        document_id: document_id,
        issued_at: issued_at,
        status: status,
        total_amount: total_amount,
        additional_properties: struct
      )
    end
# Serialize an instance of PayableCreditNoteData to a JSON object
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
      obj.document_id&.is_a?(String) != false || raise("Passed value for field obj.document_id is not the expected type, validation failed.")
      obj.issued_at&.is_a?(String) != false || raise("Passed value for field obj.issued_at is not the expected type, validation failed.")
      obj.status.is_a?(String) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
      obj.total_amount&.is_a?(Integer) != false || raise("Passed value for field obj.total_amount is not the expected type, validation failed.")
    end
  end
end