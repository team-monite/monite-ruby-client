# frozen_string_literal: true
require "ostruct"
require "json"

module Monite
# A schema for returning a response with list of ids by which user check sending
#  status
  class ReceivablesSendResponse
  # @return [Array<String>] 
    attr_reader :mail_ids
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param mail_ids [Array<String>] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::ReceivablesSendResponse]
    def initialize(mail_ids:, additional_properties: nil)
      @mail_ids = mail_ids
      @additional_properties = additional_properties
      @_field_set = { "mail_ids": mail_ids }
    end
# Deserialize a JSON object to an instance of ReceivablesSendResponse
    #
    # @param json_object [String] 
    # @return [Monite::ReceivablesSendResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      mail_ids = parsed_json["mail_ids"]
      new(mail_ids: mail_ids, additional_properties: struct)
    end
# Serialize an instance of ReceivablesSendResponse to a JSON object
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
      obj.mail_ids.is_a?(Array) != false || raise("Passed value for field obj.mail_ids is not the expected type, validation failed.")
    end
  end
end