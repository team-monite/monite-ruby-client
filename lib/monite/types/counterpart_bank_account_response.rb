# frozen_string_literal: true
require_relative "allowed_countries"
require_relative "currency_enum"
require "ostruct"
require "json"

module Monite
  class CounterpartBankAccountResponse
  # @return [String] 
    attr_reader :id
  # @return [String] The name of the person or business that owns this bank account. Required for US
#  bank accounts to accept ACH payments.
    attr_reader :account_holder_name
  # @return [String] The bank account number. Required for US bank accounts to accept ACH payments.
#  US account numbers contain 9 to 12 digits. UK account numbers typically contain
#  8 digits.
    attr_reader :account_number
  # @return [String] The BIC/SWIFT code of the bank.
    attr_reader :bic
  # @return [String] 
    attr_reader :counterpart_id
  # @return [Monite::AllowedCountries] 
    attr_reader :country
  # @return [Monite::CurrencyEnum] 
    attr_reader :currency
  # @return [String] The IBAN of the bank account.
    attr_reader :iban
  # @return [Boolean] 
    attr_reader :is_default_for_currency
  # @return [String] 
    attr_reader :name
  # @return [Hash{String => Object}] Metadata for partner needs.
    attr_reader :partner_metadata
  # @return [String] The bank's routing transit number (RTN). Required for US bank accounts to accept
#  ACH payments. US routing numbers consist of 9 digits.
    attr_reader :routing_number
  # @return [String] The bank's sort code.
    attr_reader :sort_code
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] 
    # @param account_holder_name [String] The name of the person or business that owns this bank account. Required for US
#  bank accounts to accept ACH payments.
    # @param account_number [String] The bank account number. Required for US bank accounts to accept ACH payments.
#  US account numbers contain 9 to 12 digits. UK account numbers typically contain
#  8 digits.
    # @param bic [String] The BIC/SWIFT code of the bank.
    # @param counterpart_id [String] 
    # @param country [Monite::AllowedCountries] 
    # @param currency [Monite::CurrencyEnum] 
    # @param iban [String] The IBAN of the bank account.
    # @param is_default_for_currency [Boolean] 
    # @param name [String] 
    # @param partner_metadata [Hash{String => Object}] Metadata for partner needs.
    # @param routing_number [String] The bank's routing transit number (RTN). Required for US bank accounts to accept
#  ACH payments. US routing numbers consist of 9 digits.
    # @param sort_code [String] The bank's sort code.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::CounterpartBankAccountResponse]
    def initialize(id:, account_holder_name: OMIT, account_number: OMIT, bic: OMIT, counterpart_id:, country:, currency:, iban: OMIT, is_default_for_currency: OMIT, name: OMIT, partner_metadata: OMIT, routing_number: OMIT, sort_code: OMIT, additional_properties: nil)
      @id = id
      @account_holder_name = account_holder_name if account_holder_name != OMIT
      @account_number = account_number if account_number != OMIT
      @bic = bic if bic != OMIT
      @counterpart_id = counterpart_id
      @country = country
      @currency = currency
      @iban = iban if iban != OMIT
      @is_default_for_currency = is_default_for_currency if is_default_for_currency != OMIT
      @name = name if name != OMIT
      @partner_metadata = partner_metadata if partner_metadata != OMIT
      @routing_number = routing_number if routing_number != OMIT
      @sort_code = sort_code if sort_code != OMIT
      @additional_properties = additional_properties
      @_field_set = { "id": id, "account_holder_name": account_holder_name, "account_number": account_number, "bic": bic, "counterpart_id": counterpart_id, "country": country, "currency": currency, "iban": iban, "is_default_for_currency": is_default_for_currency, "name": name, "partner_metadata": partner_metadata, "routing_number": routing_number, "sort_code": sort_code }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of CounterpartBankAccountResponse
    #
    # @param json_object [String] 
    # @return [Monite::CounterpartBankAccountResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      account_holder_name = parsed_json["account_holder_name"]
      account_number = parsed_json["account_number"]
      bic = parsed_json["bic"]
      counterpart_id = parsed_json["counterpart_id"]
      country = parsed_json["country"]
      currency = parsed_json["currency"]
      iban = parsed_json["iban"]
      is_default_for_currency = parsed_json["is_default_for_currency"]
      name = parsed_json["name"]
      partner_metadata = parsed_json["partner_metadata"]
      routing_number = parsed_json["routing_number"]
      sort_code = parsed_json["sort_code"]
      new(
        id: id,
        account_holder_name: account_holder_name,
        account_number: account_number,
        bic: bic,
        counterpart_id: counterpart_id,
        country: country,
        currency: currency,
        iban: iban,
        is_default_for_currency: is_default_for_currency,
        name: name,
        partner_metadata: partner_metadata,
        routing_number: routing_number,
        sort_code: sort_code,
        additional_properties: struct
      )
    end
# Serialize an instance of CounterpartBankAccountResponse to a JSON object
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
      obj.account_holder_name&.is_a?(String) != false || raise("Passed value for field obj.account_holder_name is not the expected type, validation failed.")
      obj.account_number&.is_a?(String) != false || raise("Passed value for field obj.account_number is not the expected type, validation failed.")
      obj.bic&.is_a?(String) != false || raise("Passed value for field obj.bic is not the expected type, validation failed.")
      obj.counterpart_id.is_a?(String) != false || raise("Passed value for field obj.counterpart_id is not the expected type, validation failed.")
      obj.country.is_a?(Monite::AllowedCountries) != false || raise("Passed value for field obj.country is not the expected type, validation failed.")
      obj.currency.is_a?(Monite::CurrencyEnum) != false || raise("Passed value for field obj.currency is not the expected type, validation failed.")
      obj.iban&.is_a?(String) != false || raise("Passed value for field obj.iban is not the expected type, validation failed.")
      obj.is_default_for_currency&.is_a?(Boolean) != false || raise("Passed value for field obj.is_default_for_currency is not the expected type, validation failed.")
      obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.partner_metadata&.is_a?(Hash) != false || raise("Passed value for field obj.partner_metadata is not the expected type, validation failed.")
      obj.routing_number&.is_a?(String) != false || raise("Passed value for field obj.routing_number is not the expected type, validation failed.")
      obj.sort_code&.is_a?(String) != false || raise("Passed value for field obj.sort_code is not the expected type, validation failed.")
    end
  end
end