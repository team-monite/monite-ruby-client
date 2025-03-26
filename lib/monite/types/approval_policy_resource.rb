# frozen_string_literal: true
require "date"
require "date"
require_relative "approval_policy_resource_script_item"
require_relative "approval_policy_resource_trigger"
require_relative "approval_policy_resource_status"
require "date"
require "date"
require "ostruct"
require "json"

module Monite
  class ApprovalPolicyResource
  # @return [DateTime] The date and time (in the ISO 8601 format) when the approval policy becomes
#  active. Only payables submitted for approval during the policy's active period
#  will trigger this policy. If omitted or `null`, the policy is effective
#  immediately. The value will be converted to UTC.
    attr_reader :starts_at
  # @return [DateTime] The date and time (in the ISO 8601 format) when the approval policy stops being
#  active and stops triggering approval workflows.If `ends_at` is provided in the
#  request, then `starts_at` must also be provided and `ends_at` must be later than
#  `starts_at`. The value will be converted to UTC.
    attr_reader :ends_at
  # @return [String] The name of the approval policy.
    attr_reader :name
  # @return [String] A brief description of the approval policy.
    attr_reader :description
  # @return [Array<Monite::ApprovalPolicyResourceScriptItem>] A list of JSON objects that represents the approval policy script. The script
#  contains the logic that determines whether an action should be sent to approval.
#  This field is required, and it should contain at least one script object.
    attr_reader :script
  # @return [Monite::ApprovalPolicyResourceTrigger] A JSON object that represents the trigger for the approval policy. The trigger
#  specifies the event that will trigger the policy to be evaluated.
    attr_reader :trigger
  # @return [String] 
    attr_reader :id
  # @return [Monite::ApprovalPolicyResourceStatus] The current status of the approval policy.
    attr_reader :status
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

    # @param starts_at [DateTime] The date and time (in the ISO 8601 format) when the approval policy becomes
#  active. Only payables submitted for approval during the policy's active period
#  will trigger this policy. If omitted or `null`, the policy is effective
#  immediately. The value will be converted to UTC.
    # @param ends_at [DateTime] The date and time (in the ISO 8601 format) when the approval policy stops being
#  active and stops triggering approval workflows.If `ends_at` is provided in the
#  request, then `starts_at` must also be provided and `ends_at` must be later than
#  `starts_at`. The value will be converted to UTC.
    # @param name [String] The name of the approval policy.
    # @param description [String] A brief description of the approval policy.
    # @param script [Array<Monite::ApprovalPolicyResourceScriptItem>] A list of JSON objects that represents the approval policy script. The script
#  contains the logic that determines whether an action should be sent to approval.
#  This field is required, and it should contain at least one script object.
    # @param trigger [Monite::ApprovalPolicyResourceTrigger] A JSON object that represents the trigger for the approval policy. The trigger
#  specifies the event that will trigger the policy to be evaluated.
    # @param id [String] 
    # @param status [Monite::ApprovalPolicyResourceStatus] The current status of the approval policy.
    # @param created_at [DateTime] 
    # @param updated_at [DateTime] 
    # @param created_by [String] 
    # @param updated_by [String] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::ApprovalPolicyResource]
    def initialize(starts_at: OMIT, ends_at: OMIT, name:, description:, script:, trigger: OMIT, id:, status:, created_at:, updated_at:, created_by:, updated_by: OMIT, additional_properties: nil)
      @starts_at = starts_at if starts_at != OMIT
      @ends_at = ends_at if ends_at != OMIT
      @name = name
      @description = description
      @script = script
      @trigger = trigger if trigger != OMIT
      @id = id
      @status = status
      @created_at = created_at
      @updated_at = updated_at
      @created_by = created_by
      @updated_by = updated_by if updated_by != OMIT
      @additional_properties = additional_properties
      @_field_set = { "starts_at": starts_at, "ends_at": ends_at, "name": name, "description": description, "script": script, "trigger": trigger, "id": id, "status": status, "created_at": created_at, "updated_at": updated_at, "created_by": created_by, "updated_by": updated_by }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of ApprovalPolicyResource
    #
    # @param json_object [String] 
    # @return [Monite::ApprovalPolicyResource]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      starts_at = unless parsed_json["starts_at"].nil?
  DateTime.parse(parsed_json["starts_at"])
else
  nil
end
      ends_at = unless parsed_json["ends_at"].nil?
  DateTime.parse(parsed_json["ends_at"])
else
  nil
end
      name = parsed_json["name"]
      description = parsed_json["description"]
      script = parsed_json["script"]&.map do | item |
  item = item.to_json
  Monite::ApprovalPolicyResourceScriptItem.from_json(json_object: item)
end
      unless parsed_json["trigger"].nil?
        trigger = parsed_json["trigger"].to_json
        trigger = Monite::ApprovalPolicyResourceTrigger.from_json(json_object: trigger)
      else
        trigger = nil
      end
      id = parsed_json["id"]
      status = parsed_json["status"]
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
        starts_at: starts_at,
        ends_at: ends_at,
        name: name,
        description: description,
        script: script,
        trigger: trigger,
        id: id,
        status: status,
        created_at: created_at,
        updated_at: updated_at,
        created_by: created_by,
        updated_by: updated_by,
        additional_properties: struct
      )
    end
# Serialize an instance of ApprovalPolicyResource to a JSON object
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
      obj.starts_at&.is_a?(DateTime) != false || raise("Passed value for field obj.starts_at is not the expected type, validation failed.")
      obj.ends_at&.is_a?(DateTime) != false || raise("Passed value for field obj.ends_at is not the expected type, validation failed.")
      obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.description.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
      obj.script.is_a?(Array) != false || raise("Passed value for field obj.script is not the expected type, validation failed.")
      obj.trigger.nil? || Monite::ApprovalPolicyResourceTrigger.validate_raw(obj: obj.trigger)
      obj.id.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
      obj.status.is_a?(Monite::ApprovalPolicyResourceStatus) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
      obj.created_at.is_a?(DateTime) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
      obj.updated_at.is_a?(DateTime) != false || raise("Passed value for field obj.updated_at is not the expected type, validation failed.")
      obj.created_by.is_a?(String) != false || raise("Passed value for field obj.created_by is not the expected type, validation failed.")
      obj.updated_by&.is_a?(String) != false || raise("Passed value for field obj.updated_by is not the expected type, validation failed.")
    end
  end
end