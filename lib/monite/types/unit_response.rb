# frozen_string_literal: true
require "date"
require "date"
require "ostruct"
require "json"

module Monite
  class UnitResponse
  # @return [String] 
    attr_reader :id
  # @return [DateTime] 
    attr_reader :created_at
  # @return [DateTime] 
    attr_reader :updated_at
  # @return [String] 
    attr_reader :description
  # @return [String] 
    attr_reader :name
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] 
    # @param created_at [DateTime] 
    # @param updated_at [DateTime] 
    # @param description [String] 
    # @param name [String] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::UnitResponse]
    def initialize(id:, created_at:, updated_at:, description: OMIT, name:, additional_properties: nil)
      @id = id
      @created_at = created_at
      @updated_at = updated_at
      @description = description if description != OMIT
      @name = name
      @additional_properties = additional_properties
      @_field_set = { "id": id, "created_at": created_at, "updated_at": updated_at, "description": description, "name": name }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of UnitResponse
    #
    # @param json_object [String] 
    # @return [Monite::UnitResponse]
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
      description = parsed_json["description"]
      name = parsed_json["name"]
      new(
        id: id,
        created_at: created_at,
        updated_at: updated_at,
        description: description,
        name: name,
        additional_properties: struct
      )
    end
# Serialize an instance of UnitResponse to a JSON object
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
      obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
      obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
    end
  end
end