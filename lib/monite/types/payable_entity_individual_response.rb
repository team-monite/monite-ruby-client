# frozen_string_literal: true
require "date"
require "date"
require_relative "payable_entity_address_schema"
require_relative "payable_individual_schema"
require_relative "file_schema_4"
require_relative "status_enum"
require "ostruct"
require "json"

module Monite
# A base for an entity response schema
  class PayableEntityIndividualResponse
  # @return [String] UUID entity ID
    attr_reader :id
  # @return [DateTime] UTC datetime
    attr_reader :created_at
  # @return [DateTime] UTC datetime
    attr_reader :updated_at
  # @return [Monite::PayableEntityAddressSchema] 
    attr_reader :address
  # @return [String] An official email address of the entity
    attr_reader :email
  # @return [Monite::PayableIndividualSchema] A set of metadata describing an individual
    attr_reader :individual
  # @return [Monite::FileSchema4] A logo image of the entity
    attr_reader :logo
  # @return [String] A phone number of the entity
    attr_reader :phone
  # @return [Monite::StatusEnum] record status, 'active' by default
    attr_reader :status
  # @return [String] The entity's taxpayer identification number or tax ID. This field is required
#  for entities that are non-VAT registered.
    attr_reader :tax_id
  # @return [String] A website of the entity
    attr_reader :website
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] UUID entity ID
    # @param created_at [DateTime] UTC datetime
    # @param updated_at [DateTime] UTC datetime
    # @param address [Monite::PayableEntityAddressSchema] 
    # @param email [String] An official email address of the entity
    # @param individual [Monite::PayableIndividualSchema] A set of metadata describing an individual
    # @param logo [Monite::FileSchema4] A logo image of the entity
    # @param phone [String] A phone number of the entity
    # @param status [Monite::StatusEnum] record status, 'active' by default
    # @param tax_id [String] The entity's taxpayer identification number or tax ID. This field is required
#  for entities that are non-VAT registered.
    # @param website [String] A website of the entity
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::PayableEntityIndividualResponse]
    def initialize(id:, created_at:, updated_at:, address:, email: OMIT, individual:, logo: OMIT, phone: OMIT, status:, tax_id: OMIT, website: OMIT, additional_properties: nil)
      @id = id
      @created_at = created_at
      @updated_at = updated_at
      @address = address
      @email = email if email != OMIT
      @individual = individual
      @logo = logo if logo != OMIT
      @phone = phone if phone != OMIT
      @status = status
      @tax_id = tax_id if tax_id != OMIT
      @website = website if website != OMIT
      @additional_properties = additional_properties
      @_field_set = { "id": id, "created_at": created_at, "updated_at": updated_at, "address": address, "email": email, "individual": individual, "logo": logo, "phone": phone, "status": status, "tax_id": tax_id, "website": website }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of PayableEntityIndividualResponse
    #
    # @param json_object [String] 
    # @return [Monite::PayableEntityIndividualResponse]
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
      unless parsed_json["address"].nil?
        address = parsed_json["address"].to_json
        address = Monite::PayableEntityAddressSchema.from_json(json_object: address)
      else
        address = nil
      end
      email = parsed_json["email"]
      unless parsed_json["individual"].nil?
        individual = parsed_json["individual"].to_json
        individual = Monite::PayableIndividualSchema.from_json(json_object: individual)
      else
        individual = nil
      end
      unless parsed_json["logo"].nil?
        logo = parsed_json["logo"].to_json
        logo = Monite::FileSchema4.from_json(json_object: logo)
      else
        logo = nil
      end
      phone = parsed_json["phone"]
      status = parsed_json["status"]
      tax_id = parsed_json["tax_id"]
      website = parsed_json["website"]
      new(
        id: id,
        created_at: created_at,
        updated_at: updated_at,
        address: address,
        email: email,
        individual: individual,
        logo: logo,
        phone: phone,
        status: status,
        tax_id: tax_id,
        website: website,
        additional_properties: struct
      )
    end
# Serialize an instance of PayableEntityIndividualResponse to a JSON object
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
      Monite::PayableEntityAddressSchema.validate_raw(obj: obj.address)
      obj.email&.is_a?(String) != false || raise("Passed value for field obj.email is not the expected type, validation failed.")
      Monite::PayableIndividualSchema.validate_raw(obj: obj.individual)
      obj.logo.nil? || Monite::FileSchema4.validate_raw(obj: obj.logo)
      obj.phone&.is_a?(String) != false || raise("Passed value for field obj.phone is not the expected type, validation failed.")
      obj.status.is_a?(Monite::StatusEnum) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
      obj.tax_id&.is_a?(String) != false || raise("Passed value for field obj.tax_id is not the expected type, validation failed.")
      obj.website&.is_a?(String) != false || raise("Passed value for field obj.website is not the expected type, validation failed.")
    end
  end
end