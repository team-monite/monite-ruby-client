# frozen_string_literal: true
require_relative "credit_note_response"
require "ostruct"
require "json"

module Monite
# A paginated list of credit notes.
  class CreditNotePaginationResponse
  # @return [Array<Monite::CreditNoteResponse>] List of credit notes for the current page
    attr_reader :data
  # @return [String] Token to retrieve the next page of results
    attr_reader :next_pagination_token
  # @return [String] Token to retrieve the previous page of results
    attr_reader :prev_pagination_token
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param data [Array<Monite::CreditNoteResponse>] List of credit notes for the current page
    # @param next_pagination_token [String] Token to retrieve the next page of results
    # @param prev_pagination_token [String] Token to retrieve the previous page of results
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::CreditNotePaginationResponse]
    def initialize(data:, next_pagination_token: OMIT, prev_pagination_token: OMIT, additional_properties: nil)
      @data = data
      @next_pagination_token = next_pagination_token if next_pagination_token != OMIT
      @prev_pagination_token = prev_pagination_token if prev_pagination_token != OMIT
      @additional_properties = additional_properties
      @_field_set = { "data": data, "next_pagination_token": next_pagination_token, "prev_pagination_token": prev_pagination_token }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of CreditNotePaginationResponse
    #
    # @param json_object [String] 
    # @return [Monite::CreditNotePaginationResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      data = parsed_json["data"]&.map do | item |
  item = item.to_json
  Monite::CreditNoteResponse.from_json(json_object: item)
end
      next_pagination_token = parsed_json["next_pagination_token"]
      prev_pagination_token = parsed_json["prev_pagination_token"]
      new(
        data: data,
        next_pagination_token: next_pagination_token,
        prev_pagination_token: prev_pagination_token,
        additional_properties: struct
      )
    end
# Serialize an instance of CreditNotePaginationResponse to a JSON object
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
      obj.data.is_a?(Array) != false || raise("Passed value for field obj.data is not the expected type, validation failed.")
      obj.next_pagination_token&.is_a?(String) != false || raise("Passed value for field obj.next_pagination_token is not the expected type, validation failed.")
      obj.prev_pagination_token&.is_a?(String) != false || raise("Passed value for field obj.prev_pagination_token is not the expected type, validation failed.")
    end
  end
end