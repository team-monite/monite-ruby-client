# frozen_string_literal: true
require_relative "airwallex_mandate_type"
require_relative "airwallex_mandate_version"
require "ostruct"
require "json"

module Monite
  class AirwallexMandate
  # @return [String] PDF copy of mandate will be sent to the email by Airwallex
    attr_reader :email
  # @return [String] Name of the person signed the mandate, must be a bank account owner
    attr_reader :signatory
  # @return [Monite::AIRWALLEX_MANDATE_TYPE] 
    attr_reader :type
  # @return [Monite::AIRWALLEX_MANDATE_VERSION] 
    attr_reader :version
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param email [String] PDF copy of mandate will be sent to the email by Airwallex
    # @param signatory [String] Name of the person signed the mandate, must be a bank account owner
    # @param type [Monite::AIRWALLEX_MANDATE_TYPE] 
    # @param version [Monite::AIRWALLEX_MANDATE_VERSION] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::AirwallexMandate]
    def initialize(email:, signatory:, type:, version:, additional_properties: nil)
      @email = email
      @signatory = signatory
      @type = type
      @version = version
      @additional_properties = additional_properties
      @_field_set = { "email": email, "signatory": signatory, "type": type, "version": version }
    end
# Deserialize a JSON object to an instance of AirwallexMandate
    #
    # @param json_object [String] 
    # @return [Monite::AirwallexMandate]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      email = parsed_json["email"]
      signatory = parsed_json["signatory"]
      type = parsed_json["type"]
      version = parsed_json["version"]
      new(
        email: email,
        signatory: signatory,
        type: type,
        version: version,
        additional_properties: struct
      )
    end
# Serialize an instance of AirwallexMandate to a JSON object
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
      obj.email.is_a?(String) != false || raise("Passed value for field obj.email is not the expected type, validation failed.")
      obj.signatory.is_a?(String) != false || raise("Passed value for field obj.signatory is not the expected type, validation failed.")
      obj.type.is_a?(String) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
      obj.version.is_a?(String) != false || raise("Passed value for field obj.version is not the expected type, validation failed.")
    end
  end
end