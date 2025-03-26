# frozen_string_literal: true
require_relative "payable_aggregated_item"
require "ostruct"
require "json"

module Monite
  class PayableAggregatedDataResponse
  # @return [Integer] The total count of payables across all statuses.
    attr_reader :count
  # @return [Array<Monite::PayableAggregatedItem>] A list of aggregated items, each representing a status with its associated sum
#  of the amount field and count.
    attr_reader :data
  # @return [Integer] The total sum of the amount field for all payables across all statuses.
    attr_reader :sum_total_amount
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param count [Integer] The total count of payables across all statuses.
    # @param data [Array<Monite::PayableAggregatedItem>] A list of aggregated items, each representing a status with its associated sum
#  of the amount field and count.
    # @param sum_total_amount [Integer] The total sum of the amount field for all payables across all statuses.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::PayableAggregatedDataResponse]
    def initialize(count:, data:, sum_total_amount:, additional_properties: nil)
      @count = count
      @data = data
      @sum_total_amount = sum_total_amount
      @additional_properties = additional_properties
      @_field_set = { "count": count, "data": data, "sum_total_amount": sum_total_amount }
    end
# Deserialize a JSON object to an instance of PayableAggregatedDataResponse
    #
    # @param json_object [String] 
    # @return [Monite::PayableAggregatedDataResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      count = parsed_json["count"]
      data = parsed_json["data"]&.map do | item |
  item = item.to_json
  Monite::PayableAggregatedItem.from_json(json_object: item)
end
      sum_total_amount = parsed_json["sum_total_amount"]
      new(
        count: count,
        data: data,
        sum_total_amount: sum_total_amount,
        additional_properties: struct
      )
    end
# Serialize an instance of PayableAggregatedDataResponse to a JSON object
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
      obj.data.is_a?(Array) != false || raise("Passed value for field obj.data is not the expected type, validation failed.")
      obj.sum_total_amount.is_a?(Integer) != false || raise("Passed value for field obj.sum_total_amount is not the expected type, validation failed.")
    end
  end
end