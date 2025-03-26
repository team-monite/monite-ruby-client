# frozen_string_literal: true
require "date"
require "date"
require "ostruct"
require "json"

module Monite
  class FileResponse
  # @return [String] 
    attr_reader :id
  # @return [DateTime] 
    attr_reader :created_at
  # @return [DateTime] 
    attr_reader :updated_at
  # @return [String] 
    attr_reader :file_type
  # @return [String] 
    attr_reader :md_5
  # @return [String] 
    attr_reader :mimetype
  # @return [String] 
    attr_reader :name
  # @return [String] 
    attr_reader :region
  # @return [String] 
    attr_reader :s_3_bucket
  # @return [String] 
    attr_reader :s_3_file_path
  # @return [Integer] 
    attr_reader :size
  # @return [String] 
    attr_reader :url
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] 
    # @param created_at [DateTime] 
    # @param updated_at [DateTime] 
    # @param file_type [String] 
    # @param md_5 [String] 
    # @param mimetype [String] 
    # @param name [String] 
    # @param region [String] 
    # @param s_3_bucket [String] 
    # @param s_3_file_path [String] 
    # @param size [Integer] 
    # @param url [String] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::FileResponse]
    def initialize(id:, created_at:, updated_at:, file_type:, md_5:, mimetype:, name:, region:, s_3_bucket:, s_3_file_path:, size:, url:, additional_properties: nil)
      @id = id
      @created_at = created_at
      @updated_at = updated_at
      @file_type = file_type
      @md_5 = md_5
      @mimetype = mimetype
      @name = name
      @region = region
      @s_3_bucket = s_3_bucket
      @s_3_file_path = s_3_file_path
      @size = size
      @url = url
      @additional_properties = additional_properties
      @_field_set = { "id": id, "created_at": created_at, "updated_at": updated_at, "file_type": file_type, "md5": md_5, "mimetype": mimetype, "name": name, "region": region, "s3_bucket": s_3_bucket, "s3_file_path": s_3_file_path, "size": size, "url": url }
    end
# Deserialize a JSON object to an instance of FileResponse
    #
    # @param json_object [String] 
    # @return [Monite::FileResponse]
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
      file_type = parsed_json["file_type"]
      md_5 = parsed_json["md5"]
      mimetype = parsed_json["mimetype"]
      name = parsed_json["name"]
      region = parsed_json["region"]
      s_3_bucket = parsed_json["s3_bucket"]
      s_3_file_path = parsed_json["s3_file_path"]
      size = parsed_json["size"]
      url = parsed_json["url"]
      new(
        id: id,
        created_at: created_at,
        updated_at: updated_at,
        file_type: file_type,
        md_5: md_5,
        mimetype: mimetype,
        name: name,
        region: region,
        s_3_bucket: s_3_bucket,
        s_3_file_path: s_3_file_path,
        size: size,
        url: url,
        additional_properties: struct
      )
    end
# Serialize an instance of FileResponse to a JSON object
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
      obj.file_type.is_a?(String) != false || raise("Passed value for field obj.file_type is not the expected type, validation failed.")
      obj.md_5.is_a?(String) != false || raise("Passed value for field obj.md_5 is not the expected type, validation failed.")
      obj.mimetype.is_a?(String) != false || raise("Passed value for field obj.mimetype is not the expected type, validation failed.")
      obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.region.is_a?(String) != false || raise("Passed value for field obj.region is not the expected type, validation failed.")
      obj.s_3_bucket.is_a?(String) != false || raise("Passed value for field obj.s_3_bucket is not the expected type, validation failed.")
      obj.s_3_file_path.is_a?(String) != false || raise("Passed value for field obj.s_3_file_path is not the expected type, validation failed.")
      obj.size.is_a?(Integer) != false || raise("Passed value for field obj.size is not the expected type, validation failed.")
      obj.url.is_a?(String) != false || raise("Passed value for field obj.url is not the expected type, validation failed.")
    end
  end
end