# frozen_string_literal: true
require "ostruct"
require "json"

module Monite
  class OptionalPersonRelationship
  # @return [Boolean] Whether the person is a director of the account's legal entity
    attr_reader :director
  # @return [Boolean] Whether the person has significant responsibility to control, manage, or direct
#  the organization
    attr_reader :executive
  # @return [Boolean] Whether the person is an owner of the account's legal entity
    attr_reader :owner
  # @return [Float] The percent owned by the person of the account's legal entity
    attr_reader :percent_ownership
  # @return [Boolean] Whether the person is authorized as the primary representative of the account
    attr_reader :representative
  # @return [String] The person's title (e.g., CEO, Support Engineer)
    attr_reader :title
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param director [Boolean] Whether the person is a director of the account's legal entity
    # @param executive [Boolean] Whether the person has significant responsibility to control, manage, or direct
#  the organization
    # @param owner [Boolean] Whether the person is an owner of the account's legal entity
    # @param percent_ownership [Float] The percent owned by the person of the account's legal entity
    # @param representative [Boolean] Whether the person is authorized as the primary representative of the account
    # @param title [String] The person's title (e.g., CEO, Support Engineer)
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::OptionalPersonRelationship]
    def initialize(director: OMIT, executive: OMIT, owner: OMIT, percent_ownership: OMIT, representative: OMIT, title: OMIT, additional_properties: nil)
      @director = director if director != OMIT
      @executive = executive if executive != OMIT
      @owner = owner if owner != OMIT
      @percent_ownership = percent_ownership if percent_ownership != OMIT
      @representative = representative if representative != OMIT
      @title = title if title != OMIT
      @additional_properties = additional_properties
      @_field_set = { "director": director, "executive": executive, "owner": owner, "percent_ownership": percent_ownership, "representative": representative, "title": title }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of OptionalPersonRelationship
    #
    # @param json_object [String] 
    # @return [Monite::OptionalPersonRelationship]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      director = parsed_json["director"]
      executive = parsed_json["executive"]
      owner = parsed_json["owner"]
      percent_ownership = parsed_json["percent_ownership"]
      representative = parsed_json["representative"]
      title = parsed_json["title"]
      new(
        director: director,
        executive: executive,
        owner: owner,
        percent_ownership: percent_ownership,
        representative: representative,
        title: title,
        additional_properties: struct
      )
    end
# Serialize an instance of OptionalPersonRelationship to a JSON object
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
      obj.director&.is_a?(Boolean) != false || raise("Passed value for field obj.director is not the expected type, validation failed.")
      obj.executive&.is_a?(Boolean) != false || raise("Passed value for field obj.executive is not the expected type, validation failed.")
      obj.owner&.is_a?(Boolean) != false || raise("Passed value for field obj.owner is not the expected type, validation failed.")
      obj.percent_ownership&.is_a?(Float) != false || raise("Passed value for field obj.percent_ownership is not the expected type, validation failed.")
      obj.representative&.is_a?(Boolean) != false || raise("Passed value for field obj.representative is not the expected type, validation failed.")
      obj.title&.is_a?(String) != false || raise("Passed value for field obj.title is not the expected type, validation failed.")
    end
  end
end