# frozen_string_literal: true
require_relative "recipient"
require "ostruct"
require "json"

module Monite
  class CreateOnboardingLinkRequest
  # @return [Monite::Recipient] 
    attr_reader :recipient
  # @return [String] 
    attr_reader :refresh_url
  # @return [String] 
    attr_reader :return_url
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param recipient [Monite::Recipient] 
    # @param refresh_url [String] 
    # @param return_url [String] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::CreateOnboardingLinkRequest]
    def initialize(recipient:, refresh_url:, return_url:, additional_properties: nil)
      @recipient = recipient
      @refresh_url = refresh_url
      @return_url = return_url
      @additional_properties = additional_properties
      @_field_set = { "recipient": recipient, "refresh_url": refresh_url, "return_url": return_url }
    end
# Deserialize a JSON object to an instance of CreateOnboardingLinkRequest
    #
    # @param json_object [String] 
    # @return [Monite::CreateOnboardingLinkRequest]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["recipient"].nil?
        recipient = parsed_json["recipient"].to_json
        recipient = Monite::Recipient.from_json(json_object: recipient)
      else
        recipient = nil
      end
      refresh_url = parsed_json["refresh_url"]
      return_url = parsed_json["return_url"]
      new(
        recipient: recipient,
        refresh_url: refresh_url,
        return_url: return_url,
        additional_properties: struct
      )
    end
# Serialize an instance of CreateOnboardingLinkRequest to a JSON object
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
      Monite::Recipient.validate_raw(obj: obj.recipient)
      obj.refresh_url.is_a?(String) != false || raise("Passed value for field obj.refresh_url is not the expected type, validation failed.")
      obj.return_url.is_a?(String) != false || raise("Passed value for field obj.return_url is not the expected type, validation failed.")
    end
  end
end