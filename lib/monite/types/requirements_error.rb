# frozen_string_literal: true
require "ostruct"
require "json"

module Monite
  class RequirementsError
  # @return [String] 
    attr_reader :code
  # @return [String] 
    attr_reader :reason
  # @return [String] 
    attr_reader :requirement
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param code [String] 
    # @param reason [String] 
    # @param requirement [String] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::RequirementsError]
    def initialize(code:, reason:, requirement:, additional_properties: nil)
      @code = code
      @reason = reason
      @requirement = requirement
      @additional_properties = additional_properties
      @_field_set = { "code": code, "reason": reason, "requirement": requirement }
    end
# Deserialize a JSON object to an instance of RequirementsError
    #
    # @param json_object [String] 
    # @return [Monite::RequirementsError]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      code = parsed_json["code"]
      reason = parsed_json["reason"]
      requirement = parsed_json["requirement"]
      new(
        code: code,
        reason: reason,
        requirement: requirement,
        additional_properties: struct
      )
    end
# Serialize an instance of RequirementsError to a JSON object
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
      obj.code.is_a?(String) != false || raise("Passed value for field obj.code is not the expected type, validation failed.")
      obj.reason.is_a?(String) != false || raise("Passed value for field obj.reason is not the expected type, validation failed.")
      obj.requirement.is_a?(String) != false || raise("Passed value for field obj.requirement is not the expected type, validation failed.")
    end
  end
end