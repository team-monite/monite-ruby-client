# frozen_string_literal: true
require "ostruct"
require "json"

module Monite
  class ReceivableSettings
  # @return [Boolean] 
    attr_reader :create_without_personal_info
  # @return [String] 
    attr_reader :deduction_title
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param create_without_personal_info [Boolean] 
    # @param deduction_title [String] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::ReceivableSettings]
    def initialize(create_without_personal_info:, deduction_title: OMIT, additional_properties: nil)
      @create_without_personal_info = create_without_personal_info
      @deduction_title = deduction_title if deduction_title != OMIT
      @additional_properties = additional_properties
      @_field_set = { "create_without_personal_info": create_without_personal_info, "deduction_title": deduction_title }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of ReceivableSettings
    #
    # @param json_object [String] 
    # @return [Monite::ReceivableSettings]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      create_without_personal_info = parsed_json["create_without_personal_info"]
      deduction_title = parsed_json["deduction_title"]
      new(
        create_without_personal_info: create_without_personal_info,
        deduction_title: deduction_title,
        additional_properties: struct
      )
    end
# Serialize an instance of ReceivableSettings to a JSON object
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
      obj.create_without_personal_info.is_a?(Boolean) != false || raise("Passed value for field obj.create_without_personal_info is not the expected type, validation failed.")
      obj.deduction_title&.is_a?(String) != false || raise("Passed value for field obj.deduction_title is not the expected type, validation failed.")
    end
  end
end