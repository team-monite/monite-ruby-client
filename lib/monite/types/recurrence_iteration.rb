# frozen_string_literal: true
require_relative "iteration_status"
require "ostruct"
require "json"

module Monite
  class RecurrenceIteration
  # @return [String] 
    attr_reader :issue_at
  # @return [String] 
    attr_reader :issued_invoice_id
  # @return [Integer] 
    attr_reader :iteration
  # @return [Monite::IterationStatus] 
    attr_reader :status
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param issue_at [String] 
    # @param issued_invoice_id [String] 
    # @param iteration [Integer] 
    # @param status [Monite::IterationStatus] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::RecurrenceIteration]
    def initialize(issue_at:, issued_invoice_id: OMIT, iteration: OMIT, status:, additional_properties: nil)
      @issue_at = issue_at
      @issued_invoice_id = issued_invoice_id if issued_invoice_id != OMIT
      @iteration = iteration if iteration != OMIT
      @status = status
      @additional_properties = additional_properties
      @_field_set = { "issue_at": issue_at, "issued_invoice_id": issued_invoice_id, "iteration": iteration, "status": status }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of RecurrenceIteration
    #
    # @param json_object [String] 
    # @return [Monite::RecurrenceIteration]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      issue_at = parsed_json["issue_at"]
      issued_invoice_id = parsed_json["issued_invoice_id"]
      iteration = parsed_json["iteration"]
      status = parsed_json["status"]
      new(
        issue_at: issue_at,
        issued_invoice_id: issued_invoice_id,
        iteration: iteration,
        status: status,
        additional_properties: struct
      )
    end
# Serialize an instance of RecurrenceIteration to a JSON object
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
      obj.issue_at.is_a?(String) != false || raise("Passed value for field obj.issue_at is not the expected type, validation failed.")
      obj.issued_invoice_id&.is_a?(String) != false || raise("Passed value for field obj.issued_invoice_id is not the expected type, validation failed.")
      obj.iteration&.is_a?(Integer) != false || raise("Passed value for field obj.iteration is not the expected type, validation failed.")
      obj.status.is_a?(Monite::IterationStatus) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
    end
  end
end