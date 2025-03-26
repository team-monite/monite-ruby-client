# frozen_string_literal: true
require_relative "invoice_file"
require "ostruct"
require "json"

module Monite
  class Invoice
  # @return [String] 
    attr_reader :due_date
  # @return [Monite::InvoiceFile] 
    attr_reader :file
  # @return [String] 
    attr_reader :issue_date
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param due_date [String] 
    # @param file [Monite::InvoiceFile] 
    # @param issue_date [String] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::Invoice]
    def initialize(due_date: OMIT, file: OMIT, issue_date: OMIT, additional_properties: nil)
      @due_date = due_date if due_date != OMIT
      @file = file if file != OMIT
      @issue_date = issue_date if issue_date != OMIT
      @additional_properties = additional_properties
      @_field_set = { "due_date": due_date, "file": file, "issue_date": issue_date }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of Invoice
    #
    # @param json_object [String] 
    # @return [Monite::Invoice]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      due_date = parsed_json["due_date"]
      unless parsed_json["file"].nil?
        file = parsed_json["file"].to_json
        file = Monite::InvoiceFile.from_json(json_object: file)
      else
        file = nil
      end
      issue_date = parsed_json["issue_date"]
      new(
        due_date: due_date,
        file: file,
        issue_date: issue_date,
        additional_properties: struct
      )
    end
# Serialize an instance of Invoice to a JSON object
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
      obj.due_date&.is_a?(String) != false || raise("Passed value for field obj.due_date is not the expected type, validation failed.")
      obj.file.nil? || Monite::InvoiceFile.validate_raw(obj: obj.file)
      obj.issue_date&.is_a?(String) != false || raise("Passed value for field obj.issue_date is not the expected type, validation failed.")
    end
  end
end