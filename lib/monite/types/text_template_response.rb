# frozen_string_literal: true
require "date"
require "date"
require_relative "document_type_enum"
require_relative "text_template_type"
require "ostruct"
require "json"

module Monite
  class TextTemplateResponse
  # @return [String] 
    attr_reader :id
  # @return [DateTime] 
    attr_reader :created_at
  # @return [DateTime] 
    attr_reader :updated_at
  # @return [Monite::DocumentTypeEnum] 
    attr_reader :document_type
  # @return [Boolean] 
    attr_reader :is_default
  # @return [String] 
    attr_reader :name
  # @return [String] 
    attr_reader :template
  # @return [Monite::TextTemplateType] 
    attr_reader :type
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] 
    # @param created_at [DateTime] 
    # @param updated_at [DateTime] 
    # @param document_type [Monite::DocumentTypeEnum] 
    # @param is_default [Boolean] 
    # @param name [String] 
    # @param template [String] 
    # @param type [Monite::TextTemplateType] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::TextTemplateResponse]
    def initialize(id:, created_at:, updated_at:, document_type:, is_default:, name:, template:, type:, additional_properties: nil)
      @id = id
      @created_at = created_at
      @updated_at = updated_at
      @document_type = document_type
      @is_default = is_default
      @name = name
      @template = template
      @type = type
      @additional_properties = additional_properties
      @_field_set = { "id": id, "created_at": created_at, "updated_at": updated_at, "document_type": document_type, "is_default": is_default, "name": name, "template": template, "type": type }
    end
# Deserialize a JSON object to an instance of TextTemplateResponse
    #
    # @param json_object [String] 
    # @return [Monite::TextTemplateResponse]
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
      document_type = parsed_json["document_type"]
      is_default = parsed_json["is_default"]
      name = parsed_json["name"]
      template = parsed_json["template"]
      type = parsed_json["type"]
      new(
        id: id,
        created_at: created_at,
        updated_at: updated_at,
        document_type: document_type,
        is_default: is_default,
        name: name,
        template: template,
        type: type,
        additional_properties: struct
      )
    end
# Serialize an instance of TextTemplateResponse to a JSON object
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
      obj.document_type.is_a?(Monite::DocumentTypeEnum) != false || raise("Passed value for field obj.document_type is not the expected type, validation failed.")
      obj.is_default.is_a?(Boolean) != false || raise("Passed value for field obj.is_default is not the expected type, validation failed.")
      obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.template.is_a?(String) != false || raise("Passed value for field obj.template is not the expected type, validation failed.")
      obj.type.is_a?(Monite::TextTemplateType) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
    end
  end
end