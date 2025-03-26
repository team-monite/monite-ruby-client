# frozen_string_literal: true
require "date"
require "date"
require_relative "error_schema"
require "date"
require_relative "connection_status"
require "ostruct"
require "json"

module Monite
  class AccountingConnectionResponse
  # @return [String] 
    attr_reader :id
  # @return [DateTime] 
    attr_reader :created_at
  # @return [DateTime] 
    attr_reader :updated_at
  # @return [String] 
    attr_reader :connection_url
  # @return [Array<Monite::ErrorSchema>] 
    attr_reader :errors
  # @return [DateTime] 
    attr_reader :last_pull
  # @return [String] 
    attr_reader :platform
  # @return [Monite::ConnectionStatus] 
    attr_reader :status
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] 
    # @param created_at [DateTime] 
    # @param updated_at [DateTime] 
    # @param connection_url [String] 
    # @param errors [Array<Monite::ErrorSchema>] 
    # @param last_pull [DateTime] 
    # @param platform [String] 
    # @param status [Monite::ConnectionStatus] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::AccountingConnectionResponse]
    def initialize(id:, created_at:, updated_at:, connection_url:, errors: OMIT, last_pull: OMIT, platform: OMIT, status: OMIT, additional_properties: nil)
      @id = id
      @created_at = created_at
      @updated_at = updated_at
      @connection_url = connection_url
      @errors = errors if errors != OMIT
      @last_pull = last_pull if last_pull != OMIT
      @platform = platform if platform != OMIT
      @status = status if status != OMIT
      @additional_properties = additional_properties
      @_field_set = { "id": id, "created_at": created_at, "updated_at": updated_at, "connection_url": connection_url, "errors": errors, "last_pull": last_pull, "platform": platform, "status": status }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of AccountingConnectionResponse
    #
    # @param json_object [String] 
    # @return [Monite::AccountingConnectionResponse]
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
      connection_url = parsed_json["connection_url"]
      errors = parsed_json["errors"]&.map do | item |
  item = item.to_json
  Monite::ErrorSchema.from_json(json_object: item)
end
      last_pull = unless parsed_json["last_pull"].nil?
  DateTime.parse(parsed_json["last_pull"])
else
  nil
end
      platform = parsed_json["platform"]
      status = parsed_json["status"]
      new(
        id: id,
        created_at: created_at,
        updated_at: updated_at,
        connection_url: connection_url,
        errors: errors,
        last_pull: last_pull,
        platform: platform,
        status: status,
        additional_properties: struct
      )
    end
# Serialize an instance of AccountingConnectionResponse to a JSON object
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
      obj.connection_url.is_a?(String) != false || raise("Passed value for field obj.connection_url is not the expected type, validation failed.")
      obj.errors&.is_a?(Array) != false || raise("Passed value for field obj.errors is not the expected type, validation failed.")
      obj.last_pull&.is_a?(DateTime) != false || raise("Passed value for field obj.last_pull is not the expected type, validation failed.")
      obj.platform&.is_a?(String) != false || raise("Passed value for field obj.platform is not the expected type, validation failed.")
      obj.status&.is_a?(Monite::ConnectionStatus) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
    end
  end
end