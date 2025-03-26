# frozen_string_literal: true
require_relative "payable_state_enum"
require "ostruct"
require "json"

module Monite
  class PayableAggregatedItem
  # @return [Integer] The total count of payables with this specific status.
    attr_reader :count
  # @return [Monite::PayableStateEnum] The status of the payable (e.g., paid, draft, etc.).
    attr_reader :status
  # @return [Integer] The total sum of the amount field for all payables with this specific status.
    attr_reader :sum_total_amount
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param count [Integer] The total count of payables with this specific status.
    # @param status [Monite::PayableStateEnum] The status of the payable (e.g., paid, draft, etc.).
    # @param sum_total_amount [Integer] The total sum of the amount field for all payables with this specific status.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::PayableAggregatedItem]
    def initialize(count:, status:, sum_total_amount:, additional_properties: nil)
      @count = count
      @status = status
      @sum_total_amount = sum_total_amount
      @additional_properties = additional_properties
      @_field_set = { "count": count, "status": status, "sum_total_amount": sum_total_amount }
    end
# Deserialize a JSON object to an instance of PayableAggregatedItem
    #
    # @param json_object [String] 
    # @return [Monite::PayableAggregatedItem]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      count = parsed_json["count"]
      status = parsed_json["status"]
      sum_total_amount = parsed_json["sum_total_amount"]
      new(
        count: count,
        status: status,
        sum_total_amount: sum_total_amount,
        additional_properties: struct
      )
    end
# Serialize an instance of PayableAggregatedItem to a JSON object
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
      obj.count.is_a?(Integer) != false || raise("Passed value for field obj.count is not the expected type, validation failed.")
      obj.status.is_a?(Monite::PayableStateEnum) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
      obj.sum_total_amount.is_a?(Integer) != false || raise("Passed value for field obj.sum_total_amount is not the expected type, validation failed.")
    end
  end
end