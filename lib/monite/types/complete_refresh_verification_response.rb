# frozen_string_literal: true
require_relative "bank_account_verifications"
require "ostruct"
require "json"

module Monite
  class CompleteRefreshVerificationResponse
  # @return [Monite::BankAccountVerifications] 
    attr_reader :verifications
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param verifications [Monite::BankAccountVerifications] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::CompleteRefreshVerificationResponse]
    def initialize(verifications:, additional_properties: nil)
      @verifications = verifications
      @additional_properties = additional_properties
      @_field_set = { "verifications": verifications }
    end
# Deserialize a JSON object to an instance of CompleteRefreshVerificationResponse
    #
    # @param json_object [String] 
    # @return [Monite::CompleteRefreshVerificationResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["verifications"].nil?
        verifications = parsed_json["verifications"].to_json
        verifications = Monite::BankAccountVerifications.from_json(json_object: verifications)
      else
        verifications = nil
      end
      new(verifications: verifications, additional_properties: struct)
    end
# Serialize an instance of CompleteRefreshVerificationResponse to a JSON object
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
      Monite::BankAccountVerifications.validate_raw(obj: obj.verifications)
    end
  end
end