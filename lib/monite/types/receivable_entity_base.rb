# frozen_string_literal: true
require "ostruct"
require "json"

module Monite
# A base schemas for an entity
  class ReceivableEntityBase
  # @return [String] An email of the entity
    attr_reader :email
  # @return [String] A link to the entity logo
    attr_reader :logo
  # @return [String] A phone number of the entity
    attr_reader :phone
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
    # @param phone [String] A phone number of the entity
    # @param website [String] A website of the entity
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::ReceivableEntityBase]
    def initialize(email: OMIT, logo: OMIT, phone: OMIT, website: OMIT, additional_properties: nil)
      @email = email if email != OMIT
      @logo = logo if logo != OMIT
      @phone = phone if phone != OMIT
      @website = website if website != OMIT
      @additional_properties = additional_properties
      @_field_set = { "email": email, "logo": logo, "phone": phone, "website": website }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of ReceivableEntityBase
    #
    # @param json_object [String] 
    # @return [Monite::ReceivableEntityBase]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      email = parsed_json["email"]
      logo = parsed_json["logo"]
      phone = parsed_json["phone"]
      website = parsed_json["website"]
      new(
        email: email,
        logo: logo,
        phone: phone,
        website: website,
        additional_properties: struct
      )
    end
# Serialize an instance of ReceivableEntityBase to a JSON object
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
      obj.phone&.is_a?(String) != false || raise("Passed value for field obj.phone is not the expected type, validation failed.")
      obj.website&.is_a?(String) != false || raise("Passed value for field obj.website is not the expected type, validation failed.")
    end
  end
end