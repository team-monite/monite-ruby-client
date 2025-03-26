# frozen_string_literal: true
require "date"
require_relative "webhook_object_type"
require "ostruct"
require "json"

module Monite
  class EventResourceForWebhookClient
  # @return [String] 
    attr_reader :id
  # @return [DateTime] The timestamp that was generated at the time of making the database transaction
#  that has initially caused the event
    attr_reader :created_at
  # @return [String] 
    attr_reader :action
  # @return [String] 
    attr_reader :api_version
  # @return [String] 
    attr_reader :description
  # @return [String] 
    attr_reader :entity_id
  # @return [Object] 
    attr_reader :object
  # @return [Monite::WebhookObjectType] 
    attr_reader :object_type
  # @return [String] 
    attr_reader :webhook_subscription_id
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] 
    # @param created_at [DateTime] The timestamp that was generated at the time of making the database transaction
#  that has initially caused the event
    # @param action [String] 
    # @param api_version [String] 
    # @param description [String] 
    # @param entity_id [String] 
    # @param object [Object] 
    # @param object_type [Monite::WebhookObjectType] 
    # @param webhook_subscription_id [String] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::EventResourceForWebhookClient]
    def initialize(id:, created_at: OMIT, action:, api_version: OMIT, description:, entity_id:, object: OMIT, object_type:, webhook_subscription_id:, additional_properties: nil)
      @id = id
      @created_at = created_at if created_at != OMIT
      @action = action
      @api_version = api_version if api_version != OMIT
      @description = description
      @entity_id = entity_id
      @object = object if object != OMIT
      @object_type = object_type
      @webhook_subscription_id = webhook_subscription_id
      @additional_properties = additional_properties
      @_field_set = { "id": id, "created_at": created_at, "action": action, "api_version": api_version, "description": description, "entity_id": entity_id, "object": object, "object_type": object_type, "webhook_subscription_id": webhook_subscription_id }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of EventResourceForWebhookClient
    #
    # @param json_object [String] 
    # @return [Monite::EventResourceForWebhookClient]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      created_at = unless parsed_json["created_at"].nil?
  DateTime.parse(parsed_json["created_at"])
else
  nil
end
      action = parsed_json["action"]
      api_version = parsed_json["api_version"]
      description = parsed_json["description"]
      entity_id = parsed_json["entity_id"]
      object = parsed_json["object"]
      object_type = parsed_json["object_type"]
      webhook_subscription_id = parsed_json["webhook_subscription_id"]
      new(
        id: id,
        created_at: created_at,
        action: action,
        api_version: api_version,
        description: description,
        entity_id: entity_id,
        object: object,
        object_type: object_type,
        webhook_subscription_id: webhook_subscription_id,
        additional_properties: struct
      )
    end
# Serialize an instance of EventResourceForWebhookClient to a JSON object
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
      obj.created_at&.is_a?(DateTime) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
      obj.action.is_a?(String) != false || raise("Passed value for field obj.action is not the expected type, validation failed.")
      obj.api_version&.is_a?(String) != false || raise("Passed value for field obj.api_version is not the expected type, validation failed.")
      obj.description.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
      obj.entity_id.is_a?(String) != false || raise("Passed value for field obj.entity_id is not the expected type, validation failed.")
      obj.object&.is_a?(Object) != false || raise("Passed value for field obj.object is not the expected type, validation failed.")
      obj.object_type.is_a?(Monite::WebhookObjectType) != false || raise("Passed value for field obj.object_type is not the expected type, validation failed.")
      obj.webhook_subscription_id.is_a?(String) != false || raise("Passed value for field obj.webhook_subscription_id is not the expected type, validation failed.")
    end
  end
end