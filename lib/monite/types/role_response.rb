# frozen_string_literal: true
require_relative "biz_objects_schema_output"
require_relative "status_enum"
require "date"
require "date"
require "ostruct"
require "json"

module Monite
  class RoleResponse
  # @return [String] UUID role ID
    attr_reader :id
  # @return [String] Role name
    attr_reader :name
  # @return [Monite::BizObjectsSchemaOutput] Access permissions
    attr_reader :permissions
  # @return [Monite::StatusEnum] record status, 'active' by default
    attr_reader :status
  # @return [DateTime] UTC datetime
    attr_reader :created_at
  # @return [DateTime] UTC datetime
    attr_reader :updated_at
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] UUID role ID
    # @param name [String] Role name
    # @param permissions [Monite::BizObjectsSchemaOutput] Access permissions
    # @param status [Monite::StatusEnum] record status, 'active' by default
    # @param created_at [DateTime] UTC datetime
    # @param updated_at [DateTime] UTC datetime
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::RoleResponse]
    def initialize(id:, name:, permissions:, status:, created_at:, updated_at:, additional_properties: nil)
      @id = id
      @name = name
      @permissions = permissions
      @status = status
      @created_at = created_at
      @updated_at = updated_at
      @additional_properties = additional_properties
      @_field_set = { "id": id, "name": name, "permissions": permissions, "status": status, "created_at": created_at, "updated_at": updated_at }
    end
# Deserialize a JSON object to an instance of RoleResponse
    #
    # @param json_object [String] 
    # @return [Monite::RoleResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      name = parsed_json["name"]
      unless parsed_json["permissions"].nil?
        permissions = parsed_json["permissions"].to_json
        permissions = Monite::BizObjectsSchemaOutput.from_json(json_object: permissions)
      else
        permissions = nil
      end
      status = parsed_json["status"]
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
      new(
        id: id,
        name: name,
        permissions: permissions,
        status: status,
        created_at: created_at,
        updated_at: updated_at,
        additional_properties: struct
      )
    end
# Serialize an instance of RoleResponse to a JSON object
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
      obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      Monite::BizObjectsSchemaOutput.validate_raw(obj: obj.permissions)
      obj.status.is_a?(Monite::StatusEnum) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
      obj.created_at.is_a?(DateTime) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
      obj.updated_at.is_a?(DateTime) != false || raise("Passed value for field obj.updated_at is not the expected type, validation failed.")
    end
  end
end