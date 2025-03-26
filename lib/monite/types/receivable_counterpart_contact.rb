# frozen_string_literal: true
require_relative "receivables_representation_of_counterpart_address"
require "ostruct"
require "json"

module Monite
  class ReceivableCounterpartContact
  # @return [Monite::ReceivablesRepresentationOfCounterpartAddress] The contact address of the counterpart
    attr_reader :address
  # @return [String] The contact email of the counterpart.
    attr_reader :email
  # @return [String] The first name of the counterpart contact.
    attr_reader :first_name
  # @return [String] The last name of the counterpart contact.
    attr_reader :last_name
  # @return [String] The contact phone number of the counterpart.
    attr_reader :phone
  # @return [String] The counterpart contact title (e.g. Dr., Mr., Mrs., Ms., etc).
    attr_reader :title
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param address [Monite::ReceivablesRepresentationOfCounterpartAddress] The contact address of the counterpart
    # @param email [String] The contact email of the counterpart.
    # @param first_name [String] The first name of the counterpart contact.
    # @param last_name [String] The last name of the counterpart contact.
    # @param phone [String] The contact phone number of the counterpart.
    # @param title [String] The counterpart contact title (e.g. Dr., Mr., Mrs., Ms., etc).
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::ReceivableCounterpartContact]
    def initialize(address:, email: OMIT, first_name:, last_name:, phone: OMIT, title: OMIT, additional_properties: nil)
      @address = address
      @email = email if email != OMIT
      @first_name = first_name
      @last_name = last_name
      @phone = phone if phone != OMIT
      @title = title if title != OMIT
      @additional_properties = additional_properties
      @_field_set = { "address": address, "email": email, "first_name": first_name, "last_name": last_name, "phone": phone, "title": title }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of ReceivableCounterpartContact
    #
    # @param json_object [String] 
    # @return [Monite::ReceivableCounterpartContact]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["address"].nil?
        address = parsed_json["address"].to_json
        address = Monite::ReceivablesRepresentationOfCounterpartAddress.from_json(json_object: address)
      else
        address = nil
      end
      email = parsed_json["email"]
      first_name = parsed_json["first_name"]
      last_name = parsed_json["last_name"]
      phone = parsed_json["phone"]
      title = parsed_json["title"]
      new(
        address: address,
        email: email,
        first_name: first_name,
        last_name: last_name,
        phone: phone,
        title: title,
        additional_properties: struct
      )
    end
# Serialize an instance of ReceivableCounterpartContact to a JSON object
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
      Monite::ReceivablesRepresentationOfCounterpartAddress.validate_raw(obj: obj.address)
      obj.email&.is_a?(String) != false || raise("Passed value for field obj.email is not the expected type, validation failed.")
      obj.first_name.is_a?(String) != false || raise("Passed value for field obj.first_name is not the expected type, validation failed.")
      obj.last_name.is_a?(String) != false || raise("Passed value for field obj.last_name is not the expected type, validation failed.")
      obj.phone&.is_a?(String) != false || raise("Passed value for field obj.phone is not the expected type, validation failed.")
      obj.title&.is_a?(String) != false || raise("Passed value for field obj.title is not the expected type, validation failed.")
    end
  end
end