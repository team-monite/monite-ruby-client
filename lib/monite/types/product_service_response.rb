# frozen_string_literal: true
require "date"
require "date"
require_relative "price"
require_relative "product_service_type_enum"
require "ostruct"
require "json"

module Monite
  class ProductServiceResponse
  # @return [String] Unique ID of the product.
    attr_reader :id
  # @return [DateTime] Time at which the product was created. Timestamps follow the ISO 8601 standard.
    attr_reader :created_at
  # @return [DateTime] Time at which the product was last updated. Timestamps follow the ISO 8601
#  standard.
    attr_reader :updated_at
  # @return [String] Description of the product.
    attr_reader :description
  # @return [String] 
    attr_reader :entity_id
  # @return [String] 
    attr_reader :entity_user_id
  # @return [String] 
    attr_reader :ledger_account_id
  # @return [String] The unique ID reference of the unit used to measure the quantity of this product
#  (e.g. items, meters, kilograms).
    attr_reader :measure_unit_id
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

    # @param id [String] Unique ID of the product.
    # @param created_at [DateTime] Time at which the product was created. Timestamps follow the ISO 8601 standard.
    # @param updated_at [DateTime] Time at which the product was last updated. Timestamps follow the ISO 8601
#  standard.
    # @param description [String] Description of the product.
    # @param entity_id [String] 
    # @param entity_user_id [String] 
    # @param ledger_account_id [String] 
    # @param measure_unit_id [String] The unique ID reference of the unit used to measure the quantity of this product
#  (e.g. items, meters, kilograms).
    # @param name [String] Name of the product.
    # @param price [Monite::Price] 
    # @param smallest_amount [Float] The smallest amount allowed for this product.
    # @param type [Monite::ProductServiceTypeEnum] Specifies whether this offering is a product or service. This may affect the
#  applicable tax rates.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::ProductServiceResponse]
    def initialize(id:, created_at:, updated_at:, description: OMIT, entity_id:, entity_user_id: OMIT, ledger_account_id: OMIT, measure_unit_id: OMIT, name:, price: OMIT, smallest_amount: OMIT, type: OMIT, additional_properties: nil)
      @id = id
      @created_at = created_at
      @updated_at = updated_at
      @description = description if description != OMIT
      @entity_id = entity_id
      @entity_user_id = entity_user_id if entity_user_id != OMIT
      @ledger_account_id = ledger_account_id if ledger_account_id != OMIT
      @measure_unit_id = measure_unit_id if measure_unit_id != OMIT
      @name = name
      @price = price if price != OMIT
      @smallest_amount = smallest_amount if smallest_amount != OMIT
      @type = type if type != OMIT
      @additional_properties = additional_properties
      @_field_set = { "id": id, "created_at": created_at, "updated_at": updated_at, "description": description, "entity_id": entity_id, "entity_user_id": entity_user_id, "ledger_account_id": ledger_account_id, "measure_unit_id": measure_unit_id, "name": name, "price": price, "smallest_amount": smallest_amount, "type": type }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of ProductServiceResponse
    #
    # @param json_object [String] 
    # @return [Monite::ProductServiceResponse]
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
      description = parsed_json["description"]
      entity_id = parsed_json["entity_id"]
      entity_user_id = parsed_json["entity_user_id"]
      ledger_account_id = parsed_json["ledger_account_id"]
      measure_unit_id = parsed_json["measure_unit_id"]
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
        id: id,
        created_at: created_at,
        updated_at: updated_at,
        description: description,
        entity_id: entity_id,
        entity_user_id: entity_user_id,
        ledger_account_id: ledger_account_id,
        measure_unit_id: measure_unit_id,
        name: name,
        price: price,
        smallest_amount: smallest_amount,
        type: type,
        additional_properties: struct
      )
    end
# Serialize an instance of ProductServiceResponse to a JSON object
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
      obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
      obj.entity_id.is_a?(String) != false || raise("Passed value for field obj.entity_id is not the expected type, validation failed.")
      obj.entity_user_id&.is_a?(String) != false || raise("Passed value for field obj.entity_user_id is not the expected type, validation failed.")
      obj.ledger_account_id&.is_a?(String) != false || raise("Passed value for field obj.ledger_account_id is not the expected type, validation failed.")
      obj.measure_unit_id&.is_a?(String) != false || raise("Passed value for field obj.measure_unit_id is not the expected type, validation failed.")
      obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.price.nil? || Monite::Price.validate_raw(obj: obj.price)
      obj.smallest_amount&.is_a?(Float) != false || raise("Passed value for field obj.smallest_amount is not the expected type, validation failed.")
      obj.type&.is_a?(Monite::ProductServiceTypeEnum) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
    end
  end
end