# frozen_string_literal: true
require_relative "document_type_prefix"
require_relative "document_id_separators"
require "ostruct"
require "json"

module Monite
  class DocumentIDsSettings
  # @return [Monite::DocumentTypePrefix] Prefixes for each document_type.
    attr_reader :document_type_prefix
  # @return [Boolean] Optionally add 4-digit of the current year.
    attr_reader :include_date
  # @return [Integer] Minimal size of number in document ID Number will be left padded with zeros if
#  less.
    attr_reader :min_digits
  # @return [String] Optional prefix. Does not substitute document_type prefix.
    attr_reader :prefix
  # @return [Monite::DocumentIdSeparators] Which character should separate each part of the document_id.
    attr_reader :separator
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param document_type_prefix [Monite::DocumentTypePrefix] Prefixes for each document_type.
    # @param include_date [Boolean] Optionally add 4-digit of the current year.
    # @param min_digits [Integer] Minimal size of number in document ID Number will be left padded with zeros if
#  less.
    # @param prefix [String] Optional prefix. Does not substitute document_type prefix.
    # @param separator [Monite::DocumentIdSeparators] Which character should separate each part of the document_id.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::DocumentIDsSettings]
    def initialize(document_type_prefix: OMIT, include_date: OMIT, min_digits: OMIT, prefix: OMIT, separator: OMIT, additional_properties: nil)
      @document_type_prefix = document_type_prefix if document_type_prefix != OMIT
      @include_date = include_date if include_date != OMIT
      @min_digits = min_digits if min_digits != OMIT
      @prefix = prefix if prefix != OMIT
      @separator = separator if separator != OMIT
      @additional_properties = additional_properties
      @_field_set = { "document_type_prefix": document_type_prefix, "include_date": include_date, "min_digits": min_digits, "prefix": prefix, "separator": separator }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of DocumentIDsSettings
    #
    # @param json_object [String] 
    # @return [Monite::DocumentIDsSettings]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["document_type_prefix"].nil?
        document_type_prefix = parsed_json["document_type_prefix"].to_json
        document_type_prefix = Monite::DocumentTypePrefix.from_json(json_object: document_type_prefix)
      else
        document_type_prefix = nil
      end
      include_date = parsed_json["include_date"]
      min_digits = parsed_json["min_digits"]
      prefix = parsed_json["prefix"]
      separator = parsed_json["separator"]
      new(
        document_type_prefix: document_type_prefix,
        include_date: include_date,
        min_digits: min_digits,
        prefix: prefix,
        separator: separator,
        additional_properties: struct
      )
    end
# Serialize an instance of DocumentIDsSettings to a JSON object
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
      obj.document_type_prefix.nil? || Monite::DocumentTypePrefix.validate_raw(obj: obj.document_type_prefix)
      obj.include_date&.is_a?(Boolean) != false || raise("Passed value for field obj.include_date is not the expected type, validation failed.")
      obj.min_digits&.is_a?(Integer) != false || raise("Passed value for field obj.min_digits is not the expected type, validation failed.")
      obj.prefix&.is_a?(String) != false || raise("Passed value for field obj.prefix is not the expected type, validation failed.")
      obj.separator&.is_a?(Monite::DocumentIdSeparators) != false || raise("Passed value for field obj.separator is not the expected type, validation failed.")
    end
  end
end