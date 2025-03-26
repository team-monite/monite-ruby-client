# frozen_string_literal: true
require_relative "counterpart_address"
require "ostruct"
require "json"

module Monite
# Represents counterparts that are individuals (natural persons).
  class CounterpartIndividualCreatePayload
  # @return [Monite::CounterpartAddress] The person's address.
    attr_reader :address
  # @return [String] The person's email address.
    attr_reader :email
  # @return [String] The person's first name.
    attr_reader :first_name
  # @return [Boolean] Indicates if the counterpart is a customer.
    attr_reader :is_customer
  # @return [Boolean] Indicates if the counterpart is a vendor.
    attr_reader :is_vendor
  # @return [String] The person's last name.
    attr_reader :last_name
  # @return [String] The person's phone number.
    attr_reader :phone
  # @return [Array<String>] A list of IDs of user-defined tags (labels) assigned to this counterpart.
    attr_reader :tag_ids
  # @return [String] The person's title or honorific. Examples: Mr., Ms., Dr., Prof.
    attr_reader :title
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param address [Monite::CounterpartAddress] The person's address.
    # @param email [String] The person's email address.
    # @param first_name [String] The person's first name.
    # @param is_customer [Boolean] Indicates if the counterpart is a customer.
    # @param is_vendor [Boolean] Indicates if the counterpart is a vendor.
    # @param last_name [String] The person's last name.
    # @param phone [String] The person's phone number.
    # @param tag_ids [Array<String>] A list of IDs of user-defined tags (labels) assigned to this counterpart.
    # @param title [String] The person's title or honorific. Examples: Mr., Ms., Dr., Prof.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::CounterpartIndividualCreatePayload]
    def initialize(address:, email: OMIT, first_name:, is_customer:, is_vendor:, last_name:, phone: OMIT, tag_ids: OMIT, title: OMIT, additional_properties: nil)
      @address = address
      @email = email if email != OMIT
      @first_name = first_name
      @is_customer = is_customer
      @is_vendor = is_vendor
      @last_name = last_name
      @phone = phone if phone != OMIT
      @tag_ids = tag_ids if tag_ids != OMIT
      @title = title if title != OMIT
      @additional_properties = additional_properties
      @_field_set = { "address": address, "email": email, "first_name": first_name, "is_customer": is_customer, "is_vendor": is_vendor, "last_name": last_name, "phone": phone, "tag_ids": tag_ids, "title": title }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of CounterpartIndividualCreatePayload
    #
    # @param json_object [String] 
    # @return [Monite::CounterpartIndividualCreatePayload]
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
      first_name = parsed_json["first_name"]
      is_customer = parsed_json["is_customer"]
      is_vendor = parsed_json["is_vendor"]
      last_name = parsed_json["last_name"]
      phone = parsed_json["phone"]
      tag_ids = parsed_json["tag_ids"]
      title = parsed_json["title"]
      new(
        address: address,
        email: email,
        first_name: first_name,
        is_customer: is_customer,
        is_vendor: is_vendor,
        last_name: last_name,
        phone: phone,
        tag_ids: tag_ids,
        title: title,
        additional_properties: struct
      )
    end
# Serialize an instance of CounterpartIndividualCreatePayload to a JSON object
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
      obj.first_name.is_a?(String) != false || raise("Passed value for field obj.first_name is not the expected type, validation failed.")
      obj.is_customer.is_a?(Boolean) != false || raise("Passed value for field obj.is_customer is not the expected type, validation failed.")
      obj.is_vendor.is_a?(Boolean) != false || raise("Passed value for field obj.is_vendor is not the expected type, validation failed.")
      obj.last_name.is_a?(String) != false || raise("Passed value for field obj.last_name is not the expected type, validation failed.")
      obj.phone&.is_a?(String) != false || raise("Passed value for field obj.phone is not the expected type, validation failed.")
      obj.tag_ids&.is_a?(Array) != false || raise("Passed value for field obj.tag_ids is not the expected type, validation failed.")
      obj.title&.is_a?(String) != false || raise("Passed value for field obj.title is not the expected type, validation failed.")
    end
  end
end