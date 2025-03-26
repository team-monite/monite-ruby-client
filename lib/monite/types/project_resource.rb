# frozen_string_literal: true
require "date"
require "date"
require_relative "tag_read_schema"
require "ostruct"
require "json"

module Monite
  class ProjectResource
  # @return [String] A unique ID assigned to this project.
    attr_reader :id
  # @return [DateTime] Project created at
    attr_reader :created_at
  # @return [DateTime] Last time project was updated at
    attr_reader :updated_at
  # @return [String] Project code
    attr_reader :code
  # @return [String] Project color
    attr_reader :color
  # @return [String] Project created by entity user
    attr_reader :created_by_entity_user_id
  # @return [String] Description of project
    attr_reader :description
  # @return [String] Project end date
    attr_reader :end_date
  # @return [String] The ID of the entity to which the project was issued.
    attr_reader :entity_id
  # @return [String] The project name.
    attr_reader :name
  # @return [String] Parent project ID
    attr_reader :parent_id
  # @return [Hash{String => Object}] Project metadata
    attr_reader :partner_metadata
  # @return [String] Project start date
    attr_reader :start_date
  # @return [Array<Monite::TagReadSchema>] A list of user-defined tags (labels) assigned to this project.
    attr_reader :tags
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] A unique ID assigned to this project.
    # @param created_at [DateTime] Project created at
    # @param updated_at [DateTime] Last time project was updated at
    # @param code [String] Project code
    # @param color [String] Project color
    # @param created_by_entity_user_id [String] Project created by entity user
    # @param description [String] Description of project
    # @param end_date [String] Project end date
    # @param entity_id [String] The ID of the entity to which the project was issued.
    # @param name [String] The project name.
    # @param parent_id [String] Parent project ID
    # @param partner_metadata [Hash{String => Object}] Project metadata
    # @param start_date [String] Project start date
    # @param tags [Array<Monite::TagReadSchema>] A list of user-defined tags (labels) assigned to this project.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::ProjectResource]
    def initialize(id:, created_at:, updated_at:, code: OMIT, color: OMIT, created_by_entity_user_id: OMIT, description: OMIT, end_date: OMIT, entity_id:, name:, parent_id: OMIT, partner_metadata: OMIT, start_date: OMIT, tags: OMIT, additional_properties: nil)
      @id = id
      @created_at = created_at
      @updated_at = updated_at
      @code = code if code != OMIT
      @color = color if color != OMIT
      @created_by_entity_user_id = created_by_entity_user_id if created_by_entity_user_id != OMIT
      @description = description if description != OMIT
      @end_date = end_date if end_date != OMIT
      @entity_id = entity_id
      @name = name
      @parent_id = parent_id if parent_id != OMIT
      @partner_metadata = partner_metadata if partner_metadata != OMIT
      @start_date = start_date if start_date != OMIT
      @tags = tags if tags != OMIT
      @additional_properties = additional_properties
      @_field_set = { "id": id, "created_at": created_at, "updated_at": updated_at, "code": code, "color": color, "created_by_entity_user_id": created_by_entity_user_id, "description": description, "end_date": end_date, "entity_id": entity_id, "name": name, "parent_id": parent_id, "partner_metadata": partner_metadata, "start_date": start_date, "tags": tags }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of ProjectResource
    #
    # @param json_object [String] 
    # @return [Monite::ProjectResource]
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
      code = parsed_json["code"]
      color = parsed_json["color"]
      created_by_entity_user_id = parsed_json["created_by_entity_user_id"]
      description = parsed_json["description"]
      end_date = parsed_json["end_date"]
      entity_id = parsed_json["entity_id"]
      name = parsed_json["name"]
      parent_id = parsed_json["parent_id"]
      partner_metadata = parsed_json["partner_metadata"]
      start_date = parsed_json["start_date"]
      tags = parsed_json["tags"]&.map do | item |
  item = item.to_json
  Monite::TagReadSchema.from_json(json_object: item)
end
      new(
        id: id,
        created_at: created_at,
        updated_at: updated_at,
        code: code,
        color: color,
        created_by_entity_user_id: created_by_entity_user_id,
        description: description,
        end_date: end_date,
        entity_id: entity_id,
        name: name,
        parent_id: parent_id,
        partner_metadata: partner_metadata,
        start_date: start_date,
        tags: tags,
        additional_properties: struct
      )
    end
# Serialize an instance of ProjectResource to a JSON object
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
      obj.code&.is_a?(String) != false || raise("Passed value for field obj.code is not the expected type, validation failed.")
      obj.color&.is_a?(String) != false || raise("Passed value for field obj.color is not the expected type, validation failed.")
      obj.created_by_entity_user_id&.is_a?(String) != false || raise("Passed value for field obj.created_by_entity_user_id is not the expected type, validation failed.")
      obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
      obj.end_date&.is_a?(String) != false || raise("Passed value for field obj.end_date is not the expected type, validation failed.")
      obj.entity_id.is_a?(String) != false || raise("Passed value for field obj.entity_id is not the expected type, validation failed.")
      obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.parent_id&.is_a?(String) != false || raise("Passed value for field obj.parent_id is not the expected type, validation failed.")
      obj.partner_metadata&.is_a?(Hash) != false || raise("Passed value for field obj.partner_metadata is not the expected type, validation failed.")
      obj.start_date&.is_a?(String) != false || raise("Passed value for field obj.start_date is not the expected type, validation failed.")
      obj.tags&.is_a?(Array) != false || raise("Passed value for field obj.tags is not the expected type, validation failed.")
    end
  end
end