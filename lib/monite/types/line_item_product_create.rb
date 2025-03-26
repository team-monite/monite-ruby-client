# frozen_string_literal: true
require_relative "unit_request"
require_relative "price"
require_relative "product_service_type_enum"
require "ostruct"
require "json"

module Monite
  class LineItemProductCreate
  # @return [String] Description of the product.
    attr_reader :description
  # @return [String] 
    attr_reader :ledger_account_id
  # @return [Monite::UnitRequest] 
    attr_reader :measure_unit
  # @return [String] Name of the product.
    attr_reader :name
  # @return [Monite::Price] 
    attr_reader :price
  # @return [Float] The smallest amount allowed for this product.
    attr_reader :smallest_amount
  # @return [Monite::ProductServiceTypeEnum] Specifies whether this offering is a product or service. This may affect the
#  applicable tax rates.
    attr_reader :type
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param description [String] Description of the product.
    # @param ledger_account_id [String] 
    # @param measure_unit [Monite::UnitRequest] 
    # @param name [String] Name of the product.
    # @param price [Monite::Price] 
    # @param smallest_amount [Float] The smallest amount allowed for this product.
    # @param type [Monite::ProductServiceTypeEnum] Specifies whether this offering is a product or service. This may affect the
#  applicable tax rates.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::LineItemProductCreate]
    def initialize(description: OMIT, ledger_account_id: OMIT, measure_unit: OMIT, name:, price:, smallest_amount: OMIT, type: OMIT, additional_properties: nil)
      @description = description if description != OMIT
      @ledger_account_id = ledger_account_id if ledger_account_id != OMIT
      @measure_unit = measure_unit if measure_unit != OMIT
      @name = name
      @price = price
      @smallest_amount = smallest_amount if smallest_amount != OMIT
      @type = type if type != OMIT
      @additional_properties = additional_properties
      @_field_set = { "description": description, "ledger_account_id": ledger_account_id, "measure_unit": measure_unit, "name": name, "price": price, "smallest_amount": smallest_amount, "type": type }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of LineItemProductCreate
    #
    # @param json_object [String] 
    # @return [Monite::LineItemProductCreate]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      description = parsed_json["description"]
      ledger_account_id = parsed_json["ledger_account_id"]
      unless parsed_json["measure_unit"].nil?
        measure_unit = parsed_json["measure_unit"].to_json
        measure_unit = Monite::UnitRequest.from_json(json_object: measure_unit)
      else
        measure_unit = nil
      end
      name = parsed_json["name"]
      unless parsed_json["price"].nil?
        price = parsed_json["price"].to_json
        price = Monite::Price.from_json(json_object: price)
      else
        price = nil
      end
      smallest_amount = parsed_json["smallest_amount"]
      type = parsed_json["type"]
      new(
        description: description,
        ledger_account_id: ledger_account_id,
        measure_unit: measure_unit,
        name: name,
        price: price,
        smallest_amount: smallest_amount,
        type: type,
        additional_properties: struct
      )
    end
# Serialize an instance of LineItemProductCreate to a JSON object
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
      obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
      obj.ledger_account_id&.is_a?(String) != false || raise("Passed value for field obj.ledger_account_id is not the expected type, validation failed.")
      obj.measure_unit.nil? || Monite::UnitRequest.validate_raw(obj: obj.measure_unit)
      obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      Monite::Price.validate_raw(obj: obj.price)
      obj.smallest_amount&.is_a?(Float) != false || raise("Passed value for field obj.smallest_amount is not the expected type, validation failed.")
      obj.type&.is_a?(Monite::ProductServiceTypeEnum) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
    end
  end
end