# frozen_string_literal: true
require_relative "financing_invoice_type"
require_relative "wc_invoice_status"
require_relative "currency_enum"
require_relative "repayment_schedule"
require "ostruct"
require "json"

module Monite
  class FinancingInvoice
  # @return [Monite::FinancingInvoiceType] The type of the invoice i.e. receivable or payable.
    attr_reader :type
  # @return [Monite::WcInvoiceStatus] Status of the invoice.
    attr_reader :status
  # @return [String] Monite invoice ID.
    attr_reader :invoice_id
  # @return [String] Monite document ID.
    attr_reader :document_id
  # @return [String] Monite invoice due date.
    attr_reader :due_date
  # @return [String] Monite invoice issue date.
    attr_reader :issue_date
  # @return [Integer] Total amount of the invoice in minor units.
    attr_reader :total_amount
  # @return [Monite::CurrencyEnum] Currency code.
    attr_reader :currency
  # @return [String] Description of the invoice.
    attr_reader :description
  # @return [String] Payer type. BUSINESS or INDIVIDUAL
    attr_reader :payer_type
  # @return [String] Payer business name. Only applicable for BUSINESS payer type.
    attr_reader :payer_business_name
  # @return [String] Payer first name. Only applicable for INDIVIDUAL payer type.
    attr_reader :payer_first_name
  # @return [String] Payer last name. Only applicable for INDIVIDUAL payer type.
    attr_reader :payer_last_name
  # @return [Monite::RepaymentSchedule] Repayment schedule of the invoice.
    attr_reader :repayment_schedule
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param type [Monite::FinancingInvoiceType] The type of the invoice i.e. receivable or payable.
    # @param status [Monite::WcInvoiceStatus] Status of the invoice.
    # @param invoice_id [String] Monite invoice ID.
    # @param document_id [String] Monite document ID.
    # @param due_date [String] Monite invoice due date.
    # @param issue_date [String] Monite invoice issue date.
    # @param total_amount [Integer] Total amount of the invoice in minor units.
    # @param currency [Monite::CurrencyEnum] Currency code.
    # @param description [String] Description of the invoice.
    # @param payer_type [String] Payer type. BUSINESS or INDIVIDUAL
    # @param payer_business_name [String] Payer business name. Only applicable for BUSINESS payer type.
    # @param payer_first_name [String] Payer first name. Only applicable for INDIVIDUAL payer type.
    # @param payer_last_name [String] Payer last name. Only applicable for INDIVIDUAL payer type.
    # @param repayment_schedule [Monite::RepaymentSchedule] Repayment schedule of the invoice.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::FinancingInvoice]
    def initialize(type:, status:, invoice_id:, document_id:, due_date:, issue_date:, total_amount:, currency:, description: OMIT, payer_type:, payer_business_name: OMIT, payer_first_name: OMIT, payer_last_name: OMIT, repayment_schedule: OMIT, additional_properties: nil)
      @type = type
      @status = status
      @invoice_id = invoice_id
      @document_id = document_id
      @due_date = due_date
      @issue_date = issue_date
      @total_amount = total_amount
      @currency = currency
      @description = description if description != OMIT
      @payer_type = payer_type
      @payer_business_name = payer_business_name if payer_business_name != OMIT
      @payer_first_name = payer_first_name if payer_first_name != OMIT
      @payer_last_name = payer_last_name if payer_last_name != OMIT
      @repayment_schedule = repayment_schedule if repayment_schedule != OMIT
      @additional_properties = additional_properties
      @_field_set = { "type": type, "status": status, "invoice_id": invoice_id, "document_id": document_id, "due_date": due_date, "issue_date": issue_date, "total_amount": total_amount, "currency": currency, "description": description, "payer_type": payer_type, "payer_business_name": payer_business_name, "payer_first_name": payer_first_name, "payer_last_name": payer_last_name, "repayment_schedule": repayment_schedule }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of FinancingInvoice
    #
    # @param json_object [String] 
    # @return [Monite::FinancingInvoice]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      type = parsed_json["type"]
      status = parsed_json["status"]
      invoice_id = parsed_json["invoice_id"]
      document_id = parsed_json["document_id"]
      due_date = parsed_json["due_date"]
      issue_date = parsed_json["issue_date"]
      total_amount = parsed_json["total_amount"]
      currency = parsed_json["currency"]
      description = parsed_json["description"]
      payer_type = parsed_json["payer_type"]
      payer_business_name = parsed_json["payer_business_name"]
      payer_first_name = parsed_json["payer_first_name"]
      payer_last_name = parsed_json["payer_last_name"]
      unless parsed_json["repayment_schedule"].nil?
        repayment_schedule = parsed_json["repayment_schedule"].to_json
        repayment_schedule = Monite::RepaymentSchedule.from_json(json_object: repayment_schedule)
      else
        repayment_schedule = nil
      end
      new(
        type: type,
        status: status,
        invoice_id: invoice_id,
        document_id: document_id,
        due_date: due_date,
        issue_date: issue_date,
        total_amount: total_amount,
        currency: currency,
        description: description,
        payer_type: payer_type,
        payer_business_name: payer_business_name,
        payer_first_name: payer_first_name,
        payer_last_name: payer_last_name,
        repayment_schedule: repayment_schedule,
        additional_properties: struct
      )
    end
# Serialize an instance of FinancingInvoice to a JSON object
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
      obj.type.is_a?(Monite::FinancingInvoiceType) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
      obj.status.is_a?(Monite::WcInvoiceStatus) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
      obj.invoice_id.is_a?(String) != false || raise("Passed value for field obj.invoice_id is not the expected type, validation failed.")
      obj.document_id.is_a?(String) != false || raise("Passed value for field obj.document_id is not the expected type, validation failed.")
      obj.due_date.is_a?(String) != false || raise("Passed value for field obj.due_date is not the expected type, validation failed.")
      obj.issue_date.is_a?(String) != false || raise("Passed value for field obj.issue_date is not the expected type, validation failed.")
      obj.total_amount.is_a?(Integer) != false || raise("Passed value for field obj.total_amount is not the expected type, validation failed.")
      obj.currency.is_a?(Monite::CurrencyEnum) != false || raise("Passed value for field obj.currency is not the expected type, validation failed.")
      obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
      obj.payer_type.is_a?(String) != false || raise("Passed value for field obj.payer_type is not the expected type, validation failed.")
      obj.payer_business_name&.is_a?(String) != false || raise("Passed value for field obj.payer_business_name is not the expected type, validation failed.")
      obj.payer_first_name&.is_a?(String) != false || raise("Passed value for field obj.payer_first_name is not the expected type, validation failed.")
      obj.payer_last_name&.is_a?(String) != false || raise("Passed value for field obj.payer_last_name is not the expected type, validation failed.")
      obj.repayment_schedule.nil? || Monite::RepaymentSchedule.validate_raw(obj: obj.repayment_schedule)
    end
  end
end