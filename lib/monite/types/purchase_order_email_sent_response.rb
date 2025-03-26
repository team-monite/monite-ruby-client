# frozen_string_literal: true
require "ostruct"
require "json"

module Monite
# A schema for returning a response an email with a link to purchase order
#  document has been sent
  class PurchaseOrderEmailSentResponse
  # @return [String] 
    attr_reader :mail_id
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param mail_id [String] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::PurchaseOrderEmailSentResponse]
    def initialize(mail_id:, additional_properties: nil)
      @mail_id = mail_id
      @additional_properties = additional_properties
      @_field_set = { "mail_id": mail_id }
    end
# Deserialize a JSON object to an instance of PurchaseOrderEmailSentResponse
    #
    # @param json_object [String] 
    # @return [Monite::PurchaseOrderEmailSentResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      mail_id = parsed_json["mail_id"]
      new(mail_id: mail_id, additional_properties: struct)
    end
# Serialize an instance of PurchaseOrderEmailSentResponse to a JSON object
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
      obj.mail_id.is_a?(String) != false || raise("Passed value for field obj.mail_id is not the expected type, validation failed.")
    end
  end
end