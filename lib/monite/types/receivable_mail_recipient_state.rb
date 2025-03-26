# frozen_string_literal: true
require "ostruct"
require "json"

module Monite
  class ReceivableMailRecipientState
  # @return [String] An email address of the recipient.
    attr_reader :email
  # @return [String] An error message in case the mailing was unsuccessful.
    attr_reader :error
  # @return [Boolean] Whether mail was sent successfully.
    attr_reader :is_success
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param email [String] An email address of the recipient.
    # @param error [String] An error message in case the mailing was unsuccessful.
    # @param is_success [Boolean] Whether mail was sent successfully.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::ReceivableMailRecipientState]
    def initialize(email:, error: OMIT, is_success:, additional_properties: nil)
      @email = email
      @error = error if error != OMIT
      @is_success = is_success
      @additional_properties = additional_properties
      @_field_set = { "email": email, "error": error, "is_success": is_success }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of ReceivableMailRecipientState
    #
    # @param json_object [String] 
    # @return [Monite::ReceivableMailRecipientState]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      email = parsed_json["email"]
      error = parsed_json["error"]
      is_success = parsed_json["is_success"]
      new(
        email: email,
        error: error,
        is_success: is_success,
        additional_properties: struct
      )
    end
# Serialize an instance of ReceivableMailRecipientState to a JSON object
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
      obj.email.is_a?(String) != false || raise("Passed value for field obj.email is not the expected type, validation failed.")
      obj.error&.is_a?(String) != false || raise("Passed value for field obj.error is not the expected type, validation failed.")
      obj.is_success.is_a?(Boolean) != false || raise("Passed value for field obj.is_success is not the expected type, validation failed.")
    end
  end
end