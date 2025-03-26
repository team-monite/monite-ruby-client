# frozen_string_literal: true
require_relative "receivable_mail_recipient_state"
require "ostruct"
require "json"

module Monite
  class ReceivableMailRecipients
  # @return [Array<Monite::ReceivableMailRecipientState>] 
    attr_reader :bcc
  # @return [Array<Monite::ReceivableMailRecipientState>] 
    attr_reader :cc
  # @return [Array<Monite::ReceivableMailRecipientState>] 
    attr_reader :to
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param bcc [Array<Monite::ReceivableMailRecipientState>] 
    # @param cc [Array<Monite::ReceivableMailRecipientState>] 
    # @param to [Array<Monite::ReceivableMailRecipientState>] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::ReceivableMailRecipients]
    def initialize(bcc: OMIT, cc: OMIT, to: OMIT, additional_properties: nil)
      @bcc = bcc if bcc != OMIT
      @cc = cc if cc != OMIT
      @to = to if to != OMIT
      @additional_properties = additional_properties
      @_field_set = { "bcc": bcc, "cc": cc, "to": to }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of ReceivableMailRecipients
    #
    # @param json_object [String] 
    # @return [Monite::ReceivableMailRecipients]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      bcc = parsed_json["bcc"]&.map do | item |
  item = item.to_json
  Monite::ReceivableMailRecipientState.from_json(json_object: item)
end
      cc = parsed_json["cc"]&.map do | item |
  item = item.to_json
  Monite::ReceivableMailRecipientState.from_json(json_object: item)
end
      to = parsed_json["to"]&.map do | item |
  item = item.to_json
  Monite::ReceivableMailRecipientState.from_json(json_object: item)
end
      new(
        bcc: bcc,
        cc: cc,
        to: to,
        additional_properties: struct
      )
    end
# Serialize an instance of ReceivableMailRecipients to a JSON object
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