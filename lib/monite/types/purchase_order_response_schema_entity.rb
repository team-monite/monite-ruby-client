# frozen_string_literal: true
require "json"
require_relative "payable_entity_individual_response"
require_relative "payable_entity_organization_response"

module Monite
# Data of the entity (address, name, contact)
  class PurchaseOrderResponseSchemaEntity


# Deserialize a JSON object to an instance of PurchaseOrderResponseSchemaEntity
    #
    # @param json_object [String] 
    # @return [Monite::PurchaseOrderResponseSchemaEntity]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      begin
        Monite::PayableEntityIndividualResponse.validate_raw(obj: struct)
        unless struct.nil?
  return Monite::PayableEntityIndividualResponse.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Monite::PayableEntityOrganizationResponse.validate_raw(obj: struct)
        unless struct.nil?
  return Monite::PayableEntityOrganizationResponse.from_json(json_object: struct)
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
        return Monite::PayableEntityIndividualResponse.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Monite::PayableEntityOrganizationResponse.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      raise("Passed value matched no type within the union, validation failed.")
    end
  end
end