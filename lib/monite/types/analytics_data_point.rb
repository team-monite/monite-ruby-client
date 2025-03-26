# frozen_string_literal: true
require "ostruct"
require "json"

module Monite
  class AnalyticsDataPoint
  # @return [String] 
    attr_reader :dimension_value
  # @return [Integer] 
    attr_reader :metric_value
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param dimension_value [String] 
    # @param metric_value [Integer] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::AnalyticsDataPoint]
    def initialize(dimension_value: OMIT, metric_value:, additional_properties: nil)
      @dimension_value = dimension_value if dimension_value != OMIT
      @metric_value = metric_value
      @additional_properties = additional_properties
      @_field_set = { "dimension_value": dimension_value, "metric_value": metric_value }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of AnalyticsDataPoint
    #
    # @param json_object [String] 
    # @return [Monite::AnalyticsDataPoint]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      dimension_value = parsed_json["dimension_value"]
      metric_value = parsed_json["metric_value"]
      new(
        dimension_value: dimension_value,
        metric_value: metric_value,
        additional_properties: struct
      )
    end
# Serialize an instance of AnalyticsDataPoint to a JSON object
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
      obj.dimension_value&.is_a?(String) != false || raise("Passed value for field obj.dimension_value is not the expected type, validation failed.")
      obj.metric_value.is_a?(Integer) != false || raise("Passed value for field obj.metric_value is not the expected type, validation failed.")
    end
  end
end