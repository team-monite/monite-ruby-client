# frozen_string_literal: true
require_relative "update_quote"
require "ostruct"
require "json"

module Monite
  class UpdateQuotePayload
  # @return [Monite::UpdateQuote] 
    attr_reader :quote
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param quote [Monite::UpdateQuote] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::UpdateQuotePayload]
    def initialize(quote:, additional_properties: nil)
      @quote = quote
      @additional_properties = additional_properties
      @_field_set = { "quote": quote }
    end
# Deserialize a JSON object to an instance of UpdateQuotePayload
    #
    # @param json_object [String] 
    # @return [Monite::UpdateQuotePayload]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["quote"].nil?
        quote = parsed_json["quote"].to_json
        quote = Monite::UpdateQuote.from_json(json_object: quote)
      else
        quote = nil
      end
      new(quote: quote, additional_properties: struct)
    end
# Serialize an instance of UpdateQuotePayload to a JSON object
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
      Monite::UpdateQuote.validate_raw(obj: obj.quote)
    end
  end
end