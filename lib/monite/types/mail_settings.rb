# frozen_string_literal: true
require "ostruct"
require "json"

module Monite
  class MailSettings
  # @return [Boolean] 
    attr_reader :attach_documents_as_pdf
  # @return [String] 
    attr_reader :from_email_username
  # @return [String] 
    attr_reader :from_name
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param attach_documents_as_pdf [Boolean] 
    # @param from_email_username [String] 
    # @param from_name [String] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::MailSettings]
    def initialize(attach_documents_as_pdf:, from_email_username: OMIT, from_name: OMIT, additional_properties: nil)
      @attach_documents_as_pdf = attach_documents_as_pdf
      @from_email_username = from_email_username if from_email_username != OMIT
      @from_name = from_name if from_name != OMIT
      @additional_properties = additional_properties
      @_field_set = { "attach_documents_as_pdf": attach_documents_as_pdf, "from_email_username": from_email_username, "from_name": from_name }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of MailSettings
    #
    # @param json_object [String] 
    # @return [Monite::MailSettings]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      attach_documents_as_pdf = parsed_json["attach_documents_as_pdf"]
      from_email_username = parsed_json["from_email_username"]
      from_name = parsed_json["from_name"]
      new(
        attach_documents_as_pdf: attach_documents_as_pdf,
        from_email_username: from_email_username,
        from_name: from_name,
        additional_properties: struct
      )
    end
# Serialize an instance of MailSettings to a JSON object
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
      obj.attach_documents_as_pdf.is_a?(Boolean) != false || raise("Passed value for field obj.attach_documents_as_pdf is not the expected type, validation failed.")
      obj.from_email_username&.is_a?(String) != false || raise("Passed value for field obj.from_email_username is not the expected type, validation failed.")
      obj.from_name&.is_a?(String) != false || raise("Passed value for field obj.from_name is not the expected type, validation failed.")
    end
  end
end