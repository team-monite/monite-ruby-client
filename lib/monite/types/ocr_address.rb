# frozen_string_literal: true
require "ostruct"
require "json"

module Monite
# In general it's compatible with CounterpartAddress model but
#  * All fields are optional
#  * There is an additional field original_country_name
  class OcrAddress
  # @return [String] Two-letter ISO country code ([ISO 3166-1
#  alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2)).
    attr_reader :country
  # @return [String] Country name as it is stated in the document.
    attr_reader :original_country_name
  # @return [String] City name.
    attr_reader :city
  # @return [String] ZIP or postal code.
    attr_reader :postal_code
  # @return [String] State, region, province, or county.
    attr_reader :state
  # @return [String] Street address.
    attr_reader :line_1
  # @return [String] Additional address information (if any).
    attr_reader :line_2
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param country [String] Two-letter ISO country code ([ISO 3166-1
#  alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2)).
    # @param original_country_name [String] Country name as it is stated in the document.
    # @param city [String] City name.
    # @param postal_code [String] ZIP or postal code.
    # @param state [String] State, region, province, or county.
    # @param line_1 [String] Street address.
    # @param line_2 [String] Additional address information (if any).
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::OcrAddress]
    def initialize(country: OMIT, original_country_name: OMIT, city: OMIT, postal_code: OMIT, state: OMIT, line_1: OMIT, line_2: OMIT, additional_properties: nil)
      @country = country if country != OMIT
      @original_country_name = original_country_name if original_country_name != OMIT
      @city = city if city != OMIT
      @postal_code = postal_code if postal_code != OMIT
      @state = state if state != OMIT
      @line_1 = line_1 if line_1 != OMIT
      @line_2 = line_2 if line_2 != OMIT
      @additional_properties = additional_properties
      @_field_set = { "country": country, "original_country_name": original_country_name, "city": city, "postal_code": postal_code, "state": state, "line1": line_1, "line2": line_2 }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of OcrAddress
    #
    # @param json_object [String] 
    # @return [Monite::OcrAddress]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      country = parsed_json["country"]
      original_country_name = parsed_json["original_country_name"]
      city = parsed_json["city"]
      postal_code = parsed_json["postal_code"]
      state = parsed_json["state"]
      line_1 = parsed_json["line1"]
      line_2 = parsed_json["line2"]
      new(
        country: country,
        original_country_name: original_country_name,
        city: city,
        postal_code: postal_code,
        state: state,
        line_1: line_1,
        line_2: line_2,
        additional_properties: struct
      )
    end
# Serialize an instance of OcrAddress to a JSON object
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
      obj.country&.is_a?(String) != false || raise("Passed value for field obj.country is not the expected type, validation failed.")
      obj.original_country_name&.is_a?(String) != false || raise("Passed value for field obj.original_country_name is not the expected type, validation failed.")
      obj.city&.is_a?(String) != false || raise("Passed value for field obj.city is not the expected type, validation failed.")
      obj.postal_code&.is_a?(String) != false || raise("Passed value for field obj.postal_code is not the expected type, validation failed.")
      obj.state&.is_a?(String) != false || raise("Passed value for field obj.state is not the expected type, validation failed.")
      obj.line_1&.is_a?(String) != false || raise("Passed value for field obj.line_1 is not the expected type, validation failed.")
      obj.line_2&.is_a?(String) != false || raise("Passed value for field obj.line_2 is not the expected type, validation failed.")
    end
  end
end