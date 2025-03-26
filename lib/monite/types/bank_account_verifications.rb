# frozen_string_literal: true
require_relative "airwallex_plaid_verification"
require "ostruct"
require "json"

module Monite
  class BankAccountVerifications
  # @return [Monite::AirwallexPlaidVerification] Airwallex Plaid verification
    attr_reader :airwallex_plaid
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param airwallex_plaid [Monite::AirwallexPlaidVerification] Airwallex Plaid verification
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::BankAccountVerifications]
    def initialize(airwallex_plaid: OMIT, additional_properties: nil)
      @airwallex_plaid = airwallex_plaid if airwallex_plaid != OMIT
      @additional_properties = additional_properties
      @_field_set = { "airwallex_plaid": airwallex_plaid }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of BankAccountVerifications
    #
    # @param json_object [String] 
    # @return [Monite::BankAccountVerifications]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["airwallex_plaid"].nil?
        airwallex_plaid = parsed_json["airwallex_plaid"].to_json
        airwallex_plaid = Monite::AirwallexPlaidVerification.from_json(json_object: airwallex_plaid)
      else
        airwallex_plaid = nil
      end
      new(airwallex_plaid: airwallex_plaid, additional_properties: struct)
    end
# Serialize an instance of BankAccountVerifications to a JSON object
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
      obj.airwallex_plaid.nil? || Monite::AirwallexPlaidVerification.validate_raw(obj: obj.airwallex_plaid)
    end
  end
end