# frozen_string_literal: true
require_relative "missing_line_item_fields"
require "ostruct"
require "json"

module Monite
  class MissingFields
  # @return [Array<String>] Missing fields of counterpart.
    attr_reader :counterpart
  # @return [Array<String>] Missing fields of entity.
    attr_reader :entity
  # @return [Array<Monite::MissingLineItemFields>] Missing fields of line items.
    attr_reader :products
  # @return [Array<String>] Missing fields of receivable.
    attr_reader :receivable
  # @return [Array<String>] List of invalid vat rates.
    attr_reader :vat_rates
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param counterpart [Array<String>] Missing fields of counterpart.
    # @param entity [Array<String>] Missing fields of entity.
    # @param products [Array<Monite::MissingLineItemFields>] Missing fields of line items.
    # @param receivable [Array<String>] Missing fields of receivable.
    # @param vat_rates [Array<String>] List of invalid vat rates.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::MissingFields]
    def initialize(counterpart: OMIT, entity: OMIT, products: OMIT, receivable: OMIT, vat_rates: OMIT, additional_properties: nil)
      @counterpart = counterpart if counterpart != OMIT
      @entity = entity if entity != OMIT
      @products = products if products != OMIT
      @receivable = receivable if receivable != OMIT
      @vat_rates = vat_rates if vat_rates != OMIT
      @additional_properties = additional_properties
      @_field_set = { "counterpart": counterpart, "entity": entity, "products": products, "receivable": receivable, "vat_rates": vat_rates }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of MissingFields
    #
    # @param json_object [String] 
    # @return [Monite::MissingFields]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      counterpart = parsed_json["counterpart"]
      entity = parsed_json["entity"]
      products = parsed_json["products"]&.map do | item |
  item = item.to_json
  Monite::MissingLineItemFields.from_json(json_object: item)
end
      receivable = parsed_json["receivable"]
      vat_rates = parsed_json["vat_rates"]
      new(
        counterpart: counterpart,
        entity: entity,
        products: products,
        receivable: receivable,
        vat_rates: vat_rates,
        additional_properties: struct
      )
    end
# Serialize an instance of MissingFields to a JSON object
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
      obj.counterpart&.is_a?(Array) != false || raise("Passed value for field obj.counterpart is not the expected type, validation failed.")
      obj.entity&.is_a?(Array) != false || raise("Passed value for field obj.entity is not the expected type, validation failed.")
      obj.products&.is_a?(Array) != false || raise("Passed value for field obj.products is not the expected type, validation failed.")
      obj.receivable&.is_a?(Array) != false || raise("Passed value for field obj.receivable is not the expected type, validation failed.")
      obj.vat_rates&.is_a?(Array) != false || raise("Passed value for field obj.vat_rates is not the expected type, validation failed.")
    end
  end
end