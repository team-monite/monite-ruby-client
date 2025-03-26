# frozen_string_literal: true
require "date"
require "ostruct"
require "json"

module Monite
  class PaymentMethodRequirements
  # @return [DateTime] 
    attr_reader :current_deadline
  # @return [Array<String>] 
    attr_reader :currently_due
  # @return [Array<String>] 
    attr_reader :eventually_due
  # @return [Array<String>] 
    attr_reader :past_due
  # @return [Array<String>] 
    attr_reader :pending_verification
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param current_deadline [DateTime] 
    # @param currently_due [Array<String>] 
    # @param eventually_due [Array<String>] 
    # @param past_due [Array<String>] 
    # @param pending_verification [Array<String>] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::PaymentMethodRequirements]
    def initialize(current_deadline: OMIT, currently_due:, eventually_due:, past_due:, pending_verification:, additional_properties: nil)
      @current_deadline = current_deadline if current_deadline != OMIT
      @currently_due = currently_due
      @eventually_due = eventually_due
      @past_due = past_due
      @pending_verification = pending_verification
      @additional_properties = additional_properties
      @_field_set = { "current_deadline": current_deadline, "currently_due": currently_due, "eventually_due": eventually_due, "past_due": past_due, "pending_verification": pending_verification }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of PaymentMethodRequirements
    #
    # @param json_object [String] 
    # @return [Monite::PaymentMethodRequirements]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      current_deadline = unless parsed_json["current_deadline"].nil?
  DateTime.parse(parsed_json["current_deadline"])
else
  nil
end
      currently_due = parsed_json["currently_due"]
      eventually_due = parsed_json["eventually_due"]
      past_due = parsed_json["past_due"]
      pending_verification = parsed_json["pending_verification"]
      new(
        current_deadline: current_deadline,
        currently_due: currently_due,
        eventually_due: eventually_due,
        past_due: past_due,
        pending_verification: pending_verification,
        additional_properties: struct
      )
    end
# Serialize an instance of PaymentMethodRequirements to a JSON object
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
      obj.current_deadline&.is_a?(DateTime) != false || raise("Passed value for field obj.current_deadline is not the expected type, validation failed.")
      obj.currently_due.is_a?(Array) != false || raise("Passed value for field obj.currently_due is not the expected type, validation failed.")
      obj.eventually_due.is_a?(Array) != false || raise("Passed value for field obj.eventually_due is not the expected type, validation failed.")
      obj.past_due.is_a?(Array) != false || raise("Passed value for field obj.past_due is not the expected type, validation failed.")
      obj.pending_verification.is_a?(Array) != false || raise("Passed value for field obj.pending_verification is not the expected type, validation failed.")
    end
  end
end