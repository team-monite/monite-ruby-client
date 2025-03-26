# frozen_string_literal: true
require_relative "bank_account_verification_type"
require "ostruct"
require "json"

module Monite
  class CompleteRefreshVerificationRequest
  # @return [Monite::BankAccountVerificationType] 
    attr_reader :type
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param type [Monite::BankAccountVerificationType] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::CompleteRefreshVerificationRequest]
    def initialize(type:, additional_properties: nil)
      @type = type
      @additional_properties = additional_properties
      @_field_set = { "type": type }
    end
# Deserialize a JSON object to an instance of CompleteRefreshVerificationRequest
    #
    # @param json_object [String] 
    # @return [Monite::CompleteRefreshVerificationRequest]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      type = parsed_json["type"]
      new(type: type, additional_properties: struct)
    end
# Serialize an instance of CompleteRefreshVerificationRequest to a JSON object
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
      obj.type.is_a?(Monite::BankAccountVerificationType) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
    end
  end
end