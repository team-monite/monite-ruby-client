# frozen_string_literal: true
require_relative "allowed_countries"
require "ostruct"
require "json"

module Monite
  class LineItemProductVatRate
  # @return [String] Unique identifier of the vat rate object.
    attr_reader :id
  # @return [Monite::AllowedCountries] Two-letter ISO country code ([ISO 3166-1
#  alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2)).
    attr_reader :country
  # @return [Integer] Percent minor units. Example: 12.5% is 1250.
    attr_reader :value
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] Unique identifier of the vat rate object.
    # @param country [Monite::AllowedCountries] Two-letter ISO country code ([ISO 3166-1
#  alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2)).
    # @param value [Integer] Percent minor units. Example: 12.5% is 1250.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::LineItemProductVatRate]
    def initialize(id: OMIT, country:, value:, additional_properties: nil)
      @id = id if id != OMIT
      @country = country
      @value = value
      @additional_properties = additional_properties
      @_field_set = { "id": id, "country": country, "value": value }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of LineItemProductVatRate
    #
    # @param json_object [String] 
    # @return [Monite::LineItemProductVatRate]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      country = parsed_json["country"]
      value = parsed_json["value"]
      new(
        id: id,
        country: country,
        value: value,
        additional_properties: struct
      )
    end
# Serialize an instance of LineItemProductVatRate to a JSON object
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
      obj.id&.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
      obj.country.is_a?(Monite::AllowedCountries) != false || raise("Passed value for field obj.country is not the expected type, validation failed.")
      obj.value.is_a?(Integer) != false || raise("Passed value for field obj.value is not the expected type, validation failed.")
    end
  end
end