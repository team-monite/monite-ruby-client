# frozen_string_literal: true
require "date"
require "date"
require_relative "document_type_enum"
require_relative "file_schema"
require_relative "template_type_enum"
require "ostruct"
require "json"

module Monite
  class TemplateReceivableResponse
  # @return [String] 
    attr_reader :id
  # @return [DateTime] 
    attr_reader :created_at
  # @return [DateTime] 
    attr_reader :updated_at
  # @return [Array<String>] 
    attr_reader :blocks
  # @return [Monite::DocumentTypeEnum] 
    attr_reader :document_type
  # @return [Boolean] 
    attr_reader :is_default
  # @return [String] 
    attr_reader :language
  # @return [String] 
    attr_reader :name
  # @return [Monite::FileSchema] 
    attr_reader :preview
  # @return [String] 
    attr_reader :template
  # @return [Monite::TemplateTypeEnum] 
    attr_reader :template_type
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] 
    # @param created_at [DateTime] 
    # @param updated_at [DateTime] 
    # @param blocks [Array<String>] 
    # @param document_type [Monite::DocumentTypeEnum] 
    # @param is_default [Boolean] 
    # @param language [String] 
    # @param name [String] 
    # @param preview [Monite::FileSchema] 
    # @param template [String] 
    # @param template_type [Monite::TemplateTypeEnum] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::TemplateReceivableResponse]
    def initialize(id:, created_at: OMIT, updated_at: OMIT, blocks: OMIT, document_type:, is_default:, language:, name:, preview: OMIT, template:, template_type: OMIT, additional_properties: nil)
      @id = id
      @created_at = created_at if created_at != OMIT
      @updated_at = updated_at if updated_at != OMIT
      @blocks = blocks if blocks != OMIT
      @document_type = document_type
      @is_default = is_default
      @language = language
      @name = name
      @preview = preview if preview != OMIT
      @template = template
      @template_type = template_type if template_type != OMIT
      @additional_properties = additional_properties
      @_field_set = { "id": id, "created_at": created_at, "updated_at": updated_at, "blocks": blocks, "document_type": document_type, "is_default": is_default, "language": language, "name": name, "preview": preview, "template": template, "template_type": template_type }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of TemplateReceivableResponse
    #
    # @param json_object [String] 
    # @return [Monite::TemplateReceivableResponse]
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
      blocks = parsed_json["blocks"]
      document_type = parsed_json["document_type"]
      is_default = parsed_json["is_default"]
      language = parsed_json["language"]
      name = parsed_json["name"]
      unless parsed_json["preview"].nil?
        preview = parsed_json["preview"].to_json
        preview = Monite::FileSchema.from_json(json_object: preview)
      else
        preview = nil
      end
      template = parsed_json["template"]
      template_type = parsed_json["template_type"]
      new(
        id: id,
        created_at: created_at,
        updated_at: updated_at,
        blocks: blocks,
        document_type: document_type,
        is_default: is_default,
        language: language,
        name: name,
        preview: preview,
        template: template,
        template_type: template_type,
        additional_properties: struct
      )
    end
# Serialize an instance of TemplateReceivableResponse to a JSON object
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
      obj.created_at&.is_a?(DateTime) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
      obj.updated_at&.is_a?(DateTime) != false || raise("Passed value for field obj.updated_at is not the expected type, validation failed.")
      obj.blocks&.is_a?(Array) != false || raise("Passed value for field obj.blocks is not the expected type, validation failed.")
      obj.document_type.is_a?(Monite::DocumentTypeEnum) != false || raise("Passed value for field obj.document_type is not the expected type, validation failed.")
      obj.is_default.is_a?(Boolean) != false || raise("Passed value for field obj.is_default is not the expected type, validation failed.")
      obj.language.is_a?(String) != false || raise("Passed value for field obj.language is not the expected type, validation failed.")
      obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.preview.nil? || Monite::FileSchema.validate_raw(obj: obj.preview)
      obj.template.is_a?(String) != false || raise("Passed value for field obj.template is not the expected type, validation failed.")
      obj.template_type&.is_a?(Monite::TemplateTypeEnum) != false || raise("Passed value for field obj.template_type is not the expected type, validation failed.")
    end
  end
end