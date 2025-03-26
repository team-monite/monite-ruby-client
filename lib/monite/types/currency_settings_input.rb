# frozen_string_literal: true
require_relative "currency_enum"
require_relative "exchange_rate"
require "ostruct"
require "json"

module Monite
  class CurrencySettingsInput
  # @return [Monite::CurrencyEnum] 
    attr_reader :default
  # @return [Array<Monite::ExchangeRate>] 
    attr_reader :exchange_rates
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param default [Monite::CurrencyEnum] 
    # @param exchange_rates [Array<Monite::ExchangeRate>] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::CurrencySettingsInput]
    def initialize(default:, exchange_rates: OMIT, additional_properties: nil)
      @default = default
      @exchange_rates = exchange_rates if exchange_rates != OMIT
      @additional_properties = additional_properties
      @_field_set = { "default": default, "exchange_rates": exchange_rates }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of CurrencySettingsInput
    #
    # @param json_object [String] 
    # @return [Monite::CurrencySettingsInput]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      default = parsed_json["default"]
      exchange_rates = parsed_json["exchange_rates"]&.map do | item |
  item = item.to_json
  Monite::ExchangeRate.from_json(json_object: item)
end
      new(
        default: default,
        exchange_rates: exchange_rates,
        additional_properties: struct
      )
    end
# Serialize an instance of CurrencySettingsInput to a JSON object
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
      obj.default.is_a?(Monite::CurrencyEnum) != false || raise("Passed value for field obj.default is not the expected type, validation failed.")
      obj.exchange_rates&.is_a?(Array) != false || raise("Passed value for field obj.exchange_rates is not the expected type, validation failed.")
    end
  end
end