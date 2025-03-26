# frozen_string_literal: true
require "ostruct"
require "json"

module Monite
  class TemplateDataSchema
  # @return [String] Jinja2 compatible email body template
    attr_reader :body_template
  # @return [String] Lowercase ISO code of language
    attr_reader :language
  # @return [String] Jinja2 compatible email subject template
    attr_reader :subject_template
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param body_template [String] Jinja2 compatible email body template
    # @param language [String] Lowercase ISO code of language
    # @param subject_template [String] Jinja2 compatible email subject template
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::TemplateDataSchema]
    def initialize(body_template:, language:, subject_template:, additional_properties: nil)
      @body_template = body_template
      @language = language
      @subject_template = subject_template
      @additional_properties = additional_properties
      @_field_set = { "body_template": body_template, "language": language, "subject_template": subject_template }
    end
# Deserialize a JSON object to an instance of TemplateDataSchema
    #
    # @param json_object [String] 
    # @return [Monite::TemplateDataSchema]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      body_template = parsed_json["body_template"]
      language = parsed_json["language"]
      subject_template = parsed_json["subject_template"]
      new(
        body_template: body_template,
        language: language,
        subject_template: subject_template,
        additional_properties: struct
      )
    end
# Serialize an instance of TemplateDataSchema to a JSON object
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
      obj.body_template.is_a?(String) != false || raise("Passed value for field obj.body_template is not the expected type, validation failed.")
      obj.language.is_a?(String) != false || raise("Passed value for field obj.language is not the expected type, validation failed.")
      obj.subject_template.is_a?(String) != false || raise("Passed value for field obj.subject_template is not the expected type, validation failed.")
    end
  end
end