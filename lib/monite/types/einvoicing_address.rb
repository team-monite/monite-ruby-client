# frozen_string_literal: true
require_relative "allowed_einvoicing_country_codes"
require "ostruct"
require "json"

module Monite
  class EinvoicingAddress
  # @return [String] Street address line 1
    attr_reader :address_line_1
  # @return [String] Street address line 2
    attr_reader :address_line_2
  # @return [String] City name
    attr_reader :city
  # @return [Monite::AllowedEinvoicingCountryCodes] Country name
    attr_reader :country
  # @return [String] Postal/ZIP code
    attr_reader :postal_code
  # @return [String] State/Province/County
    attr_reader :state
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param address_line_1 [String] Street address line 1
    # @param address_line_2 [String] Street address line 2
    # @param city [String] City name
    # @param country [Monite::AllowedEinvoicingCountryCodes] Country name
    # @param postal_code [String] Postal/ZIP code
    # @param state [String] State/Province/County
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::EinvoicingAddress]
    def initialize(address_line_1:, address_line_2: OMIT, city:, country:, postal_code:, state: OMIT, additional_properties: nil)
      @address_line_1 = address_line_1
      @address_line_2 = address_line_2 if address_line_2 != OMIT
      @city = city
      @country = country
      @postal_code = postal_code
      @state = state if state != OMIT
      @additional_properties = additional_properties
      @_field_set = { "address_line1": address_line_1, "address_line2": address_line_2, "city": city, "country": country, "postal_code": postal_code, "state": state }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of EinvoicingAddress
    #
    # @param json_object [String] 
    # @return [Monite::EinvoicingAddress]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      address_line_1 = parsed_json["address_line1"]
      address_line_2 = parsed_json["address_line2"]
      city = parsed_json["city"]
      country = parsed_json["country"]
      postal_code = parsed_json["postal_code"]
      state = parsed_json["state"]
      new(
        address_line_1: address_line_1,
        address_line_2: address_line_2,
        city: city,
        country: country,
        postal_code: postal_code,
        state: state,
        additional_properties: struct
      )
    end
# Serialize an instance of EinvoicingAddress to a JSON object
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
      obj.address_line_1.is_a?(String) != false || raise("Passed value for field obj.address_line_1 is not the expected type, validation failed.")
      obj.address_line_2&.is_a?(String) != false || raise("Passed value for field obj.address_line_2 is not the expected type, validation failed.")
      obj.city.is_a?(String) != false || raise("Passed value for field obj.city is not the expected type, validation failed.")
      obj.country.is_a?(Monite::AllowedEinvoicingCountryCodes) != false || raise("Passed value for field obj.country is not the expected type, validation failed.")
      obj.postal_code.is_a?(String) != false || raise("Passed value for field obj.postal_code is not the expected type, validation failed.")
      obj.state&.is_a?(String) != false || raise("Passed value for field obj.state is not the expected type, validation failed.")
    end
  end
end