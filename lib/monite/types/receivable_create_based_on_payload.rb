# frozen_string_literal: true
require_relative "based_on_transition_type"
require "ostruct"
require "json"

module Monite
  class ReceivableCreateBasedOnPayload
  # @return [String] The unique ID of a previous document related to the receivable if applicable.
    attr_reader :based_on
  # @return [Array<String>] A list of IDs of user-defined tags (labels) assigned to this receivable.
    attr_reader :tag_ids
  # @return [Monite::BasedOnTransitionType] The type of a created receivable. Currently supported transitions:quote ->
#  invoice; invoice -> credit_note
    attr_reader :type
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param based_on [String] The unique ID of a previous document related to the receivable if applicable.
    # @param tag_ids [Array<String>] A list of IDs of user-defined tags (labels) assigned to this receivable.
    # @param type [Monite::BasedOnTransitionType] The type of a created receivable. Currently supported transitions:quote ->
#  invoice; invoice -> credit_note
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::ReceivableCreateBasedOnPayload]
    def initialize(based_on:, tag_ids: OMIT, type:, additional_properties: nil)
      @based_on = based_on
      @tag_ids = tag_ids if tag_ids != OMIT
      @type = type
      @additional_properties = additional_properties
      @_field_set = { "based_on": based_on, "tag_ids": tag_ids, "type": type }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of ReceivableCreateBasedOnPayload
    #
    # @param json_object [String] 
    # @return [Monite::ReceivableCreateBasedOnPayload]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      based_on = parsed_json["based_on"]
      tag_ids = parsed_json["tag_ids"]
      type = parsed_json["type"]
      new(
        based_on: based_on,
        tag_ids: tag_ids,
        type: type,
        additional_properties: struct
      )
    end
# Serialize an instance of ReceivableCreateBasedOnPayload to a JSON object
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
      obj.based_on.is_a?(String) != false || raise("Passed value for field obj.based_on is not the expected type, validation failed.")
      obj.tag_ids&.is_a?(Array) != false || raise("Passed value for field obj.tag_ids is not the expected type, validation failed.")
      obj.type.is_a?(Monite::BasedOnTransitionType) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
    end
  end
end