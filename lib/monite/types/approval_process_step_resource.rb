# frozen_string_literal: true
require_relative "approval_process_step_status"
require "ostruct"
require "json"

module Monite
  class ApprovalProcessStepResource
  # @return [String] 
    attr_reader :object_id
  # @return [Integer] 
    attr_reader :required_approval_count
  # @return [Monite::ApprovalProcessStepStatus] 
    attr_reader :status
  # @return [Array<String>] 
    attr_reader :user_ids
  # @return [Array<String>] 
    attr_reader :role_ids
  # @return [Array<String>] 
    attr_reader :approved_by
  # @return [String] 
    attr_reader :rejected_by
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param object_id [String] 
    # @param required_approval_count [Integer] 
    # @param status [Monite::ApprovalProcessStepStatus] 
    # @param user_ids [Array<String>] 
    # @param role_ids [Array<String>] 
    # @param approved_by [Array<String>] 
    # @param rejected_by [String] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::ApprovalProcessStepResource]
    def initialize(object_id:, required_approval_count:, status:, user_ids:, role_ids:, approved_by:, rejected_by: OMIT, additional_properties: nil)
      @object_id = object_id
      @required_approval_count = required_approval_count
      @status = status
      @user_ids = user_ids
      @role_ids = role_ids
      @approved_by = approved_by
      @rejected_by = rejected_by if rejected_by != OMIT
      @additional_properties = additional_properties
      @_field_set = { "object_id": object_id, "required_approval_count": required_approval_count, "status": status, "user_ids": user_ids, "role_ids": role_ids, "approved_by": approved_by, "rejected_by": rejected_by }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of ApprovalProcessStepResource
    #
    # @param json_object [String] 
    # @return [Monite::ApprovalProcessStepResource]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      object_id = parsed_json["object_id"]
      required_approval_count = parsed_json["required_approval_count"]
      status = parsed_json["status"]
      user_ids = parsed_json["user_ids"]
      role_ids = parsed_json["role_ids"]
      approved_by = parsed_json["approved_by"]
      rejected_by = parsed_json["rejected_by"]
      new(
        object_id: object_id,
        required_approval_count: required_approval_count,
        status: status,
        user_ids: user_ids,
        role_ids: role_ids,
        approved_by: approved_by,
        rejected_by: rejected_by,
        additional_properties: struct
      )
    end
# Serialize an instance of ApprovalProcessStepResource to a JSON object
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
      obj.required_approval_count.is_a?(Integer) != false || raise("Passed value for field obj.required_approval_count is not the expected type, validation failed.")
      obj.status.is_a?(Monite::ApprovalProcessStepStatus) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
      obj.user_ids.is_a?(Array) != false || raise("Passed value for field obj.user_ids is not the expected type, validation failed.")
      obj.role_ids.is_a?(Array) != false || raise("Passed value for field obj.role_ids is not the expected type, validation failed.")
      obj.approved_by.is_a?(Array) != false || raise("Passed value for field obj.approved_by is not the expected type, validation failed.")
      obj.rejected_by&.is_a?(String) != false || raise("Passed value for field obj.rejected_by is not the expected type, validation failed.")
    end
  end
end