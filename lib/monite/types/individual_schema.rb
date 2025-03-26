# frozen_string_literal: true
require "ostruct"
require "json"

module Monite
# A schema contains metadata for an individual
  class IndividualSchema
  # @return [String] 
    attr_reader :date_of_birth
  # @return [String] A first name of an individual
    attr_reader :first_name
  # @return [String] 
    attr_reader :id_number
  # @return [String] A last name of an individual
    attr_reader :last_name
  # @return [String] The last four digits of the individual's Social Security number
    attr_reader :ssn_last_4
  # @return [String] A title of an individual
    attr_reader :title
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param date_of_birth [String] 
    # @param first_name [String] A first name of an individual
    # @param id_number [String] 
    # @param last_name [String] A last name of an individual
    # @param ssn_last_4 [String] The last four digits of the individual's Social Security number
    # @param title [String] A title of an individual
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::IndividualSchema]
    def initialize(date_of_birth: OMIT, first_name:, id_number: OMIT, last_name:, ssn_last_4: OMIT, title: OMIT, additional_properties: nil)
      @date_of_birth = date_of_birth if date_of_birth != OMIT
      @first_name = first_name
      @id_number = id_number if id_number != OMIT
      @last_name = last_name
      @ssn_last_4 = ssn_last_4 if ssn_last_4 != OMIT
      @title = title if title != OMIT
      @additional_properties = additional_properties
      @_field_set = { "date_of_birth": date_of_birth, "first_name": first_name, "id_number": id_number, "last_name": last_name, "ssn_last_4": ssn_last_4, "title": title }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of IndividualSchema
    #
    # @param json_object [String] 
    # @return [Monite::IndividualSchema]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      date_of_birth = parsed_json["date_of_birth"]
      first_name = parsed_json["first_name"]
      id_number = parsed_json["id_number"]
      last_name = parsed_json["last_name"]
      ssn_last_4 = parsed_json["ssn_last_4"]
      title = parsed_json["title"]
      new(
        date_of_birth: date_of_birth,
        first_name: first_name,
        id_number: id_number,
        last_name: last_name,
        ssn_last_4: ssn_last_4,
        title: title,
        additional_properties: struct
      )
    end
# Serialize an instance of IndividualSchema to a JSON object
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
      obj.date_of_birth&.is_a?(String) != false || raise("Passed value for field obj.date_of_birth is not the expected type, validation failed.")
      obj.first_name.is_a?(String) != false || raise("Passed value for field obj.first_name is not the expected type, validation failed.")
      obj.id_number&.is_a?(String) != false || raise("Passed value for field obj.id_number is not the expected type, validation failed.")
      obj.last_name.is_a?(String) != false || raise("Passed value for field obj.last_name is not the expected type, validation failed.")
      obj.ssn_last_4&.is_a?(String) != false || raise("Passed value for field obj.ssn_last_4 is not the expected type, validation failed.")
      obj.title&.is_a?(String) != false || raise("Passed value for field obj.title is not the expected type, validation failed.")
    end
  end
end