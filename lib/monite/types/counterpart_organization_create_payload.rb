# frozen_string_literal: true
require_relative "counterpart_address"
require "ostruct"
require "json"

module Monite
# Represents counterparts that are organizations (juridical persons).
  class CounterpartOrganizationCreatePayload
  # @return [Monite::CounterpartAddress] The address of the organization.
    attr_reader :address
  # @return [String] The email address of the organization
    attr_reader :email
  # @return [Boolean] Indicates if the counterpart is a customer.
    attr_reader :is_customer
  # @return [Boolean] Indicates if the counterpart is a vendor.
    attr_reader :is_vendor
  # @return [String] The legal name of the organization.
    attr_reader :legal_name
  # @return [String] The phone number of the organization
    attr_reader :phone
  # @return [Array<String>] A list of IDs of user-defined tags (labels) assigned to this counterpart.
    attr_reader :tag_ids
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param address [Monite::CounterpartAddress] The address of the organization.
    # @param email [String] The email address of the organization
    # @param is_customer [Boolean] Indicates if the counterpart is a customer.
    # @param is_vendor [Boolean] Indicates if the counterpart is a vendor.
    # @param legal_name [String] The legal name of the organization.
    # @param phone [String] The phone number of the organization
    # @param tag_ids [Array<String>] A list of IDs of user-defined tags (labels) assigned to this counterpart.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::CounterpartOrganizationCreatePayload]
    def initialize(address:, email: OMIT, is_customer:, is_vendor:, legal_name:, phone: OMIT, tag_ids: OMIT, additional_properties: nil)
      @address = address
      @email = email if email != OMIT
      @is_customer = is_customer
      @is_vendor = is_vendor
      @legal_name = legal_name
      @phone = phone if phone != OMIT
      @tag_ids = tag_ids if tag_ids != OMIT
      @additional_properties = additional_properties
      @_field_set = { "address": address, "email": email, "is_customer": is_customer, "is_vendor": is_vendor, "legal_name": legal_name, "phone": phone, "tag_ids": tag_ids }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of CounterpartOrganizationCreatePayload
    #
    # @param json_object [String] 
    # @return [Monite::CounterpartOrganizationCreatePayload]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["address"].nil?
        address = parsed_json["address"].to_json
        address = Monite::CounterpartAddress.from_json(json_object: address)
      else
        address = nil
      end
      email = parsed_json["email"]
      is_customer = parsed_json["is_customer"]
      is_vendor = parsed_json["is_vendor"]
      legal_name = parsed_json["legal_name"]
      phone = parsed_json["phone"]
      tag_ids = parsed_json["tag_ids"]
      new(
        address: address,
        email: email,
        is_customer: is_customer,
        is_vendor: is_vendor,
        legal_name: legal_name,
        phone: phone,
        tag_ids: tag_ids,
        additional_properties: struct
      )
    end
# Serialize an instance of CounterpartOrganizationCreatePayload to a JSON object
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
      Monite::CounterpartAddress.validate_raw(obj: obj.address)
      obj.email&.is_a?(String) != false || raise("Passed value for field obj.email is not the expected type, validation failed.")
      obj.is_customer.is_a?(Boolean) != false || raise("Passed value for field obj.is_customer is not the expected type, validation failed.")
      obj.is_vendor.is_a?(Boolean) != false || raise("Passed value for field obj.is_vendor is not the expected type, validation failed.")
      obj.legal_name.is_a?(String) != false || raise("Passed value for field obj.legal_name is not the expected type, validation failed.")
      obj.phone&.is_a?(String) != false || raise("Passed value for field obj.phone is not the expected type, validation failed.")
      obj.tag_ids&.is_a?(Array) != false || raise("Passed value for field obj.tag_ids is not the expected type, validation failed.")
    end
  end
end