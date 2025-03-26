# frozen_string_literal: true
require_relative "business_profile_output"
require_relative "ownership_declaration_output"
require_relative "terms_of_service_acceptance_output"
require "ostruct"
require "json"

module Monite
  class EntityOnboardingDataResponse
  # @return [Monite::BusinessProfileOutput] Business information about the entity.
    attr_reader :business_profile
  # @return [Monite::OwnershipDeclarationOutput] Used to attest that the beneficial owner information provided is both current
#  and correct.
    attr_reader :ownership_declaration
  # @return [Monite::TermsOfServiceAcceptanceOutput] Details on the entity's acceptance of the service agreement.
    attr_reader :tos_acceptance
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param business_profile [Monite::BusinessProfileOutput] Business information about the entity.
    # @param ownership_declaration [Monite::OwnershipDeclarationOutput] Used to attest that the beneficial owner information provided is both current
#  and correct.
    # @param tos_acceptance [Monite::TermsOfServiceAcceptanceOutput] Details on the entity's acceptance of the service agreement.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::EntityOnboardingDataResponse]
    def initialize(business_profile: OMIT, ownership_declaration: OMIT, tos_acceptance: OMIT, additional_properties: nil)
      @business_profile = business_profile if business_profile != OMIT
      @ownership_declaration = ownership_declaration if ownership_declaration != OMIT
      @tos_acceptance = tos_acceptance if tos_acceptance != OMIT
      @additional_properties = additional_properties
      @_field_set = { "business_profile": business_profile, "ownership_declaration": ownership_declaration, "tos_acceptance": tos_acceptance }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of EntityOnboardingDataResponse
    #
    # @param json_object [String] 
    # @return [Monite::EntityOnboardingDataResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["business_profile"].nil?
        business_profile = parsed_json["business_profile"].to_json
        business_profile = Monite::BusinessProfileOutput.from_json(json_object: business_profile)
      else
        business_profile = nil
      end
      unless parsed_json["ownership_declaration"].nil?
        ownership_declaration = parsed_json["ownership_declaration"].to_json
        ownership_declaration = Monite::OwnershipDeclarationOutput.from_json(json_object: ownership_declaration)
      else
        ownership_declaration = nil
      end
      unless parsed_json["tos_acceptance"].nil?
        tos_acceptance = parsed_json["tos_acceptance"].to_json
        tos_acceptance = Monite::TermsOfServiceAcceptanceOutput.from_json(json_object: tos_acceptance)
      else
        tos_acceptance = nil
      end
      new(
        business_profile: business_profile,
        ownership_declaration: ownership_declaration,
        tos_acceptance: tos_acceptance,
        additional_properties: struct
      )
    end
# Serialize an instance of EntityOnboardingDataResponse to a JSON object
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
      obj.business_profile.nil? || Monite::BusinessProfileOutput.validate_raw(obj: obj.business_profile)
      obj.ownership_declaration.nil? || Monite::OwnershipDeclarationOutput.validate_raw(obj: obj.ownership_declaration)
      obj.tos_acceptance.nil? || Monite::TermsOfServiceAcceptanceOutput.validate_raw(obj: obj.tos_acceptance)
    end
  end
end