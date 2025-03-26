# frozen_string_literal: true
require "date"
require "date"
require_relative "object_type"
require_relative "approval_request_status"
require "ostruct"
require "json"

module Monite
  class ApprovalRequestResourceWithMetadata
  # @return [String] 
    attr_reader :id
  # @return [DateTime] 
    attr_reader :created_at
  # @return [DateTime] 
    attr_reader :updated_at
  # @return [Array<String>] 
    attr_reader :approved_by
  # @return [String] ID of the user who created the approval request
    attr_reader :created_by
  # @return [String] 
    attr_reader :object_id
  # @return [Monite::ObjectType] 
    attr_reader :object_type
  # @return [String] 
    attr_reader :rejected_by
  # @return [Integer] 
    attr_reader :required_approval_count
  # @return [Array<String>] 
    attr_reader :role_ids
  # @return [Monite::ApprovalRequestStatus] 
    attr_reader :status
  # @return [Array<String>] 
    attr_reader :user_ids
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] 
    # @param created_at [DateTime] 
    # @param updated_at [DateTime] 
    # @param approved_by [Array<String>] 
    # @param created_by [String] ID of the user who created the approval request
    # @param object_id [String] 
    # @param object_type [Monite::ObjectType] 
    # @param rejected_by [String] 
    # @param required_approval_count [Integer] 
    # @param role_ids [Array<String>] 
    # @param status [Monite::ApprovalRequestStatus] 
    # @param user_ids [Array<String>] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::ApprovalRequestResourceWithMetadata]
    def initialize(id:, created_at:, updated_at:, approved_by:, created_by:, object_id:, object_type:, rejected_by: OMIT, required_approval_count:, role_ids:, status:, user_ids:, additional_properties: nil)
      @id = id
      @created_at = created_at
      @updated_at = updated_at
      @approved_by = approved_by
      @created_by = created_by
      @object_id = object_id
      @object_type = object_type
      @rejected_by = rejected_by if rejected_by != OMIT
      @required_approval_count = required_approval_count
      @role_ids = role_ids
      @status = status
      @user_ids = user_ids
      @additional_properties = additional_properties
      @_field_set = { "id": id, "created_at": created_at, "updated_at": updated_at, "approved_by": approved_by, "created_by": created_by, "object_id": object_id, "object_type": object_type, "rejected_by": rejected_by, "required_approval_count": required_approval_count, "role_ids": role_ids, "status": status, "user_ids": user_ids }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of ApprovalRequestResourceWithMetadata
    #
    # @param json_object [String] 
    # @return [Monite::ApprovalRequestResourceWithMetadata]
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
      approved_by = parsed_json["approved_by"]
      created_by = parsed_json["created_by"]
      object_id = parsed_json["object_id"]
      object_type = parsed_json["object_type"]
      rejected_by = parsed_json["rejected_by"]
      required_approval_count = parsed_json["required_approval_count"]
      role_ids = parsed_json["role_ids"]
      status = parsed_json["status"]
      user_ids = parsed_json["user_ids"]
      new(
        id: id,
        created_at: created_at,
        updated_at: updated_at,
        approved_by: approved_by,
        created_by: created_by,
        object_id: object_id,
        object_type: object_type,
        rejected_by: rejected_by,
        required_approval_count: required_approval_count,
        role_ids: role_ids,
        status: status,
        user_ids: user_ids,
        additional_properties: struct
      )
    end
# Serialize an instance of ApprovalRequestResourceWithMetadata to a JSON object
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
      obj.approved_by.is_a?(Array) != false || raise("Passed value for field obj.approved_by is not the expected type, validation failed.")
      obj.created_by.is_a?(String) != false || raise("Passed value for field obj.created_by is not the expected type, validation failed.")
      obj.object_id.is_a?(String) != false || raise("Passed value for field obj.object_id is not the expected type, validation failed.")
      obj.object_type.is_a?(Monite::ObjectType) != false || raise("Passed value for field obj.object_type is not the expected type, validation failed.")
      obj.rejected_by&.is_a?(String) != false || raise("Passed value for field obj.rejected_by is not the expected type, validation failed.")
      obj.required_approval_count.is_a?(Integer) != false || raise("Passed value for field obj.required_approval_count is not the expected type, validation failed.")
      obj.role_ids.is_a?(Array) != false || raise("Passed value for field obj.role_ids is not the expected type, validation failed.")
      obj.status.is_a?(Monite::ApprovalRequestStatus) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
      obj.user_ids.is_a?(Array) != false || raise("Passed value for field obj.user_ids is not the expected type, validation failed.")
    end
  end
end