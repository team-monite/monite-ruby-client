# frozen_string_literal: true
require_relative "template_data_schema"
require "ostruct"
require "json"

module Monite
  class SystemTemplateDataSchema
  # @return [Array<Monite::TemplateDataSchema>] Array of templates
    attr_reader :available_templates
  # @return [String] Name of the template
    attr_reader :template_name
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param available_templates [Array<Monite::TemplateDataSchema>] Array of templates
    # @param template_name [String] Name of the template
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::SystemTemplateDataSchema]
    def initialize(available_templates:, template_name:, additional_properties: nil)
      @available_templates = available_templates
      @template_name = template_name
      @additional_properties = additional_properties
      @_field_set = { "available_templates": available_templates, "template_name": template_name }
    end
# Deserialize a JSON object to an instance of SystemTemplateDataSchema
    #
    # @param json_object [String] 
    # @return [Monite::SystemTemplateDataSchema]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      available_templates = parsed_json["available_templates"]&.map do | item |
  item = item.to_json
  Monite::TemplateDataSchema.from_json(json_object: item)
end
      template_name = parsed_json["template_name"]
      new(
        available_templates: available_templates,
        template_name: template_name,
        additional_properties: struct
      )
    end
# Serialize an instance of SystemTemplateDataSchema to a JSON object
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
      obj.available_templates.is_a?(Array) != false || raise("Passed value for field obj.available_templates is not the expected type, validation failed.")
      obj.template_name.is_a?(String) != false || raise("Passed value for field obj.template_name is not the expected type, validation failed.")
    end
  end
end