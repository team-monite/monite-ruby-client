# frozen_string_literal: true
require_relative "receivables_status_enum"
require "ostruct"
require "json"

module Monite
# Contains information about a document's status change. See the applicable
#  [invoice statuses](https://docs.monite.com/accounts-receivable/invoices/index),
#  [quote statuses](https://docs.monite.com/accounts-receivable/quotes/index),
#  and [credit note
#  https://docs.monite.com/accounts-receivable/credit-notes#credit-note-lifecycle).
  class StatusChangedEventData
  # @return [Monite::ReceivablesStatusEnum] The new status of a document.
    attr_reader :new_status
  # @return [Monite::ReceivablesStatusEnum] The old status of a document.
    attr_reader :old_status
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param new_status [Monite::ReceivablesStatusEnum] The new status of a document.
    # @param old_status [Monite::ReceivablesStatusEnum] The old status of a document.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::StatusChangedEventData]
    def initialize(new_status:, old_status:, additional_properties: nil)
      @new_status = new_status
      @old_status = old_status
      @additional_properties = additional_properties
      @_field_set = { "new_status": new_status, "old_status": old_status }
    end
# Deserialize a JSON object to an instance of StatusChangedEventData
    #
    # @param json_object [String] 
    # @return [Monite::StatusChangedEventData]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      new_status = parsed_json["new_status"]
      old_status = parsed_json["old_status"]
      new(
        new_status: new_status,
        old_status: old_status,
        additional_properties: struct
      )
    end
# Serialize an instance of StatusChangedEventData to a JSON object
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
      obj.new_status.is_a?(Monite::ReceivablesStatusEnum) != false || raise("Passed value for field obj.new_status is not the expected type, validation failed.")
      obj.old_status.is_a?(Monite::ReceivablesStatusEnum) != false || raise("Passed value for field obj.old_status is not the expected type, validation failed.")
    end
  end
end