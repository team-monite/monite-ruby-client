# frozen_string_literal: true
require "date"
require "date"
require_relative "allowed_countries"
require_relative "vat_rate_creator"
require_relative "vat_rate_status_enum"
require "ostruct"
require "json"

module Monite
  class VatRateResponse
  # @return [String] Unique identifier of the vat rate object.
    attr_reader :id
  # @return [DateTime] Date/time when this rate was recorded in the table.
    attr_reader :created_at
  # @return [DateTime] Date/time when this rate was updated in the table.
    attr_reader :updated_at
  # @return [Monite::AllowedCountries] Two-letter ISO country code ([ISO 3166-1
#  alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2)).
    attr_reader :country
  # @return [Monite::VatRateCreator] By whom this rate was recorded: monite employee | accounting system.
    attr_reader :created_by
  # @return [Monite::VatRateStatusEnum] Status for this vat rate: active | inactive.
    attr_reader :status
  # @return [String] Date starting from when this rate can be used.
    attr_reader :valid_from
  # @return [String] Date when this rate was depreciated, after this date rate cannot be used.
    attr_reader :valid_until
  # @return [Integer] Percent minor units. Example: 12.5% is 1250.
    attr_reader :value
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] Unique identifier of the vat rate object.
    # @param created_at [DateTime] Date/time when this rate was recorded in the table.
    # @param updated_at [DateTime] Date/time when this rate was updated in the table.
    # @param country [Monite::AllowedCountries] Two-letter ISO country code ([ISO 3166-1
#  alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2)).
    # @param created_by [Monite::VatRateCreator] By whom this rate was recorded: monite employee | accounting system.
    # @param status [Monite::VatRateStatusEnum] Status for this vat rate: active | inactive.
    # @param valid_from [String] Date starting from when this rate can be used.
    # @param valid_until [String] Date when this rate was depreciated, after this date rate cannot be used.
    # @param value [Integer] Percent minor units. Example: 12.5% is 1250.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::VatRateResponse]
    def initialize(id:, created_at:, updated_at:, country:, created_by: OMIT, status: OMIT, valid_from: OMIT, valid_until: OMIT, value:, additional_properties: nil)
      @id = id
      @created_at = created_at
      @updated_at = updated_at
      @country = country
      @created_by = created_by if created_by != OMIT
      @status = status if status != OMIT
      @valid_from = valid_from if valid_from != OMIT
      @valid_until = valid_until if valid_until != OMIT
      @value = value
      @additional_properties = additional_properties
      @_field_set = { "id": id, "created_at": created_at, "updated_at": updated_at, "country": country, "created_by": created_by, "status": status, "valid_from": valid_from, "valid_until": valid_until, "value": value }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of VatRateResponse
    #
    # @param json_object [String] 
    # @return [Monite::VatRateResponse]
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
      country = parsed_json["country"]
      created_by = parsed_json["created_by"]
      status = parsed_json["status"]
      valid_from = parsed_json["valid_from"]
      valid_until = parsed_json["valid_until"]
      value = parsed_json["value"]
      new(
        id: id,
        created_at: created_at,
        updated_at: updated_at,
        country: country,
        created_by: created_by,
        status: status,
        valid_from: valid_from,
        valid_until: valid_until,
        value: value,
        additional_properties: struct
      )
    end
# Serialize an instance of VatRateResponse to a JSON object
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
      obj.country.is_a?(Monite::AllowedCountries) != false || raise("Passed value for field obj.country is not the expected type, validation failed.")
      obj.created_by&.is_a?(Monite::VatRateCreator) != false || raise("Passed value for field obj.created_by is not the expected type, validation failed.")
      obj.status&.is_a?(Monite::VatRateStatusEnum) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
      obj.valid_from&.is_a?(String) != false || raise("Passed value for field obj.valid_from is not the expected type, validation failed.")
      obj.valid_until&.is_a?(String) != false || raise("Passed value for field obj.valid_until is not the expected type, validation failed.")
      obj.value.is_a?(Integer) != false || raise("Passed value for field obj.value is not the expected type, validation failed.")
    end
  end
end