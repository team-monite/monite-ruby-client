# frozen_string_literal: true
require "date"
require "date"
require "ostruct"
require "json"

module Monite
  class DocumentExportResponseSchema
  # @return [String] 
    attr_reader :id
  # @return [Integer] 
    attr_reader :count
  # @return [String] 
    attr_reader :created_by_entity_user_id
  # @return [DateTime] 
    attr_reader :end_datetime
  # @return [String] 
    attr_reader :entity_id
  # @return [String] 
    attr_reader :format
  # @return [String] 
    attr_reader :language
  # @return [String] 
    attr_reader :source_url
  # @return [DateTime] 
    attr_reader :start_datetime
  # @return [String] 
    attr_reader :status
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] 
    # @param count [Integer] 
    # @param created_by_entity_user_id [String] 
    # @param end_datetime [DateTime] 
    # @param entity_id [String] 
    # @param format [String] 
    # @param language [String] 
    # @param source_url [String] 
    # @param start_datetime [DateTime] 
    # @param status [String] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::DocumentExportResponseSchema]
    def initialize(id:, count:, created_by_entity_user_id: OMIT, end_datetime: OMIT, entity_id:, format:, language:, source_url: OMIT, start_datetime: OMIT, status:, additional_properties: nil)
      @id = id
      @count = count
      @created_by_entity_user_id = created_by_entity_user_id if created_by_entity_user_id != OMIT
      @end_datetime = end_datetime if end_datetime != OMIT
      @entity_id = entity_id
      @format = format
      @language = language
      @source_url = source_url if source_url != OMIT
      @start_datetime = start_datetime if start_datetime != OMIT
      @status = status
      @additional_properties = additional_properties
      @_field_set = { "id": id, "count": count, "created_by_entity_user_id": created_by_entity_user_id, "end_datetime": end_datetime, "entity_id": entity_id, "format": format, "language": language, "source_url": source_url, "start_datetime": start_datetime, "status": status }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of DocumentExportResponseSchema
    #
    # @param json_object [String] 
    # @return [Monite::DocumentExportResponseSchema]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      count = parsed_json["count"]
      created_by_entity_user_id = parsed_json["created_by_entity_user_id"]
      end_datetime = unless parsed_json["end_datetime"].nil?
  DateTime.parse(parsed_json["end_datetime"])
else
  nil
end
      entity_id = parsed_json["entity_id"]
      format = parsed_json["format"]
      language = parsed_json["language"]
      source_url = parsed_json["source_url"]
      start_datetime = unless parsed_json["start_datetime"].nil?
  DateTime.parse(parsed_json["start_datetime"])
else
  nil
end
      status = parsed_json["status"]
      new(
        id: id,
        count: count,
        created_by_entity_user_id: created_by_entity_user_id,
        end_datetime: end_datetime,
        entity_id: entity_id,
        format: format,
        language: language,
        source_url: source_url,
        start_datetime: start_datetime,
        status: status,
        additional_properties: struct
      )
    end
# Serialize an instance of DocumentExportResponseSchema to a JSON object
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
      obj.count.is_a?(Integer) != false || raise("Passed value for field obj.count is not the expected type, validation failed.")
      obj.created_by_entity_user_id&.is_a?(String) != false || raise("Passed value for field obj.created_by_entity_user_id is not the expected type, validation failed.")
      obj.end_datetime&.is_a?(DateTime) != false || raise("Passed value for field obj.end_datetime is not the expected type, validation failed.")
      obj.entity_id.is_a?(String) != false || raise("Passed value for field obj.entity_id is not the expected type, validation failed.")
      obj.format.is_a?(String) != false || raise("Passed value for field obj.format is not the expected type, validation failed.")
      obj.language.is_a?(String) != false || raise("Passed value for field obj.language is not the expected type, validation failed.")
      obj.source_url&.is_a?(String) != false || raise("Passed value for field obj.source_url is not the expected type, validation failed.")
      obj.start_datetime&.is_a?(DateTime) != false || raise("Passed value for field obj.start_datetime is not the expected type, validation failed.")
      obj.status.is_a?(String) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
    end
  end
end