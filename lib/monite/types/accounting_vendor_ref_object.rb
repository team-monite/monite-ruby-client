# frozen_string_literal: true
require "ostruct"
require "json"

module Monite
  class AccountingVendorRefObject
  # @return [String] A unique identifier of the vendor in the accounting system.
    attr_reader :id
  # @return [String] Vendor name in the accounting system.
    attr_reader :name
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] A unique identifier of the vendor in the accounting system.
    # @param name [String] Vendor name in the accounting system.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::AccountingVendorRefObject]
    def initialize(id:, name: OMIT, additional_properties: nil)
      @id = id
      @name = name if name != OMIT
      @additional_properties = additional_properties
      @_field_set = { "id": id, "name": name }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of AccountingVendorRefObject
    #
    # @param json_object [String] 
    # @return [Monite::AccountingVendorRefObject]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      name = parsed_json["name"]
      new(
        id: id,
        name: name,
        additional_properties: struct
      )
    end
# Serialize an instance of AccountingVendorRefObject to a JSON object
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
      obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
    end
  end
end