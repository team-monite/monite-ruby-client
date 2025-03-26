# frozen_string_literal: true
require "date"
require "ostruct"
require "json"

module Monite
  class VerificationAirwallexPlaidResponse
  # @return [String] Client name from the request
    attr_reader :client_name
  # @return [DateTime] 
    attr_reader :expires_at
  # @return [String] Customization name from the request
    attr_reader :link_customization_name
  # @return [String] Link token that should be used to init Plaid SDK
    attr_reader :link_token
  # @return [String] URL from the request
    attr_reader :redirect_url
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param client_name [String] Client name from the request
    # @param expires_at [DateTime] 
    # @param link_customization_name [String] Customization name from the request
    # @param link_token [String] Link token that should be used to init Plaid SDK
    # @param redirect_url [String] URL from the request
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::VerificationAirwallexPlaidResponse]
    def initialize(client_name:, expires_at:, link_customization_name: OMIT, link_token:, redirect_url:, additional_properties: nil)
      @client_name = client_name
      @expires_at = expires_at
      @link_customization_name = link_customization_name if link_customization_name != OMIT
      @link_token = link_token
      @redirect_url = redirect_url
      @additional_properties = additional_properties
      @_field_set = { "client_name": client_name, "expires_at": expires_at, "link_customization_name": link_customization_name, "link_token": link_token, "redirect_url": redirect_url }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of VerificationAirwallexPlaidResponse
    #
    # @param json_object [String] 
    # @return [Monite::VerificationAirwallexPlaidResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      client_name = parsed_json["client_name"]
      expires_at = unless parsed_json["expires_at"].nil?
  DateTime.parse(parsed_json["expires_at"])
else
  nil
end
      link_customization_name = parsed_json["link_customization_name"]
      link_token = parsed_json["link_token"]
      redirect_url = parsed_json["redirect_url"]
      new(
        client_name: client_name,
        expires_at: expires_at,
        link_customization_name: link_customization_name,
        link_token: link_token,
        redirect_url: redirect_url,
        additional_properties: struct
      )
    end
# Serialize an instance of VerificationAirwallexPlaidResponse to a JSON object
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
      obj.client_name.is_a?(String) != false || raise("Passed value for field obj.client_name is not the expected type, validation failed.")
      obj.expires_at.is_a?(DateTime) != false || raise("Passed value for field obj.expires_at is not the expected type, validation failed.")
      obj.link_customization_name&.is_a?(String) != false || raise("Passed value for field obj.link_customization_name is not the expected type, validation failed.")
      obj.link_token.is_a?(String) != false || raise("Passed value for field obj.link_token is not the expected type, validation failed.")
      obj.redirect_url.is_a?(String) != false || raise("Passed value for field obj.redirect_url is not the expected type, validation failed.")
    end
  end
end