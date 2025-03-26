# frozen_string_literal: true
require_relative "wc_offer_status"
require_relative "currency_enum"
require_relative "pricing_plan"
require "ostruct"
require "json"

module Monite
  class FinancingOffer
  # @return [Monite::WcOfferStatus] The status of the financing offer.
    attr_reader :status
  # @return [Integer] The total credit limit in minor units.
    attr_reader :total_amount
  # @return [Integer] The available credit limit in minor units.
    attr_reader :available_amount
  # @return [Monite::CurrencyEnum] The currency code.
    attr_reader :currency
  # @return [Array<Monite::PricingPlan>] A list of pricing plans for the offer.
    attr_reader :pricing_plans
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param status [Monite::WcOfferStatus] The status of the financing offer.
    # @param total_amount [Integer] The total credit limit in minor units.
    # @param available_amount [Integer] The available credit limit in minor units.
    # @param currency [Monite::CurrencyEnum] The currency code.
    # @param pricing_plans [Array<Monite::PricingPlan>] A list of pricing plans for the offer.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::FinancingOffer]
    def initialize(status:, total_amount:, available_amount: OMIT, currency:, pricing_plans:, additional_properties: nil)
      @status = status
      @total_amount = total_amount
      @available_amount = available_amount if available_amount != OMIT
      @currency = currency
      @pricing_plans = pricing_plans
      @additional_properties = additional_properties
      @_field_set = { "status": status, "total_amount": total_amount, "available_amount": available_amount, "currency": currency, "pricing_plans": pricing_plans }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of FinancingOffer
    #
    # @param json_object [String] 
    # @return [Monite::FinancingOffer]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      status = parsed_json["status"]
      total_amount = parsed_json["total_amount"]
      available_amount = parsed_json["available_amount"]
      currency = parsed_json["currency"]
      pricing_plans = parsed_json["pricing_plans"]&.map do | item |
  item = item.to_json
  Monite::PricingPlan.from_json(json_object: item)
end
      new(
        status: status,
        total_amount: total_amount,
        available_amount: available_amount,
        currency: currency,
        pricing_plans: pricing_plans,
        additional_properties: struct
      )
    end
# Serialize an instance of FinancingOffer to a JSON object
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
      obj.status.is_a?(Monite::WcOfferStatus) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
      obj.total_amount.is_a?(Integer) != false || raise("Passed value for field obj.total_amount is not the expected type, validation failed.")
      obj.available_amount&.is_a?(Integer) != false || raise("Passed value for field obj.available_amount is not the expected type, validation failed.")
      obj.currency.is_a?(Monite::CurrencyEnum) != false || raise("Passed value for field obj.currency is not the expected type, validation failed.")
      obj.pricing_plans.is_a?(Array) != false || raise("Passed value for field obj.pricing_plans is not the expected type, validation failed.")
    end
  end
end