# frozen_string_literal: true
require "ostruct"
require "json"

module Monite
  class OnboardingVerificationError
  # @return [String] 
    attr_reader :code
  # @return [String] 
    attr_reader :details
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param code [String] 
    # @param details [String] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::OnboardingVerificationError]
    def initialize(code:, details:, additional_properties: nil)
      @code = code
      @details = details
      @additional_properties = additional_properties
      @_field_set = { "code": code, "details": details }
    end
# Deserialize a JSON object to an instance of OnboardingVerificationError
    #
    # @param json_object [String] 
    # @return [Monite::OnboardingVerificationError]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      code = parsed_json["code"]
      details = parsed_json["details"]
      new(
        code: code,
        details: details,
        additional_properties: struct
      )
    end
# Serialize an instance of OnboardingVerificationError to a JSON object
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
      obj.details.is_a?(String) != false || raise("Passed value for field obj.details is not the expected type, validation failed.")
    end
  end
end