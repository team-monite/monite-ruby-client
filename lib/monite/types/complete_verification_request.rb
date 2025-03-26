# frozen_string_literal: true
require_relative "complete_verification_airwallex_plaid_request"
require_relative "bank_account_verification_type"
require "ostruct"
require "json"

module Monite
  class CompleteVerificationRequest
  # @return [Monite::CompleteVerificationAirwallexPlaidRequest] 
    attr_reader :airwallex_plaid
  # @return [Monite::BankAccountVerificationType] 
    attr_reader :type
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param airwallex_plaid [Monite::CompleteVerificationAirwallexPlaidRequest] 
    # @param type [Monite::BankAccountVerificationType] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::CompleteVerificationRequest]
    def initialize(airwallex_plaid:, type:, additional_properties: nil)
      @airwallex_plaid = airwallex_plaid
      @type = type
      @additional_properties = additional_properties
      @_field_set = { "airwallex_plaid": airwallex_plaid, "type": type }
    end
# Deserialize a JSON object to an instance of CompleteVerificationRequest
    #
    # @param json_object [String] 
    # @return [Monite::CompleteVerificationRequest]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["airwallex_plaid"].nil?
        airwallex_plaid = parsed_json["airwallex_plaid"].to_json
        airwallex_plaid = Monite::CompleteVerificationAirwallexPlaidRequest.from_json(json_object: airwallex_plaid)
      else
        airwallex_plaid = nil
      end
      type = parsed_json["type"]
      new(
        airwallex_plaid: airwallex_plaid,
        type: type,
        additional_properties: struct
      )
    end
# Serialize an instance of CompleteVerificationRequest to a JSON object
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
      Monite::CompleteVerificationAirwallexPlaidRequest.validate_raw(obj: obj.airwallex_plaid)
      obj.type.is_a?(Monite::BankAccountVerificationType) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
    end
  end
end