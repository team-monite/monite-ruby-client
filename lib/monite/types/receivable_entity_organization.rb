# frozen_string_literal: true
require "ostruct"
require "json"

module Monite
# A Response schema for an entity of organization type
  class ReceivableEntityOrganization
  # @return [String] An email of the entity
    attr_reader :email
  # @return [String] A link to the entity logo
    attr_reader :logo
  # @return [String] The name of the entity issuing the receivable, when it is an organization.
    attr_reader :name
  # @return [String] A phone number of the entity
    attr_reader :phone
  # @return [String] The Tax ID of the entity issuing the receivable
    attr_reader :tax_id
  # @return [String] The VAT ID of the entity issuing the receivable, when it is an organization.
    attr_reader :vat_id
  # @return [String] A website of the entity
    attr_reader :website
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param email [String] An email of the entity
    # @param logo [String] A link to the entity logo
    # @param name [String] The name of the entity issuing the receivable, when it is an organization.
    # @param phone [String] A phone number of the entity
    # @param tax_id [String] The Tax ID of the entity issuing the receivable
    # @param vat_id [String] The VAT ID of the entity issuing the receivable, when it is an organization.
    # @param website [String] A website of the entity
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::ReceivableEntityOrganization]
    def initialize(email: OMIT, logo: OMIT, name:, phone: OMIT, tax_id: OMIT, vat_id: OMIT, website: OMIT, additional_properties: nil)
      @email = email if email != OMIT
      @logo = logo if logo != OMIT
      @name = name
      @phone = phone if phone != OMIT
      @tax_id = tax_id if tax_id != OMIT
      @vat_id = vat_id if vat_id != OMIT
      @website = website if website != OMIT
      @additional_properties = additional_properties
      @_field_set = { "email": email, "logo": logo, "name": name, "phone": phone, "tax_id": tax_id, "vat_id": vat_id, "website": website }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of ReceivableEntityOrganization
    #
    # @param json_object [String] 
    # @return [Monite::ReceivableEntityOrganization]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      email = parsed_json["email"]
      logo = parsed_json["logo"]
      name = parsed_json["name"]
      phone = parsed_json["phone"]
      tax_id = parsed_json["tax_id"]
      vat_id = parsed_json["vat_id"]
      website = parsed_json["website"]
      new(
        email: email,
        logo: logo,
        name: name,
        phone: phone,
        tax_id: tax_id,
        vat_id: vat_id,
        website: website,
        additional_properties: struct
      )
    end
# Serialize an instance of ReceivableEntityOrganization to a JSON object
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
      obj.email&.is_a?(String) != false || raise("Passed value for field obj.email is not the expected type, validation failed.")
      obj.logo&.is_a?(String) != false || raise("Passed value for field obj.logo is not the expected type, validation failed.")
      obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.phone&.is_a?(String) != false || raise("Passed value for field obj.phone is not the expected type, validation failed.")
      obj.tax_id&.is_a?(String) != false || raise("Passed value for field obj.tax_id is not the expected type, validation failed.")
      obj.vat_id&.is_a?(String) != false || raise("Passed value for field obj.vat_id is not the expected type, validation failed.")
      obj.website&.is_a?(String) != false || raise("Passed value for field obj.website is not the expected type, validation failed.")
    end
  end
end