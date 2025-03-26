# frozen_string_literal: true
require "ostruct"
require "json"

module Monite
  class FinancingPushInvoicesResponse
  # @return [String] A connect token for Kanmon SDK.
    attr_reader :connect_token
  # @return [String] An embedded session token for Kanmon SDK.
    attr_reader :session_token
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param connect_token [String] A connect token for Kanmon SDK.
    # @param session_token [String] An embedded session token for Kanmon SDK.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::FinancingPushInvoicesResponse]
    def initialize(connect_token:, session_token:, additional_properties: nil)
      @connect_token = connect_token
      @session_token = session_token
      @additional_properties = additional_properties
      @_field_set = { "connect_token": connect_token, "session_token": session_token }
    end
# Deserialize a JSON object to an instance of FinancingPushInvoicesResponse
    #
    # @param json_object [String] 
    # @return [Monite::FinancingPushInvoicesResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      connect_token = parsed_json["connect_token"]
      session_token = parsed_json["session_token"]
      new(
        connect_token: connect_token,
        session_token: session_token,
        additional_properties: struct
      )
    end
# Serialize an instance of FinancingPushInvoicesResponse to a JSON object
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
      obj.connect_token.is_a?(String) != false || raise("Passed value for field obj.connect_token is not the expected type, validation failed.")
      obj.session_token.is_a?(String) != false || raise("Passed value for field obj.session_token is not the expected type, validation failed.")
    end
  end
end