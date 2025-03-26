# frozen_string_literal: true
require_relative "webhook_object_type"
require_relative "webhook_subscription_status"
require "ostruct"
require "json"

module Monite
  class WebhookSubscriptionResourceWithSecret
  # @return [String] 
    attr_reader :id
  # @return [Array<String>] 
    attr_reader :event_types
  # @return [Monite::WebhookObjectType] 
    attr_reader :object_type
  # @return [String] 
    attr_reader :secret
  # @return [Monite::WebhookSubscriptionStatus] 
    attr_reader :status
  # @return [String] 
    attr_reader :url
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] 
    # @param event_types [Array<String>] 
    # @param object_type [Monite::WebhookObjectType] 
    # @param secret [String] 
    # @param status [Monite::WebhookSubscriptionStatus] 
    # @param url [String] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::WebhookSubscriptionResourceWithSecret]
    def initialize(id:, event_types:, object_type:, secret:, status:, url:, additional_properties: nil)
      @id = id
      @event_types = event_types
      @object_type = object_type
      @secret = secret
      @status = status
      @url = url
      @additional_properties = additional_properties
      @_field_set = { "id": id, "event_types": event_types, "object_type": object_type, "secret": secret, "status": status, "url": url }
    end
# Deserialize a JSON object to an instance of
#  WebhookSubscriptionResourceWithSecret
    #
    # @param json_object [String] 
    # @return [Monite::WebhookSubscriptionResourceWithSecret]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      event_types = parsed_json["event_types"]
      object_type = parsed_json["object_type"]
      secret = parsed_json["secret"]
      status = parsed_json["status"]
      url = parsed_json["url"]
      new(
        id: id,
        event_types: event_types,
        object_type: object_type,
        secret: secret,
        status: status,
        url: url,
        additional_properties: struct
      )
    end
# Serialize an instance of WebhookSubscriptionResourceWithSecret to a JSON object
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
      obj.event_types.is_a?(Array) != false || raise("Passed value for field obj.event_types is not the expected type, validation failed.")
      obj.object_type.is_a?(Monite::WebhookObjectType) != false || raise("Passed value for field obj.object_type is not the expected type, validation failed.")
      obj.secret.is_a?(String) != false || raise("Passed value for field obj.secret is not the expected type, validation failed.")
      obj.status.is_a?(Monite::WebhookSubscriptionStatus) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
      obj.url.is_a?(String) != false || raise("Passed value for field obj.url is not the expected type, validation failed.")
    end
  end
end