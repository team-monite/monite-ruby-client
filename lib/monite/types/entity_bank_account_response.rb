# frozen_string_literal: true
require_relative "allowed_countries"
require_relative "currency_enum"
require "ostruct"
require "json"

module Monite
# Represents a bank account owned by an entity.
  class EntityBankAccountResponse
  # @return [String] Unique ID of the bank account.
    attr_reader :id
  # @return [String] The name of the person or business that owns this bank account. Required if the
#  account currency is GBP or USD.
    attr_reader :account_holder_name
  # @return [String] The bank account number. Required if the account currency is GBP or USD. UK
#  account numbers typically contain 8 digits. US bank account numbers contain 9 to
#  12 digits.
    attr_reader :account_number
  # @return [String] The bank name.
    attr_reader :bank_name
  # @return [String] The SWIFT/BIC code of the bank.
    attr_reader :bic
  # @return [Monite::AllowedCountries] The country in which the bank account is registered, repsesented as a two-letter
#  country code ([ISO 3166-1
#  alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2)).
    attr_reader :country
  # @return [Monite::CurrencyEnum] The currency of the bank account, represented as a three-letter ISO [currency
#  code](https://docs.monite.com/references/currencies).
    attr_reader :currency
  # @return [String] User-defined name of this bank account, such as 'Primary account' or 'Savings
#  account'.
    attr_reader :display_name
  # @return [String] The IBAN of the bank account. Required if the account currency is EUR.
    attr_reader :iban
  # @return [Boolean] Indicates whether this bank account is the default one for its currency.
    attr_reader :is_default_for_currency
  # @return [String] The bank's routing transit number (RTN) or branch code. Required if the account
#  currency is USD. US routing numbers consist of 9 digits.
    attr_reader :routing_number
  # @return [String] The bank's sort code. Required if the account currency is GBP.
    attr_reader :sort_code
  # @return [String] ID of the entity user who added this bank account, or `null` if it was added
#  using a partner access token.
    attr_reader :was_created_by_user_id
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] Unique ID of the bank account.
    # @param account_holder_name [String] The name of the person or business that owns this bank account. Required if the
#  account currency is GBP or USD.
    # @param account_number [String] The bank account number. Required if the account currency is GBP or USD. UK
#  account numbers typically contain 8 digits. US bank account numbers contain 9 to
#  12 digits.
    # @param bank_name [String] The bank name.
    # @param bic [String] The SWIFT/BIC code of the bank.
    # @param country [Monite::AllowedCountries] The country in which the bank account is registered, repsesented as a two-letter
#  country code ([ISO 3166-1
#  alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2)).
    # @param currency [Monite::CurrencyEnum] The currency of the bank account, represented as a three-letter ISO [currency
#  code](https://docs.monite.com/references/currencies).
    # @param display_name [String] User-defined name of this bank account, such as 'Primary account' or 'Savings
#  account'.
    # @param iban [String] The IBAN of the bank account. Required if the account currency is EUR.
    # @param is_default_for_currency [Boolean] Indicates whether this bank account is the default one for its currency.
    # @param routing_number [String] The bank's routing transit number (RTN) or branch code. Required if the account
#  currency is USD. US routing numbers consist of 9 digits.
    # @param sort_code [String] The bank's sort code. Required if the account currency is GBP.
    # @param was_created_by_user_id [String] ID of the entity user who added this bank account, or `null` if it was added
#  using a partner access token.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::EntityBankAccountResponse]
    def initialize(id:, account_holder_name: OMIT, account_number: OMIT, bank_name: OMIT, bic: OMIT, country: OMIT, currency: OMIT, display_name: OMIT, iban: OMIT, is_default_for_currency: OMIT, routing_number: OMIT, sort_code: OMIT, was_created_by_user_id: OMIT, additional_properties: nil)
      @id = id
      @account_holder_name = account_holder_name if account_holder_name != OMIT
      @account_number = account_number if account_number != OMIT
      @bank_name = bank_name if bank_name != OMIT
      @bic = bic if bic != OMIT
      @country = country if country != OMIT
      @currency = currency if currency != OMIT
      @display_name = display_name if display_name != OMIT
      @iban = iban if iban != OMIT
      @is_default_for_currency = is_default_for_currency if is_default_for_currency != OMIT
      @routing_number = routing_number if routing_number != OMIT
      @sort_code = sort_code if sort_code != OMIT
      @was_created_by_user_id = was_created_by_user_id if was_created_by_user_id != OMIT
      @additional_properties = additional_properties
      @_field_set = { "id": id, "account_holder_name": account_holder_name, "account_number": account_number, "bank_name": bank_name, "bic": bic, "country": country, "currency": currency, "display_name": display_name, "iban": iban, "is_default_for_currency": is_default_for_currency, "routing_number": routing_number, "sort_code": sort_code, "was_created_by_user_id": was_created_by_user_id }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of EntityBankAccountResponse
    #
    # @param json_object [String] 
    # @return [Monite::EntityBankAccountResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      account_holder_name = parsed_json["account_holder_name"]
      account_number = parsed_json["account_number"]
      bank_name = parsed_json["bank_name"]
      bic = parsed_json["bic"]
      country = parsed_json["country"]
      currency = parsed_json["currency"]
      display_name = parsed_json["display_name"]
      iban = parsed_json["iban"]
      is_default_for_currency = parsed_json["is_default_for_currency"]
      routing_number = parsed_json["routing_number"]
      sort_code = parsed_json["sort_code"]
      was_created_by_user_id = parsed_json["was_created_by_user_id"]
      new(
        id: id,
        account_holder_name: account_holder_name,
        account_number: account_number,
        bank_name: bank_name,
        bic: bic,
        country: country,
        currency: currency,
        display_name: display_name,
        iban: iban,
        is_default_for_currency: is_default_for_currency,
        routing_number: routing_number,
        sort_code: sort_code,
        was_created_by_user_id: was_created_by_user_id,
        additional_properties: struct
      )
    end
# Serialize an instance of EntityBankAccountResponse to a JSON object
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
      obj.bank_name&.is_a?(String) != false || raise("Passed value for field obj.bank_name is not the expected type, validation failed.")
      obj.bic&.is_a?(String) != false || raise("Passed value for field obj.bic is not the expected type, validation failed.")
      obj.country&.is_a?(Monite::AllowedCountries) != false || raise("Passed value for field obj.country is not the expected type, validation failed.")
      obj.currency&.is_a?(Monite::CurrencyEnum) != false || raise("Passed value for field obj.currency is not the expected type, validation failed.")
      obj.display_name&.is_a?(String) != false || raise("Passed value for field obj.display_name is not the expected type, validation failed.")
      obj.iban&.is_a?(String) != false || raise("Passed value for field obj.iban is not the expected type, validation failed.")
      obj.is_default_for_currency&.is_a?(Boolean) != false || raise("Passed value for field obj.is_default_for_currency is not the expected type, validation failed.")
      obj.routing_number&.is_a?(String) != false || raise("Passed value for field obj.routing_number is not the expected type, validation failed.")
      obj.sort_code&.is_a?(String) != false || raise("Passed value for field obj.sort_code is not the expected type, validation failed.")
      obj.was_created_by_user_id&.is_a?(String) != false || raise("Passed value for field obj.was_created_by_user_id is not the expected type, validation failed.")
    end
  end
end