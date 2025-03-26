# frozen_string_literal: true
require_relative "accounting_payable_due_date"
require_relative "accounting_line_item"
require_relative "accounting_purchase_order_ref"
require_relative "accounting_vendor_ref_object"
require "ostruct"
require "json"

module Monite
# Details of an accounts payable invoice (bill) retrieved from an accounting
#  system.
  class AccountingPayable
  # @return [String] An internal identifier of the payable in the accounting system.
    attr_reader :id
  # @return [Float] Remaining amount to be paid.
    attr_reader :amount_due
  # @return [String] ISO-4217 currency code of the payable.
    attr_reader :currency
  # @return [Float] Rate to convert the total amount of the transaction into the entity's base
#  currency at the time of the transaction.
    attr_reader :currency_rate
  # @return [Monite::AccountingPayableDueDate] The payable's due date.
    attr_reader :due_date
  # @return [String] Invoice number of the payable.
    attr_reader :invoice_number
  # @return [Array<Monite::AccountingLineItem>] 
    attr_reader :lines
  # @return [String] Any additional information or business notes about the payable.
    attr_reader :memo
  # @return [String] Date when the payable was added to the accounting service. This may differ from
#  the payable creation date.
    attr_reader :posted_date
  # @return [Array<Monite::AccountingPurchaseOrderRef>] A list of purchase orders linked to the payable, if any.
    attr_reader :purchase_order_refs
  # @return [String] The status of the payable in the accounting system. Possible values: `open`,
#  `draft`, `partially_paid`, `paid`, `unknown`, `void`.
    attr_reader :status
  # @return [Float] Amount payable, including discounts but excluding VAT/taxes.
    attr_reader :subtotal
  # @return [Float] Total VAT or tax amount.
    attr_reader :tax_amount
  # @return [Float] The total amount payable, including discounts and VAT/taxes.
    attr_reader :total_amount
  # @return [Monite::AccountingVendorRefObject] Information about the vendor from whom the payable was received.
    attr_reader :vendor_ref
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] An internal identifier of the payable in the accounting system.
    # @param amount_due [Float] Remaining amount to be paid.
    # @param currency [String] ISO-4217 currency code of the payable.
    # @param currency_rate [Float] Rate to convert the total amount of the transaction into the entity's base
#  currency at the time of the transaction.
    # @param due_date [Monite::AccountingPayableDueDate] The payable's due date.
    # @param invoice_number [String] Invoice number of the payable.
    # @param lines [Array<Monite::AccountingLineItem>] 
    # @param memo [String] Any additional information or business notes about the payable.
    # @param posted_date [String] Date when the payable was added to the accounting service. This may differ from
#  the payable creation date.
    # @param purchase_order_refs [Array<Monite::AccountingPurchaseOrderRef>] A list of purchase orders linked to the payable, if any.
    # @param status [String] The status of the payable in the accounting system. Possible values: `open`,
#  `draft`, `partially_paid`, `paid`, `unknown`, `void`.
    # @param subtotal [Float] Amount payable, including discounts but excluding VAT/taxes.
    # @param tax_amount [Float] Total VAT or tax amount.
    # @param total_amount [Float] The total amount payable, including discounts and VAT/taxes.
    # @param vendor_ref [Monite::AccountingVendorRefObject] Information about the vendor from whom the payable was received.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::AccountingPayable]
    def initialize(id:, amount_due: OMIT, currency: OMIT, currency_rate: OMIT, due_date: OMIT, invoice_number: OMIT, lines: OMIT, memo: OMIT, posted_date: OMIT, purchase_order_refs: OMIT, status:, subtotal: OMIT, tax_amount: OMIT, total_amount:, vendor_ref: OMIT, additional_properties: nil)
      @id = id
      @amount_due = amount_due if amount_due != OMIT
      @currency = currency if currency != OMIT
      @currency_rate = currency_rate if currency_rate != OMIT
      @due_date = due_date if due_date != OMIT
      @invoice_number = invoice_number if invoice_number != OMIT
      @lines = lines if lines != OMIT
      @memo = memo if memo != OMIT
      @posted_date = posted_date if posted_date != OMIT
      @purchase_order_refs = purchase_order_refs if purchase_order_refs != OMIT
      @status = status
      @subtotal = subtotal if subtotal != OMIT
      @tax_amount = tax_amount if tax_amount != OMIT
      @total_amount = total_amount
      @vendor_ref = vendor_ref if vendor_ref != OMIT
      @additional_properties = additional_properties
      @_field_set = { "id": id, "amount_due": amount_due, "currency": currency, "currency_rate": currency_rate, "due_date": due_date, "invoice_number": invoice_number, "lines": lines, "memo": memo, "posted_date": posted_date, "purchase_order_refs": purchase_order_refs, "status": status, "subtotal": subtotal, "tax_amount": tax_amount, "total_amount": total_amount, "vendor_ref": vendor_ref }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of AccountingPayable
    #
    # @param json_object [String] 
    # @return [Monite::AccountingPayable]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      amount_due = parsed_json["amount_due"]
      currency = parsed_json["currency"]
      currency_rate = parsed_json["currency_rate"]
      unless parsed_json["due_date"].nil?
        due_date = parsed_json["due_date"].to_json
        due_date = Monite::AccountingPayableDueDate.from_json(json_object: due_date)
      else
        due_date = nil
      end
      invoice_number = parsed_json["invoice_number"]
      lines = parsed_json["lines"]&.map do | item |
  item = item.to_json
  Monite::AccountingLineItem.from_json(json_object: item)
end
      memo = parsed_json["memo"]
      posted_date = parsed_json["posted_date"]
      purchase_order_refs = parsed_json["purchase_order_refs"]&.map do | item |
  item = item.to_json
  Monite::AccountingPurchaseOrderRef.from_json(json_object: item)
end
      status = parsed_json["status"]
      subtotal = parsed_json["subtotal"]
      tax_amount = parsed_json["tax_amount"]
      total_amount = parsed_json["total_amount"]
      unless parsed_json["vendor_ref"].nil?
        vendor_ref = parsed_json["vendor_ref"].to_json
        vendor_ref = Monite::AccountingVendorRefObject.from_json(json_object: vendor_ref)
      else
        vendor_ref = nil
      end
      new(
        id: id,
        amount_due: amount_due,
        currency: currency,
        currency_rate: currency_rate,
        due_date: due_date,
        invoice_number: invoice_number,
        lines: lines,
        memo: memo,
        posted_date: posted_date,
        purchase_order_refs: purchase_order_refs,
        status: status,
        subtotal: subtotal,
        tax_amount: tax_amount,
        total_amount: total_amount,
        vendor_ref: vendor_ref,
        additional_properties: struct
      )
    end
# Serialize an instance of AccountingPayable to a JSON object
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
      obj.amount_due&.is_a?(Float) != false || raise("Passed value for field obj.amount_due is not the expected type, validation failed.")
      obj.currency&.is_a?(String) != false || raise("Passed value for field obj.currency is not the expected type, validation failed.")
      obj.currency_rate&.is_a?(Float) != false || raise("Passed value for field obj.currency_rate is not the expected type, validation failed.")
      obj.due_date.nil? || Monite::AccountingPayableDueDate.validate_raw(obj: obj.due_date)
      obj.invoice_number&.is_a?(String) != false || raise("Passed value for field obj.invoice_number is not the expected type, validation failed.")
      obj.lines&.is_a?(Array) != false || raise("Passed value for field obj.lines is not the expected type, validation failed.")
      obj.memo&.is_a?(String) != false || raise("Passed value for field obj.memo is not the expected type, validation failed.")
      obj.posted_date&.is_a?(String) != false || raise("Passed value for field obj.posted_date is not the expected type, validation failed.")
      obj.purchase_order_refs&.is_a?(Array) != false || raise("Passed value for field obj.purchase_order_refs is not the expected type, validation failed.")
      obj.status.is_a?(String) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
      obj.subtotal&.is_a?(Float) != false || raise("Passed value for field obj.subtotal is not the expected type, validation failed.")
      obj.tax_amount&.is_a?(Float) != false || raise("Passed value for field obj.tax_amount is not the expected type, validation failed.")
      obj.total_amount.is_a?(Float) != false || raise("Passed value for field obj.total_amount is not the expected type, validation failed.")
      obj.vendor_ref.nil? || Monite::AccountingVendorRefObject.validate_raw(obj: obj.vendor_ref)
    end
  end
end