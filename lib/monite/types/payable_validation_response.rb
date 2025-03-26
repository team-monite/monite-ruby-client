# frozen_string_literal: true
require "ostruct"
require "json"

module Monite
  class PayableValidationResponse
  # @return [String] A unique ID assigned to this payable.
    attr_reader :id
  # @return [Array<Hash{String => Object}>] 
    attr_reader :validation_errors
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] A unique ID assigned to this payable.
    # @param validation_errors [Array<Hash{String => Object}>] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::PayableValidationResponse]
    def initialize(id:, validation_errors: OMIT, additional_properties: nil)
      @id = id
      @validation_errors = validation_errors if validation_errors != OMIT
      @additional_properties = additional_properties
      @_field_set = { "id": id, "validation_errors": validation_errors }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of PayableValidationResponse
    #
    # @param json_object [String] 
    # @return [Monite::PayableValidationResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      validation_errors = parsed_json["validation_errors"]
      new(
        id: id,
        validation_errors: validation_errors,
        additional_properties: struct
      )
    end
# Serialize an instance of PayableValidationResponse to a JSON object
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
      obj.validation_errors&.is_a?(Array) != false || raise("Passed value for field obj.validation_errors is not the expected type, validation failed.")
    end
  end
end