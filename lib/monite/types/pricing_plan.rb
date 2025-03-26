# frozen_string_literal: true
require_relative "wc_repayment_type"
require "ostruct"
require "json"

module Monite
# A pricing plan of a financing offer
  class PricingPlan
  # @return [Integer] Advance rate percentage. 10000 means 100%
    attr_reader :advance_rate_percentage
  # @return [Integer] Transaction fee percentage. 300 means 3.00%
    attr_reader :fee_percentage
  # @return [Monite::WcRepaymentType] Repayment type of the loan.
    attr_reader :repayment_type
  # @return [Integer] This amount of days after which the repayment duration is due. This is only
#  applicable for FIXED_DURATION repayment type
    attr_reader :repayment_duration_days
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param advance_rate_percentage [Integer] Advance rate percentage. 10000 means 100%
    # @param fee_percentage [Integer] Transaction fee percentage. 300 means 3.00%
    # @param repayment_type [Monite::WcRepaymentType] Repayment type of the loan.
    # @param repayment_duration_days [Integer] This amount of days after which the repayment duration is due. This is only
#  applicable for FIXED_DURATION repayment type
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::PricingPlan]
    def initialize(advance_rate_percentage:, fee_percentage:, repayment_type:, repayment_duration_days: OMIT, additional_properties: nil)
      @advance_rate_percentage = advance_rate_percentage
      @fee_percentage = fee_percentage
      @repayment_type = repayment_type
      @repayment_duration_days = repayment_duration_days if repayment_duration_days != OMIT
      @additional_properties = additional_properties
      @_field_set = { "advance_rate_percentage": advance_rate_percentage, "fee_percentage": fee_percentage, "repayment_type": repayment_type, "repayment_duration_days": repayment_duration_days }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of PricingPlan
    #
    # @param json_object [String] 
    # @return [Monite::PricingPlan]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      advance_rate_percentage = parsed_json["advance_rate_percentage"]
      fee_percentage = parsed_json["fee_percentage"]
      repayment_type = parsed_json["repayment_type"]
      repayment_duration_days = parsed_json["repayment_duration_days"]
      new(
        advance_rate_percentage: advance_rate_percentage,
        fee_percentage: fee_percentage,
        repayment_type: repayment_type,
        repayment_duration_days: repayment_duration_days,
        additional_properties: struct
      )
    end
# Serialize an instance of PricingPlan to a JSON object
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
      obj.advance_rate_percentage.is_a?(Integer) != false || raise("Passed value for field obj.advance_rate_percentage is not the expected type, validation failed.")
      obj.fee_percentage.is_a?(Integer) != false || raise("Passed value for field obj.fee_percentage is not the expected type, validation failed.")
      obj.repayment_type.is_a?(Monite::WcRepaymentType) != false || raise("Passed value for field obj.repayment_type is not the expected type, validation failed.")
      obj.repayment_duration_days&.is_a?(Integer) != false || raise("Passed value for field obj.repayment_duration_days is not the expected type, validation failed.")
    end
  end
end