# frozen_string_literal: true
require "ostruct"
require "json"

module Monite
  class ReceivablesRemindersWarningMessage
  # @return [String] Warning message for payment reminder
    attr_reader :payment_reminders
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param payment_reminders [String] Warning message for payment reminder
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::ReceivablesRemindersWarningMessage]
    def initialize(payment_reminders: OMIT, additional_properties: nil)
      @payment_reminders = payment_reminders if payment_reminders != OMIT
      @additional_properties = additional_properties
      @_field_set = { "payment_reminders": payment_reminders }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of ReceivablesRemindersWarningMessage
    #
    # @param json_object [String] 
    # @return [Monite::ReceivablesRemindersWarningMessage]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      payment_reminders = parsed_json["payment_reminders"]
      new(payment_reminders: payment_reminders, additional_properties: struct)
    end
# Serialize an instance of ReceivablesRemindersWarningMessage to a JSON object
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
      obj.payment_reminders&.is_a?(String) != false || raise("Passed value for field obj.payment_reminders is not the expected type, validation failed.")
    end
  end
end