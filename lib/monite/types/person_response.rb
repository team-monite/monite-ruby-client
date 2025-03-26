# frozen_string_literal: true
require "date"
require "date"
require_relative "person_address_response"
require_relative "allowed_countries"
require_relative "person_relationship_response"
require "ostruct"
require "json"

module Monite
  class PersonResponse
  # @return [String] The person's unique identifier
    attr_reader :id
  # @return [DateTime] Time at which the person was created
    attr_reader :created_at
  # @return [DateTime] Time at which the person was updated
    attr_reader :updated_at
  # @return [Monite::PersonAddressResponse] The person's address
    attr_reader :address
  # @return [Monite::AllowedCountries] Required for persons of US entities. The country of the person's citizenship, as
#  a two-letter country code (ISO 3166-1 alpha-2). In case of dual or multiple
#  citizenship, specify any.
    attr_reader :citizenship
  # @return [String] ID of the entity user who created this person, or null if the person was created
#  using a partner access token.
    attr_reader :created_by_entity_user_id
  # @return [String] The person's date of birth
    attr_reader :date_of_birth
  # @return [String] The person's email address
    attr_reader :email
  # @return [String] Entity ID
    attr_reader :entity_id
  # @return [String] The person's first name
    attr_reader :first_name
  # @return [String] The person's ID number, as appropriate for their country
    attr_reader :id_number
  # @return [String] The person's last name
    attr_reader :last_name
  # @return [String] The person's phone number
    attr_reader :phone
  # @return [Monite::PersonRelationshipResponse] Describes the person's relationship to the entity
    attr_reader :relationship
  # @return [String] The last four digits of the person's Social Security number
    attr_reader :ssn_last_4
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] The person's unique identifier
    # @param created_at [DateTime] Time at which the person was created
    # @param updated_at [DateTime] Time at which the person was updated
    # @param address [Monite::PersonAddressResponse] The person's address
    # @param citizenship [Monite::AllowedCountries] Required for persons of US entities. The country of the person's citizenship, as
#  a two-letter country code (ISO 3166-1 alpha-2). In case of dual or multiple
#  citizenship, specify any.
    # @param created_by_entity_user_id [String] ID of the entity user who created this person, or null if the person was created
#  using a partner access token.
    # @param date_of_birth [String] The person's date of birth
    # @param email [String] The person's email address
    # @param entity_id [String] Entity ID
    # @param first_name [String] The person's first name
    # @param id_number [String] The person's ID number, as appropriate for their country
    # @param last_name [String] The person's last name
    # @param phone [String] The person's phone number
    # @param relationship [Monite::PersonRelationshipResponse] Describes the person's relationship to the entity
    # @param ssn_last_4 [String] The last four digits of the person's Social Security number
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::PersonResponse]
    def initialize(id:, created_at:, updated_at:, address: OMIT, citizenship: OMIT, created_by_entity_user_id: OMIT, date_of_birth: OMIT, email:, entity_id:, first_name:, id_number: OMIT, last_name:, phone: OMIT, relationship:, ssn_last_4: OMIT, additional_properties: nil)
      @id = id
      @created_at = created_at
      @updated_at = updated_at
      @address = address if address != OMIT
      @citizenship = citizenship if citizenship != OMIT
      @created_by_entity_user_id = created_by_entity_user_id if created_by_entity_user_id != OMIT
      @date_of_birth = date_of_birth if date_of_birth != OMIT
      @email = email
      @entity_id = entity_id
      @first_name = first_name
      @id_number = id_number if id_number != OMIT
      @last_name = last_name
      @phone = phone if phone != OMIT
      @relationship = relationship
      @ssn_last_4 = ssn_last_4 if ssn_last_4 != OMIT
      @additional_properties = additional_properties
      @_field_set = { "id": id, "created_at": created_at, "updated_at": updated_at, "address": address, "citizenship": citizenship, "created_by_entity_user_id": created_by_entity_user_id, "date_of_birth": date_of_birth, "email": email, "entity_id": entity_id, "first_name": first_name, "id_number": id_number, "last_name": last_name, "phone": phone, "relationship": relationship, "ssn_last_4": ssn_last_4 }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of PersonResponse
    #
    # @param json_object [String] 
    # @return [Monite::PersonResponse]
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
        address = Monite::PersonAddressResponse.from_json(json_object: address)
      else
        address = nil
      end
      citizenship = parsed_json["citizenship"]
      created_by_entity_user_id = parsed_json["created_by_entity_user_id"]
      date_of_birth = parsed_json["date_of_birth"]
      email = parsed_json["email"]
      entity_id = parsed_json["entity_id"]
      first_name = parsed_json["first_name"]
      id_number = parsed_json["id_number"]
      last_name = parsed_json["last_name"]
      phone = parsed_json["phone"]
      unless parsed_json["relationship"].nil?
        relationship = parsed_json["relationship"].to_json
        relationship = Monite::PersonRelationshipResponse.from_json(json_object: relationship)
      else
        relationship = nil
      end
      ssn_last_4 = parsed_json["ssn_last_4"]
      new(
        id: id,
        created_at: created_at,
        updated_at: updated_at,
        address: address,
        citizenship: citizenship,
        created_by_entity_user_id: created_by_entity_user_id,
        date_of_birth: date_of_birth,
        email: email,
        entity_id: entity_id,
        first_name: first_name,
        id_number: id_number,
        last_name: last_name,
        phone: phone,
        relationship: relationship,
        ssn_last_4: ssn_last_4,
        additional_properties: struct
      )
    end
# Serialize an instance of PersonResponse to a JSON object
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
      obj.address.nil? || Monite::PersonAddressResponse.validate_raw(obj: obj.address)
      obj.citizenship&.is_a?(Monite::AllowedCountries) != false || raise("Passed value for field obj.citizenship is not the expected type, validation failed.")
      obj.created_by_entity_user_id&.is_a?(String) != false || raise("Passed value for field obj.created_by_entity_user_id is not the expected type, validation failed.")
      obj.date_of_birth&.is_a?(String) != false || raise("Passed value for field obj.date_of_birth is not the expected type, validation failed.")
      obj.email.is_a?(String) != false || raise("Passed value for field obj.email is not the expected type, validation failed.")
      obj.entity_id.is_a?(String) != false || raise("Passed value for field obj.entity_id is not the expected type, validation failed.")
      obj.first_name.is_a?(String) != false || raise("Passed value for field obj.first_name is not the expected type, validation failed.")
      obj.id_number&.is_a?(String) != false || raise("Passed value for field obj.id_number is not the expected type, validation failed.")
      obj.last_name.is_a?(String) != false || raise("Passed value for field obj.last_name is not the expected type, validation failed.")
      obj.phone&.is_a?(String) != false || raise("Passed value for field obj.phone is not the expected type, validation failed.")
      Monite::PersonRelationshipResponse.validate_raw(obj: obj.relationship)
      obj.ssn_last_4&.is_a?(String) != false || raise("Passed value for field obj.ssn_last_4 is not the expected type, validation failed.")
    end
  end
end