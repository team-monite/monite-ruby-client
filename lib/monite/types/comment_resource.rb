# frozen_string_literal: true
require "date"
require "date"
require_relative "status_enum"
require "ostruct"
require "json"

module Monite
  class CommentResource
  # @return [String] 
    attr_reader :id
  # @return [DateTime] 
    attr_reader :created_at
  # @return [DateTime] 
    attr_reader :updated_at
  # @return [String] 
    attr_reader :created_by_entity_user_id
  # @return [String] 
    attr_reader :entity_id
  # @return [String] 
    attr_reader :object_id
  # @return [String] 
    attr_reader :object_type
  # @return [String] 
    attr_reader :reply_to_entity_user_id
  # @return [Monite::StatusEnum] 
    attr_reader :status
  # @return [String] 
    attr_reader :text
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] 
    # @param created_at [DateTime] 
    # @param updated_at [DateTime] 
    # @param created_by_entity_user_id [String] 
    # @param entity_id [String] 
    # @param object_id [String] 
    # @param object_type [String] 
    # @param reply_to_entity_user_id [String] 
    # @param status [Monite::StatusEnum] 
    # @param text [String] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::CommentResource]
    def initialize(id:, created_at: OMIT, updated_at: OMIT, created_by_entity_user_id:, entity_id:, object_id:, object_type:, reply_to_entity_user_id: OMIT, status:, text:, additional_properties: nil)
      @id = id
      @created_at = created_at if created_at != OMIT
      @updated_at = updated_at if updated_at != OMIT
      @created_by_entity_user_id = created_by_entity_user_id
      @entity_id = entity_id
      @object_id = object_id
      @object_type = object_type
      @reply_to_entity_user_id = reply_to_entity_user_id if reply_to_entity_user_id != OMIT
      @status = status
      @text = text
      @additional_properties = additional_properties
      @_field_set = { "id": id, "created_at": created_at, "updated_at": updated_at, "created_by_entity_user_id": created_by_entity_user_id, "entity_id": entity_id, "object_id": object_id, "object_type": object_type, "reply_to_entity_user_id": reply_to_entity_user_id, "status": status, "text": text }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of CommentResource
    #
    # @param json_object [String] 
    # @return [Monite::CommentResource]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      created_at = unless parsed_json["created_at"].nil?
  DateTime.parse(parsed_json["created_at"])
else
  nil
end
      updated_at = unless parsed_json["updated_at"].nil?
  DateTime.parse(parsed_json["updated_at"])
else
  nil
end
      created_by_entity_user_id = parsed_json["created_by_entity_user_id"]
      entity_id = parsed_json["entity_id"]
      object_id = parsed_json["object_id"]
      object_type = parsed_json["object_type"]
      reply_to_entity_user_id = parsed_json["reply_to_entity_user_id"]
      status = parsed_json["status"]
      text = parsed_json["text"]
      new(
        id: id,
        created_at: created_at,
        updated_at: updated_at,
        created_by_entity_user_id: created_by_entity_user_id,
        entity_id: entity_id,
        object_id: object_id,
        object_type: object_type,
        reply_to_entity_user_id: reply_to_entity_user_id,
        status: status,
        text: text,
        additional_properties: struct
      )
    end
# Serialize an instance of CommentResource to a JSON object
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
      obj.updated_at&.is_a?(DateTime) != false || raise("Passed value for field obj.updated_at is not the expected type, validation failed.")
      obj.created_by_entity_user_id.is_a?(String) != false || raise("Passed value for field obj.created_by_entity_user_id is not the expected type, validation failed.")
      obj.entity_id.is_a?(String) != false || raise("Passed value for field obj.entity_id is not the expected type, validation failed.")
      obj.object_id.is_a?(String) != false || raise("Passed value for field obj.object_id is not the expected type, validation failed.")
      obj.object_type.is_a?(String) != false || raise("Passed value for field obj.object_type is not the expected type, validation failed.")
      obj.reply_to_entity_user_id&.is_a?(String) != false || raise("Passed value for field obj.reply_to_entity_user_id is not the expected type, validation failed.")
      obj.status.is_a?(Monite::StatusEnum) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
      obj.text.is_a?(String) != false || raise("Passed value for field obj.text is not the expected type, validation failed.")
    end
  end
end