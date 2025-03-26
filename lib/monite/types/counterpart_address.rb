# frozen_string_literal: true
require_relative "allowed_countries"
require "ostruct"
require "json"

module Monite
# Address information.
  class CounterpartAddress
  # @return [String] City name.
    attr_reader :city
  # @return [Monite::AllowedCountries] Two-letter ISO country code ([ISO 3166-1
#  alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2)).
    attr_reader :country
  # @return [String] Street address.
    attr_reader :line_1
  # @return [String] Additional address information (if any).
    attr_reader :line_2
  # @return [String] ZIP or postal code.
    attr_reader :postal_code
  # @return [String] State, region, province, or county.
    attr_reader :state
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param city [String] City name.
    # @param country [Monite::AllowedCountries] Two-letter ISO country code ([ISO 3166-1
#  alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2)).
    # @param line_1 [String] Street address.
    # @param line_2 [String] Additional address information (if any).
    # @param postal_code [String] ZIP or postal code.
    # @param state [String] State, region, province, or county.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::CounterpartAddress]
    def initialize(city:, country:, line_1:, line_2: OMIT, postal_code:, state: OMIT, additional_properties: nil)
      @city = city
      @country = country
      @line_1 = line_1
      @line_2 = line_2 if line_2 != OMIT
      @postal_code = postal_code
      @state = state if state != OMIT
      @additional_properties = additional_properties
      @_field_set = { "city": city, "country": country, "line1": line_1, "line2": line_2, "postal_code": postal_code, "state": state }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of CounterpartAddress
    #
    # @param json_object [String] 
    # @return [Monite::CounterpartAddress]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      city = parsed_json["city"]
      country = parsed_json["country"]
      line_1 = parsed_json["line1"]
      line_2 = parsed_json["line2"]
      postal_code = parsed_json["postal_code"]
      state = parsed_json["state"]
      new(
        city: city,
        country: country,
        line_1: line_1,
        line_2: line_2,
        postal_code: postal_code,
        state: state,
        additional_properties: struct
      )
    end
# Serialize an instance of CounterpartAddress to a JSON object
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
      obj.city.is_a?(String) != false || raise("Passed value for field obj.city is not the expected type, validation failed.")
      obj.country.is_a?(Monite::AllowedCountries) != false || raise("Passed value for field obj.country is not the expected type, validation failed.")
      obj.line_1.is_a?(String) != false || raise("Passed value for field obj.line_1 is not the expected type, validation failed.")
      obj.line_2&.is_a?(String) != false || raise("Passed value for field obj.line_2 is not the expected type, validation failed.")
      obj.postal_code.is_a?(String) != false || raise("Passed value for field obj.postal_code is not the expected type, validation failed.")
      obj.state&.is_a?(String) != false || raise("Passed value for field obj.state is not the expected type, validation failed.")
    end
  end
end