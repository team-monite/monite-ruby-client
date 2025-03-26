# frozen_string_literal: true
require_relative "object_type_enum"
require "ostruct"
require "json"

module Monite
  class PaymentRecordObjectResponse
  # @return [String] ID of the invoice
    attr_reader :id
  # @return [String] Status, in which object has been moved
    attr_reader :new_status
  # @return [String] Status, in which object was before payment
    attr_reader :old_status
  # @return [Monite::ObjectTypeEnum] 
    attr_reader :type
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] ID of the invoice
    # @param new_status [String] Status, in which object has been moved
    # @param old_status [String] Status, in which object was before payment
    # @param type [Monite::ObjectTypeEnum] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::PaymentRecordObjectResponse]
    def initialize(id:, new_status:, old_status:, type:, additional_properties: nil)
      @id = id
      @new_status = new_status
      @old_status = old_status
      @type = type
      @additional_properties = additional_properties
      @_field_set = { "id": id, "new_status": new_status, "old_status": old_status, "type": type }
    end
# Deserialize a JSON object to an instance of PaymentRecordObjectResponse
    #
    # @param json_object [String] 
    # @return [Monite::PaymentRecordObjectResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      new_status = parsed_json["new_status"]
      old_status = parsed_json["old_status"]
      type = parsed_json["type"]
      new(
        id: id,
        new_status: new_status,
        old_status: old_status,
        type: type,
        additional_properties: struct
      )
    end
# Serialize an instance of PaymentRecordObjectResponse to a JSON object
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
      obj.new_status.is_a?(String) != false || raise("Passed value for field obj.new_status is not the expected type, validation failed.")
      obj.old_status.is_a?(String) != false || raise("Passed value for field obj.old_status is not the expected type, validation failed.")
      obj.type.is_a?(Monite::ObjectTypeEnum) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
    end
  end
end