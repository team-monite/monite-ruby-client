# frozen_string_literal: true
require "ostruct"
require "json"

module Monite
  class InvoiceFile
  # @return [String] 
    attr_reader :mimetype
  # @return [String] 
    attr_reader :name
  # @return [String] 
    attr_reader :url
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param mimetype [String] 
    # @param name [String] 
    # @param url [String] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::InvoiceFile]
    def initialize(mimetype:, name:, url:, additional_properties: nil)
      @mimetype = mimetype
      @name = name
      @url = url
      @additional_properties = additional_properties
      @_field_set = { "mimetype": mimetype, "name": name, "url": url }
    end
# Deserialize a JSON object to an instance of InvoiceFile
    #
    # @param json_object [String] 
    # @return [Monite::InvoiceFile]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      mimetype = parsed_json["mimetype"]
      name = parsed_json["name"]
      url = parsed_json["url"]
      new(
        mimetype: mimetype,
        name: name,
        url: url,
        additional_properties: struct
      )
    end
# Serialize an instance of InvoiceFile to a JSON object
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
      obj.mimetype.is_a?(String) != false || raise("Passed value for field obj.mimetype is not the expected type, validation failed.")
      obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.url.is_a?(String) != false || raise("Passed value for field obj.url is not the expected type, validation failed.")
    end
  end
end