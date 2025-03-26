# frozen_string_literal: true
require "date"
require_relative "preview_schema_2"
require_relative "page_schema_2"
require "ostruct"
require "json"

module Monite
# Represents a file (such as a PDF invoice) that was uploaded to Monite.
  class FileSchema2
  # @return [String] A unique ID of this file.
    attr_reader :id
  # @return [DateTime] UTC date and time when this file was uploaded to Monite. Timestamps follow the
#  [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.
    attr_reader :created_at
  # @return [String] The type of the business object associated with this file.
    attr_reader :file_type
  # @return [String] The original file name (if available).
    attr_reader :name
  # @return [String] Geographical region of the data center where the file is stored.
    attr_reader :region
  # @return [String] The MD5 hash of the file.
    attr_reader :md_5
  # @return [String] The file's [media
#  type](https://developer.mozilla.org/en-US/docs/Web/HTTP/MIME_types).
    attr_reader :mimetype
  # @return [String] The URL to download the file.
    attr_reader :url
  # @return [Integer] The file size in bytes.
    attr_reader :size
  # @return [Array<Monite::PreviewSchema2>] Preview images generated for this file. There can be multiple images with
#  different sizes.
    attr_reader :previews
  # @return [Array<Monite::PageSchema2>] If the file is a PDF document, this property contains individual pages extracted
#  from the file. Otherwise, an empty array.
    attr_reader :pages
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] A unique ID of this file.
    # @param created_at [DateTime] UTC date and time when this file was uploaded to Monite. Timestamps follow the
#  [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.
    # @param file_type [String] The type of the business object associated with this file.
    # @param name [String] The original file name (if available).
    # @param region [String] Geographical region of the data center where the file is stored.
    # @param md_5 [String] The MD5 hash of the file.
    # @param mimetype [String] The file's [media
#  type](https://developer.mozilla.org/en-US/docs/Web/HTTP/MIME_types).
    # @param url [String] The URL to download the file.
    # @param size [Integer] The file size in bytes.
    # @param previews [Array<Monite::PreviewSchema2>] Preview images generated for this file. There can be multiple images with
#  different sizes.
    # @param pages [Array<Monite::PageSchema2>] If the file is a PDF document, this property contains individual pages extracted
#  from the file. Otherwise, an empty array.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::FileSchema2]
    def initialize(id:, created_at:, file_type:, name:, region:, md_5:, mimetype:, url:, size:, previews: OMIT, pages: OMIT, additional_properties: nil)
      @id = id
      @created_at = created_at
      @file_type = file_type
      @name = name
      @region = region
      @md_5 = md_5
      @mimetype = mimetype
      @url = url
      @size = size
      @previews = previews if previews != OMIT
      @pages = pages if pages != OMIT
      @additional_properties = additional_properties
      @_field_set = { "id": id, "created_at": created_at, "file_type": file_type, "name": name, "region": region, "md5": md_5, "mimetype": mimetype, "url": url, "size": size, "previews": previews, "pages": pages }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of FileSchema2
    #
    # @param json_object [String] 
    # @return [Monite::FileSchema2]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      created_at = unless parsed_json["created_at"].nil?
  DateTime.parse(parsed_json["created_at"])
else
  nil
end
      file_type = parsed_json["file_type"]
      name = parsed_json["name"]
      region = parsed_json["region"]
      md_5 = parsed_json["md5"]
      mimetype = parsed_json["mimetype"]
      url = parsed_json["url"]
      size = parsed_json["size"]
      previews = parsed_json["previews"]&.map do | item |
  item = item.to_json
  Monite::PreviewSchema2.from_json(json_object: item)
end
      pages = parsed_json["pages"]&.map do | item |
  item = item.to_json
  Monite::PageSchema2.from_json(json_object: item)
end
      new(
        id: id,
        created_at: created_at,
        file_type: file_type,
        name: name,
        region: region,
        md_5: md_5,
        mimetype: mimetype,
        url: url,
        size: size,
        previews: previews,
        pages: pages,
        additional_properties: struct
      )
    end
# Serialize an instance of FileSchema2 to a JSON object
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
      obj.file_type.is_a?(String) != false || raise("Passed value for field obj.file_type is not the expected type, validation failed.")
      obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.region.is_a?(String) != false || raise("Passed value for field obj.region is not the expected type, validation failed.")
      obj.md_5.is_a?(String) != false || raise("Passed value for field obj.md_5 is not the expected type, validation failed.")
      obj.mimetype.is_a?(String) != false || raise("Passed value for field obj.mimetype is not the expected type, validation failed.")
      obj.url.is_a?(String) != false || raise("Passed value for field obj.url is not the expected type, validation failed.")
      obj.size.is_a?(Integer) != false || raise("Passed value for field obj.size is not the expected type, validation failed.")
      obj.previews&.is_a?(Array) != false || raise("Passed value for field obj.previews is not the expected type, validation failed.")
      obj.pages&.is_a?(Array) != false || raise("Passed value for field obj.pages is not the expected type, validation failed.")
    end
  end
end