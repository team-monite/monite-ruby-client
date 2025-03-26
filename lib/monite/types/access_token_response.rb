# frozen_string_literal: true
require "ostruct"
require "json"

module Monite
  class AccessTokenResponse
  # @return [String] 
    attr_reader :access_token
  # @return [Integer] 
    attr_reader :expires_in
  # @return [String] 
    attr_reader :token_type
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param access_token [String] 
    # @param expires_in [Integer] 
    # @param token_type [String] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::AccessTokenResponse]
    def initialize(access_token:, expires_in:, token_type:, additional_properties: nil)
      @access_token = access_token
      @expires_in = expires_in
      @token_type = token_type
      @additional_properties = additional_properties
      @_field_set = { "access_token": access_token, "expires_in": expires_in, "token_type": token_type }
    end
# Deserialize a JSON object to an instance of AccessTokenResponse
    #
    # @param json_object [String] 
    # @return [Monite::AccessTokenResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      access_token = parsed_json["access_token"]
      expires_in = parsed_json["expires_in"]
      token_type = parsed_json["token_type"]
      new(
        access_token: access_token,
        expires_in: expires_in,
        token_type: token_type,
        additional_properties: struct
      )
    end
# Serialize an instance of AccessTokenResponse to a JSON object
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
      obj.access_token.is_a?(String) != false || raise("Passed value for field obj.access_token is not the expected type, validation failed.")
      obj.expires_in.is_a?(Integer) != false || raise("Passed value for field obj.expires_in is not the expected type, validation failed.")
      obj.token_type.is_a?(String) != false || raise("Passed value for field obj.token_type is not the expected type, validation failed.")
    end
  end
end