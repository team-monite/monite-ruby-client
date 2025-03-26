# frozen_string_literal: true
require "ostruct"
require "json"

module Monite
# A schema for receiving a request for previewing an email with a receivable
#  document
  class ReceivablePreviewResponse
  # @return [String] 
    attr_reader :body_preview
  # @return [String] 
    attr_reader :subject_preview
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param body_preview [String] 
    # @param subject_preview [String] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::ReceivablePreviewResponse]
    def initialize(body_preview:, subject_preview:, additional_properties: nil)
      @body_preview = body_preview
      @subject_preview = subject_preview
      @additional_properties = additional_properties
      @_field_set = { "body_preview": body_preview, "subject_preview": subject_preview }
    end
# Deserialize a JSON object to an instance of ReceivablePreviewResponse
    #
    # @param json_object [String] 
    # @return [Monite::ReceivablePreviewResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      body_preview = parsed_json["body_preview"]
      subject_preview = parsed_json["subject_preview"]
      new(
        body_preview: body_preview,
        subject_preview: subject_preview,
        additional_properties: struct
      )
    end
# Serialize an instance of ReceivablePreviewResponse to a JSON object
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
      obj.body_preview.is_a?(String) != false || raise("Passed value for field obj.body_preview is not the expected type, validation failed.")
      obj.subject_preview.is_a?(String) != false || raise("Passed value for field obj.subject_preview is not the expected type, validation failed.")
    end
  end
end