# frozen_string_literal: true
require "date"
require "date"
require_relative "status_enum"
require "ostruct"
require "json"

module Monite
  class EntityUserResponse
  # @return [String] UUID entity user ID
    attr_reader :id
  # @return [DateTime] UTC datetime
    attr_reader :created_at
  # @return [DateTime] UTC datetime
    attr_reader :updated_at
  # @return [String] An entity user business email
    attr_reader :email
  # @return [String] First name
    attr_reader :first_name
  # @return [String] Last name
    attr_reader :last_name
  # @return [String] Login
    attr_reader :login
  # @return [String] An entity user phone number in the international format
    attr_reader :phone
  # @return [String] UUID role ID
    attr_reader :role_id
  # @return [Monite::StatusEnum] record status, 'active' by default
    attr_reader :status
  # @return [String] 
    attr_reader :userpic_file_id
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] UUID entity user ID
    # @param created_at [DateTime] UTC datetime
    # @param updated_at [DateTime] UTC datetime
    # @param email [String] An entity user business email
    # @param first_name [String] First name
    # @param last_name [String] Last name
    # @param login [String] Login
    # @param phone [String] An entity user phone number in the international format
    # @param role_id [String] UUID role ID
    # @param status [Monite::StatusEnum] record status, 'active' by default
    # @param userpic_file_id [String] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::EntityUserResponse]
    def initialize(id:, created_at:, updated_at:, email: OMIT, first_name: OMIT, last_name: OMIT, login:, phone: OMIT, role_id:, status:, userpic_file_id: OMIT, additional_properties: nil)
      @id = id
      @created_at = created_at
      @updated_at = updated_at
      @email = email if email != OMIT
      @first_name = first_name if first_name != OMIT
      @last_name = last_name if last_name != OMIT
      @login = login
      @phone = phone if phone != OMIT
      @role_id = role_id
      @status = status
      @userpic_file_id = userpic_file_id if userpic_file_id != OMIT
      @additional_properties = additional_properties
      @_field_set = { "id": id, "created_at": created_at, "updated_at": updated_at, "email": email, "first_name": first_name, "last_name": last_name, "login": login, "phone": phone, "role_id": role_id, "status": status, "userpic_file_id": userpic_file_id }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of EntityUserResponse
    #
    # @param json_object [String] 
    # @return [Monite::EntityUserResponse]
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
      email = parsed_json["email"]
      first_name = parsed_json["first_name"]
      last_name = parsed_json["last_name"]
      login = parsed_json["login"]
      phone = parsed_json["phone"]
      role_id = parsed_json["role_id"]
      status = parsed_json["status"]
      userpic_file_id = parsed_json["userpic_file_id"]
      new(
        id: id,
        created_at: created_at,
        updated_at: updated_at,
        email: email,
        first_name: first_name,
        last_name: last_name,
        login: login,
        phone: phone,
        role_id: role_id,
        status: status,
        userpic_file_id: userpic_file_id,
        additional_properties: struct
      )
    end
# Serialize an instance of EntityUserResponse to a JSON object
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
      obj.email&.is_a?(String) != false || raise("Passed value for field obj.email is not the expected type, validation failed.")
      obj.first_name&.is_a?(String) != false || raise("Passed value for field obj.first_name is not the expected type, validation failed.")
      obj.last_name&.is_a?(String) != false || raise("Passed value for field obj.last_name is not the expected type, validation failed.")
      obj.login.is_a?(String) != false || raise("Passed value for field obj.login is not the expected type, validation failed.")
      obj.phone&.is_a?(String) != false || raise("Passed value for field obj.phone is not the expected type, validation failed.")
      obj.role_id.is_a?(String) != false || raise("Passed value for field obj.role_id is not the expected type, validation failed.")
      obj.status.is_a?(Monite::StatusEnum) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
      obj.userpic_file_id&.is_a?(String) != false || raise("Passed value for field obj.userpic_file_id is not the expected type, validation failed.")
    end
  end
end