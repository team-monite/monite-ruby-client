# frozen_string_literal: true
require_relative "currency_enum"
require "ostruct"
require "json"

module Monite
  class ExchangeRate
  # @return [Monite::CurrencyEnum] 
    attr_reader :base
  # @return [Monite::CurrencyEnum] 
    attr_reader :to
  # @return [Float] 
    attr_reader :rate
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param base [Monite::CurrencyEnum] 
    # @param to [Monite::CurrencyEnum] 
    # @param rate [Float] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::ExchangeRate]
    def initialize(base:, to:, rate:, additional_properties: nil)
      @base = base
      @to = to
      @rate = rate
      @additional_properties = additional_properties
      @_field_set = { "base": base, "to": to, "rate": rate }
    end
# Deserialize a JSON object to an instance of ExchangeRate
    #
    # @param json_object [String] 
    # @return [Monite::ExchangeRate]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      base = parsed_json["base"]
      to = parsed_json["to"]
      rate = parsed_json["rate"]
      new(
        base: base,
        to: to,
        rate: rate,
        additional_properties: struct
      )
    end
# Serialize an instance of ExchangeRate to a JSON object
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
      obj.base.is_a?(Monite::CurrencyEnum) != false || raise("Passed value for field obj.base is not the expected type, validation failed.")
      obj.to.is_a?(Monite::CurrencyEnum) != false || raise("Passed value for field obj.to is not the expected type, validation failed.")
      obj.rate.is_a?(Float) != false || raise("Passed value for field obj.rate is not the expected type, validation failed.")
    end
  end
end