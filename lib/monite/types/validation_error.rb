# frozen_string_literal: true
require_relative "validation_error_loc_item"
require "ostruct"
require "json"

module Monite
  class ValidationError
  # @return [Array<Monite::ValidationErrorLocItem>] 
    attr_reader :loc
  # @return [String] 
    attr_reader :msg
  # @return [String] 
    attr_reader :type
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param loc [Array<Monite::ValidationErrorLocItem>] 
    # @param msg [String] 
    # @param type [String] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::ValidationError]
    def initialize(loc:, msg:, type:, additional_properties: nil)
      @loc = loc
      @msg = msg
      @type = type
      @additional_properties = additional_properties
      @_field_set = { "loc": loc, "msg": msg, "type": type }
    end
# Deserialize a JSON object to an instance of ValidationError
    #
    # @param json_object [String] 
    # @return [Monite::ValidationError]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      loc = parsed_json["loc"]&.map do | item |
  item = item.to_json
  Monite::ValidationErrorLocItem.from_json(json_object: item)
end
      msg = parsed_json["msg"]
      type = parsed_json["type"]
      new(
        loc: loc,
        msg: msg,
        type: type,
        additional_properties: struct
      )
    end
# Serialize an instance of ValidationError to a JSON object
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
      obj.loc.is_a?(Array) != false || raise("Passed value for field obj.loc is not the expected type, validation failed.")
      obj.msg.is_a?(String) != false || raise("Passed value for field obj.msg is not the expected type, validation failed.")
      obj.type.is_a?(String) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
    end
  end
end