# frozen_string_literal: true
require_relative "update_entity_address_schema"
require_relative "optional_organization_schema"
require_relative "optional_individual_schema"
require "ostruct"
require "json"

module Monite
# A schema for a request to update an entity
  class UpdateEntityRequest
  # @return [Monite::UpdateEntityAddressSchema] An address description of the entity
    attr_reader :address
  # @return [String] An official email address of the entity
    attr_reader :email
  # @return [String] The contact phone number of the entity. Required for US organizations to use
#  payments.
    attr_reader :phone
  # @return [String] A website of the entity
    attr_reader :website
  # @return [String] The entity's taxpayer identification number or tax ID. This field is required
#  for entities that are non-VAT registered.
    attr_reader :tax_id
  # @return [Monite::OptionalOrganizationSchema] A set of meta data describing the organization
    attr_reader :organization
  # @return [Monite::OptionalIndividualSchema] A set of meta data describing the individual
    attr_reader :individual
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param address [Monite::UpdateEntityAddressSchema] An address description of the entity
    # @param email [String] An official email address of the entity
    # @param phone [String] The contact phone number of the entity. Required for US organizations to use
#  payments.
    # @param website [String] A website of the entity
    # @param tax_id [String] The entity's taxpayer identification number or tax ID. This field is required
#  for entities that are non-VAT registered.
    # @param organization [Monite::OptionalOrganizationSchema] A set of meta data describing the organization
    # @param individual [Monite::OptionalIndividualSchema] A set of meta data describing the individual
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::UpdateEntityRequest]
    def initialize(address: OMIT, email: OMIT, phone: OMIT, website: OMIT, tax_id: OMIT, organization: OMIT, individual: OMIT, additional_properties: nil)
      @address = address if address != OMIT
      @email = email if email != OMIT
      @phone = phone if phone != OMIT
      @website = website if website != OMIT
      @tax_id = tax_id if tax_id != OMIT
      @organization = organization if organization != OMIT
      @individual = individual if individual != OMIT
      @additional_properties = additional_properties
      @_field_set = { "address": address, "email": email, "phone": phone, "website": website, "tax_id": tax_id, "organization": organization, "individual": individual }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of UpdateEntityRequest
    #
    # @param json_object [String] 
    # @return [Monite::UpdateEntityRequest]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["address"].nil?
        address = parsed_json["address"].to_json
        address = Monite::UpdateEntityAddressSchema.from_json(json_object: address)
      else
        address = nil
      end
      email = parsed_json["email"]
      phone = parsed_json["phone"]
      website = parsed_json["website"]
      tax_id = parsed_json["tax_id"]
      unless parsed_json["organization"].nil?
        organization = parsed_json["organization"].to_json
        organization = Monite::OptionalOrganizationSchema.from_json(json_object: organization)
      else
        organization = nil
      end
      unless parsed_json["individual"].nil?
        individual = parsed_json["individual"].to_json
        individual = Monite::OptionalIndividualSchema.from_json(json_object: individual)
      else
        individual = nil
      end
      new(
        address: address,
        email: email,
        phone: phone,
        website: website,
        tax_id: tax_id,
        organization: organization,
        individual: individual,
        additional_properties: struct
      )
    end
# Serialize an instance of UpdateEntityRequest to a JSON object
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
      obj.address.nil? || Monite::UpdateEntityAddressSchema.validate_raw(obj: obj.address)
      obj.email&.is_a?(String) != false || raise("Passed value for field obj.email is not the expected type, validation failed.")
      obj.phone&.is_a?(String) != false || raise("Passed value for field obj.phone is not the expected type, validation failed.")
      obj.website&.is_a?(String) != false || raise("Passed value for field obj.website is not the expected type, validation failed.")
      obj.tax_id&.is_a?(String) != false || raise("Passed value for field obj.tax_id is not the expected type, validation failed.")
      obj.organization.nil? || Monite::OptionalOrganizationSchema.validate_raw(obj: obj.organization)
      obj.individual.nil? || Monite::OptionalIndividualSchema.validate_raw(obj: obj.individual)
    end
  end
end