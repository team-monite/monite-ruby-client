# frozen_string_literal: true
require_relative "domain_response_dns_records"
require "date"
require "ostruct"
require "json"

module Monite
  class DomainResponse
  # @return [String] Entry UUID
    attr_reader :id
  # @return [String] A dedicated IP address assigned to this mailbox and used to send outgoing email.
    attr_reader :dedicated_ip
  # @return [Monite::DomainResponseDnsRecords] 
    attr_reader :dns_records
  # @return [String] The domain name.
    attr_reader :domain
  # @return [DateTime] The time the domain was updated for the last time
    attr_reader :last_updated_at
  # @return [String] 
    attr_reader :status
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] Entry UUID
    # @param dedicated_ip [String] A dedicated IP address assigned to this mailbox and used to send outgoing email.
    # @param dns_records [Monite::DomainResponseDnsRecords] 
    # @param domain [String] The domain name.
    # @param last_updated_at [DateTime] The time the domain was updated for the last time
    # @param status [String] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::DomainResponse]
    def initialize(id:, dedicated_ip: OMIT, dns_records:, domain:, last_updated_at: OMIT, status:, additional_properties: nil)
      @id = id
      @dedicated_ip = dedicated_ip if dedicated_ip != OMIT
      @dns_records = dns_records
      @domain = domain
      @last_updated_at = last_updated_at if last_updated_at != OMIT
      @status = status
      @additional_properties = additional_properties
      @_field_set = { "id": id, "dedicated_ip": dedicated_ip, "dns_records": dns_records, "domain": domain, "last_updated_at": last_updated_at, "status": status }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of DomainResponse
    #
    # @param json_object [String] 
    # @return [Monite::DomainResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      dedicated_ip = parsed_json["dedicated_ip"]
      unless parsed_json["dns_records"].nil?
        dns_records = parsed_json["dns_records"].to_json
        dns_records = Monite::DomainResponseDnsRecords.from_json(json_object: dns_records)
      else
        dns_records = nil
      end
      domain = parsed_json["domain"]
      last_updated_at = unless parsed_json["last_updated_at"].nil?
  DateTime.parse(parsed_json["last_updated_at"])
else
  nil
end
      status = parsed_json["status"]
      new(
        id: id,
        dedicated_ip: dedicated_ip,
        dns_records: dns_records,
        domain: domain,
        last_updated_at: last_updated_at,
        status: status,
        additional_properties: struct
      )
    end
# Serialize an instance of DomainResponse to a JSON object
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
      obj.dedicated_ip&.is_a?(String) != false || raise("Passed value for field obj.dedicated_ip is not the expected type, validation failed.")
      Monite::DomainResponseDnsRecords.validate_raw(obj: obj.dns_records)
      obj.domain.is_a?(String) != false || raise("Passed value for field obj.domain is not the expected type, validation failed.")
      obj.last_updated_at&.is_a?(DateTime) != false || raise("Passed value for field obj.last_updated_at is not the expected type, validation failed.")
      obj.status.is_a?(String) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
    end
  end
end