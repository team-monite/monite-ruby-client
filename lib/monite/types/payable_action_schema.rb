# frozen_string_literal: true
require_relative "payable_action_enum"
require_relative "permission_enum"
require "ostruct"
require "json"

module Monite
  class PayableActionSchema
  # @return [Monite::PayableActionEnum] Action name
    attr_reader :action_name
  # @return [Monite::PermissionEnum] Permission type
    attr_reader :permission
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param action_name [Monite::PayableActionEnum] Action name
    # @param permission [Monite::PermissionEnum] Permission type
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::PayableActionSchema]
    def initialize(action_name: OMIT, permission: OMIT, additional_properties: nil)
      @action_name = action_name if action_name != OMIT
      @permission = permission if permission != OMIT
      @additional_properties = additional_properties
      @_field_set = { "action_name": action_name, "permission": permission }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of PayableActionSchema
    #
    # @param json_object [String] 
    # @return [Monite::PayableActionSchema]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      action_name = parsed_json["action_name"]
      permission = parsed_json["permission"]
      new(
        action_name: action_name,
        permission: permission,
        additional_properties: struct
      )
    end
# Serialize an instance of PayableActionSchema to a JSON object
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
      obj.action_name&.is_a?(Monite::PayableActionEnum) != false || raise("Passed value for field obj.action_name is not the expected type, validation failed.")
      obj.permission&.is_a?(Monite::PermissionEnum) != false || raise("Passed value for field obj.permission is not the expected type, validation failed.")
    end
  end
end