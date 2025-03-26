# frozen_string_literal: true
require_relative "dns_record_purpose"
require_relative "dns_record_type"
require "ostruct"
require "json"

module Monite
  class DnsRecord
  # @return [Boolean] 
    attr_reader :is_active
  # @return [String] 
    attr_reader :name
  # @return [Monite::DnsRecordPurpose] Purpose of specific entry to distinguish between various TXT entries.
    attr_reader :record_purpose
  # @return [Monite::DnsRecordType] 
    attr_reader :record_type
  # @return [String] Field reflecting validation status by Mailgun.
    attr_reader :valid
  # @return [String] 
    attr_reader :value
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param is_active [Boolean] 
    # @param name [String] 
    # @param record_purpose [Monite::DnsRecordPurpose] Purpose of specific entry to distinguish between various TXT entries.
    # @param record_type [Monite::DnsRecordType] 
    # @param valid [String] Field reflecting validation status by Mailgun.
    # @param value [String] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::DnsRecord]
    def initialize(is_active:, name: OMIT, record_purpose: OMIT, record_type:, valid:, value:, additional_properties: nil)
      @is_active = is_active
      @name = name if name != OMIT
      @record_purpose = record_purpose if record_purpose != OMIT
      @record_type = record_type
      @valid = valid
      @value = value
      @additional_properties = additional_properties
      @_field_set = { "is_active": is_active, "name": name, "record_purpose": record_purpose, "record_type": record_type, "valid": valid, "value": value }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of DnsRecord
    #
    # @param json_object [String] 
    # @return [Monite::DnsRecord]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      is_active = parsed_json["is_active"]
      name = parsed_json["name"]
      record_purpose = parsed_json["record_purpose"]
      record_type = parsed_json["record_type"]
      valid = parsed_json["valid"]
      value = parsed_json["value"]
      new(
        is_active: is_active,
        name: name,
        record_purpose: record_purpose,
        record_type: record_type,
        valid: valid,
        value: value,
        additional_properties: struct
      )
    end
# Serialize an instance of DnsRecord to a JSON object
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
      obj.is_active.is_a?(Boolean) != false || raise("Passed value for field obj.is_active is not the expected type, validation failed.")
      obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.record_purpose&.is_a?(Monite::DnsRecordPurpose) != false || raise("Passed value for field obj.record_purpose is not the expected type, validation failed.")
      obj.record_type.is_a?(Monite::DnsRecordType) != false || raise("Passed value for field obj.record_type is not the expected type, validation failed.")
      obj.valid.is_a?(String) != false || raise("Passed value for field obj.valid is not the expected type, validation failed.")
      obj.value.is_a?(String) != false || raise("Passed value for field obj.value is not the expected type, validation failed.")
    end
  end
end