# frozen_string_literal: true
require_relative "allowed_countries"
require "ostruct"
require "json"

module Monite
  class CounterpartRawVatIdUpdateRequest
  # @return [Monite::AllowedCountries] 
    attr_reader :country
  # @return [String] 
    attr_reader :type
  # @return [String] 
    attr_reader :value
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param country [Monite::AllowedCountries] 
    # @param type [String] 
    # @param value [String] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::CounterpartRawVatIdUpdateRequest]
    def initialize(country: OMIT, type: OMIT, value: OMIT, additional_properties: nil)
      @country = country if country != OMIT
      @type = type if type != OMIT
      @value = value if value != OMIT
      @additional_properties = additional_properties
      @_field_set = { "country": country, "type": type, "value": value }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of CounterpartRawVatIdUpdateRequest
    #
    # @param json_object [String] 
    # @return [Monite::CounterpartRawVatIdUpdateRequest]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      country = parsed_json["country"]
      type = parsed_json["type"]
      value = parsed_json["value"]
      new(
        country: country,
        type: type,
        value: value,
        additional_properties: struct
      )
    end
# Serialize an instance of CounterpartRawVatIdUpdateRequest to a JSON object
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
      obj.country&.is_a?(Monite::AllowedCountries) != false || raise("Passed value for field obj.country is not the expected type, validation failed.")
      obj.type&.is_a?(String) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
      obj.value&.is_a?(String) != false || raise("Passed value for field obj.value is not the expected type, validation failed.")
    end
  end
end