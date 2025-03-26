# frozen_string_literal: true
require "date"
require "date"
require_relative "einvoice_schema_type_enum"
require "ostruct"
require "json"

module Monite
  class EinvoicingNetworkCredentialsResponse
  # @return [String] ID of the credentials
    attr_reader :id
  # @return [DateTime] Date of credential
    attr_reader :created_at
  # @return [DateTime] Last update of credential
    attr_reader :updated_at
  # @return [String] ID of the Einvoicing connection
    attr_reader :einvoicing_connection_id
  # @return [String] Network participant identifier
    attr_reader :network_credentials_identifier
  # @return [Monite::EinvoiceSchemaTypeEnum] Network scheme identifier
    attr_reader :network_credentials_schema
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] ID of the credentials
    # @param created_at [DateTime] Date of credential
    # @param updated_at [DateTime] Last update of credential
    # @param einvoicing_connection_id [String] ID of the Einvoicing connection
    # @param network_credentials_identifier [String] Network participant identifier
    # @param network_credentials_schema [Monite::EinvoiceSchemaTypeEnum] Network scheme identifier
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::EinvoicingNetworkCredentialsResponse]
    def initialize(id:, created_at:, updated_at:, einvoicing_connection_id:, network_credentials_identifier:, network_credentials_schema:, additional_properties: nil)
      @id = id
      @created_at = created_at
      @updated_at = updated_at
      @einvoicing_connection_id = einvoicing_connection_id
      @network_credentials_identifier = network_credentials_identifier
      @network_credentials_schema = network_credentials_schema
      @additional_properties = additional_properties
      @_field_set = { "id": id, "created_at": created_at, "updated_at": updated_at, "einvoicing_connection_id": einvoicing_connection_id, "network_credentials_identifier": network_credentials_identifier, "network_credentials_schema": network_credentials_schema }
    end
# Deserialize a JSON object to an instance of EinvoicingNetworkCredentialsResponse
    #
    # @param json_object [String] 
    # @return [Monite::EinvoicingNetworkCredentialsResponse]
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
      einvoicing_connection_id = parsed_json["einvoicing_connection_id"]
      network_credentials_identifier = parsed_json["network_credentials_identifier"]
      network_credentials_schema = parsed_json["network_credentials_schema"]
      new(
        id: id,
        created_at: created_at,
        updated_at: updated_at,
        einvoicing_connection_id: einvoicing_connection_id,
        network_credentials_identifier: network_credentials_identifier,
        network_credentials_schema: network_credentials_schema,
        additional_properties: struct
      )
    end
# Serialize an instance of EinvoicingNetworkCredentialsResponse to a JSON object
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
      obj.einvoicing_connection_id.is_a?(String) != false || raise("Passed value for field obj.einvoicing_connection_id is not the expected type, validation failed.")
      obj.network_credentials_identifier.is_a?(String) != false || raise("Passed value for field obj.network_credentials_identifier is not the expected type, validation failed.")
      obj.network_credentials_schema.is_a?(Monite::EinvoiceSchemaTypeEnum) != false || raise("Passed value for field obj.network_credentials_schema is not the expected type, validation failed.")
    end
  end
end