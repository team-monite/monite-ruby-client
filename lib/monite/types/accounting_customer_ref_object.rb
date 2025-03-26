# frozen_string_literal: true
require "ostruct"
require "json"

module Monite
  class AccountingCustomerRefObject
  # @return [String] A unique identifier of the customer in the accounting system.
    attr_reader :id
  # @return [String] Customer name in the accounting system.
    attr_reader :company_name
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] A unique identifier of the customer in the accounting system.
    # @param company_name [String] Customer name in the accounting system.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::AccountingCustomerRefObject]
    def initialize(id:, company_name: OMIT, additional_properties: nil)
      @id = id
      @company_name = company_name if company_name != OMIT
      @additional_properties = additional_properties
      @_field_set = { "id": id, "company_name": company_name }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of AccountingCustomerRefObject
    #
    # @param json_object [String] 
    # @return [Monite::AccountingCustomerRefObject]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      company_name = parsed_json["company_name"]
      new(
        id: id,
        company_name: company_name,
        additional_properties: struct
      )
    end
# Serialize an instance of AccountingCustomerRefObject to a JSON object
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
      obj.id.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
      obj.company_name&.is_a?(String) != false || raise("Passed value for field obj.company_name is not the expected type, validation failed.")
    end
  end
end