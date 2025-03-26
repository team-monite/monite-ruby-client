# frozen_string_literal: true
require_relative "airwallex_plaid_account"
require_relative "airwallex_plaid_institution"
require_relative "airwallex_mandate"
require "ostruct"
require "json"

module Monite
  class CompleteVerificationAirwallexPlaidRequest
  # @return [Monite::AirwallexPlaidAccount] The bank account that was selected in the Plaid Modal
    attr_reader :account
  # @return [Monite::AirwallexPlaidInstitution] The financial institution that was selected in the Plaid Modal
    attr_reader :institution
  # @return [Monite::AirwallexMandate] 
    attr_reader :mandate
  # @return [String] The Plaid Public Token
    attr_reader :public_token
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param account [Monite::AirwallexPlaidAccount] The bank account that was selected in the Plaid Modal
    # @param institution [Monite::AirwallexPlaidInstitution] The financial institution that was selected in the Plaid Modal
    # @param mandate [Monite::AirwallexMandate] 
    # @param public_token [String] The Plaid Public Token
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::CompleteVerificationAirwallexPlaidRequest]
    def initialize(account:, institution:, mandate:, public_token:, additional_properties: nil)
      @account = account
      @institution = institution
      @mandate = mandate
      @public_token = public_token
      @additional_properties = additional_properties
      @_field_set = { "account": account, "institution": institution, "mandate": mandate, "public_token": public_token }
    end
# Deserialize a JSON object to an instance of
#  CompleteVerificationAirwallexPlaidRequest
    #
    # @param json_object [String] 
    # @return [Monite::CompleteVerificationAirwallexPlaidRequest]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["account"].nil?
        account = parsed_json["account"].to_json
        account = Monite::AirwallexPlaidAccount.from_json(json_object: account)
      else
        account = nil
      end
      unless parsed_json["institution"].nil?
        institution = parsed_json["institution"].to_json
        institution = Monite::AirwallexPlaidInstitution.from_json(json_object: institution)
      else
        institution = nil
      end
      unless parsed_json["mandate"].nil?
        mandate = parsed_json["mandate"].to_json
        mandate = Monite::AirwallexMandate.from_json(json_object: mandate)
      else
        mandate = nil
      end
      public_token = parsed_json["public_token"]
      new(
        account: account,
        institution: institution,
        mandate: mandate,
        public_token: public_token,
        additional_properties: struct
      )
    end
# Serialize an instance of CompleteVerificationAirwallexPlaidRequest to a JSON
#  object
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
      Monite::AirwallexPlaidAccount.validate_raw(obj: obj.account)
      Monite::AirwallexPlaidInstitution.validate_raw(obj: obj.institution)
      Monite::AirwallexMandate.validate_raw(obj: obj.mandate)
      obj.public_token.is_a?(String) != false || raise("Passed value for field obj.public_token is not the expected type, validation failed.")
    end
  end
end