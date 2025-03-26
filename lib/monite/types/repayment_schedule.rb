# frozen_string_literal: true
require "ostruct"
require "json"

module Monite
# Repayment schedule model
  class RepaymentSchedule
  # @return [String] Repayment date in ISO 8601 format
    attr_reader :repayment_date
  # @return [Integer] Repayment amount in minor units
    attr_reader :repayment_amount
  # @return [Integer] Repayment fee amount in minor units
    attr_reader :repayment_fee_amount
  # @return [Integer] Repayment principal amount in minor units
    attr_reader :repayment_principal_amount
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param repayment_date [String] Repayment date in ISO 8601 format
    # @param repayment_amount [Integer] Repayment amount in minor units
    # @param repayment_fee_amount [Integer] Repayment fee amount in minor units
    # @param repayment_principal_amount [Integer] Repayment principal amount in minor units
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::RepaymentSchedule]
    def initialize(repayment_date:, repayment_amount:, repayment_fee_amount:, repayment_principal_amount:, additional_properties: nil)
      @repayment_date = repayment_date
      @repayment_amount = repayment_amount
      @repayment_fee_amount = repayment_fee_amount
      @repayment_principal_amount = repayment_principal_amount
      @additional_properties = additional_properties
      @_field_set = { "repayment_date": repayment_date, "repayment_amount": repayment_amount, "repayment_fee_amount": repayment_fee_amount, "repayment_principal_amount": repayment_principal_amount }
    end
# Deserialize a JSON object to an instance of RepaymentSchedule
    #
    # @param json_object [String] 
    # @return [Monite::RepaymentSchedule]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      repayment_date = parsed_json["repayment_date"]
      repayment_amount = parsed_json["repayment_amount"]
      repayment_fee_amount = parsed_json["repayment_fee_amount"]
      repayment_principal_amount = parsed_json["repayment_principal_amount"]
      new(
        repayment_date: repayment_date,
        repayment_amount: repayment_amount,
        repayment_fee_amount: repayment_fee_amount,
        repayment_principal_amount: repayment_principal_amount,
        additional_properties: struct
      )
    end
# Serialize an instance of RepaymentSchedule to a JSON object
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
      obj.repayment_date.is_a?(String) != false || raise("Passed value for field obj.repayment_date is not the expected type, validation failed.")
      obj.repayment_amount.is_a?(Integer) != false || raise("Passed value for field obj.repayment_amount is not the expected type, validation failed.")
      obj.repayment_fee_amount.is_a?(Integer) != false || raise("Passed value for field obj.repayment_fee_amount is not the expected type, validation failed.")
      obj.repayment_principal_amount.is_a?(Integer) != false || raise("Passed value for field obj.repayment_principal_amount is not the expected type, validation failed.")
    end
  end
end