# frozen_string_literal: true
require_relative "allowed_countries"
require_relative "currency_enum"
require_relative "bank_account_verifications"
require "ostruct"
require "json"

module Monite
  class CompleteVerificationResponse
  # @return [String] Deprecated. Use bank_account_id instead.
    attr_reader :id
  # @return [String] Account holder's name
    attr_reader :account_holder_name
  # @return [String] Account number (required if IBAN is not provided)
    attr_reader :account_number
  # @return [String] 
    attr_reader :bank_account_id
  # @return [String] The name of the entity`s bank account.
    attr_reader :bank_name
  # @return [String] The BIC of the entity`s bank account.
    attr_reader :bic
  # @return [Monite::AllowedCountries] 
    attr_reader :country
  # @return [Monite::CurrencyEnum] 
    attr_reader :currency
  # @return [String] 
    attr_reader :display_name
  # @return [String] The IBAN of the entity`s bank account.
    attr_reader :iban
  # @return [Boolean] Marks if a bank account should be used by default for the currency. Only 1 can
#  be True for each currency.
    attr_reader :is_default
  # @return [String] Routing number (US)
    attr_reader :routing_number
  # @return [String] Sort code (GB)
    attr_reader :sort_code
  # @return [Monite::BankAccountVerifications] 
    attr_reader :verifications
  # @return [String] 
    attr_reader :was_created_by_user_id
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] Deprecated. Use bank_account_id instead.
    # @param account_holder_name [String] Account holder's name
    # @param account_number [String] Account number (required if IBAN is not provided)
    # @param bank_account_id [String] 
    # @param bank_name [String] The name of the entity`s bank account.
    # @param bic [String] The BIC of the entity`s bank account.
    # @param country [Monite::AllowedCountries] 
    # @param currency [Monite::CurrencyEnum] 
    # @param display_name [String] 
    # @param iban [String] The IBAN of the entity`s bank account.
    # @param is_default [Boolean] Marks if a bank account should be used by default for the currency. Only 1 can
#  be True for each currency.
    # @param routing_number [String] Routing number (US)
    # @param sort_code [String] Sort code (GB)
    # @param verifications [Monite::BankAccountVerifications] 
    # @param was_created_by_user_id [String] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::CompleteVerificationResponse]
    def initialize(id:, account_holder_name: OMIT, account_number: OMIT, bank_account_id:, bank_name: OMIT, bic: OMIT, country: OMIT, currency: OMIT, display_name: OMIT, iban: OMIT, is_default:, routing_number: OMIT, sort_code: OMIT, verifications:, was_created_by_user_id: OMIT, additional_properties: nil)
      @id = id
      @account_holder_name = account_holder_name if account_holder_name != OMIT
      @account_number = account_number if account_number != OMIT
      @bank_account_id = bank_account_id
      @bank_name = bank_name if bank_name != OMIT
      @bic = bic if bic != OMIT
      @country = country if country != OMIT
      @currency = currency if currency != OMIT
      @display_name = display_name if display_name != OMIT
      @iban = iban if iban != OMIT
      @is_default = is_default
      @routing_number = routing_number if routing_number != OMIT
      @sort_code = sort_code if sort_code != OMIT
      @verifications = verifications
      @was_created_by_user_id = was_created_by_user_id if was_created_by_user_id != OMIT
      @additional_properties = additional_properties
      @_field_set = { "id": id, "account_holder_name": account_holder_name, "account_number": account_number, "bank_account_id": bank_account_id, "bank_name": bank_name, "bic": bic, "country": country, "currency": currency, "display_name": display_name, "iban": iban, "is_default": is_default, "routing_number": routing_number, "sort_code": sort_code, "verifications": verifications, "was_created_by_user_id": was_created_by_user_id }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of CompleteVerificationResponse
    #
    # @param json_object [String] 
    # @return [Monite::CompleteVerificationResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      account_holder_name = parsed_json["account_holder_name"]
      account_number = parsed_json["account_number"]
      bank_account_id = parsed_json["bank_account_id"]
      bank_name = parsed_json["bank_name"]
      bic = parsed_json["bic"]
      country = parsed_json["country"]
      currency = parsed_json["currency"]
      display_name = parsed_json["display_name"]
      iban = parsed_json["iban"]
      is_default = parsed_json["is_default"]
      routing_number = parsed_json["routing_number"]
      sort_code = parsed_json["sort_code"]
      unless parsed_json["verifications"].nil?
        verifications = parsed_json["verifications"].to_json
        verifications = Monite::BankAccountVerifications.from_json(json_object: verifications)
      else
        verifications = nil
      end
      was_created_by_user_id = parsed_json["was_created_by_user_id"]
      new(
        id: id,
        account_holder_name: account_holder_name,
        account_number: account_number,
        bank_account_id: bank_account_id,
        bank_name: bank_name,
        bic: bic,
        country: country,
        currency: currency,
        display_name: display_name,
        iban: iban,
        is_default: is_default,
        routing_number: routing_number,
        sort_code: sort_code,
        verifications: verifications,
        was_created_by_user_id: was_created_by_user_id,
        additional_properties: struct
      )
    end
# Serialize an instance of CompleteVerificationResponse to a JSON object
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
      obj.bank_account_id.is_a?(String) != false || raise("Passed value for field obj.bank_account_id is not the expected type, validation failed.")
      obj.bank_name&.is_a?(String) != false || raise("Passed value for field obj.bank_name is not the expected type, validation failed.")
      obj.bic&.is_a?(String) != false || raise("Passed value for field obj.bic is not the expected type, validation failed.")
      obj.country&.is_a?(Monite::AllowedCountries) != false || raise("Passed value for field obj.country is not the expected type, validation failed.")
      obj.currency&.is_a?(Monite::CurrencyEnum) != false || raise("Passed value for field obj.currency is not the expected type, validation failed.")
      obj.display_name&.is_a?(String) != false || raise("Passed value for field obj.display_name is not the expected type, validation failed.")
      obj.iban&.is_a?(String) != false || raise("Passed value for field obj.iban is not the expected type, validation failed.")
      obj.is_default.is_a?(Boolean) != false || raise("Passed value for field obj.is_default is not the expected type, validation failed.")
      obj.routing_number&.is_a?(String) != false || raise("Passed value for field obj.routing_number is not the expected type, validation failed.")
      obj.sort_code&.is_a?(String) != false || raise("Passed value for field obj.sort_code is not the expected type, validation failed.")
      Monite::BankAccountVerifications.validate_raw(obj: obj.verifications)
      obj.was_created_by_user_id&.is_a?(String) != false || raise("Passed value for field obj.was_created_by_user_id is not the expected type, validation failed.")
    end
  end
end