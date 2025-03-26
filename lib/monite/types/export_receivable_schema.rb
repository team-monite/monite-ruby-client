# frozen_string_literal: true
require_relative "receivables_status_enum"
require "ostruct"
require "json"

module Monite
  class ExportReceivableSchema
  # @return [Array<Monite::ReceivablesStatusEnum>] 
    attr_reader :statuses
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param statuses [Array<Monite::ReceivablesStatusEnum>] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::ExportReceivableSchema]
    def initialize(statuses:, additional_properties: nil)
      @statuses = statuses
      @additional_properties = additional_properties
      @_field_set = { "statuses": statuses }
    end
# Deserialize a JSON object to an instance of ExportReceivableSchema
    #
    # @param json_object [String] 
    # @return [Monite::ExportReceivableSchema]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      statuses = parsed_json["statuses"]
      new(statuses: statuses, additional_properties: struct)
    end
# Serialize an instance of ExportReceivableSchema to a JSON object
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
      obj.statuses.is_a?(Array) != false || raise("Passed value for field obj.statuses is not the expected type, validation failed.")
    end
  end
end