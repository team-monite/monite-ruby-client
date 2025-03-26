# frozen_string_literal: true
require_relative "counterpart_address"
require "ostruct"
require "json"

module Monite
# The contact person for an organization.
  class CounterpartContactResponse
  # @return [String] 
    attr_reader :id
  # @return [Monite::CounterpartAddress] The address of a contact person.
    attr_reader :address
  # @return [String] 
    attr_reader :counterpart_id
  # @return [String] The email address of a contact person.
    attr_reader :email
  # @return [String] The first name of a contact person.
    attr_reader :first_name
  # @return [Boolean] 
    attr_reader :is_default
  # @return [String] The last name of a contact person.
    attr_reader :last_name
  # @return [String] The phone number of a contact person
    attr_reader :phone
  # @return [String] The title or honorific of a contact person. Examples: Mr., Ms., Dr., Prof.
    attr_reader :title
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] 
    # @param address [Monite::CounterpartAddress] The address of a contact person.
    # @param counterpart_id [String] 
    # @param email [String] The email address of a contact person.
    # @param first_name [String] The first name of a contact person.
    # @param is_default [Boolean] 
    # @param last_name [String] The last name of a contact person.
    # @param phone [String] The phone number of a contact person
    # @param title [String] The title or honorific of a contact person. Examples: Mr., Ms., Dr., Prof.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::CounterpartContactResponse]
    def initialize(id:, address:, counterpart_id:, email: OMIT, first_name:, is_default:, last_name:, phone: OMIT, title: OMIT, additional_properties: nil)
      @id = id
      @address = address
      @counterpart_id = counterpart_id
      @email = email if email != OMIT
      @first_name = first_name
      @is_default = is_default
      @last_name = last_name
      @phone = phone if phone != OMIT
      @title = title if title != OMIT
      @additional_properties = additional_properties
      @_field_set = { "id": id, "address": address, "counterpart_id": counterpart_id, "email": email, "first_name": first_name, "is_default": is_default, "last_name": last_name, "phone": phone, "title": title }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of CounterpartContactResponse
    #
    # @param json_object [String] 
    # @return [Monite::CounterpartContactResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      unless parsed_json["address"].nil?
        address = parsed_json["address"].to_json
        address = Monite::CounterpartAddress.from_json(json_object: address)
      else
        address = nil
      end
      counterpart_id = parsed_json["counterpart_id"]
      email = parsed_json["email"]
      first_name = parsed_json["first_name"]
      is_default = parsed_json["is_default"]
      last_name = parsed_json["last_name"]
      phone = parsed_json["phone"]
      title = parsed_json["title"]
      new(
        id: id,
        address: address,
        counterpart_id: counterpart_id,
        email: email,
        first_name: first_name,
        is_default: is_default,
        last_name: last_name,
        phone: phone,
        title: title,
        additional_properties: struct
      )
    end
# Serialize an instance of CounterpartContactResponse to a JSON object
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
      Monite::CounterpartAddress.validate_raw(obj: obj.address)
      obj.counterpart_id.is_a?(String) != false || raise("Passed value for field obj.counterpart_id is not the expected type, validation failed.")
      obj.email&.is_a?(String) != false || raise("Passed value for field obj.email is not the expected type, validation failed.")
      obj.first_name.is_a?(String) != false || raise("Passed value for field obj.first_name is not the expected type, validation failed.")
      obj.is_default.is_a?(Boolean) != false || raise("Passed value for field obj.is_default is not the expected type, validation failed.")
      obj.last_name.is_a?(String) != false || raise("Passed value for field obj.last_name is not the expected type, validation failed.")
      obj.phone&.is_a?(String) != false || raise("Passed value for field obj.phone is not the expected type, validation failed.")
      obj.title&.is_a?(String) != false || raise("Passed value for field obj.title is not the expected type, validation failed.")
    end
  end
end