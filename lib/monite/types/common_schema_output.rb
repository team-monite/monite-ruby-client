# frozen_string_literal: true
require_relative "action_schema"
require "ostruct"
require "json"

module Monite
  class CommonSchemaOutput
  # @return [Array<Monite::ActionSchema>] List of actions
    attr_reader :actions
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param actions [Array<Monite::ActionSchema>] List of actions
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::CommonSchemaOutput]
    def initialize(actions: OMIT, additional_properties: nil)
      @actions = actions if actions != OMIT
      @additional_properties = additional_properties
      @_field_set = { "actions": actions }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of CommonSchemaOutput
    #
    # @param json_object [String] 
    # @return [Monite::CommonSchemaOutput]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      actions = parsed_json["actions"]&.map do | item |
  item = item.to_json
  Monite::ActionSchema.from_json(json_object: item)
end
      new(actions: actions, additional_properties: struct)
    end
# Serialize an instance of CommonSchemaOutput to a JSON object
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
      obj.actions&.is_a?(Array) != false || raise("Passed value for field obj.actions is not the expected type, validation failed.")
    end
  end
end