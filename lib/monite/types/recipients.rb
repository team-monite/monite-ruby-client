# frozen_string_literal: true
require "ostruct"
require "json"

module Monite
  class Recipients
  # @return [Array<String>] 
    attr_reader :bcc
  # @return [Array<String>] 
    attr_reader :cc
  # @return [Array<String>] 
    attr_reader :to
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param bcc [Array<String>] 
    # @param cc [Array<String>] 
    # @param to [Array<String>] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::Recipients]
    def initialize(bcc: OMIT, cc: OMIT, to: OMIT, additional_properties: nil)
      @bcc = bcc if bcc != OMIT
      @cc = cc if cc != OMIT
      @to = to if to != OMIT
      @additional_properties = additional_properties
      @_field_set = { "bcc": bcc, "cc": cc, "to": to }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of Recipients
    #
    # @param json_object [String] 
    # @return [Monite::Recipients]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      bcc = parsed_json["bcc"]
      cc = parsed_json["cc"]
      to = parsed_json["to"]
      new(
        bcc: bcc,
        cc: cc,
        to: to,
        additional_properties: struct
      )
    end
# Serialize an instance of Recipients to a JSON object
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
      obj.bcc&.is_a?(Array) != false || raise("Passed value for field obj.bcc is not the expected type, validation failed.")
      obj.cc&.is_a?(Array) != false || raise("Passed value for field obj.cc is not the expected type, validation failed.")
      obj.to&.is_a?(Array) != false || raise("Passed value for field obj.to is not the expected type, validation failed.")
    end
  end
end