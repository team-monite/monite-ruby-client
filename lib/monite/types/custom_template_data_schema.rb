# frozen_string_literal: true
require "date"
require "date"
require "ostruct"
require "json"

module Monite
  class CustomTemplateDataSchema
  # @return [String] ID of email template
    attr_reader :id
  # @return [DateTime] Template created date and time
    attr_reader :created_at
  # @return [DateTime] Template updated date and time
    attr_reader :updated_at
  # @return [String] Jinja2 compatible email body template
    attr_reader :body_template
  # @return [Boolean] Is default template
    attr_reader :is_default
  # @return [String] Lowercase ISO code of language
    attr_reader :language
  # @return [String] Name of the template
    attr_reader :name
  # @return [String] Jinja2 compatible email subject template
    attr_reader :subject_template
  # @return [String] Document type of content
    attr_reader :type
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] ID of email template
    # @param created_at [DateTime] Template created date and time
    # @param updated_at [DateTime] Template updated date and time
    # @param body_template [String] Jinja2 compatible email body template
    # @param is_default [Boolean] Is default template
    # @param language [String] Lowercase ISO code of language
    # @param name [String] Name of the template
    # @param subject_template [String] Jinja2 compatible email subject template
    # @param type [String] Document type of content
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::CustomTemplateDataSchema]
    def initialize(id:, created_at:, updated_at:, body_template:, is_default:, language:, name:, subject_template:, type:, additional_properties: nil)
      @id = id
      @created_at = created_at
      @updated_at = updated_at
      @body_template = body_template
      @is_default = is_default
      @language = language
      @name = name
      @subject_template = subject_template
      @type = type
      @additional_properties = additional_properties
      @_field_set = { "id": id, "created_at": created_at, "updated_at": updated_at, "body_template": body_template, "is_default": is_default, "language": language, "name": name, "subject_template": subject_template, "type": type }
    end
# Deserialize a JSON object to an instance of CustomTemplateDataSchema
    #
    # @param json_object [String] 
    # @return [Monite::CustomTemplateDataSchema]
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
      body_template = parsed_json["body_template"]
      is_default = parsed_json["is_default"]
      language = parsed_json["language"]
      name = parsed_json["name"]
      subject_template = parsed_json["subject_template"]
      type = parsed_json["type"]
      new(
        id: id,
        created_at: created_at,
        updated_at: updated_at,
        body_template: body_template,
        is_default: is_default,
        language: language,
        name: name,
        subject_template: subject_template,
        type: type,
        additional_properties: struct
      )
    end
# Serialize an instance of CustomTemplateDataSchema to a JSON object
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
      obj.body_template.is_a?(String) != false || raise("Passed value for field obj.body_template is not the expected type, validation failed.")
      obj.is_default.is_a?(Boolean) != false || raise("Passed value for field obj.is_default is not the expected type, validation failed.")
      obj.language.is_a?(String) != false || raise("Passed value for field obj.language is not the expected type, validation failed.")
      obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.subject_template.is_a?(String) != false || raise("Passed value for field obj.subject_template is not the expected type, validation failed.")
      obj.type.is_a?(String) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
    end
  end
end