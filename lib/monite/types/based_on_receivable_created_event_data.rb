# frozen_string_literal: true
require_relative "receivable_type"
require "ostruct"
require "json"

module Monite
# In invoice history, this object contains information about a credit note created
#  for this invoice.
#  In quote history, it contains information about an invoice created from this
#  quote.
  class BasedOnReceivableCreatedEventData
  # @return [String] The ID of the newly created receivable document.
    attr_reader :receivable_id
  # @return [Monite::ReceivableType] The type of the receivable document that was created based on the current
#  document.
    attr_reader :type
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param receivable_id [String] The ID of the newly created receivable document.
    # @param type [Monite::ReceivableType] The type of the receivable document that was created based on the current
#  document.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::BasedOnReceivableCreatedEventData]
    def initialize(receivable_id:, type:, additional_properties: nil)
      @receivable_id = receivable_id
      @type = type
      @additional_properties = additional_properties
      @_field_set = { "receivable_id": receivable_id, "type": type }
    end
# Deserialize a JSON object to an instance of BasedOnReceivableCreatedEventData
    #
    # @param json_object [String] 
    # @return [Monite::BasedOnReceivableCreatedEventData]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      receivable_id = parsed_json["receivable_id"]
      type = parsed_json["type"]
      new(
        receivable_id: receivable_id,
        type: type,
        additional_properties: struct
      )
    end
# Serialize an instance of BasedOnReceivableCreatedEventData to a JSON object
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
      obj.receivable_id.is_a?(String) != false || raise("Passed value for field obj.receivable_id is not the expected type, validation failed.")
      obj.type.is_a?(Monite::ReceivableType) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
    end
  end
end