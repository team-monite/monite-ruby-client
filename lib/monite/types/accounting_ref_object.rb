# frozen_string_literal: true
require "ostruct"
require "json"

module Monite
  class AccountingRefObject
  # @return [String] An internal ID of the tax rate in the accounting system.
    attr_reader :id
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] An internal ID of the tax rate in the accounting system.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::AccountingRefObject]
    def initialize(id: OMIT, additional_properties: nil)
      @id = id if id != OMIT
      @additional_properties = additional_properties
      @_field_set = { "id": id }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of AccountingRefObject
    #
    # @param json_object [String] 
    # @return [Monite::AccountingRefObject]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      new(id: id, additional_properties: struct)
    end
# Serialize an instance of AccountingRefObject to a JSON object
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
    end
  end
end