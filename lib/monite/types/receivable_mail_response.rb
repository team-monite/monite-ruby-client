# frozen_string_literal: true
require "date"
require "date"
require_relative "receivable_mail_recipients"
require_relative "receivable_mail_status_enum"
require "ostruct"
require "json"

module Monite
  class ReceivableMailResponse
  # @return [String] 
    attr_reader :id
  # @return [DateTime] The time the mail task was created
    attr_reader :created_at
  # @return [DateTime] The time the mail task was updated
    attr_reader :updated_at
  # @return [Monite::ReceivableMailRecipients] 
    attr_reader :recipients
  # @return [Monite::ReceivableMailStatusEnum] The status of the mail sent by receivable
    attr_reader :status
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] 
    # @param created_at [DateTime] The time the mail task was created
    # @param updated_at [DateTime] The time the mail task was updated
    # @param recipients [Monite::ReceivableMailRecipients] 
    # @param status [Monite::ReceivableMailStatusEnum] The status of the mail sent by receivable
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::ReceivableMailResponse]
    def initialize(id:, created_at:, updated_at:, recipients: OMIT, status:, additional_properties: nil)
      @id = id
      @created_at = created_at
      @updated_at = updated_at
      @recipients = recipients if recipients != OMIT
      @status = status
      @additional_properties = additional_properties
      @_field_set = { "id": id, "created_at": created_at, "updated_at": updated_at, "recipients": recipients, "status": status }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of ReceivableMailResponse
    #
    # @param json_object [String] 
    # @return [Monite::ReceivableMailResponse]
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
      unless parsed_json["recipients"].nil?
        recipients = parsed_json["recipients"].to_json
        recipients = Monite::ReceivableMailRecipients.from_json(json_object: recipients)
      else
        recipients = nil
      end
      status = parsed_json["status"]
      new(
        id: id,
        created_at: created_at,
        updated_at: updated_at,
        recipients: recipients,
        status: status,
        additional_properties: struct
      )
    end
# Serialize an instance of ReceivableMailResponse to a JSON object
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
      obj.recipients.nil? || Monite::ReceivableMailRecipients.validate_raw(obj: obj.recipients)
      obj.status.is_a?(Monite::ReceivableMailStatusEnum) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
    end
  end
end