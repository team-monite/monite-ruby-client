# frozen_string_literal: true
require "date"
require "date"
require_relative "tag_category"
require "ostruct"
require "json"

module Monite
# Represents a user-defined tag that can be assigned to resources to filter them.
  class TagReadSchema
  # @return [String] A unique ID of this tag.
    attr_reader :id
  # @return [DateTime] Date and time when the tag was created. Timestamps follow the [ISO
#  8601](https://en.wikipedia.org/wiki/ISO_8601) standard.
    attr_reader :created_at
  # @return [DateTime] Date and time when the tag was last updated. Timestamps follow the [ISO
#  8601](https://en.wikipedia.org/wiki/ISO_8601) standard.
    attr_reader :updated_at
  # @return [Monite::TagCategory] The tag category.
    attr_reader :category
  # @return [String] ID of the user who created the tag.
    attr_reader :created_by_entity_user_id
  # @return [String] The tag description.
    attr_reader :description
  # @return [String] The tag name.
    attr_reader :name
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] A unique ID of this tag.
    # @param created_at [DateTime] Date and time when the tag was created. Timestamps follow the [ISO
#  8601](https://en.wikipedia.org/wiki/ISO_8601) standard.
    # @param updated_at [DateTime] Date and time when the tag was last updated. Timestamps follow the [ISO
#  8601](https://en.wikipedia.org/wiki/ISO_8601) standard.
    # @param category [Monite::TagCategory] The tag category.
    # @param created_by_entity_user_id [String] ID of the user who created the tag.
    # @param description [String] The tag description.
    # @param name [String] The tag name.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::TagReadSchema]
    def initialize(id:, created_at:, updated_at:, category: OMIT, created_by_entity_user_id: OMIT, description: OMIT, name:, additional_properties: nil)
      @id = id
      @created_at = created_at
      @updated_at = updated_at
      @category = category if category != OMIT
      @created_by_entity_user_id = created_by_entity_user_id if created_by_entity_user_id != OMIT
      @description = description if description != OMIT
      @name = name
      @additional_properties = additional_properties
      @_field_set = { "id": id, "created_at": created_at, "updated_at": updated_at, "category": category, "created_by_entity_user_id": created_by_entity_user_id, "description": description, "name": name }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of TagReadSchema
    #
    # @param json_object [String] 
    # @return [Monite::TagReadSchema]
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
      category = parsed_json["category"]
      created_by_entity_user_id = parsed_json["created_by_entity_user_id"]
      description = parsed_json["description"]
      name = parsed_json["name"]
      new(
        id: id,
        created_at: created_at,
        updated_at: updated_at,
        category: category,
        created_by_entity_user_id: created_by_entity_user_id,
        description: description,
        name: name,
        additional_properties: struct
      )
    end
# Serialize an instance of TagReadSchema to a JSON object
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
      obj.updated_at.is_a?(DateTime) != false || raise("Passed value for field obj.updated_at is not the expected type, validation failed.")
      obj.category&.is_a?(Monite::TagCategory) != false || raise("Passed value for field obj.category is not the expected type, validation failed.")
      obj.created_by_entity_user_id&.is_a?(String) != false || raise("Passed value for field obj.created_by_entity_user_id is not the expected type, validation failed.")
      obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
      obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
    end
  end
end