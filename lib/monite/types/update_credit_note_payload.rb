# frozen_string_literal: true
require_relative "update_credit_note"
require "ostruct"
require "json"

module Monite
  class UpdateCreditNotePayload
  # @return [Monite::UpdateCreditNote] 
    attr_reader :credit_note
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param credit_note [Monite::UpdateCreditNote] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::UpdateCreditNotePayload]
    def initialize(credit_note:, additional_properties: nil)
      @credit_note = credit_note
      @additional_properties = additional_properties
      @_field_set = { "credit_note": credit_note }
    end
# Deserialize a JSON object to an instance of UpdateCreditNotePayload
    #
    # @param json_object [String] 
    # @return [Monite::UpdateCreditNotePayload]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["credit_note"].nil?
        credit_note = parsed_json["credit_note"].to_json
        credit_note = Monite::UpdateCreditNote.from_json(json_object: credit_note)
      else
        credit_note = nil
      end
      new(credit_note: credit_note, additional_properties: struct)
    end
# Serialize an instance of UpdateCreditNotePayload to a JSON object
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
      Monite::UpdateCreditNote.validate_raw(obj: obj.credit_note)
    end
  end
end