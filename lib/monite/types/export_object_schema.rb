# frozen_string_literal: true
require "json"
require_relative "export_payable_schema"
require_relative "export_receivable_schema"

module Monite
  class ExportObjectSchema
  # @return [Object] 
    attr_reader :member
  # @return [String] 
    attr_reader :discriminant

    private_class_method :new
    alias kind_of? is_a?

    # @param member [Object] 
    # @param discriminant [String] 
    # @return [Monite::ExportObjectSchema]
    def initialize(member:, discriminant:)
      @member = member
      @discriminant = discriminant
    end
# Deserialize a JSON object to an instance of ExportObjectSchema
    #
    # @param json_object [String] 
    # @return [Monite::ExportObjectSchema]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      case struct.name
      when "payable"
        member = Monite::ExportPayableSchema.from_json(json_object: json_object)
      when "receivable"
        member = Monite::ExportReceivableSchema.from_json(json_object: json_object)
      else
        member = Monite::ExportPayableSchema.from_json(json_object: json_object)
      end
      new(member: member, discriminant: struct.name)
    end
# For Union Types, to_json functionality is delegated to the wrapped member.
    #
    # @return [String]
    def to_json
      case @discriminant
      when "payable"
        { **@member.to_json, name: @discriminant }.to_json
      when "receivable"
        { **@member.to_json, name: @discriminant }.to_json
      else
        { "name": @discriminant, value: @member }.to_json
      end
      @member.to_json
    end
# Leveraged for Union-type generation, validate_raw attempts to parse the given
#  hash and check each fields type against the current object's property
#  definitions.
    #
    # @param obj [Object] 
    # @return [Void]
    def self.validate_raw(obj:)
      case obj.name
      when "payable"
        Monite::ExportPayableSchema.validate_raw(obj: obj)
      when "receivable"
        Monite::ExportReceivableSchema.validate_raw(obj: obj)
      else
        raise("Passed value matched no type within the union, validation failed.")
      end
    end
# For Union Types, is_a? functionality is delegated to the wrapped member.
    #
    # @param obj [Object] 
    # @return [Boolean]
    def is_a?(obj)
      @member.is_a?(obj)
    end
    # @param member [Monite::ExportPayableSchema] 
    # @return [Monite::ExportObjectSchema]
    def self.payable(member:)
      new(member: member, discriminant: "payable")
    end
    # @param member [Monite::ExportReceivableSchema] 
    # @return [Monite::ExportObjectSchema]
    def self.receivable(member:)
      new(member: member, discriminant: "receivable")
    end
  end
end