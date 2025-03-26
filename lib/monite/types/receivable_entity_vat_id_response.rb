# frozen_string_literal: true
require_relative "allowed_countries"
require_relative "vat_id_type_enum"
require "ostruct"
require "json"

module Monite
  class ReceivableEntityVatIdResponse
  # @return [String] 
    attr_reader :id
  # @return [Monite::AllowedCountries] 
    attr_reader :country
  # @return [String] 
    attr_reader :entity_id
  # @return [Monite::VatIdTypeEnum] 
    attr_reader :type
  # @return [String] 
    attr_reader :value
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] 
    # @param country [Monite::AllowedCountries] 
    # @param entity_id [String] 
    # @param type [Monite::VatIdTypeEnum] 
    # @param value [String] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::ReceivableEntityVatIdResponse]
    def initialize(id:, country:, entity_id:, type: OMIT, value:, additional_properties: nil)
      @id = id
      @country = country
      @entity_id = entity_id
      @type = type if type != OMIT
      @value = value
      @additional_properties = additional_properties
      @_field_set = { "id": id, "country": country, "entity_id": entity_id, "type": type, "value": value }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of ReceivableEntityVatIdResponse
    #
    # @param json_object [String] 
    # @return [Monite::ReceivableEntityVatIdResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      country = parsed_json["country"]
      entity_id = parsed_json["entity_id"]
      type = parsed_json["type"]
      value = parsed_json["value"]
      new(
        id: id,
        country: country,
        entity_id: entity_id,
        type: type,
        value: value,
        additional_properties: struct
      )
    end
# Serialize an instance of ReceivableEntityVatIdResponse to a JSON object
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
      obj.country.is_a?(Monite::AllowedCountries) != false || raise("Passed value for field obj.country is not the expected type, validation failed.")
      obj.entity_id.is_a?(String) != false || raise("Passed value for field obj.entity_id is not the expected type, validation failed.")
      obj.type&.is_a?(Monite::VatIdTypeEnum) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
      obj.value.is_a?(String) != false || raise("Passed value for field obj.value is not the expected type, validation failed.")
    end
  end
end