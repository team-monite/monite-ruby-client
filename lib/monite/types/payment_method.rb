# frozen_string_literal: true
require_relative "payment_method_direction"
require_relative "monite_all_payment_methods"
require_relative "payment_method_status"
require_relative "monite_all_payment_methods_types"
require "ostruct"
require "json"

module Monite
  class PaymentMethod
  # @return [Monite::PaymentMethodDirection] 
    attr_reader :direction
  # @return [Monite::MoniteAllPaymentMethods] 
    attr_reader :name
  # @return [Monite::PaymentMethodStatus] 
    attr_reader :status
  # @return [Monite::MoniteAllPaymentMethodsTypes] 
    attr_reader :type
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param direction [Monite::PaymentMethodDirection] 
    # @param name [Monite::MoniteAllPaymentMethods] 
    # @param status [Monite::PaymentMethodStatus] 
    # @param type [Monite::MoniteAllPaymentMethodsTypes] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::PaymentMethod]
    def initialize(direction:, name:, status:, type:, additional_properties: nil)
      @direction = direction
      @name = name
      @status = status
      @type = type
      @additional_properties = additional_properties
      @_field_set = { "direction": direction, "name": name, "status": status, "type": type }
    end
# Deserialize a JSON object to an instance of PaymentMethod
    #
    # @param json_object [String] 
    # @return [Monite::PaymentMethod]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      direction = parsed_json["direction"]
      name = parsed_json["name"]
      status = parsed_json["status"]
      type = parsed_json["type"]
      new(
        direction: direction,
        name: name,
        status: status,
        type: type,
        additional_properties: struct
      )
    end
# Serialize an instance of PaymentMethod to a JSON object
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
      obj.direction.is_a?(Monite::PaymentMethodDirection) != false || raise("Passed value for field obj.direction is not the expected type, validation failed.")
      obj.name.is_a?(Monite::MoniteAllPaymentMethods) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.status.is_a?(Monite::PaymentMethodStatus) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
      obj.type.is_a?(Monite::MoniteAllPaymentMethodsTypes) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
    end
  end
end