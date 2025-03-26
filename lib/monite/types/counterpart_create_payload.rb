# frozen_string_literal: true
require "json"
require_relative "counterpart_organization_root_create_payload"
require_relative "counterpart_individual_root_create_payload"

module Monite
# This schema is used to create new counterparts (either organizations or
#  individuals).
#  The counterpart type is specified by the `type` property. Depending on the
#  `type`,
#  you need to provide the data for either the `individual` or `organization`
#  property.
  class CounterpartCreatePayload
  # @return [Object] 
    attr_reader :member
  # @return [String] 
    attr_reader :discriminant

    private_class_method :new
    alias kind_of? is_a?

    # @param member [Object] 
    # @param discriminant [String] 
    # @return [Monite::CounterpartCreatePayload]
    def initialize(member:, discriminant:)
      @member = member
      @discriminant = discriminant
    end
# Deserialize a JSON object to an instance of CounterpartCreatePayload
    #
    # @param json_object [String] 
    # @return [Monite::CounterpartCreatePayload]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      case struct.type
      when "organization"
        member = Monite::CounterpartOrganizationRootCreatePayload.from_json(json_object: json_object)
      when "individual"
        member = Monite::CounterpartIndividualRootCreatePayload.from_json(json_object: json_object)
      else
        member = Monite::CounterpartOrganizationRootCreatePayload.from_json(json_object: json_object)
      end
      new(member: member, discriminant: struct.type)
    end
# For Union Types, to_json functionality is delegated to the wrapped member.
    #
    # @return [String]
    def to_json
      case @discriminant
      when "organization"
        { **@member.to_json, type: @discriminant }.to_json
      when "individual"
        { **@member.to_json, type: @discriminant }.to_json
      else
        { "type": @discriminant, value: @member }.to_json
      end
      @member.to_json
    end
# Leveraged for Union-type generation, validate_raw attempts to parse the given
#  hash and check each fields type against the current object's property
#  definitions.
    #
    # @param obj [Object] 
    # @return [Void]
    def self.validate_raw(obj:)
      case obj.type
      when "organization"
        Monite::CounterpartOrganizationRootCreatePayload.validate_raw(obj: obj)
      when "individual"
        Monite::CounterpartIndividualRootCreatePayload.validate_raw(obj: obj)
      else
        raise("Passed value matched no type within the union, validation failed.")
      end
    end
# For Union Types, is_a? functionality is delegated to the wrapped member.
    #
    # @param obj [Object] 
    # @return [Boolean]
    def is_a?(obj)
      @member.is_a?(obj)
    end
    # @param member [Monite::CounterpartOrganizationRootCreatePayload] 
    # @return [Monite::CounterpartCreatePayload]
    def self.organization(member:)
      new(member: member, discriminant: "organization")
    end
    # @param member [Monite::CounterpartIndividualRootCreatePayload] 
    # @return [Monite::CounterpartCreatePayload]
    def self.individual(member:)
      new(member: member, discriminant: "individual")
    end
  end
end