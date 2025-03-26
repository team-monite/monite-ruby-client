# frozen_string_literal: true
require "ostruct"
require "json"

module Monite
  class AirwallexPlaidAccount
  # @return [String] Plaid`s unique identifier for the account
    attr_reader :id
  # @return [String] The last 2-4 alphanumeric characters of an account's official account number
    attr_reader :mask
  # @return [String] The name of the account, either assigned by the user or by the financial
#  institution itself
    attr_reader :name
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] Plaid`s unique identifier for the account
    # @param mask [String] The last 2-4 alphanumeric characters of an account's official account number
    # @param name [String] The name of the account, either assigned by the user or by the financial
#  institution itself
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::AirwallexPlaidAccount]
    def initialize(id:, mask:, name:, additional_properties: nil)
      @id = id
      @mask = mask
      @name = name
      @additional_properties = additional_properties
      @_field_set = { "id": id, "mask": mask, "name": name }
    end
# Deserialize a JSON object to an instance of AirwallexPlaidAccount
    #
    # @param json_object [String] 
    # @return [Monite::AirwallexPlaidAccount]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      mask = parsed_json["mask"]
      name = parsed_json["name"]
      new(
        id: id,
        mask: mask,
        name: name,
        additional_properties: struct
      )
    end
# Serialize an instance of AirwallexPlaidAccount to a JSON object
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
      obj.mask.is_a?(String) != false || raise("Passed value for field obj.mask is not the expected type, validation failed.")
      obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
    end
  end
end