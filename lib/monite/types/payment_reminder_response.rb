# frozen_string_literal: true
require "date"
require "date"
require_relative "recipients"
require_relative "status_enum"
require_relative "reminder"
require "ostruct"
require "json"

module Monite
  class PaymentReminderResponse
  # @return [String] 
    attr_reader :id
  # @return [DateTime] Time at which the PaymentReminder was created. Timestamps follow the ISO 8601
#  standard.
    attr_reader :created_at
  # @return [DateTime] Time at which the PaymentReminder was last updated. Timestamps follow the ISO
#  8601 standard.
    attr_reader :updated_at
  # @return [String] 
    attr_reader :entity_id
  # @return [String] 
    attr_reader :name
  # @return [Monite::Recipients] 
    attr_reader :recipients
  # @return [Monite::StatusEnum] 
    attr_reader :status
  # @return [Monite::Reminder] Reminder to send for first payment term
    attr_reader :term_1_reminder
  # @return [Monite::Reminder] Reminder to send for second payment term
    attr_reader :term_2_reminder
  # @return [Monite::Reminder] Reminder to send for final payment term
    attr_reader :term_final_reminder
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] 
    # @param created_at [DateTime] Time at which the PaymentReminder was created. Timestamps follow the ISO 8601
#  standard.
    # @param updated_at [DateTime] Time at which the PaymentReminder was last updated. Timestamps follow the ISO
#  8601 standard.
    # @param entity_id [String] 
    # @param name [String] 
    # @param recipients [Monite::Recipients] 
    # @param status [Monite::StatusEnum] 
    # @param term_1_reminder [Monite::Reminder] Reminder to send for first payment term
    # @param term_2_reminder [Monite::Reminder] Reminder to send for second payment term
    # @param term_final_reminder [Monite::Reminder] Reminder to send for final payment term
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::PaymentReminderResponse]
    def initialize(id:, created_at:, updated_at:, entity_id:, name:, recipients: OMIT, status:, term_1_reminder: OMIT, term_2_reminder: OMIT, term_final_reminder: OMIT, additional_properties: nil)
      @id = id
      @created_at = created_at
      @updated_at = updated_at
      @entity_id = entity_id
      @name = name
      @recipients = recipients if recipients != OMIT
      @status = status
      @term_1_reminder = term_1_reminder if term_1_reminder != OMIT
      @term_2_reminder = term_2_reminder if term_2_reminder != OMIT
      @term_final_reminder = term_final_reminder if term_final_reminder != OMIT
      @additional_properties = additional_properties
      @_field_set = { "id": id, "created_at": created_at, "updated_at": updated_at, "entity_id": entity_id, "name": name, "recipients": recipients, "status": status, "term_1_reminder": term_1_reminder, "term_2_reminder": term_2_reminder, "term_final_reminder": term_final_reminder }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of PaymentReminderResponse
    #
    # @param json_object [String] 
    # @return [Monite::PaymentReminderResponse]
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
      entity_id = parsed_json["entity_id"]
      name = parsed_json["name"]
      unless parsed_json["recipients"].nil?
        recipients = parsed_json["recipients"].to_json
        recipients = Monite::Recipients.from_json(json_object: recipients)
      else
        recipients = nil
      end
      status = parsed_json["status"]
      unless parsed_json["term_1_reminder"].nil?
        term_1_reminder = parsed_json["term_1_reminder"].to_json
        term_1_reminder = Monite::Reminder.from_json(json_object: term_1_reminder)
      else
        term_1_reminder = nil
      end
      unless parsed_json["term_2_reminder"].nil?
        term_2_reminder = parsed_json["term_2_reminder"].to_json
        term_2_reminder = Monite::Reminder.from_json(json_object: term_2_reminder)
      else
        term_2_reminder = nil
      end
      unless parsed_json["term_final_reminder"].nil?
        term_final_reminder = parsed_json["term_final_reminder"].to_json
        term_final_reminder = Monite::Reminder.from_json(json_object: term_final_reminder)
      else
        term_final_reminder = nil
      end
      new(
        id: id,
        created_at: created_at,
        updated_at: updated_at,
        entity_id: entity_id,
        name: name,
        recipients: recipients,
        status: status,
        term_1_reminder: term_1_reminder,
        term_2_reminder: term_2_reminder,
        term_final_reminder: term_final_reminder,
        additional_properties: struct
      )
    end
# Serialize an instance of PaymentReminderResponse to a JSON object
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
      obj.entity_id.is_a?(String) != false || raise("Passed value for field obj.entity_id is not the expected type, validation failed.")
      obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.recipients.nil? || Monite::Recipients.validate_raw(obj: obj.recipients)
      obj.status.is_a?(Monite::StatusEnum) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
      obj.term_1_reminder.nil? || Monite::Reminder.validate_raw(obj: obj.term_1_reminder)
      obj.term_2_reminder.nil? || Monite::Reminder.validate_raw(obj: obj.term_2_reminder)
      obj.term_final_reminder.nil? || Monite::Reminder.validate_raw(obj: obj.term_final_reminder)
    end
  end
end