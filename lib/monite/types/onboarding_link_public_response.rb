# frozen_string_literal: true
require "date"
require "ostruct"
require "json"

module Monite
  class OnboardingLinkPublicResponse
  # @return [String] 
    attr_reader :id
  # @return [String] 
    attr_reader :entity_id
  # @return [DateTime] 
    attr_reader :expires_at
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
    # @param entity_id [String] 
    # @param expires_at [DateTime] 
    # @param refresh_url [String] 
    # @param return_url [String] 
    # @param url [String] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::OnboardingLinkPublicResponse]
    def initialize(id:, entity_id:, expires_at:, refresh_url:, return_url:, url:, additional_properties: nil)
      @id = id
      @entity_id = entity_id
      @expires_at = expires_at
      @refresh_url = refresh_url
      @return_url = return_url
      @url = url
      @additional_properties = additional_properties
      @_field_set = { "id": id, "entity_id": entity_id, "expires_at": expires_at, "refresh_url": refresh_url, "return_url": return_url, "url": url }
    end
# Deserialize a JSON object to an instance of OnboardingLinkPublicResponse
    #
    # @param json_object [String] 
    # @return [Monite::OnboardingLinkPublicResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      entity_id = parsed_json["entity_id"]
      expires_at = unless parsed_json["expires_at"].nil?
  DateTime.parse(parsed_json["expires_at"])
else
  nil
end
      refresh_url = parsed_json["refresh_url"]
      return_url = parsed_json["return_url"]
      url = parsed_json["url"]
      new(
        id: id,
        entity_id: entity_id,
        expires_at: expires_at,
        refresh_url: refresh_url,
        return_url: return_url,
        url: url,
        additional_properties: struct
      )
    end
# Serialize an instance of OnboardingLinkPublicResponse to a JSON object
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
      obj.entity_id.is_a?(String) != false || raise("Passed value for field obj.entity_id is not the expected type, validation failed.")
      obj.expires_at.is_a?(DateTime) != false || raise("Passed value for field obj.expires_at is not the expected type, validation failed.")
      obj.refresh_url.is_a?(String) != false || raise("Passed value for field obj.refresh_url is not the expected type, validation failed.")
      obj.return_url.is_a?(String) != false || raise("Passed value for field obj.return_url is not the expected type, validation failed.")
      obj.url.is_a?(String) != false || raise("Passed value for field obj.url is not the expected type, validation failed.")
    end
  end
end