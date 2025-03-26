# frozen_string_literal: true
require_relative "allowed_countries"
require_relative "currency_enum"
require "ostruct"
require "json"

module Monite
  class BankAccount
  # @return [String] The ID of the bank account.
    attr_reader :id
  # @return [String] The name of the person or business that owns this bank account.
    attr_reader :account_holder_name
  # @return [String] The bank account number. Typically used for UK and US bank accounts. US account
#  numbers contain 9 to 12 digits. UK account numbers typically contain 8 digits.
    attr_reader :account_number
  # @return [String] The BIC/SWIFT code of the bank.
    attr_reader :bic
  # @return [Monite::AllowedCountries] The country in which the bank account is registered, repsesented as a two-letter
#  country code ([ISO 3166-1
#  alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2)).
    attr_reader :country
  # @return [Monite::CurrencyEnum] The currency of the bank account, represented as a three-letter ISO [currency
#  code](https://docs.monite.com/references/currencies).
    attr_reader :currency
  # @return [String] User-defined name of this bank account, such as 'Primary account' or 'Savings
#  account'. Used only for entity bank accounts.
    attr_reader :display_name
  # @return [String] The IBAN of the bank account.
    attr_reader :iban
  # @return [Boolean] Indicates whether this bank account is the default one for its currency.
    attr_reader :is_default
  # @return [String] User-defined name of this bank account, such as 'Primary account' or 'Savings
#  account'. Used only for counterpart bank accounts.
    attr_reader :name
  # @return [String] The bank's routing transit number (RTN). Typically used for US banks. US routing
#  numbers consist of 9 digits.
    attr_reader :routing_number
  # @return [String] The bank's sort code. Typically used for UK banks.
    attr_reader :sort_code
  # @return [String] ID of the entity user who added this bank account, or `null` if it was added
#  using a partner access token. Used only for entity bank accounts.
    attr_reader :was_created_by_user_id
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] The ID of the bank account.
    # @param account_holder_name [String] The name of the person or business that owns this bank account.
    # @param account_number [String] The bank account number. Typically used for UK and US bank accounts. US account
#  numbers contain 9 to 12 digits. UK account numbers typically contain 8 digits.
    # @param bic [String] The BIC/SWIFT code of the bank.
    # @param country [Monite::AllowedCountries] The country in which the bank account is registered, repsesented as a two-letter
#  country code ([ISO 3166-1
#  alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2)).
    # @param currency [Monite::CurrencyEnum] The currency of the bank account, represented as a three-letter ISO [currency
#  code](https://docs.monite.com/references/currencies).
    # @param display_name [String] User-defined name of this bank account, such as 'Primary account' or 'Savings
#  account'. Used only for entity bank accounts.
    # @param iban [String] The IBAN of the bank account.
    # @param is_default [Boolean] Indicates whether this bank account is the default one for its currency.
    # @param name [String] User-defined name of this bank account, such as 'Primary account' or 'Savings
#  account'. Used only for counterpart bank accounts.
    # @param routing_number [String] The bank's routing transit number (RTN). Typically used for US banks. US routing
#  numbers consist of 9 digits.
    # @param sort_code [String] The bank's sort code. Typically used for UK banks.
    # @param was_created_by_user_id [String] ID of the entity user who added this bank account, or `null` if it was added
#  using a partner access token. Used only for entity bank accounts.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::BankAccount]
    def initialize(id:, account_holder_name: OMIT, account_number: OMIT, bic: OMIT, country: OMIT, currency: OMIT, display_name: OMIT, iban: OMIT, is_default: OMIT, name: OMIT, routing_number: OMIT, sort_code: OMIT, was_created_by_user_id: OMIT, additional_properties: nil)
      @id = id
      @account_holder_name = account_holder_name if account_holder_name != OMIT
      @account_number = account_number if account_number != OMIT
      @bic = bic if bic != OMIT
      @country = country if country != OMIT
      @currency = currency if currency != OMIT
      @display_name = display_name if display_name != OMIT
      @iban = iban if iban != OMIT
      @is_default = is_default if is_default != OMIT
      @name = name if name != OMIT
      @routing_number = routing_number if routing_number != OMIT
      @sort_code = sort_code if sort_code != OMIT
      @was_created_by_user_id = was_created_by_user_id if was_created_by_user_id != OMIT
      @additional_properties = additional_properties
      @_field_set = { "id": id, "account_holder_name": account_holder_name, "account_number": account_number, "bic": bic, "country": country, "currency": currency, "display_name": display_name, "iban": iban, "is_default": is_default, "name": name, "routing_number": routing_number, "sort_code": sort_code, "was_created_by_user_id": was_created_by_user_id }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of BankAccount
    #
    # @param json_object [String] 
    # @return [Monite::BankAccount]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      account_holder_name = parsed_json["account_holder_name"]
      account_number = parsed_json["account_number"]
      bic = parsed_json["bic"]
      country = parsed_json["country"]
      currency = parsed_json["currency"]
      display_name = parsed_json["display_name"]
      iban = parsed_json["iban"]
      is_default = parsed_json["is_default"]
      name = parsed_json["name"]
      routing_number = parsed_json["routing_number"]
      sort_code = parsed_json["sort_code"]
      was_created_by_user_id = parsed_json["was_created_by_user_id"]
      new(
        id: id,
        account_holder_name: account_holder_name,
        account_number: account_number,
        bic: bic,
        country: country,
        currency: currency,
        display_name: display_name,
        iban: iban,
        is_default: is_default,
        name: name,
        routing_number: routing_number,
        sort_code: sort_code,
        was_created_by_user_id: was_created_by_user_id,
        additional_properties: struct
      )
    end
# Serialize an instance of BankAccount to a JSON object
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
      obj.country&.is_a?(Monite::AllowedCountries) != false || raise("Passed value for field obj.country is not the expected type, validation failed.")
      obj.currency&.is_a?(Monite::CurrencyEnum) != false || raise("Passed value for field obj.currency is not the expected type, validation failed.")
      obj.display_name&.is_a?(String) != false || raise("Passed value for field obj.display_name is not the expected type, validation failed.")
      obj.iban&.is_a?(String) != false || raise("Passed value for field obj.iban is not the expected type, validation failed.")
      obj.is_default&.is_a?(Boolean) != false || raise("Passed value for field obj.is_default is not the expected type, validation failed.")
      obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.routing_number&.is_a?(String) != false || raise("Passed value for field obj.routing_number is not the expected type, validation failed.")
      obj.sort_code&.is_a?(String) != false || raise("Passed value for field obj.sort_code is not the expected type, validation failed.")
      obj.was_created_by_user_id&.is_a?(String) != false || raise("Passed value for field obj.was_created_by_user_id is not the expected type, validation failed.")
    end
  end
end