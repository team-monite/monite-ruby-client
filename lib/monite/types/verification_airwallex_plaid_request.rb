# frozen_string_literal: true
require "ostruct"
require "json"

module Monite
  class VerificationAirwallexPlaidRequest
  # @return [String] The name of your application to be displayed in Plaid Modal
    attr_reader :client_name
  # @return [String] The name of the Link customization configured on the Plaid Dashboard. If not
#  specified, the default customization will be applied
    attr_reader :link_customization_name
  # @return [String] URL to handle the OAuth verification flow
    attr_reader :redirect_url
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param client_name [String] The name of your application to be displayed in Plaid Modal
    # @param link_customization_name [String] The name of the Link customization configured on the Plaid Dashboard. If not
#  specified, the default customization will be applied
    # @param redirect_url [String] URL to handle the OAuth verification flow
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::VerificationAirwallexPlaidRequest]
    def initialize(client_name:, link_customization_name: OMIT, redirect_url:, additional_properties: nil)
      @client_name = client_name
      @link_customization_name = link_customization_name if link_customization_name != OMIT
      @redirect_url = redirect_url
      @additional_properties = additional_properties
      @_field_set = { "client_name": client_name, "link_customization_name": link_customization_name, "redirect_url": redirect_url }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of VerificationAirwallexPlaidRequest
    #
    # @param json_object [String] 
    # @return [Monite::VerificationAirwallexPlaidRequest]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      client_name = parsed_json["client_name"]
      link_customization_name = parsed_json["link_customization_name"]
      redirect_url = parsed_json["redirect_url"]
      new(
        client_name: client_name,
        link_customization_name: link_customization_name,
        redirect_url: redirect_url,
        additional_properties: struct
      )
    end
# Serialize an instance of VerificationAirwallexPlaidRequest to a JSON object
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
      obj.link_customization_name&.is_a?(String) != false || raise("Passed value for field obj.link_customization_name is not the expected type, validation failed.")
      obj.redirect_url.is_a?(String) != false || raise("Passed value for field obj.redirect_url is not the expected type, validation failed.")
    end
  end
end