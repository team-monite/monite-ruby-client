# frozen_string_literal: true
require "json"
require_relative "purchase_order_counterpart_individual_root_response"
require_relative "purchase_order_counterpart_organization_root_response"

module Monite
# A Counterpart object contains information about an organization (juridical
#  person) or
#  individual (natural person) that provides goods and services to or buys them
#  from an
#  [SME](https://docs.monite.com/docs/glossary#sme).
  class PurchaseOrderCounterpartSchema


# Deserialize a JSON object to an instance of PurchaseOrderCounterpartSchema
    #
    # @param json_object [String] 
    # @return [Monite::PurchaseOrderCounterpartSchema]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      begin
        Monite::PurchaseOrderCounterpartIndividualRootResponse.validate_raw(obj: struct)
        unless struct.nil?
  return Monite::PurchaseOrderCounterpartIndividualRootResponse.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Monite::PurchaseOrderCounterpartOrganizationRootResponse.validate_raw(obj: struct)
        unless struct.nil?
  return Monite::PurchaseOrderCounterpartOrganizationRootResponse.from_json(json_object: struct)
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
        return Monite::PurchaseOrderCounterpartIndividualRootResponse.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Monite::PurchaseOrderCounterpartOrganizationRootResponse.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      raise("Passed value matched no type within the union, validation failed.")
    end
  end
end