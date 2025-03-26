# frozen_string_literal: true
require "ostruct"
require "json"

module Monite
  class PersonOnboardingDocuments
  # @return [String] 
    attr_reader :verification_document_front
  # @return [String] 
    attr_reader :verification_document_back
  # @return [String] 
    attr_reader :additional_verification_document_front
  # @return [String] 
    attr_reader :additional_verification_document_back
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param verification_document_front [String] 
    # @param verification_document_back [String] 
    # @param additional_verification_document_front [String] 
    # @param additional_verification_document_back [String] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::PersonOnboardingDocuments]
    def initialize(verification_document_front: OMIT, verification_document_back: OMIT, additional_verification_document_front: OMIT, additional_verification_document_back: OMIT, additional_properties: nil)
      @verification_document_front = verification_document_front if verification_document_front != OMIT
      @verification_document_back = verification_document_back if verification_document_back != OMIT
      @additional_verification_document_front = additional_verification_document_front if additional_verification_document_front != OMIT
      @additional_verification_document_back = additional_verification_document_back if additional_verification_document_back != OMIT
      @additional_properties = additional_properties
      @_field_set = { "verification_document_front": verification_document_front, "verification_document_back": verification_document_back, "additional_verification_document_front": additional_verification_document_front, "additional_verification_document_back": additional_verification_document_back }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of PersonOnboardingDocuments
    #
    # @param json_object [String] 
    # @return [Monite::PersonOnboardingDocuments]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      verification_document_front = parsed_json["verification_document_front"]
      verification_document_back = parsed_json["verification_document_back"]
      additional_verification_document_front = parsed_json["additional_verification_document_front"]
      additional_verification_document_back = parsed_json["additional_verification_document_back"]
      new(
        verification_document_front: verification_document_front,
        verification_document_back: verification_document_back,
        additional_verification_document_front: additional_verification_document_front,
        additional_verification_document_back: additional_verification_document_back,
        additional_properties: struct
      )
    end
# Serialize an instance of PersonOnboardingDocuments to a JSON object
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
      obj.verification_document_front&.is_a?(String) != false || raise("Passed value for field obj.verification_document_front is not the expected type, validation failed.")
      obj.verification_document_back&.is_a?(String) != false || raise("Passed value for field obj.verification_document_back is not the expected type, validation failed.")
      obj.additional_verification_document_front&.is_a?(String) != false || raise("Passed value for field obj.additional_verification_document_front is not the expected type, validation failed.")
      obj.additional_verification_document_back&.is_a?(String) != false || raise("Passed value for field obj.additional_verification_document_back is not the expected type, validation failed.")
    end
  end
end