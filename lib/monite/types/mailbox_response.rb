# frozen_string_literal: true
require "ostruct"
require "json"

module Monite
  class MailboxResponse
  # @return [String] Mailbox UUID
    attr_reader :id
  # @return [String] 
    attr_reader :mailbox_domain_id
  # @return [String] 
    attr_reader :mailbox_full_address
  # @return [String] 
    attr_reader :mailbox_name
  # @return [String] 
    attr_reader :related_object_type
  # @return [String] 
    attr_reader :status
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] Mailbox UUID
    # @param mailbox_domain_id [String] 
    # @param mailbox_full_address [String] 
    # @param mailbox_name [String] 
    # @param related_object_type [String] 
    # @param status [String] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::MailboxResponse]
    def initialize(id:, mailbox_domain_id: OMIT, mailbox_full_address:, mailbox_name:, related_object_type:, status:, additional_properties: nil)
      @id = id
      @mailbox_domain_id = mailbox_domain_id if mailbox_domain_id != OMIT
      @mailbox_full_address = mailbox_full_address
      @mailbox_name = mailbox_name
      @related_object_type = related_object_type
      @status = status
      @additional_properties = additional_properties
      @_field_set = { "id": id, "mailbox_domain_id": mailbox_domain_id, "mailbox_full_address": mailbox_full_address, "mailbox_name": mailbox_name, "related_object_type": related_object_type, "status": status }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of MailboxResponse
    #
    # @param json_object [String] 
    # @return [Monite::MailboxResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      mailbox_domain_id = parsed_json["mailbox_domain_id"]
      mailbox_full_address = parsed_json["mailbox_full_address"]
      mailbox_name = parsed_json["mailbox_name"]
      related_object_type = parsed_json["related_object_type"]
      status = parsed_json["status"]
      new(
        id: id,
        mailbox_domain_id: mailbox_domain_id,
        mailbox_full_address: mailbox_full_address,
        mailbox_name: mailbox_name,
        related_object_type: related_object_type,
        status: status,
        additional_properties: struct
      )
    end
# Serialize an instance of MailboxResponse to a JSON object
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
      obj.mailbox_domain_id&.is_a?(String) != false || raise("Passed value for field obj.mailbox_domain_id is not the expected type, validation failed.")
      obj.mailbox_full_address.is_a?(String) != false || raise("Passed value for field obj.mailbox_full_address is not the expected type, validation failed.")
      obj.mailbox_name.is_a?(String) != false || raise("Passed value for field obj.mailbox_name is not the expected type, validation failed.")
      obj.related_object_type.is_a?(String) != false || raise("Passed value for field obj.related_object_type is not the expected type, validation failed.")
      obj.status.is_a?(String) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
    end
  end
end