# frozen_string_literal: true
require "ostruct"
require "json"

module Monite
  class VerifyResponse
  # @return [String] Entry UUID
    attr_reader :id
  # @return [String] The domain name.
    attr_reader :domain
  # @return [String] 
    attr_reader :status
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] Entry UUID
    # @param domain [String] The domain name.
    # @param status [String] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::VerifyResponse]
    def initialize(id:, domain:, status:, additional_properties: nil)
      @id = id
      @domain = domain
      @status = status
      @additional_properties = additional_properties
      @_field_set = { "id": id, "domain": domain, "status": status }
    end
# Deserialize a JSON object to an instance of VerifyResponse
    #
    # @param json_object [String] 
    # @return [Monite::VerifyResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      domain = parsed_json["domain"]
      status = parsed_json["status"]
      new(
        id: id,
        domain: domain,
        status: status,
        additional_properties: struct
      )
    end
# Serialize an instance of VerifyResponse to a JSON object
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
      obj.domain.is_a?(String) != false || raise("Passed value for field obj.domain is not the expected type, validation failed.")
      obj.status.is_a?(String) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
    end
  end
end