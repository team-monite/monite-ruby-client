# frozen_string_literal: true
require "json"
require_relative "ocr_response_invoice_receipt_data"
require_relative "ocr_recognition_response"

module Monite
# Data extracted from the uploaded payable by OCR.
  class PayableResponseSchemaOtherExtractedData


# Deserialize a JSON object to an instance of
#  PayableResponseSchemaOtherExtractedData
    #
    # @param json_object [String] 
    # @return [Monite::PayableResponseSchemaOtherExtractedData]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      begin
        Monite::OcrResponseInvoiceReceiptData.validate_raw(obj: struct)
        unless struct.nil?
  return Monite::OcrResponseInvoiceReceiptData.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Monite::OcrRecognitionResponse.validate_raw(obj: struct)
        unless struct.nil?
  return Monite::OcrRecognitionResponse.from_json(json_object: struct)
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
        return Monite::OcrResponseInvoiceReceiptData.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Monite::OcrRecognitionResponse.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      raise("Passed value matched no type within the union, validation failed.")
    end
  end
end