# frozen_string_literal: true
require_relative "object_type"
require "ostruct"
require "json"

module Monite
  class ApprovalRequestCreateByRoleRequest
  # @return [String] 
    attr_reader :object_id
  # @return [Monite::ObjectType] 
    attr_reader :object_type
  # @return [Integer] 
    attr_reader :required_approval_count
  # @return [Array<String>] 
    attr_reader :role_ids
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param object_id [String] 
    # @param object_type [Monite::ObjectType] 
    # @param required_approval_count [Integer] 
    # @param role_ids [Array<String>] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::ApprovalRequestCreateByRoleRequest]
    def initialize(object_id:, object_type:, required_approval_count:, role_ids:, additional_properties: nil)
      @object_id = object_id
      @object_type = object_type
      @required_approval_count = required_approval_count
      @role_ids = role_ids
      @additional_properties = additional_properties
      @_field_set = { "object_id": object_id, "object_type": object_type, "required_approval_count": required_approval_count, "role_ids": role_ids }
    end
# Deserialize a JSON object to an instance of ApprovalRequestCreateByRoleRequest
    #
    # @param json_object [String] 
    # @return [Monite::ApprovalRequestCreateByRoleRequest]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      object_id = parsed_json["object_id"]
      object_type = parsed_json["object_type"]
      required_approval_count = parsed_json["required_approval_count"]
      role_ids = parsed_json["role_ids"]
      new(
        object_id: object_id,
        object_type: object_type,
        required_approval_count: required_approval_count,
        role_ids: role_ids,
        additional_properties: struct
      )
    end
# Serialize an instance of ApprovalRequestCreateByRoleRequest to a JSON object
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
      obj.object_id.is_a?(String) != false || raise("Passed value for field obj.object_id is not the expected type, validation failed.")
      obj.object_type.is_a?(Monite::ObjectType) != false || raise("Passed value for field obj.object_type is not the expected type, validation failed.")
      obj.required_approval_count.is_a?(Integer) != false || raise("Passed value for field obj.required_approval_count is not the expected type, validation failed.")
      obj.role_ids.is_a?(Array) != false || raise("Passed value for field obj.role_ids is not the expected type, validation failed.")
    end
  end
end