# frozen_string_literal: true
require "date"
require "date"
require "date"
require_relative "object_match_types"
require "date"
require_relative "platform"
require "date"
require_relative "service_providers_enum"
require "date"
require_relative "sync_status"
require "ostruct"
require "json"

module Monite
  class SyncRecordResource
  # @return [String] 
    attr_reader :id
  # @return [DateTime] 
    attr_reader :created_at
  # @return [DateTime] 
    attr_reader :updated_at
  # @return [Hash{String => Object}] 
    attr_reader :errors
  # @return [DateTime] 
    attr_reader :last_pulled_at
  # @return [String] 
    attr_reader :object_id
  # @return [Monite::ObjectMatchTypes] 
    attr_reader :object_type
  # @return [DateTime] 
    attr_reader :object_updated_at
  # @return [Monite::Platform] 
    attr_reader :platform
  # @return [String] 
    attr_reader :platform_object_id
  # @return [DateTime] 
    attr_reader :platform_updated_at
  # @return [Monite::ServiceProvidersEnum] 
    attr_reader :provider
  # @return [String] 
    attr_reader :provider_object_id
  # @return [DateTime] 
    attr_reader :provider_updated_at
  # @return [Monite::SyncStatus] 
    attr_reader :sync_status
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] 
    # @param created_at [DateTime] 
    # @param updated_at [DateTime] 
    # @param errors [Hash{String => Object}] 
    # @param last_pulled_at [DateTime] 
    # @param object_id [String] 
    # @param object_type [Monite::ObjectMatchTypes] 
    # @param object_updated_at [DateTime] 
    # @param platform [Monite::Platform] 
    # @param platform_object_id [String] 
    # @param platform_updated_at [DateTime] 
    # @param provider [Monite::ServiceProvidersEnum] 
    # @param provider_object_id [String] 
    # @param provider_updated_at [DateTime] 
    # @param sync_status [Monite::SyncStatus] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::SyncRecordResource]
    def initialize(id:, created_at:, updated_at:, errors: OMIT, last_pulled_at:, object_id: OMIT, object_type:, object_updated_at: OMIT, platform: OMIT, platform_object_id: OMIT, platform_updated_at: OMIT, provider: OMIT, provider_object_id: OMIT, provider_updated_at: OMIT, sync_status:, additional_properties: nil)
      @id = id
      @created_at = created_at
      @updated_at = updated_at
      @errors = errors if errors != OMIT
      @last_pulled_at = last_pulled_at
      @object_id = object_id if object_id != OMIT
      @object_type = object_type
      @object_updated_at = object_updated_at if object_updated_at != OMIT
      @platform = platform if platform != OMIT
      @platform_object_id = platform_object_id if platform_object_id != OMIT
      @platform_updated_at = platform_updated_at if platform_updated_at != OMIT
      @provider = provider if provider != OMIT
      @provider_object_id = provider_object_id if provider_object_id != OMIT
      @provider_updated_at = provider_updated_at if provider_updated_at != OMIT
      @sync_status = sync_status
      @additional_properties = additional_properties
      @_field_set = { "id": id, "created_at": created_at, "updated_at": updated_at, "errors": errors, "last_pulled_at": last_pulled_at, "object_id": object_id, "object_type": object_type, "object_updated_at": object_updated_at, "platform": platform, "platform_object_id": platform_object_id, "platform_updated_at": platform_updated_at, "provider": provider, "provider_object_id": provider_object_id, "provider_updated_at": provider_updated_at, "sync_status": sync_status }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of SyncRecordResource
    #
    # @param json_object [String] 
    # @return [Monite::SyncRecordResource]
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
      errors = parsed_json["errors"]
      last_pulled_at = unless parsed_json["last_pulled_at"].nil?
  DateTime.parse(parsed_json["last_pulled_at"])
else
  nil
end
      object_id = parsed_json["object_id"]
      object_type = parsed_json["object_type"]
      object_updated_at = unless parsed_json["object_updated_at"].nil?
  DateTime.parse(parsed_json["object_updated_at"])
else
  nil
end
      platform = parsed_json["platform"]
      platform_object_id = parsed_json["platform_object_id"]
      platform_updated_at = unless parsed_json["platform_updated_at"].nil?
  DateTime.parse(parsed_json["platform_updated_at"])
else
  nil
end
      provider = parsed_json["provider"]
      provider_object_id = parsed_json["provider_object_id"]
      provider_updated_at = unless parsed_json["provider_updated_at"].nil?
  DateTime.parse(parsed_json["provider_updated_at"])
else
  nil
end
      sync_status = parsed_json["sync_status"]
      new(
        id: id,
        created_at: created_at,
        updated_at: updated_at,
        errors: errors,
        last_pulled_at: last_pulled_at,
        object_id: object_id,
        object_type: object_type,
        object_updated_at: object_updated_at,
        platform: platform,
        platform_object_id: platform_object_id,
        platform_updated_at: platform_updated_at,
        provider: provider,
        provider_object_id: provider_object_id,
        provider_updated_at: provider_updated_at,
        sync_status: sync_status,
        additional_properties: struct
      )
    end
# Serialize an instance of SyncRecordResource to a JSON object
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
      obj.errors&.is_a?(Hash) != false || raise("Passed value for field obj.errors is not the expected type, validation failed.")
      obj.last_pulled_at.is_a?(DateTime) != false || raise("Passed value for field obj.last_pulled_at is not the expected type, validation failed.")
      obj.object_id&.is_a?(String) != false || raise("Passed value for field obj.object_id is not the expected type, validation failed.")
      obj.object_type.is_a?(Monite::ObjectMatchTypes) != false || raise("Passed value for field obj.object_type is not the expected type, validation failed.")
      obj.object_updated_at&.is_a?(DateTime) != false || raise("Passed value for field obj.object_updated_at is not the expected type, validation failed.")
      obj.platform&.is_a?(Monite::Platform) != false || raise("Passed value for field obj.platform is not the expected type, validation failed.")
      obj.platform_object_id&.is_a?(String) != false || raise("Passed value for field obj.platform_object_id is not the expected type, validation failed.")
      obj.platform_updated_at&.is_a?(DateTime) != false || raise("Passed value for field obj.platform_updated_at is not the expected type, validation failed.")
      obj.provider&.is_a?(Monite::ServiceProvidersEnum) != false || raise("Passed value for field obj.provider is not the expected type, validation failed.")
      obj.provider_object_id&.is_a?(String) != false || raise("Passed value for field obj.provider_object_id is not the expected type, validation failed.")
      obj.provider_updated_at&.is_a?(DateTime) != false || raise("Passed value for field obj.provider_updated_at is not the expected type, validation failed.")
      obj.sync_status.is_a?(Monite::SyncStatus) != false || raise("Passed value for field obj.sync_status is not the expected type, validation failed.")
    end
  end
end