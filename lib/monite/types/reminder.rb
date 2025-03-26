# frozen_string_literal: true
require "ostruct"
require "json"

module Monite
  class Reminder
  # @return [String] 
    attr_reader :body
  # @return [Integer] 
    attr_reader :days_before
  # @return [String] 
    attr_reader :subject
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param body [String] 
    # @param days_before [Integer] 
    # @param subject [String] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::Reminder]
    def initialize(body:, days_before:, subject:, additional_properties: nil)
      @body = body
      @days_before = days_before
      @subject = subject
      @additional_properties = additional_properties
      @_field_set = { "body": body, "days_before": days_before, "subject": subject }
    end
# Deserialize a JSON object to an instance of Reminder
    #
    # @param json_object [String] 
    # @return [Monite::Reminder]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      body = parsed_json["body"]
      days_before = parsed_json["days_before"]
      subject = parsed_json["subject"]
      new(
        body: body,
        days_before: days_before,
        subject: subject,
        additional_properties: struct
      )
    end
# Serialize an instance of Reminder to a JSON object
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
      obj.body.is_a?(String) != false || raise("Passed value for field obj.body is not the expected type, validation failed.")
      obj.days_before.is_a?(Integer) != false || raise("Passed value for field obj.days_before is not the expected type, validation failed.")
      obj.subject.is_a?(String) != false || raise("Passed value for field obj.subject is not the expected type, validation failed.")
    end
  end
end