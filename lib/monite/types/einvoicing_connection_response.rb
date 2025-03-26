# frozen_string_literal: true
require "date"
require "date"
require_relative "einvoicing_address"
require_relative "einvoicing_network_credentials_response"
require "ostruct"
require "json"

module Monite
  class EinvoicingConnectionResponse
  # @return [String] 
    attr_reader :id
  # @return [DateTime] Date of Integration
    attr_reader :created_at
  # @return [DateTime] Last update of Integration
    attr_reader :updated_at
  # @return [Monite::EinvoicingAddress] Integration Address
    attr_reader :address
  # @return [Array<Monite::EinvoicingNetworkCredentialsResponse>] List of credentials
    attr_reader :credentials
  # @return [String] ID of the entity
    attr_reader :entity_id
  # @return [String] Legal name of the Entity
    attr_reader :legal_name
  # @return [String] ID assigned by integration partner
    attr_reader :provider_id
  # @return [String] Current status of the integration
    attr_reader :status
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] 
    # @param created_at [DateTime] Date of Integration
    # @param updated_at [DateTime] Last update of Integration
    # @param address [Monite::EinvoicingAddress] Integration Address
    # @param credentials [Array<Monite::EinvoicingNetworkCredentialsResponse>] List of credentials
    # @param entity_id [String] ID of the entity
    # @param legal_name [String] Legal name of the Entity
    # @param provider_id [String] ID assigned by integration partner
    # @param status [String] Current status of the integration
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::EinvoicingConnectionResponse]
    def initialize(id:, created_at:, updated_at:, address:, credentials:, entity_id:, legal_name:, provider_id: OMIT, status:, additional_properties: nil)
      @id = id
      @created_at = created_at
      @updated_at = updated_at
      @address = address
      @credentials = credentials
      @entity_id = entity_id
      @legal_name = legal_name
      @provider_id = provider_id if provider_id != OMIT
      @status = status
      @additional_properties = additional_properties
      @_field_set = { "id": id, "created_at": created_at, "updated_at": updated_at, "address": address, "credentials": credentials, "entity_id": entity_id, "legal_name": legal_name, "provider_id": provider_id, "status": status }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of EinvoicingConnectionResponse
    #
    # @param json_object [String] 
    # @return [Monite::EinvoicingConnectionResponse]
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
      unless parsed_json["address"].nil?
        address = parsed_json["address"].to_json
        address = Monite::EinvoicingAddress.from_json(json_object: address)
      else
        address = nil
      end
      credentials = parsed_json["credentials"]&.map do | item |
  item = item.to_json
  Monite::EinvoicingNetworkCredentialsResponse.from_json(json_object: item)
end
      entity_id = parsed_json["entity_id"]
      legal_name = parsed_json["legal_name"]
      provider_id = parsed_json["provider_id"]
      status = parsed_json["status"]
      new(
        id: id,
        created_at: created_at,
        updated_at: updated_at,
        address: address,
        credentials: credentials,
        entity_id: entity_id,
        legal_name: legal_name,
        provider_id: provider_id,
        status: status,
        additional_properties: struct
      )
    end
# Serialize an instance of EinvoicingConnectionResponse to a JSON object
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
      Monite::EinvoicingAddress.validate_raw(obj: obj.address)
      obj.credentials.is_a?(Array) != false || raise("Passed value for field obj.credentials is not the expected type, validation failed.")
      obj.entity_id.is_a?(String) != false || raise("Passed value for field obj.entity_id is not the expected type, validation failed.")
      obj.legal_name.is_a?(String) != false || raise("Passed value for field obj.legal_name is not the expected type, validation failed.")
      obj.provider_id&.is_a?(String) != false || raise("Passed value for field obj.provider_id is not the expected type, validation failed.")
      obj.status.is_a?(String) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
    end
  end
end