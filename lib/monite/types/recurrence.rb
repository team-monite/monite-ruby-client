# frozen_string_literal: true
require "date"
require "date"
require_relative "day_of_month"
require_relative "recurrence_iteration"
require_relative "recipients"
require_relative "recurrence_status"
require "ostruct"
require "json"

module Monite
  class Recurrence
  # @return [String] 
    attr_reader :id
  # @return [DateTime] Time at which the receivable was created. Timestamps follow the ISO 8601
#  standard.
    attr_reader :created_at
  # @return [DateTime] Time at which the receivable was last updated. Timestamps follow the ISO 8601
#  standard.
    attr_reader :updated_at
  # @return [String] 
    attr_reader :body_text
  # @return [Integer] 
    attr_reader :current_iteration
  # @return [Monite::DayOfMonth] 
    attr_reader :day_of_month
  # @return [Integer] 
    attr_reader :end_month
  # @return [Integer] 
    attr_reader :end_year
  # @return [String] 
    attr_reader :invoice_id
  # @return [Array<Monite::RecurrenceIteration>] 
    attr_reader :iterations
  # @return [Monite::Recipients] 
    attr_reader :recipients
  # @return [Integer] 
    attr_reader :start_month
  # @return [Integer] 
    attr_reader :start_year
  # @return [Monite::RecurrenceStatus] 
    attr_reader :status
  # @return [String] 
    attr_reader :subject_text
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] 
    # @param created_at [DateTime] Time at which the receivable was created. Timestamps follow the ISO 8601
#  standard.
    # @param updated_at [DateTime] Time at which the receivable was last updated. Timestamps follow the ISO 8601
#  standard.
    # @param body_text [String] 
    # @param current_iteration [Integer] 
    # @param day_of_month [Monite::DayOfMonth] 
    # @param end_month [Integer] 
    # @param end_year [Integer] 
    # @param invoice_id [String] 
    # @param iterations [Array<Monite::RecurrenceIteration>] 
    # @param recipients [Monite::Recipients] 
    # @param start_month [Integer] 
    # @param start_year [Integer] 
    # @param status [Monite::RecurrenceStatus] 
    # @param subject_text [String] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::Recurrence]
    def initialize(id:, created_at:, updated_at:, body_text: OMIT, current_iteration:, day_of_month:, end_month:, end_year:, invoice_id:, iterations:, recipients: OMIT, start_month:, start_year:, status:, subject_text: OMIT, additional_properties: nil)
      @id = id
      @created_at = created_at
      @updated_at = updated_at
      @body_text = body_text if body_text != OMIT
      @current_iteration = current_iteration
      @day_of_month = day_of_month
      @end_month = end_month
      @end_year = end_year
      @invoice_id = invoice_id
      @iterations = iterations
      @recipients = recipients if recipients != OMIT
      @start_month = start_month
      @start_year = start_year
      @status = status
      @subject_text = subject_text if subject_text != OMIT
      @additional_properties = additional_properties
      @_field_set = { "id": id, "created_at": created_at, "updated_at": updated_at, "body_text": body_text, "current_iteration": current_iteration, "day_of_month": day_of_month, "end_month": end_month, "end_year": end_year, "invoice_id": invoice_id, "iterations": iterations, "recipients": recipients, "start_month": start_month, "start_year": start_year, "status": status, "subject_text": subject_text }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of Recurrence
    #
    # @param json_object [String] 
    # @return [Monite::Recurrence]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
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
      body_text = parsed_json["body_text"]
      current_iteration = parsed_json["current_iteration"]
      day_of_month = parsed_json["day_of_month"]
      end_month = parsed_json["end_month"]
      end_year = parsed_json["end_year"]
      invoice_id = parsed_json["invoice_id"]
      iterations = parsed_json["iterations"]&.map do | item |
  item = item.to_json
  Monite::RecurrenceIteration.from_json(json_object: item)
end
      unless parsed_json["recipients"].nil?
        recipients = parsed_json["recipients"].to_json
        recipients = Monite::Recipients.from_json(json_object: recipients)
      else
        recipients = nil
      end
      start_month = parsed_json["start_month"]
      start_year = parsed_json["start_year"]
      status = parsed_json["status"]
      subject_text = parsed_json["subject_text"]
      new(
        id: id,
        created_at: created_at,
        updated_at: updated_at,
        body_text: body_text,
        current_iteration: current_iteration,
        day_of_month: day_of_month,
        end_month: end_month,
        end_year: end_year,
        invoice_id: invoice_id,
        iterations: iterations,
        recipients: recipients,
        start_month: start_month,
        start_year: start_year,
        status: status,
        subject_text: subject_text,
        additional_properties: struct
      )
    end
# Serialize an instance of Recurrence to a JSON object
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
      obj.created_at.is_a?(DateTime) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
      obj.updated_at.is_a?(DateTime) != false || raise("Passed value for field obj.updated_at is not the expected type, validation failed.")
      obj.body_text&.is_a?(String) != false || raise("Passed value for field obj.body_text is not the expected type, validation failed.")
      obj.current_iteration.is_a?(Integer) != false || raise("Passed value for field obj.current_iteration is not the expected type, validation failed.")
      obj.day_of_month.is_a?(Monite::DayOfMonth) != false || raise("Passed value for field obj.day_of_month is not the expected type, validation failed.")
      obj.end_month.is_a?(Integer) != false || raise("Passed value for field obj.end_month is not the expected type, validation failed.")
      obj.end_year.is_a?(Integer) != false || raise("Passed value for field obj.end_year is not the expected type, validation failed.")
      obj.invoice_id.is_a?(String) != false || raise("Passed value for field obj.invoice_id is not the expected type, validation failed.")
      obj.iterations.is_a?(Array) != false || raise("Passed value for field obj.iterations is not the expected type, validation failed.")
      obj.recipients.nil? || Monite::Recipients.validate_raw(obj: obj.recipients)
      obj.start_month.is_a?(Integer) != false || raise("Passed value for field obj.start_month is not the expected type, validation failed.")
      obj.start_year.is_a?(Integer) != false || raise("Passed value for field obj.start_year is not the expected type, validation failed.")
      obj.status.is_a?(Monite::RecurrenceStatus) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
      obj.subject_text&.is_a?(String) != false || raise("Passed value for field obj.subject_text is not the expected type, validation failed.")
    end
  end
end