# frozen_string_literal: true
require_relative "accounting_customer_ref_object"
require_relative "accounting_receivable_due_date"
require_relative "accounting_line_item"
require "ostruct"
require "json"

module Monite
# Invoice details retrieved from an accounting system.
  class AccountingReceivable
  # @return [String] An internal identifier of the invoice in the accounting system.
    attr_reader :id
  # @return [String] ISO-4217 currency code of the invoice.
    attr_reader :currency
  # @return [Float] Rate to convert the total amount of the transaction into the entity's base
#  currency at the time of the transaction.
    attr_reader :currency_rate
  # @return [Monite::AccountingCustomerRefObject] Information about the customer that the invoice was sent to.
    attr_reader :customer_ref
  # @return [Monite::AccountingReceivableDueDate] Invoice due date.
    attr_reader :due_date
  # @return [String] Invoice document number.
    attr_reader :invoice_number
  # @return [Array<Monite::AccountingLineItem>] 
    attr_reader :lines
  # @return [String] Any additional information or business notes about the invoice.
    attr_reader :memo
  # @return [Hash{String => Object}] An object containing additional invoice data returned by the accounting system.
#  This sometimes includes custom invoice fields.
    attr_reader :pass_through
  # @return [String] Date when the invoice was added to the accounting service. This may differ from
#  the invoice creation date.
    attr_reader :posted_date
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] An internal identifier of the invoice in the accounting system.
    # @param currency [String] ISO-4217 currency code of the invoice.
    # @param currency_rate [Float] Rate to convert the total amount of the transaction into the entity's base
#  currency at the time of the transaction.
    # @param customer_ref [Monite::AccountingCustomerRefObject] Information about the customer that the invoice was sent to.
    # @param due_date [Monite::AccountingReceivableDueDate] Invoice due date.
    # @param invoice_number [String] Invoice document number.
    # @param lines [Array<Monite::AccountingLineItem>] 
    # @param memo [String] Any additional information or business notes about the invoice.
    # @param pass_through [Hash{String => Object}] An object containing additional invoice data returned by the accounting system.
#  This sometimes includes custom invoice fields.
    # @param posted_date [String] Date when the invoice was added to the accounting service. This may differ from
#  the invoice creation date.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::AccountingReceivable]
    def initialize(id: OMIT, currency: OMIT, currency_rate: OMIT, customer_ref: OMIT, due_date: OMIT, invoice_number: OMIT, lines: OMIT, memo: OMIT, pass_through: OMIT, posted_date: OMIT, additional_properties: nil)
      @id = id if id != OMIT
      @currency = currency if currency != OMIT
      @currency_rate = currency_rate if currency_rate != OMIT
      @customer_ref = customer_ref if customer_ref != OMIT
      @due_date = due_date if due_date != OMIT
      @invoice_number = invoice_number if invoice_number != OMIT
      @lines = lines if lines != OMIT
      @memo = memo if memo != OMIT
      @pass_through = pass_through if pass_through != OMIT
      @posted_date = posted_date if posted_date != OMIT
      @additional_properties = additional_properties
      @_field_set = { "id": id, "currency": currency, "currency_rate": currency_rate, "customer_ref": customer_ref, "due_date": due_date, "invoice_number": invoice_number, "lines": lines, "memo": memo, "pass_through": pass_through, "posted_date": posted_date }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of AccountingReceivable
    #
    # @param json_object [String] 
    # @return [Monite::AccountingReceivable]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      currency = parsed_json["currency"]
      currency_rate = parsed_json["currency_rate"]
      unless parsed_json["customer_ref"].nil?
        customer_ref = parsed_json["customer_ref"].to_json
        customer_ref = Monite::AccountingCustomerRefObject.from_json(json_object: customer_ref)
      else
        customer_ref = nil
      end
      unless parsed_json["due_date"].nil?
        due_date = parsed_json["due_date"].to_json
        due_date = Monite::AccountingReceivableDueDate.from_json(json_object: due_date)
      else
        due_date = nil
      end
      invoice_number = parsed_json["invoice_number"]
      lines = parsed_json["lines"]&.map do | item |
  item = item.to_json
  Monite::AccountingLineItem.from_json(json_object: item)
end
      memo = parsed_json["memo"]
      pass_through = parsed_json["pass_through"]
      posted_date = parsed_json["posted_date"]
      new(
        id: id,
        currency: currency,
        currency_rate: currency_rate,
        customer_ref: customer_ref,
        due_date: due_date,
        invoice_number: invoice_number,
        lines: lines,
        memo: memo,
        pass_through: pass_through,
        posted_date: posted_date,
        additional_properties: struct
      )
    end
# Serialize an instance of AccountingReceivable to a JSON object
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
      obj.id&.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
      obj.currency&.is_a?(String) != false || raise("Passed value for field obj.currency is not the expected type, validation failed.")
      obj.currency_rate&.is_a?(Float) != false || raise("Passed value for field obj.currency_rate is not the expected type, validation failed.")
      obj.customer_ref.nil? || Monite::AccountingCustomerRefObject.validate_raw(obj: obj.customer_ref)
      obj.due_date.nil? || Monite::AccountingReceivableDueDate.validate_raw(obj: obj.due_date)
      obj.invoice_number&.is_a?(String) != false || raise("Passed value for field obj.invoice_number is not the expected type, validation failed.")
      obj.lines&.is_a?(Array) != false || raise("Passed value for field obj.lines is not the expected type, validation failed.")
      obj.memo&.is_a?(String) != false || raise("Passed value for field obj.memo is not the expected type, validation failed.")
      obj.pass_through&.is_a?(Hash) != false || raise("Passed value for field obj.pass_through is not the expected type, validation failed.")
      obj.posted_date&.is_a?(String) != false || raise("Passed value for field obj.posted_date is not the expected type, validation failed.")
    end
  end
end