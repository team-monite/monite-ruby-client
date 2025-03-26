# frozen_string_literal: true
require_relative "airwallex_plaid_bank_account_verification_status"
require "ostruct"
require "json"

module Monite
  class AirwallexPlaidVerification
  # @return [Monite::AirwallexPlaidBankAccountVerificationStatus] Status of the bank account verification
    attr_reader :status
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param status [Monite::AirwallexPlaidBankAccountVerificationStatus] Status of the bank account verification
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::AirwallexPlaidVerification]
    def initialize(status:, additional_properties: nil)
      @status = status
      @additional_properties = additional_properties
      @_field_set = { "status": status }
    end
# Deserialize a JSON object to an instance of AirwallexPlaidVerification
    #
    # @param json_object [String] 
    # @return [Monite::AirwallexPlaidVerification]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      status = parsed_json["status"]
      new(status: status, additional_properties: struct)
    end
# Serialize an instance of AirwallexPlaidVerification to a JSON object
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
      obj.status.is_a?(Monite::AirwallexPlaidBankAccountVerificationStatus) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
    end
  end
end