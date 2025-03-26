# frozen_string_literal: true
require "json"
require_relative "entity_individual_response"
require_relative "entity_organization_response"

module Monite
# A schema for a response after creation of an entity of different types
  class EntityResponse
  # @return [Object] 
    attr_reader :member
  # @return [String] 
    attr_reader :discriminant

    private_class_method :new
    alias kind_of? is_a?

    # @param member [Object] 
    # @param discriminant [String] 
    # @return [Monite::EntityResponse]
    def initialize(member:, discriminant:)
      @member = member
      @discriminant = discriminant
    end
# Deserialize a JSON object to an instance of EntityResponse
    #
    # @param json_object [String] 
    # @return [Monite::EntityResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      case struct.type
      when "individual"
        member = Monite::EntityIndividualResponse.from_json(json_object: json_object)
      when "organization"
        member = Monite::EntityOrganizationResponse.from_json(json_object: json_object)
      else
        member = Monite::EntityIndividualResponse.from_json(json_object: json_object)
      end
      new(member: member, discriminant: struct.type)
    end
# For Union Types, to_json functionality is delegated to the wrapped member.
    #
    # @return [String]
    def to_json
      case @discriminant
      when "individual"
        { **@member.to_json, type: @discriminant }.to_json
      when "organization"
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
      when "individual"
        Monite::EntityIndividualResponse.validate_raw(obj: obj)
      when "organization"
        Monite::EntityOrganizationResponse.validate_raw(obj: obj)
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
    # @param member [Monite::EntityIndividualResponse] 
    # @return [Monite::EntityResponse]
    def self.individual(member:)
      new(member: member, discriminant: "individual")
    end
    # @param member [Monite::EntityOrganizationResponse] 
    # @return [Monite::EntityResponse]
    def self.organization(member:)
      new(member: member, discriminant: "organization")
    end
  end
end