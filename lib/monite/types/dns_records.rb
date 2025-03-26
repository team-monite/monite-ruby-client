# frozen_string_literal: true
require_relative "dns_record"
require "ostruct"
require "json"

module Monite
  class DnsRecords
  # @return [Array<Monite::DnsRecord>] Set of DNS settings required by Mailgun for domain verification before emails
#  receiving is possible.
    attr_reader :receiving_dns_records
  # @return [Array<Monite::DnsRecord>] Set of DNS settings required by Mailgun for domain verification before emails
#  sending is possible.
    attr_reader :sending_dns_records
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param receiving_dns_records [Array<Monite::DnsRecord>] Set of DNS settings required by Mailgun for domain verification before emails
#  receiving is possible.
    # @param sending_dns_records [Array<Monite::DnsRecord>] Set of DNS settings required by Mailgun for domain verification before emails
#  sending is possible.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::DnsRecords]
    def initialize(receiving_dns_records:, sending_dns_records:, additional_properties: nil)
      @receiving_dns_records = receiving_dns_records
      @sending_dns_records = sending_dns_records
      @additional_properties = additional_properties
      @_field_set = { "receiving_dns_records": receiving_dns_records, "sending_dns_records": sending_dns_records }
    end
# Deserialize a JSON object to an instance of DnsRecords
    #
    # @param json_object [String] 
    # @return [Monite::DnsRecords]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      receiving_dns_records = parsed_json["receiving_dns_records"]&.map do | item |
  item = item.to_json
  Monite::DnsRecord.from_json(json_object: item)
end
      sending_dns_records = parsed_json["sending_dns_records"]&.map do | item |
  item = item.to_json
  Monite::DnsRecord.from_json(json_object: item)
end
      new(
        receiving_dns_records: receiving_dns_records,
        sending_dns_records: sending_dns_records,
        additional_properties: struct
      )
    end
# Serialize an instance of DnsRecords to a JSON object
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
      obj.receiving_dns_records.is_a?(Array) != false || raise("Passed value for field obj.receiving_dns_records is not the expected type, validation failed.")
      obj.sending_dns_records.is_a?(Array) != false || raise("Passed value for field obj.sending_dns_records is not the expected type, validation failed.")
    end
  end
end