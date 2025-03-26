# frozen_string_literal: true
require_relative "currency_enum"
require "ostruct"
require "json"

module Monite
  class EstimatedMonthlyRevenue
  # @return [Integer] The amount of the monthly revenue, in [minor
#  units](https://docs.monite.com/references/currencies#minor-units). For example,
#  $12.50 is represented as 1250.
    attr_reader :amount
  # @return [Monite::CurrencyEnum] [Currency code](https://docs.monite.com/references/currencies) of the revenue.
    attr_reader :currency
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param amount [Integer] The amount of the monthly revenue, in [minor
#  units](https://docs.monite.com/references/currencies#minor-units). For example,
#  $12.50 is represented as 1250.
    # @param currency [Monite::CurrencyEnum] [Currency code](https://docs.monite.com/references/currencies) of the revenue.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::EstimatedMonthlyRevenue]
    def initialize(amount: OMIT, currency: OMIT, additional_properties: nil)
      @amount = amount if amount != OMIT
      @currency = currency if currency != OMIT
      @additional_properties = additional_properties
      @_field_set = { "amount": amount, "currency": currency }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of EstimatedMonthlyRevenue
    #
    # @param json_object [String] 
    # @return [Monite::EstimatedMonthlyRevenue]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      amount = parsed_json["amount"]
      currency = parsed_json["currency"]
      new(
        amount: amount,
        currency: currency,
        additional_properties: struct
      )
    end
# Serialize an instance of EstimatedMonthlyRevenue to a JSON object
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
      obj.amount&.is_a?(Integer) != false || raise("Passed value for field obj.amount is not the expected type, validation failed.")
      obj.currency&.is_a?(Monite::CurrencyEnum) != false || raise("Passed value for field obj.currency is not the expected type, validation failed.")
    end
  end
end