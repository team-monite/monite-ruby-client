# frozen_string_literal: true
require "json"
require_relative "counterpart_individual_root_update_payload"
require_relative "counterpart_organization_root_update_payload"

module Monite
# This schema is used to update existing counterparts (organizations or
#  individuals).
  class CounterpartUpdatePayload


# Deserialize a JSON object to an instance of CounterpartUpdatePayload
    #
    # @param json_object [String] 
    # @return [Monite::CounterpartUpdatePayload]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      begin
        Monite::CounterpartIndividualRootUpdatePayload.validate_raw(obj: struct)
        unless struct.nil?
  return Monite::CounterpartIndividualRootUpdatePayload.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Monite::CounterpartOrganizationRootUpdatePayload.validate_raw(obj: struct)
        unless struct.nil?
  return Monite::CounterpartOrganizationRootUpdatePayload.from_json(json_object: struct)
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
        return Monite::CounterpartIndividualRootUpdatePayload.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Monite::CounterpartOrganizationRootUpdatePayload.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      raise("Passed value matched no type within the union, validation failed.")
    end
  end
end