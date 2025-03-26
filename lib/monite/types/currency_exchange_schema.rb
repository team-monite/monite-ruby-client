# frozen_string_literal: true
require "ostruct"
require "json"

module Monite
  class CurrencyExchangeSchema
  # @return [String] 
    attr_reader :default_currency_code
  # @return [Float] 
    attr_reader :rate
  # @return [Float] 
    attr_reader :total
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param default_currency_code [String] 
    # @param rate [Float] 
    # @param total [Float] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::CurrencyExchangeSchema]
    def initialize(default_currency_code:, rate:, total:, additional_properties: nil)
      @default_currency_code = default_currency_code
      @rate = rate
      @total = total
      @additional_properties = additional_properties
      @_field_set = { "default_currency_code": default_currency_code, "rate": rate, "total": total }
    end
# Deserialize a JSON object to an instance of CurrencyExchangeSchema
    #
    # @param json_object [String] 
    # @return [Monite::CurrencyExchangeSchema]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      default_currency_code = parsed_json["default_currency_code"]
      rate = parsed_json["rate"]
      total = parsed_json["total"]
      new(
        default_currency_code: default_currency_code,
        rate: rate,
        total: total,
        additional_properties: struct
      )
    end
# Serialize an instance of CurrencyExchangeSchema to a JSON object
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
      obj.default_currency_code.is_a?(String) != false || raise("Passed value for field obj.default_currency_code is not the expected type, validation failed.")
      obj.rate.is_a?(Float) != false || raise("Passed value for field obj.rate is not the expected type, validation failed.")
      obj.total.is_a?(Float) != false || raise("Passed value for field obj.total is not the expected type, validation failed.")
    end
  end
end