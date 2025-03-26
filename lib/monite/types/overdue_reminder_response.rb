# frozen_string_literal: true
require "date"
require "date"
require_relative "recipients"
require_relative "overdue_reminder_term"
require "ostruct"
require "json"

module Monite
  class OverdueReminderResponse
  # @return [String] 
    attr_reader :id
  # @return [DateTime] Time at which the OverdueReminder was created. Timestamps follow the ISO 8601
#  standard.
    attr_reader :created_at
  # @return [DateTime] Time at which the OverdueReminder was last updated. Timestamps follow the ISO
#  8601 standard.
    attr_reader :updated_at
  # @return [String] 
    attr_reader :name
  # @return [Monite::Recipients] 
    attr_reader :recipients
  # @return [Array<Monite::OverdueReminderTerm>] Overdue reminder terms to send for payment
    attr_reader :terms
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] 
    # @param created_at [DateTime] Time at which the OverdueReminder was created. Timestamps follow the ISO 8601
#  standard.
    # @param updated_at [DateTime] Time at which the OverdueReminder was last updated. Timestamps follow the ISO
#  8601 standard.
    # @param name [String] 
    # @param recipients [Monite::Recipients] 
    # @param terms [Array<Monite::OverdueReminderTerm>] Overdue reminder terms to send for payment
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::OverdueReminderResponse]
    def initialize(id:, created_at:, updated_at:, name:, recipients: OMIT, terms: OMIT, additional_properties: nil)
      @id = id
      @created_at = created_at
      @updated_at = updated_at
      @name = name
      @recipients = recipients if recipients != OMIT
      @terms = terms if terms != OMIT
      @additional_properties = additional_properties
      @_field_set = { "id": id, "created_at": created_at, "updated_at": updated_at, "name": name, "recipients": recipients, "terms": terms }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of OverdueReminderResponse
    #
    # @param json_object [String] 
    # @return [Monite::OverdueReminderResponse]
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
      name = parsed_json["name"]
      unless parsed_json["recipients"].nil?
        recipients = parsed_json["recipients"].to_json
        recipients = Monite::Recipients.from_json(json_object: recipients)
      else
        recipients = nil
      end
      terms = parsed_json["terms"]&.map do | item |
  item = item.to_json
  Monite::OverdueReminderTerm.from_json(json_object: item)
end
      new(
        id: id,
        created_at: created_at,
        updated_at: updated_at,
        name: name,
        recipients: recipients,
        terms: terms,
        additional_properties: struct
      )
    end
# Serialize an instance of OverdueReminderResponse to a JSON object
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
      obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.recipients.nil? || Monite::Recipients.validate_raw(obj: obj.recipients)
      obj.terms&.is_a?(Array) != false || raise("Passed value for field obj.terms is not the expected type, validation failed.")
    end
  end
end