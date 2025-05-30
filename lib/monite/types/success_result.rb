# frozen_string_literal: true
require "ostruct"
require "json"

module Monite
  class SuccessResult
  # @return [Boolean] 
    attr_reader :success
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param success [Boolean] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::SuccessResult]
    def initialize(success: OMIT, additional_properties: nil)
      @success = success if success != OMIT
      @additional_properties = additional_properties
      @_field_set = { "success": success }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of SuccessResult
    #
    # @param json_object [String] 
    # @return [Monite::SuccessResult]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      success = parsed_json["success"]
      new(success: success, additional_properties: struct)
    end
# Serialize an instance of SuccessResult to a JSON object
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
      obj.success&.is_a?(Boolean) != false || raise("Passed value for field obj.success is not the expected type, validation failed.")
    end
  end
end