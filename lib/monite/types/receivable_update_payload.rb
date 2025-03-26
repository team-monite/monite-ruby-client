# frozen_string_literal: true
require "json"
require_relative "update_quote_payload"
require_relative "update_invoice_payload"
require_relative "update_credit_note_payload"
require_relative "update_issued_invoice_payload"

module Monite
  class ReceivableUpdatePayload


# Deserialize a JSON object to an instance of ReceivableUpdatePayload
    #
    # @param json_object [String] 
    # @return [Monite::ReceivableUpdatePayload]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      begin
        Monite::UpdateQuotePayload.validate_raw(obj: struct)
        unless struct.nil?
  return Monite::UpdateQuotePayload.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Monite::UpdateInvoicePayload.validate_raw(obj: struct)
        unless struct.nil?
  return Monite::UpdateInvoicePayload.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Monite::UpdateCreditNotePayload.validate_raw(obj: struct)
        unless struct.nil?
  return Monite::UpdateCreditNotePayload.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Monite::UpdateIssuedInvoicePayload.validate_raw(obj: struct)
        unless struct.nil?
  return Monite::UpdateIssuedInvoicePayload.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
 return struct
    end
# Leveraged for Union-type generation, validate_raw attempts to parse the given
#  hash and check each fields type against the current object's property
#  definitions.
    #
    # @param obj [Object] 
    # @return [Void]
    def self.validate_raw(obj:)
      begin
        return Monite::UpdateQuotePayload.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Monite::UpdateInvoicePayload.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Monite::UpdateCreditNotePayload.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Monite::UpdateIssuedInvoicePayload.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      raise("Passed value matched no type within the union, validation failed.")
    end
  end
end