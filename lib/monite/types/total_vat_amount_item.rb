# frozen_string_literal: true
require "ostruct"
require "json"

module Monite
  class TotalVatAmountItem
  # @return [String] 
    attr_reader :id
  # @return [Integer] The total VAT of all line items, in [minor
#  units](https://docs.monite.com/references/currencies#minor-units).
    attr_reader :amount
  # @return [Integer] Percent minor units. Example: 12.5% is 1250.
    attr_reader :value
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] 
    # @param amount [Integer] The total VAT of all line items, in [minor
#  units](https://docs.monite.com/references/currencies#minor-units).
    # @param value [Integer] Percent minor units. Example: 12.5% is 1250.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::TotalVatAmountItem]
    def initialize(id: OMIT, amount:, value:, additional_properties: nil)
      @id = id if id != OMIT
      @amount = amount
      @value = value
      @additional_properties = additional_properties
      @_field_set = { "id": id, "amount": amount, "value": value }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of TotalVatAmountItem
    #
    # @param json_object [String] 
    # @return [Monite::TotalVatAmountItem]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      amount = parsed_json["amount"]
      value = parsed_json["value"]
      new(
        id: id,
        amount: amount,
        value: value,
        additional_properties: struct
      )
    end
# Serialize an instance of TotalVatAmountItem to a JSON object
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
      obj.id&.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
      obj.amount.is_a?(Integer) != false || raise("Passed value for field obj.amount is not the expected type, validation failed.")
      obj.value.is_a?(Integer) != false || raise("Passed value for field obj.value is not the expected type, validation failed.")
    end
  end
end