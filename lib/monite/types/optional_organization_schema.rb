# frozen_string_literal: true
require_relative "entity_business_structure"
require "ostruct"
require "json"

module Monite
# A schema contains metadata for updating an organization
  class OptionalOrganizationSchema
  # @return [Monite::EntityBusinessStructure] Business structure of the company
    attr_reader :business_structure
  # @return [Boolean] 
    attr_reader :directors_provided
  # @return [Boolean] 
    attr_reader :executives_provided
  # @return [String] A code which identifies uniquely a party of a transaction worldwide
    attr_reader :legal_entity_id
  # @return [String] A legal name of an organization
    attr_reader :legal_name
  # @return [Boolean] 
    attr_reader :owners_provided
  # @return [Boolean] 
    attr_reader :representative_provided
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param business_structure [Monite::EntityBusinessStructure] Business structure of the company
    # @param directors_provided [Boolean] 
    # @param executives_provided [Boolean] 
    # @param legal_entity_id [String] A code which identifies uniquely a party of a transaction worldwide
    # @param legal_name [String] A legal name of an organization
    # @param owners_provided [Boolean] 
    # @param representative_provided [Boolean] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::OptionalOrganizationSchema]
    def initialize(business_structure: OMIT, directors_provided: OMIT, executives_provided: OMIT, legal_entity_id: OMIT, legal_name: OMIT, owners_provided: OMIT, representative_provided: OMIT, additional_properties: nil)
      @business_structure = business_structure if business_structure != OMIT
      @directors_provided = directors_provided if directors_provided != OMIT
      @executives_provided = executives_provided if executives_provided != OMIT
      @legal_entity_id = legal_entity_id if legal_entity_id != OMIT
      @legal_name = legal_name if legal_name != OMIT
      @owners_provided = owners_provided if owners_provided != OMIT
      @representative_provided = representative_provided if representative_provided != OMIT
      @additional_properties = additional_properties
      @_field_set = { "business_structure": business_structure, "directors_provided": directors_provided, "executives_provided": executives_provided, "legal_entity_id": legal_entity_id, "legal_name": legal_name, "owners_provided": owners_provided, "representative_provided": representative_provided }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of OptionalOrganizationSchema
    #
    # @param json_object [String] 
    # @return [Monite::OptionalOrganizationSchema]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      business_structure = parsed_json["business_structure"]
      directors_provided = parsed_json["directors_provided"]
      executives_provided = parsed_json["executives_provided"]
      legal_entity_id = parsed_json["legal_entity_id"]
      legal_name = parsed_json["legal_name"]
      owners_provided = parsed_json["owners_provided"]
      representative_provided = parsed_json["representative_provided"]
      new(
        business_structure: business_structure,
        directors_provided: directors_provided,
        executives_provided: executives_provided,
        legal_entity_id: legal_entity_id,
        legal_name: legal_name,
        owners_provided: owners_provided,
        representative_provided: representative_provided,
        additional_properties: struct
      )
    end
# Serialize an instance of OptionalOrganizationSchema to a JSON object
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
      obj.business_structure&.is_a?(Monite::EntityBusinessStructure) != false || raise("Passed value for field obj.business_structure is not the expected type, validation failed.")
      obj.directors_provided&.is_a?(Boolean) != false || raise("Passed value for field obj.directors_provided is not the expected type, validation failed.")
      obj.executives_provided&.is_a?(Boolean) != false || raise("Passed value for field obj.executives_provided is not the expected type, validation failed.")
      obj.legal_entity_id&.is_a?(String) != false || raise("Passed value for field obj.legal_entity_id is not the expected type, validation failed.")
      obj.legal_name&.is_a?(String) != false || raise("Passed value for field obj.legal_name is not the expected type, validation failed.")
      obj.owners_provided&.is_a?(Boolean) != false || raise("Passed value for field obj.owners_provided is not the expected type, validation failed.")
      obj.representative_provided&.is_a?(Boolean) != false || raise("Passed value for field obj.representative_provided is not the expected type, validation failed.")
    end
  end
end