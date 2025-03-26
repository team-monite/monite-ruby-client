# frozen_string_literal: true
require_relative "counterpart_raw_address"
require_relative "counterpart_raw_bank_account"
require_relative "counterpart_raw_vat_id"
require "ostruct"
require "json"

module Monite
  class CounterpartRawData
  # @return [Monite::CounterpartRawAddress] The address of the vendor or supplier.
    attr_reader :address
  # @return [Monite::CounterpartRawBankAccount] Object representing counterpart bank account.
    attr_reader :bank_account
  # @return [String] The email address of the organization
    attr_reader :email
  # @return [String] Vendor or supplier name.
    attr_reader :name
  # @return [String] The phone number of the organization
    attr_reader :phone
  # @return [String] The tax id of the counterpart.
    attr_reader :tax_id
  # @return [Monite::CounterpartRawVatId] VAT ID of the vendor or supplier which was used in the invoice.
    attr_reader :vat_id
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param address [Monite::CounterpartRawAddress] The address of the vendor or supplier.
    # @param bank_account [Monite::CounterpartRawBankAccount] Object representing counterpart bank account.
    # @param email [String] The email address of the organization
    # @param name [String] Vendor or supplier name.
    # @param phone [String] The phone number of the organization
    # @param tax_id [String] The tax id of the counterpart.
    # @param vat_id [Monite::CounterpartRawVatId] VAT ID of the vendor or supplier which was used in the invoice.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::CounterpartRawData]
    def initialize(address: OMIT, bank_account: OMIT, email: OMIT, name: OMIT, phone: OMIT, tax_id: OMIT, vat_id: OMIT, additional_properties: nil)
      @address = address if address != OMIT
      @bank_account = bank_account if bank_account != OMIT
      @email = email if email != OMIT
      @name = name if name != OMIT
      @phone = phone if phone != OMIT
      @tax_id = tax_id if tax_id != OMIT
      @vat_id = vat_id if vat_id != OMIT
      @additional_properties = additional_properties
      @_field_set = { "address": address, "bank_account": bank_account, "email": email, "name": name, "phone": phone, "tax_id": tax_id, "vat_id": vat_id }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of CounterpartRawData
    #
    # @param json_object [String] 
    # @return [Monite::CounterpartRawData]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["address"].nil?
        address = parsed_json["address"].to_json
        address = Monite::CounterpartRawAddress.from_json(json_object: address)
      else
        address = nil
      end
      unless parsed_json["bank_account"].nil?
        bank_account = parsed_json["bank_account"].to_json
        bank_account = Monite::CounterpartRawBankAccount.from_json(json_object: bank_account)
      else
        bank_account = nil
      end
      email = parsed_json["email"]
      name = parsed_json["name"]
      phone = parsed_json["phone"]
      tax_id = parsed_json["tax_id"]
      unless parsed_json["vat_id"].nil?
        vat_id = parsed_json["vat_id"].to_json
        vat_id = Monite::CounterpartRawVatId.from_json(json_object: vat_id)
      else
        vat_id = nil
      end
      new(
        address: address,
        bank_account: bank_account,
        email: email,
        name: name,
        phone: phone,
        tax_id: tax_id,
        vat_id: vat_id,
        additional_properties: struct
      )
    end
# Serialize an instance of CounterpartRawData to a JSON object
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
      obj.address.nil? || Monite::CounterpartRawAddress.validate_raw(obj: obj.address)
      obj.bank_account.nil? || Monite::CounterpartRawBankAccount.validate_raw(obj: obj.bank_account)
      obj.email&.is_a?(String) != false || raise("Passed value for field obj.email is not the expected type, validation failed.")
      obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.phone&.is_a?(String) != false || raise("Passed value for field obj.phone is not the expected type, validation failed.")
      obj.tax_id&.is_a?(String) != false || raise("Passed value for field obj.tax_id is not the expected type, validation failed.")
      obj.vat_id.nil? || Monite::CounterpartRawVatId.validate_raw(obj: obj.vat_id)
    end
  end
end