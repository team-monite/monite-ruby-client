# frozen_string_literal: true
require_relative "counterpart_tag_schema"
require "ostruct"
require "json"

module Monite
# Represents counterparts that are organizations (juridical persons).
  class CounterpartOrganizationResponse
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
  # @return [Array<Monite::CounterpartTagSchema>] The list of tags for this counterpart.
    attr_reader :tags
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param email [String] The email address of the organization
    # @param is_customer [Boolean] Indicates if the counterpart is a customer.
    # @param is_vendor [Boolean] Indicates if the counterpart is a vendor.
    # @param legal_name [String] The legal name of the organization.
    # @param phone [String] The phone number of the organization
    # @param tags [Array<Monite::CounterpartTagSchema>] The list of tags for this counterpart.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::CounterpartOrganizationResponse]
    def initialize(email: OMIT, is_customer:, is_vendor:, legal_name:, phone: OMIT, tags: OMIT, additional_properties: nil)
      @email = email if email != OMIT
      @is_customer = is_customer
      @is_vendor = is_vendor
      @legal_name = legal_name
      @phone = phone if phone != OMIT
      @tags = tags if tags != OMIT
      @additional_properties = additional_properties
      @_field_set = { "email": email, "is_customer": is_customer, "is_vendor": is_vendor, "legal_name": legal_name, "phone": phone, "tags": tags }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of CounterpartOrganizationResponse
    #
    # @param json_object [String] 
    # @return [Monite::CounterpartOrganizationResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      email = parsed_json["email"]
      is_customer = parsed_json["is_customer"]
      is_vendor = parsed_json["is_vendor"]
      legal_name = parsed_json["legal_name"]
      phone = parsed_json["phone"]
      tags = parsed_json["tags"]&.map do | item |
  item = item.to_json
  Monite::CounterpartTagSchema.from_json(json_object: item)
end
      new(
        email: email,
        is_customer: is_customer,
        is_vendor: is_vendor,
        legal_name: legal_name,
        phone: phone,
        tags: tags,
        additional_properties: struct
      )
    end
# Serialize an instance of CounterpartOrganizationResponse to a JSON object
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
      obj.is_customer.is_a?(Boolean) != false || raise("Passed value for field obj.is_customer is not the expected type, validation failed.")
      obj.is_vendor.is_a?(Boolean) != false || raise("Passed value for field obj.is_vendor is not the expected type, validation failed.")
      obj.legal_name.is_a?(String) != false || raise("Passed value for field obj.legal_name is not the expected type, validation failed.")
      obj.phone&.is_a?(String) != false || raise("Passed value for field obj.phone is not the expected type, validation failed.")
      obj.tags&.is_a?(Array) != false || raise("Passed value for field obj.tags is not the expected type, validation failed.")
    end
  end
end