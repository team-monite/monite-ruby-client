# frozen_string_literal: true
require_relative "financing_offer"
require_relative "wc_business_status"
require "ostruct"
require "json"

module Monite
  class FinancingOffersResponse
  # @return [Array<Monite::FinancingOffer>] A list of financing offers extended to the business.
    attr_reader :offers
  # @return [Monite::WcBusinessStatus] The business's onboarding status.
    attr_reader :business_status
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param offers [Array<Monite::FinancingOffer>] A list of financing offers extended to the business.
    # @param business_status [Monite::WcBusinessStatus] The business's onboarding status.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::FinancingOffersResponse]
    def initialize(offers:, business_status:, additional_properties: nil)
      @offers = offers
      @business_status = business_status
      @additional_properties = additional_properties
      @_field_set = { "offers": offers, "business_status": business_status }
    end
# Deserialize a JSON object to an instance of FinancingOffersResponse
    #
    # @param json_object [String] 
    # @return [Monite::FinancingOffersResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      offers = parsed_json["offers"]&.map do | item |
  item = item.to_json
  Monite::FinancingOffer.from_json(json_object: item)
end
      business_status = parsed_json["business_status"]
      new(
        offers: offers,
        business_status: business_status,
        additional_properties: struct
      )
    end
# Serialize an instance of FinancingOffersResponse to a JSON object
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
      obj.offers.is_a?(Array) != false || raise("Passed value for field obj.offers is not the expected type, validation failed.")
      obj.business_status.is_a?(Monite::WcBusinessStatus) != false || raise("Passed value for field obj.business_status is not the expected type, validation failed.")
    end
  end
end