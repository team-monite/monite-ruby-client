# frozen_string_literal: true
require "date"
require "date"
require_relative "supported_field_names"
require "ostruct"
require "json"

module Monite
  class ExtraDataResource
  # @return [String] 
    attr_reader :id
  # @return [DateTime] 
    attr_reader :created_at
  # @return [DateTime] 
    attr_reader :updated_at
  # @return [String] 
    attr_reader :created_by
  # @return [Monite::SupportedFieldNames] 
    attr_reader :field_name
  # @return [String] 
    attr_reader :field_value
  # @return [String] 
    attr_reader :object_id
  # @return [String] 
    attr_reader :object_type
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] 
    # @param created_at [DateTime] 
    # @param updated_at [DateTime] 
    # @param created_by [String] 
    # @param field_name [Monite::SupportedFieldNames] 
    # @param field_value [String] 
    # @param object_id [String] 
    # @param object_type [String] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::ExtraDataResource]
    def initialize(id:, created_at:, updated_at:, created_by: OMIT, field_name:, field_value:, object_id:, object_type:, additional_properties: nil)
      @id = id
      @created_at = created_at
      @updated_at = updated_at
      @created_by = created_by if created_by != OMIT
      @field_name = field_name
      @field_value = field_value
      @object_id = object_id
      @object_type = object_type
      @additional_properties = additional_properties
      @_field_set = { "id": id, "created_at": created_at, "updated_at": updated_at, "created_by": created_by, "field_name": field_name, "field_value": field_value, "object_id": object_id, "object_type": object_type }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of ExtraDataResource
    #
    # @param json_object [String] 
    # @return [Monite::ExtraDataResource]
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
      created_by = parsed_json["created_by"]
      field_name = parsed_json["field_name"]
      field_value = parsed_json["field_value"]
      object_id = parsed_json["object_id"]
      object_type = parsed_json["object_type"]
      new(
        id: id,
        created_at: created_at,
        updated_at: updated_at,
        created_by: created_by,
        field_name: field_name,
        field_value: field_value,
        object_id: object_id,
        object_type: object_type,
        additional_properties: struct
      )
    end
# Serialize an instance of ExtraDataResource to a JSON object
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
      obj.created_by&.is_a?(String) != false || raise("Passed value for field obj.created_by is not the expected type, validation failed.")
      obj.field_name.is_a?(Monite::SupportedFieldNames) != false || raise("Passed value for field obj.field_name is not the expected type, validation failed.")
      obj.field_value.is_a?(String) != false || raise("Passed value for field obj.field_value is not the expected type, validation failed.")
      obj.object_id.is_a?(String) != false || raise("Passed value for field obj.object_id is not the expected type, validation failed.")
      obj.object_type.is_a?(String) != false || raise("Passed value for field obj.object_type is not the expected type, validation failed.")
    end
  end
end