# frozen_string_literal: true
require "json"
require_relative "receivable_facade_create_quote_payload"
require_relative "receivable_facade_create_invoice_payload"
require_relative "receivable_create_based_on_payload"

module Monite
  class ReceivableFacadeCreatePayload


# Deserialize a JSON object to an instance of ReceivableFacadeCreatePayload
    #
    # @param json_object [String] 
    # @return [Monite::ReceivableFacadeCreatePayload]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      begin
        Monite::ReceivableFacadeCreateQuotePayload.validate_raw(obj: struct)
        unless struct.nil?
  return Monite::ReceivableFacadeCreateQuotePayload.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Monite::ReceivableFacadeCreateInvoicePayload.validate_raw(obj: struct)
        unless struct.nil?
  return Monite::ReceivableFacadeCreateInvoicePayload.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Monite::ReceivableCreateBasedOnPayload.validate_raw(obj: struct)
        unless struct.nil?
  return Monite::ReceivableCreateBasedOnPayload.from_json(json_object: struct)
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
        return Monite::ReceivableFacadeCreateQuotePayload.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Monite::ReceivableFacadeCreateInvoicePayload.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Monite::ReceivableCreateBasedOnPayload.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      raise("Passed value matched no type within the union, validation failed.")
    end
  end
end