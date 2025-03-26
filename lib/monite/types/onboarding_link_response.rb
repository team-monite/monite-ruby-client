# frozen_string_literal: true
require "date"
require "date"
require_relative "recipient"
require "ostruct"
require "json"

module Monite
  class OnboardingLinkResponse
  # @return [String] 
    attr_reader :id
  # @return [DateTime] 
    attr_reader :created_at
  # @return [DateTime] 
    attr_reader :expires_at
  # @return [Monite::Recipient] 
    attr_reader :recipient
  # @return [String] 
    attr_reader :refresh_url
  # @return [String] 
    attr_reader :return_url
  # @return [String] 
    attr_reader :url
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] 
    # @param created_at [DateTime] 
    # @param expires_at [DateTime] 
    # @param recipient [Monite::Recipient] 
    # @param refresh_url [String] 
    # @param return_url [String] 
    # @param url [String] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::OnboardingLinkResponse]
    def initialize(id:, created_at:, expires_at:, recipient:, refresh_url:, return_url:, url:, additional_properties: nil)
      @id = id
      @created_at = created_at
      @expires_at = expires_at
      @recipient = recipient
      @refresh_url = refresh_url
      @return_url = return_url
      @url = url
      @additional_properties = additional_properties
      @_field_set = { "id": id, "created_at": created_at, "expires_at": expires_at, "recipient": recipient, "refresh_url": refresh_url, "return_url": return_url, "url": url }
    end
# Deserialize a JSON object to an instance of OnboardingLinkResponse
    #
    # @param json_object [String] 
    # @return [Monite::OnboardingLinkResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      created_at = unless parsed_json["created_at"].nil?
  DateTime.parse(parsed_json["created_at"])
else
  nil
end
      expires_at = unless parsed_json["expires_at"].nil?
  DateTime.parse(parsed_json["expires_at"])
else
  nil
end
      unless parsed_json["recipient"].nil?
        recipient = parsed_json["recipient"].to_json
        recipient = Monite::Recipient.from_json(json_object: recipient)
      else
        recipient = nil
      end
      refresh_url = parsed_json["refresh_url"]
      return_url = parsed_json["return_url"]
      url = parsed_json["url"]
      new(
        id: id,
        created_at: created_at,
        expires_at: expires_at,
        recipient: recipient,
        refresh_url: refresh_url,
        return_url: return_url,
        url: url,
        additional_properties: struct
      )
    end
# Serialize an instance of OnboardingLinkResponse to a JSON object
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
      obj.id.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
      obj.created_at.is_a?(DateTime) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
      obj.expires_at.is_a?(DateTime) != false || raise("Passed value for field obj.expires_at is not the expected type, validation failed.")
      Monite::Recipient.validate_raw(obj: obj.recipient)
      obj.refresh_url.is_a?(String) != false || raise("Passed value for field obj.refresh_url is not the expected type, validation failed.")
      obj.return_url.is_a?(String) != false || raise("Passed value for field obj.return_url is not the expected type, validation failed.")
      obj.url.is_a?(String) != false || raise("Passed value for field obj.url is not the expected type, validation failed.")
    end
  end
end