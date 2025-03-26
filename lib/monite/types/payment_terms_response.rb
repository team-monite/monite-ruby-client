# frozen_string_literal: true
require_relative "payment_term_discount"
require_relative "payment_term"
require "ostruct"
require "json"

module Monite
  class PaymentTermsResponse
  # @return [String] 
    attr_reader :id
  # @return [String] 
    attr_reader :description
  # @return [String] 
    attr_reader :name
  # @return [Monite::PaymentTermDiscount] The first tier of the payment term. Represents the terms of the first early
#  discount.
    attr_reader :term_1
  # @return [Monite::PaymentTermDiscount] The second tier of the payment term. Defines the terms of the second early
#  discount.
    attr_reader :term_2
  # @return [Monite::PaymentTerm] The final tier of the payment term. Defines the invoice due date.
    attr_reader :term_final
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] 
    # @param description [String] 
    # @param name [String] 
    # @param term_1 [Monite::PaymentTermDiscount] The first tier of the payment term. Represents the terms of the first early
#  discount.
    # @param term_2 [Monite::PaymentTermDiscount] The second tier of the payment term. Defines the terms of the second early
#  discount.
    # @param term_final [Monite::PaymentTerm] The final tier of the payment term. Defines the invoice due date.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::PaymentTermsResponse]
    def initialize(id:, description: OMIT, name:, term_1: OMIT, term_2: OMIT, term_final:, additional_properties: nil)
      @id = id
      @description = description if description != OMIT
      @name = name
      @term_1 = term_1 if term_1 != OMIT
      @term_2 = term_2 if term_2 != OMIT
      @term_final = term_final
      @additional_properties = additional_properties
      @_field_set = { "id": id, "description": description, "name": name, "term_1": term_1, "term_2": term_2, "term_final": term_final }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of PaymentTermsResponse
    #
    # @param json_object [String] 
    # @return [Monite::PaymentTermsResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      description = parsed_json["description"]
      name = parsed_json["name"]
      unless parsed_json["term_1"].nil?
        term_1 = parsed_json["term_1"].to_json
        term_1 = Monite::PaymentTermDiscount.from_json(json_object: term_1)
      else
        term_1 = nil
      end
      unless parsed_json["term_2"].nil?
        term_2 = parsed_json["term_2"].to_json
        term_2 = Monite::PaymentTermDiscount.from_json(json_object: term_2)
      else
        term_2 = nil
      end
      unless parsed_json["term_final"].nil?
        term_final = parsed_json["term_final"].to_json
        term_final = Monite::PaymentTerm.from_json(json_object: term_final)
      else
        term_final = nil
      end
      new(
        id: id,
        description: description,
        name: name,
        term_1: term_1,
        term_2: term_2,
        term_final: term_final,
        additional_properties: struct
      )
    end
# Serialize an instance of PaymentTermsResponse to a JSON object
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
      obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
      obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.term_1.nil? || Monite::PaymentTermDiscount.validate_raw(obj: obj.term_1)
      obj.term_2.nil? || Monite::PaymentTermDiscount.validate_raw(obj: obj.term_2)
      Monite::PaymentTerm.validate_raw(obj: obj.term_final)
    end
  end
end