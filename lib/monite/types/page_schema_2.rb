# frozen_string_literal: true
require "ostruct"
require "json"

module Monite
# When a PDF document is uploaded to Monite, it extracts individual pages from the
#  document
#  and saves them as PNG images. This object contains the image and metadata of a
#  single page.
  class PageSchema2
  # @return [String] A unique ID of the image.
    attr_reader :id
  # @return [String] The [media type](https://developer.mozilla.org/en-US/docs/Web/HTTP/MIME_types)
#  of the image.
    attr_reader :mimetype
  # @return [Integer] Image file size, in bytes.
    attr_reader :size
  # @return [Integer] The page number in the PDF document, from 0.
    attr_reader :number
  # @return [String] The URL to download the image.
    attr_reader :url
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] A unique ID of the image.
    # @param mimetype [String] The [media type](https://developer.mozilla.org/en-US/docs/Web/HTTP/MIME_types)
#  of the image.
    # @param size [Integer] Image file size, in bytes.
    # @param number [Integer] The page number in the PDF document, from 0.
    # @param url [String] The URL to download the image.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::PageSchema2]
    def initialize(id:, mimetype:, size:, number:, url:, additional_properties: nil)
      @id = id
      @mimetype = mimetype
      @size = size
      @number = number
      @url = url
      @additional_properties = additional_properties
      @_field_set = { "id": id, "mimetype": mimetype, "size": size, "number": number, "url": url }
    end
# Deserialize a JSON object to an instance of PageSchema2
    #
    # @param json_object [String] 
    # @return [Monite::PageSchema2]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      mimetype = parsed_json["mimetype"]
      size = parsed_json["size"]
      number = parsed_json["number"]
      url = parsed_json["url"]
      new(
        id: id,
        mimetype: mimetype,
        size: size,
        number: number,
        url: url,
        additional_properties: struct
      )
    end
# Serialize an instance of PageSchema2 to a JSON object
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
      obj.mimetype.is_a?(String) != false || raise("Passed value for field obj.mimetype is not the expected type, validation failed.")
      obj.size.is_a?(Integer) != false || raise("Passed value for field obj.size is not the expected type, validation failed.")
      obj.number.is_a?(Integer) != false || raise("Passed value for field obj.number is not the expected type, validation failed.")
      obj.url.is_a?(String) != false || raise("Passed value for field obj.url is not the expected type, validation failed.")
    end
  end
end