# frozen_string_literal: true
require "ostruct"
require "json"

module Monite
  class TaxComponentResponse
  # @return [Boolean] A flag to indicate with the tax is calculated using the principle of
#  compounding.
    attr_reader :is_compound
  # @return [String] 
    attr_reader :name
  # @return [Integer] Component tax rate in percent [minor
#  units](https://docs.monite.com/references/currencies#minor-units). Example:
#  12.5% is 1250.
    attr_reader :rate
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param is_compound [Boolean] A flag to indicate with the tax is calculated using the principle of
#  compounding.
    # @param name [String] 
    # @param rate [Integer] Component tax rate in percent [minor
#  units](https://docs.monite.com/references/currencies#minor-units). Example:
#  12.5% is 1250.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::TaxComponentResponse]
    def initialize(is_compound: OMIT, name: OMIT, rate: OMIT, additional_properties: nil)
      @is_compound = is_compound if is_compound != OMIT
      @name = name if name != OMIT
      @rate = rate if rate != OMIT
      @additional_properties = additional_properties
      @_field_set = { "is_compound": is_compound, "name": name, "rate": rate }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of TaxComponentResponse
    #
    # @param json_object [String] 
    # @return [Monite::TaxComponentResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      is_compound = parsed_json["is_compound"]
      name = parsed_json["name"]
      rate = parsed_json["rate"]
      new(
        is_compound: is_compound,
        name: name,
        rate: rate,
        additional_properties: struct
      )
    end
# Serialize an instance of TaxComponentResponse to a JSON object
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
      obj.is_compound&.is_a?(Boolean) != false || raise("Passed value for field obj.is_compound is not the expected type, validation failed.")
      obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.rate&.is_a?(Integer) != false || raise("Passed value for field obj.rate is not the expected type, validation failed.")
    end
  end
end