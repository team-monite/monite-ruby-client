# frozen_string_literal: true
require "date"
require "ostruct"
require "json"

module Monite
  class TermsOfServiceAcceptanceOutput
  # @return [DateTime] The date and time (in the ISO 8601 format) when the entity representative
#  accepted the service agreement.
    attr_reader :date
  # @return [String] The IP address from which the entity representative accepted the service
#  agreement. If omitted or set to `null` in the request, the IP address is
#  inferred from the request origin or the `X-Forwarded-For` request header.
    attr_reader :ip
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param date [DateTime] The date and time (in the ISO 8601 format) when the entity representative
#  accepted the service agreement.
    # @param ip [String] The IP address from which the entity representative accepted the service
#  agreement. If omitted or set to `null` in the request, the IP address is
#  inferred from the request origin or the `X-Forwarded-For` request header.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::TermsOfServiceAcceptanceOutput]
    def initialize(date: OMIT, ip: OMIT, additional_properties: nil)
      @date = date if date != OMIT
      @ip = ip if ip != OMIT
      @additional_properties = additional_properties
      @_field_set = { "date": date, "ip": ip }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of TermsOfServiceAcceptanceOutput
    #
    # @param json_object [String] 
    # @return [Monite::TermsOfServiceAcceptanceOutput]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      date = unless parsed_json["date"].nil?
  DateTime.parse(parsed_json["date"])
else
  nil
end
      ip = parsed_json["ip"]
      new(
        date: date,
        ip: ip,
        additional_properties: struct
      )
    end
# Serialize an instance of TermsOfServiceAcceptanceOutput to a JSON object
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
      obj.date&.is_a?(DateTime) != false || raise("Passed value for field obj.date is not the expected type, validation failed.")
      obj.ip&.is_a?(String) != false || raise("Passed value for field obj.ip is not the expected type, validation failed.")
    end
  end
end