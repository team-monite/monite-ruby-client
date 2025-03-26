# frozen_string_literal: true
require_relative "process_status_enum"
require_relative "process_resource_script_snapshot"
require "date"
require "date"
require "ostruct"
require "json"

module Monite
  class ProcessResource
  # @return [String] 
    attr_reader :id
  # @return [Monite::ProcessStatusEnum] Tthe current status of the approval policy process.
    attr_reader :status
  # @return [Hash{String => Object}] The input for the script.
    attr_reader :input
  # @return [Hash{String => Object}] The error for the process.
    attr_reader :error
  # @return [Monite::ProcessResourceScriptSnapshot] The script snapshot taken when script started.
    attr_reader :script_snapshot
  # @return [Hash{String => Object}] The metadata for the process.
    attr_reader :metadata
  # @return [DateTime] 
    attr_reader :created_at
  # @return [DateTime] 
    attr_reader :updated_at
  # @return [String] 
    attr_reader :created_by
  # @return [String] 
    attr_reader :updated_by
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] 
    # @param status [Monite::ProcessStatusEnum] Tthe current status of the approval policy process.
    # @param input [Hash{String => Object}] The input for the script.
    # @param error [Hash{String => Object}] The error for the process.
    # @param script_snapshot [Monite::ProcessResourceScriptSnapshot] The script snapshot taken when script started.
    # @param metadata [Hash{String => Object}] The metadata for the process.
    # @param created_at [DateTime] 
    # @param updated_at [DateTime] 
    # @param created_by [String] 
    # @param updated_by [String] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::ProcessResource]
    def initialize(id:, status:, input:, error: OMIT, script_snapshot: OMIT, metadata:, created_at:, updated_at: OMIT, created_by: OMIT, updated_by: OMIT, additional_properties: nil)
      @id = id
      @status = status
      @input = input
      @error = error if error != OMIT
      @script_snapshot = script_snapshot if script_snapshot != OMIT
      @metadata = metadata
      @created_at = created_at
      @updated_at = updated_at if updated_at != OMIT
      @created_by = created_by if created_by != OMIT
      @updated_by = updated_by if updated_by != OMIT
      @additional_properties = additional_properties
      @_field_set = { "id": id, "status": status, "input": input, "error": error, "script_snapshot": script_snapshot, "metadata": metadata, "created_at": created_at, "updated_at": updated_at, "created_by": created_by, "updated_by": updated_by }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of ProcessResource
    #
    # @param json_object [String] 
    # @return [Monite::ProcessResource]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      status = parsed_json["status"]
      input = parsed_json["input"]
      error = parsed_json["error"]
      unless parsed_json["script_snapshot"].nil?
        script_snapshot = parsed_json["script_snapshot"].to_json
        script_snapshot = Monite::ProcessResourceScriptSnapshot.from_json(json_object: script_snapshot)
      else
        script_snapshot = nil
      end
      metadata = parsed_json["metadata"]
      created_at = unless parsed_json["created_at"].nil?
  DateTime.parse(parsed_json["created_at"])
else
  nil
end
      updated_at = unless parsed_json["updated_at"].nil?
  DateTime.parse(parsed_json["updated_at"])
else
  nil
end
      created_by = parsed_json["created_by"]
      updated_by = parsed_json["updated_by"]
      new(
        id: id,
        status: status,
        input: input,
        error: error,
        script_snapshot: script_snapshot,
        metadata: metadata,
        created_at: created_at,
        updated_at: updated_at,
        created_by: created_by,
        updated_by: updated_by,
        additional_properties: struct
      )
    end
# Serialize an instance of ProcessResource to a JSON object
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
      obj.status.is_a?(Monite::ProcessStatusEnum) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
      obj.input.is_a?(Hash) != false || raise("Passed value for field obj.input is not the expected type, validation failed.")
      obj.error&.is_a?(Hash) != false || raise("Passed value for field obj.error is not the expected type, validation failed.")
      obj.script_snapshot.nil? || Monite::ProcessResourceScriptSnapshot.validate_raw(obj: obj.script_snapshot)
      obj.metadata.is_a?(Hash) != false || raise("Passed value for field obj.metadata is not the expected type, validation failed.")
      obj.created_at.is_a?(DateTime) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
      obj.updated_at&.is_a?(DateTime) != false || raise("Passed value for field obj.updated_at is not the expected type, validation failed.")
      obj.created_by&.is_a?(String) != false || raise("Passed value for field obj.created_by is not the expected type, validation failed.")
      obj.updated_by&.is_a?(String) != false || raise("Passed value for field obj.updated_by is not the expected type, validation failed.")
    end
  end
end