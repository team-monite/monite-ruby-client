# frozen_string_literal: true
require "json"
require_relative "approval_request_create_by_role_request"
require_relative "approval_request_create_by_user_request"

module Monite
  class ApprovalRequestCreateRequest


# Deserialize a JSON object to an instance of ApprovalRequestCreateRequest
    #
    # @param json_object [String] 
    # @return [Monite::ApprovalRequestCreateRequest]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      begin
        Monite::ApprovalRequestCreateByRoleRequest.validate_raw(obj: struct)
        unless struct.nil?
  return Monite::ApprovalRequestCreateByRoleRequest.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Monite::ApprovalRequestCreateByUserRequest.validate_raw(obj: struct)
        unless struct.nil?
  return Monite::ApprovalRequestCreateByUserRequest.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
 return struct
    end
# Leveraged for Union-type generation, validate_raw attempts to parse the given
#  hash and check each fields type against the current object's property
#  definitions.
    #
    # @param obj [Object] 
    # @return [Void]
    def self.validate_raw(obj:)
      begin
        return Monite::ApprovalRequestCreateByRoleRequest.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Monite::ApprovalRequestCreateByUserRequest.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      raise("Passed value matched no type within the union, validation failed.")
    end
  end
end