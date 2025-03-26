# frozen_string_literal: true
require_relative "ocr_address"
require_relative "ocr_response_invoice_receipt_line_item"
require_relative "ocr_response_invoice_receipt_line_item_raw"
require "ostruct"
require "json"

module Monite
  class OcrResponseInvoiceReceiptData
  # @return [String] 
    attr_reader :type
  # @return [Integer] Total in cents/eurocents. Outdated, actual conversion happens in payables.
    attr_reader :total
  # @return [Float] Total paid amount
    attr_reader :total_paid_amount_raw
  # @return [Float] Total, without minor units
    attr_reader :total_raw
  # @return [Integer] Subtotal cents/eurocents. Outdated, actual conversion happens in payables.
    attr_reader :total_excl_vat
  # @return [Float] Subtotal, without minor units
    attr_reader :total_excl_vat_raw
  # @return [Integer] VAT amount in cents. Outdated, actual conversion happens in payables.
    attr_reader :total_vat_amount
  # @return [Float] VAT amount, without minor units
    attr_reader :total_vat_amount_raw
  # @return [Integer] VAT Percent minor units. Example: 12.5% is 1250. Outdated, actual conversion
#  happens in payables.
    attr_reader :total_vat_rate
  # @return [Float] VAT Percent raw, without minor units.
    attr_reader :total_vat_rate_raw
  # @return [String] ISO 4217 currency code
    attr_reader :currency
  # @return [String] Purchase Order Number
    attr_reader :purchase_order_number
  # @return [String] Counterpart name
    attr_reader :counterpart_name
  # @return [String] Counterpart address
    attr_reader :counterpart_address
  # @return [String] Counterpart bank ID
    attr_reader :counterpart_account_id
  # @return [String] Invoice/receipt ID
    attr_reader :document_id
  # @return [Array<String>] Raw payment terms parsed but not calculated.
    attr_reader :payment_terms_raw
  # @return [String] Tax payer ID
    attr_reader :tax_payer_id
  # @return [String] Counterpart VAT ID
    attr_reader :counterpart_vat_id
  # @return [String] Document issuance date in ISO format
    attr_reader :document_issued_at_date
  # @return [String] Document due date in ISO format
    attr_reader :document_due_date
  # @return [Monite::OcrAddress] Counterpart address as a json object compatible with counterparts service
    attr_reader :counterpart_address_object
  # @return [String] The bank account number
    attr_reader :counterpart_account_number
  # @return [String] The bank routing number
    attr_reader :counterpart_routing_number
  # @return [Array<Monite::OcrResponseInvoiceReceiptLineItem>] List of line items from document. Outdated, actual conversion happens in
#  payables.
    attr_reader :line_items
  # @return [Array<Monite::OcrResponseInvoiceReceiptLineItemRaw>] List of line items from document raw, without minor units conversion.
    attr_reader :line_items_raw
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param type [String] 
    # @param total [Integer] Total in cents/eurocents. Outdated, actual conversion happens in payables.
    # @param total_paid_amount_raw [Float] Total paid amount
    # @param total_raw [Float] Total, without minor units
    # @param total_excl_vat [Integer] Subtotal cents/eurocents. Outdated, actual conversion happens in payables.
    # @param total_excl_vat_raw [Float] Subtotal, without minor units
    # @param total_vat_amount [Integer] VAT amount in cents. Outdated, actual conversion happens in payables.
    # @param total_vat_amount_raw [Float] VAT amount, without minor units
    # @param total_vat_rate [Integer] VAT Percent minor units. Example: 12.5% is 1250. Outdated, actual conversion
#  happens in payables.
    # @param total_vat_rate_raw [Float] VAT Percent raw, without minor units.
    # @param currency [String] ISO 4217 currency code
    # @param purchase_order_number [String] Purchase Order Number
    # @param counterpart_name [String] Counterpart name
    # @param counterpart_address [String] Counterpart address
    # @param counterpart_account_id [String] Counterpart bank ID
    # @param document_id [String] Invoice/receipt ID
    # @param payment_terms_raw [Array<String>] Raw payment terms parsed but not calculated.
    # @param tax_payer_id [String] Tax payer ID
    # @param counterpart_vat_id [String] Counterpart VAT ID
    # @param document_issued_at_date [String] Document issuance date in ISO format
    # @param document_due_date [String] Document due date in ISO format
    # @param counterpart_address_object [Monite::OcrAddress] Counterpart address as a json object compatible with counterparts service
    # @param counterpart_account_number [String] The bank account number
    # @param counterpart_routing_number [String] The bank routing number
    # @param line_items [Array<Monite::OcrResponseInvoiceReceiptLineItem>] List of line items from document. Outdated, actual conversion happens in
#  payables.
    # @param line_items_raw [Array<Monite::OcrResponseInvoiceReceiptLineItemRaw>] List of line items from document raw, without minor units conversion.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::OcrResponseInvoiceReceiptData]
    def initialize(type: OMIT, total: OMIT, total_paid_amount_raw: OMIT, total_raw: OMIT, total_excl_vat: OMIT, total_excl_vat_raw: OMIT, total_vat_amount: OMIT, total_vat_amount_raw: OMIT, total_vat_rate: OMIT, total_vat_rate_raw: OMIT, currency: OMIT, purchase_order_number: OMIT, counterpart_name: OMIT, counterpart_address: OMIT, counterpart_account_id: OMIT, document_id: OMIT, payment_terms_raw: OMIT, tax_payer_id: OMIT, counterpart_vat_id: OMIT, document_issued_at_date: OMIT, document_due_date: OMIT, counterpart_address_object: OMIT, counterpart_account_number: OMIT, counterpart_routing_number: OMIT, line_items: OMIT, line_items_raw: OMIT, additional_properties: nil)
      @type = type if type != OMIT
      @total = total if total != OMIT
      @total_paid_amount_raw = total_paid_amount_raw if total_paid_amount_raw != OMIT
      @total_raw = total_raw if total_raw != OMIT
      @total_excl_vat = total_excl_vat if total_excl_vat != OMIT
      @total_excl_vat_raw = total_excl_vat_raw if total_excl_vat_raw != OMIT
      @total_vat_amount = total_vat_amount if total_vat_amount != OMIT
      @total_vat_amount_raw = total_vat_amount_raw if total_vat_amount_raw != OMIT
      @total_vat_rate = total_vat_rate if total_vat_rate != OMIT
      @total_vat_rate_raw = total_vat_rate_raw if total_vat_rate_raw != OMIT
      @currency = currency if currency != OMIT
      @purchase_order_number = purchase_order_number if purchase_order_number != OMIT
      @counterpart_name = counterpart_name if counterpart_name != OMIT
      @counterpart_address = counterpart_address if counterpart_address != OMIT
      @counterpart_account_id = counterpart_account_id if counterpart_account_id != OMIT
      @document_id = document_id if document_id != OMIT
      @payment_terms_raw = payment_terms_raw if payment_terms_raw != OMIT
      @tax_payer_id = tax_payer_id if tax_payer_id != OMIT
      @counterpart_vat_id = counterpart_vat_id if counterpart_vat_id != OMIT
      @document_issued_at_date = document_issued_at_date if document_issued_at_date != OMIT
      @document_due_date = document_due_date if document_due_date != OMIT
      @counterpart_address_object = counterpart_address_object if counterpart_address_object != OMIT
      @counterpart_account_number = counterpart_account_number if counterpart_account_number != OMIT
      @counterpart_routing_number = counterpart_routing_number if counterpart_routing_number != OMIT
      @line_items = line_items if line_items != OMIT
      @line_items_raw = line_items_raw if line_items_raw != OMIT
      @additional_properties = additional_properties
      @_field_set = { "type": type, "total": total, "total_paid_amount_raw": total_paid_amount_raw, "total_raw": total_raw, "total_excl_vat": total_excl_vat, "total_excl_vat_raw": total_excl_vat_raw, "total_vat_amount": total_vat_amount, "total_vat_amount_raw": total_vat_amount_raw, "total_vat_rate": total_vat_rate, "total_vat_rate_raw": total_vat_rate_raw, "currency": currency, "purchase_order_number": purchase_order_number, "counterpart_name": counterpart_name, "counterpart_address": counterpart_address, "counterpart_account_id": counterpart_account_id, "document_id": document_id, "payment_terms_raw": payment_terms_raw, "tax_payer_id": tax_payer_id, "counterpart_vat_id": counterpart_vat_id, "document_issued_at_date": document_issued_at_date, "document_due_date": document_due_date, "counterpart_address_object": counterpart_address_object, "counterpart_account_number": counterpart_account_number, "counterpart_routing_number": counterpart_routing_number, "line_items": line_items, "line_items_raw": line_items_raw }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of OcrResponseInvoiceReceiptData
    #
    # @param json_object [String] 
    # @return [Monite::OcrResponseInvoiceReceiptData]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      type = parsed_json["type"]
      total = parsed_json["total"]
      total_paid_amount_raw = parsed_json["total_paid_amount_raw"]
      total_raw = parsed_json["total_raw"]
      total_excl_vat = parsed_json["total_excl_vat"]
      total_excl_vat_raw = parsed_json["total_excl_vat_raw"]
      total_vat_amount = parsed_json["total_vat_amount"]
      total_vat_amount_raw = parsed_json["total_vat_amount_raw"]
      total_vat_rate = parsed_json["total_vat_rate"]
      total_vat_rate_raw = parsed_json["total_vat_rate_raw"]
      currency = parsed_json["currency"]
      purchase_order_number = parsed_json["purchase_order_number"]
      counterpart_name = parsed_json["counterpart_name"]
      counterpart_address = parsed_json["counterpart_address"]
      counterpart_account_id = parsed_json["counterpart_account_id"]
      document_id = parsed_json["document_id"]
      payment_terms_raw = parsed_json["payment_terms_raw"]
      tax_payer_id = parsed_json["tax_payer_id"]
      counterpart_vat_id = parsed_json["counterpart_vat_id"]
      document_issued_at_date = parsed_json["document_issued_at_date"]
      document_due_date = parsed_json["document_due_date"]
      unless parsed_json["counterpart_address_object"].nil?
        counterpart_address_object = parsed_json["counterpart_address_object"].to_json
        counterpart_address_object = Monite::OcrAddress.from_json(json_object: counterpart_address_object)
      else
        counterpart_address_object = nil
      end
      counterpart_account_number = parsed_json["counterpart_account_number"]
      counterpart_routing_number = parsed_json["counterpart_routing_number"]
      line_items = parsed_json["line_items"]&.map do | item |
  item = item.to_json
  Monite::OcrResponseInvoiceReceiptLineItem.from_json(json_object: item)
end
      line_items_raw = parsed_json["line_items_raw"]&.map do | item |
  item = item.to_json
  Monite::OcrResponseInvoiceReceiptLineItemRaw.from_json(json_object: item)
end
      new(
        type: type,
        total: total,
        total_paid_amount_raw: total_paid_amount_raw,
        total_raw: total_raw,
        total_excl_vat: total_excl_vat,
        total_excl_vat_raw: total_excl_vat_raw,
        total_vat_amount: total_vat_amount,
        total_vat_amount_raw: total_vat_amount_raw,
        total_vat_rate: total_vat_rate,
        total_vat_rate_raw: total_vat_rate_raw,
        currency: currency,
        purchase_order_number: purchase_order_number,
        counterpart_name: counterpart_name,
        counterpart_address: counterpart_address,
        counterpart_account_id: counterpart_account_id,
        document_id: document_id,
        payment_terms_raw: payment_terms_raw,
        tax_payer_id: tax_payer_id,
        counterpart_vat_id: counterpart_vat_id,
        document_issued_at_date: document_issued_at_date,
        document_due_date: document_due_date,
        counterpart_address_object: counterpart_address_object,
        counterpart_account_number: counterpart_account_number,
        counterpart_routing_number: counterpart_routing_number,
        line_items: line_items,
        line_items_raw: line_items_raw,
        additional_properties: struct
      )
    end
# Serialize an instance of OcrResponseInvoiceReceiptData to a JSON object
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
      obj.type&.is_a?(String) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
      obj.total&.is_a?(Integer) != false || raise("Passed value for field obj.total is not the expected type, validation failed.")
      obj.total_paid_amount_raw&.is_a?(Float) != false || raise("Passed value for field obj.total_paid_amount_raw is not the expected type, validation failed.")
      obj.total_raw&.is_a?(Float) != false || raise("Passed value for field obj.total_raw is not the expected type, validation failed.")
      obj.total_excl_vat&.is_a?(Integer) != false || raise("Passed value for field obj.total_excl_vat is not the expected type, validation failed.")
      obj.total_excl_vat_raw&.is_a?(Float) != false || raise("Passed value for field obj.total_excl_vat_raw is not the expected type, validation failed.")
      obj.total_vat_amount&.is_a?(Integer) != false || raise("Passed value for field obj.total_vat_amount is not the expected type, validation failed.")
      obj.total_vat_amount_raw&.is_a?(Float) != false || raise("Passed value for field obj.total_vat_amount_raw is not the expected type, validation failed.")
      obj.total_vat_rate&.is_a?(Integer) != false || raise("Passed value for field obj.total_vat_rate is not the expected type, validation failed.")
      obj.total_vat_rate_raw&.is_a?(Float) != false || raise("Passed value for field obj.total_vat_rate_raw is not the expected type, validation failed.")
      obj.currency&.is_a?(String) != false || raise("Passed value for field obj.currency is not the expected type, validation failed.")
      obj.purchase_order_number&.is_a?(String) != false || raise("Passed value for field obj.purchase_order_number is not the expected type, validation failed.")
      obj.counterpart_name&.is_a?(String) != false || raise("Passed value for field obj.counterpart_name is not the expected type, validation failed.")
      obj.counterpart_address&.is_a?(String) != false || raise("Passed value for field obj.counterpart_address is not the expected type, validation failed.")
      obj.counterpart_account_id&.is_a?(String) != false || raise("Passed value for field obj.counterpart_account_id is not the expected type, validation failed.")
      obj.document_id&.is_a?(String) != false || raise("Passed value for field obj.document_id is not the expected type, validation failed.")
      obj.payment_terms_raw&.is_a?(Array) != false || raise("Passed value for field obj.payment_terms_raw is not the expected type, validation failed.")
      obj.tax_payer_id&.is_a?(String) != false || raise("Passed value for field obj.tax_payer_id is not the expected type, validation failed.")
      obj.counterpart_vat_id&.is_a?(String) != false || raise("Passed value for field obj.counterpart_vat_id is not the expected type, validation failed.")
      obj.document_issued_at_date&.is_a?(String) != false || raise("Passed value for field obj.document_issued_at_date is not the expected type, validation failed.")
      obj.document_due_date&.is_a?(String) != false || raise("Passed value for field obj.document_due_date is not the expected type, validation failed.")
      obj.counterpart_address_object.nil? || Monite::OcrAddress.validate_raw(obj: obj.counterpart_address_object)
      obj.counterpart_account_number&.is_a?(String) != false || raise("Passed value for field obj.counterpart_account_number is not the expected type, validation failed.")
      obj.counterpart_routing_number&.is_a?(String) != false || raise("Passed value for field obj.counterpart_routing_number is not the expected type, validation failed.")
      obj.line_items&.is_a?(Array) != false || raise("Passed value for field obj.line_items is not the expected type, validation failed.")
      obj.line_items_raw&.is_a?(Array) != false || raise("Passed value for field obj.line_items_raw is not the expected type, validation failed.")
    end
  end
end