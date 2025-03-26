# frozen_string_literal: true
require "ostruct"
require "json"

module Monite
  class Signature
  # @return [String] The email of a person who signed a quote
    attr_reader :email
  # @return [String] The full name of a person who signed a quote
    attr_reader :full_name
  # @return [String] Base64 encoded PNG image of a signature
    attr_reader :signature_image
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param email [String] The email of a person who signed a quote
    # @param full_name [String] The full name of a person who signed a quote
    # @param signature_image [String] Base64 encoded PNG image of a signature
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::Signature]
    def initialize(email:, full_name:, signature_image:, additional_properties: nil)
      @email = email
      @full_name = full_name
      @signature_image = signature_image
      @additional_properties = additional_properties
      @_field_set = { "email": email, "full_name": full_name, "signature_image": signature_image }
    end
# Deserialize a JSON object to an instance of Signature
    #
    # @param json_object [String] 
    # @return [Monite::Signature]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      email = parsed_json["email"]
      full_name = parsed_json["full_name"]
      signature_image = parsed_json["signature_image"]
      new(
        email: email,
        full_name: full_name,
        signature_image: signature_image,
        additional_properties: struct
      )
    end
# Serialize an instance of Signature to a JSON object
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
      obj.full_name.is_a?(String) != false || raise("Passed value for field obj.full_name is not the expected type, validation failed.")
      obj.signature_image.is_a?(String) != false || raise("Passed value for field obj.signature_image is not the expected type, validation failed.")
    end
  end
end