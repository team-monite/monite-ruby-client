# frozen_string_literal: true
require_relative "currency_enum"
require_relative "discount"
require_relative "receivable_entity_base"
require_relative "line_item"
require_relative "vat_mode_enum"
require "ostruct"
require "json"

module Monite
  class ReceivableFacadeCreateInvoicePayload
  # @return [String] 
    attr_reader :commercial_condition_description
  # @return [String] Address of invoicing, need to state as a separate fields for some countries if
#  it differs from address of a company.
    attr_reader :counterpart_billing_address_id
  # @return [String] Different types of companies for different countries, ex. GmbH, SAS, SNC, etc.
    attr_reader :counterpart_business_type
  # @return [String] 
    attr_reader :counterpart_id
  # @return [String] Address where goods were shipped / where services were provided.
    attr_reader :counterpart_shipping_address_id
  # @return [String] Counterpart VAT ID id
    attr_reader :counterpart_vat_id_id
  # @return [Monite::CurrencyEnum] 
    attr_reader :currency
  # @return [Integer] The amount of tax deducted in minor units
    attr_reader :deduction_amount
  # @return [String] A note with additional information about a tax deduction
    attr_reader :deduction_memo
  # @return [Monite::Discount] The discount for a receivable.
    attr_reader :discount
  # @return [String] The document number of the receivable, which will appear in the PDF document.
#  Can be set manually only in the [non-compliant
#  //docs.monite.com/accounts-receivable/regulatory-compliance/invoice-compliance).
#  Otherwise (or if omitted), it will be generated automatically based on the
#  entity's [document number
#  customization](https://docs.monite.com/advanced/document-number-customization)
#  settings when the document is issued.
    attr_reader :document_id
  # @return [Monite::ReceivableEntityBase] 
    attr_reader :entity
  # @return [String] Entity bank account ID
    attr_reader :entity_bank_account_id
  # @return [String] Entity VAT ID id
    attr_reader :entity_vat_id_id
  # @return [String] The date when the goods are shipped or the service is provided. Can be a
#  current, past, or future date.
#  If omitted or `null`, defaults to the invoice issue date and the value is
#  automatically set when the invoice is moved to the `issued` status.
    attr_reader :fulfillment_date
  # @return [Array<Monite::LineItem>] 
    attr_reader :line_items
  # @return [String] A note with additional information for a receivable
    attr_reader :memo
  # @return [String] 
    attr_reader :overdue_reminder_id
  # @return [Hash{String => Object}] Metadata for partner needs
    attr_reader :partner_metadata
  # @return [String] Link to the invoice's payment page. Either Monite's payment links or your custom
#  payment links.
    attr_reader :payment_page_url
  # @return [String] 
    attr_reader :payment_reminder_id
  # @return [String] 
    attr_reader :payment_terms_id
  # @return [String] A project related to current receivable
    attr_reader :project_id
  # @return [String] Contain purchase order number.
    attr_reader :purchase_order
  # @return [Array<String>] A list of IDs of user-defined tags (labels) assigned to this receivable.
    attr_reader :tag_ids
  # @return [String] Trade name of the entity
    attr_reader :trade_name
  # @return [String] The type of the document uploaded.
    attr_reader :type
  # @return [Boolean] Indicates whether the goods, materials, or services listed in the receivable are
#  exempt from VAT or not.
    attr_reader :vat_exempt
  # @return [String] The reason for the VAT exemption, if applicable.
    attr_reader :vat_exemption_rationale
  # @return [Monite::VatModeEnum] Defines whether the prices of products in receivable will already include VAT or
#  not.
    attr_reader :vat_mode
  # @return [Integer] The amount of tax withheld in percent minor units
    attr_reader :withholding_tax_rate
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param commercial_condition_description [String] 
    # @param counterpart_billing_address_id [String] Address of invoicing, need to state as a separate fields for some countries if
#  it differs from address of a company.
    # @param counterpart_business_type [String] Different types of companies for different countries, ex. GmbH, SAS, SNC, etc.
    # @param counterpart_id [String] 
    # @param counterpart_shipping_address_id [String] Address where goods were shipped / where services were provided.
    # @param counterpart_vat_id_id [String] Counterpart VAT ID id
    # @param currency [Monite::CurrencyEnum] 
    # @param deduction_amount [Integer] The amount of tax deducted in minor units
    # @param deduction_memo [String] A note with additional information about a tax deduction
    # @param discount [Monite::Discount] The discount for a receivable.
    # @param document_id [String] The document number of the receivable, which will appear in the PDF document.
#  Can be set manually only in the [non-compliant
#  //docs.monite.com/accounts-receivable/regulatory-compliance/invoice-compliance).
#  Otherwise (or if omitted), it will be generated automatically based on the
#  entity's [document number
#  customization](https://docs.monite.com/advanced/document-number-customization)
#  settings when the document is issued.
    # @param entity [Monite::ReceivableEntityBase] 
    # @param entity_bank_account_id [String] Entity bank account ID
    # @param entity_vat_id_id [String] Entity VAT ID id
    # @param fulfillment_date [String] The date when the goods are shipped or the service is provided. Can be a
#  current, past, or future date.
#  If omitted or `null`, defaults to the invoice issue date and the value is
#  automatically set when the invoice is moved to the `issued` status.
    # @param line_items [Array<Monite::LineItem>] 
    # @param memo [String] A note with additional information for a receivable
    # @param overdue_reminder_id [String] 
    # @param partner_metadata [Hash{String => Object}] Metadata for partner needs
    # @param payment_page_url [String] Link to the invoice's payment page. Either Monite's payment links or your custom
#  payment links.
    # @param payment_reminder_id [String] 
    # @param payment_terms_id [String] 
    # @param project_id [String] A project related to current receivable
    # @param purchase_order [String] Contain purchase order number.
    # @param tag_ids [Array<String>] A list of IDs of user-defined tags (labels) assigned to this receivable.
    # @param trade_name [String] Trade name of the entity
    # @param type [String] The type of the document uploaded.
    # @param vat_exempt [Boolean] Indicates whether the goods, materials, or services listed in the receivable are
#  exempt from VAT or not.
    # @param vat_exemption_rationale [String] The reason for the VAT exemption, if applicable.
    # @param vat_mode [Monite::VatModeEnum] Defines whether the prices of products in receivable will already include VAT or
#  not.
    # @param withholding_tax_rate [Integer] The amount of tax withheld in percent minor units
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::ReceivableFacadeCreateInvoicePayload]
    def initialize(commercial_condition_description: OMIT, counterpart_billing_address_id:, counterpart_business_type: OMIT, counterpart_id:, counterpart_shipping_address_id: OMIT, counterpart_vat_id_id: OMIT, currency:, deduction_amount: OMIT, deduction_memo: OMIT, discount: OMIT, document_id: OMIT, entity: OMIT, entity_bank_account_id: OMIT, entity_vat_id_id: OMIT, fulfillment_date: OMIT, line_items:, memo: OMIT, overdue_reminder_id: OMIT, partner_metadata: OMIT, payment_page_url: OMIT, payment_reminder_id: OMIT, payment_terms_id: OMIT, project_id: OMIT, purchase_order: OMIT, tag_ids: OMIT, trade_name: OMIT, type:, vat_exempt: OMIT, vat_exemption_rationale: OMIT, vat_mode: OMIT, withholding_tax_rate: OMIT, additional_properties: nil)
      @commercial_condition_description = commercial_condition_description if commercial_condition_description != OMIT
      @counterpart_billing_address_id = counterpart_billing_address_id
      @counterpart_business_type = counterpart_business_type if counterpart_business_type != OMIT
      @counterpart_id = counterpart_id
      @counterpart_shipping_address_id = counterpart_shipping_address_id if counterpart_shipping_address_id != OMIT
      @counterpart_vat_id_id = counterpart_vat_id_id if counterpart_vat_id_id != OMIT
      @currency = currency
      @deduction_amount = deduction_amount if deduction_amount != OMIT
      @deduction_memo = deduction_memo if deduction_memo != OMIT
      @discount = discount if discount != OMIT
      @document_id = document_id if document_id != OMIT
      @entity = entity if entity != OMIT
      @entity_bank_account_id = entity_bank_account_id if entity_bank_account_id != OMIT
      @entity_vat_id_id = entity_vat_id_id if entity_vat_id_id != OMIT
      @fulfillment_date = fulfillment_date if fulfillment_date != OMIT
      @line_items = line_items
      @memo = memo if memo != OMIT
      @overdue_reminder_id = overdue_reminder_id if overdue_reminder_id != OMIT
      @partner_metadata = partner_metadata if partner_metadata != OMIT
      @payment_page_url = payment_page_url if payment_page_url != OMIT
      @payment_reminder_id = payment_reminder_id if payment_reminder_id != OMIT
      @payment_terms_id = payment_terms_id if payment_terms_id != OMIT
      @project_id = project_id if project_id != OMIT
      @purchase_order = purchase_order if purchase_order != OMIT
      @tag_ids = tag_ids if tag_ids != OMIT
      @trade_name = trade_name if trade_name != OMIT
      @type = type
      @vat_exempt = vat_exempt if vat_exempt != OMIT
      @vat_exemption_rationale = vat_exemption_rationale if vat_exemption_rationale != OMIT
      @vat_mode = vat_mode if vat_mode != OMIT
      @withholding_tax_rate = withholding_tax_rate if withholding_tax_rate != OMIT
      @additional_properties = additional_properties
      @_field_set = { "commercial_condition_description": commercial_condition_description, "counterpart_billing_address_id": counterpart_billing_address_id, "counterpart_business_type": counterpart_business_type, "counterpart_id": counterpart_id, "counterpart_shipping_address_id": counterpart_shipping_address_id, "counterpart_vat_id_id": counterpart_vat_id_id, "currency": currency, "deduction_amount": deduction_amount, "deduction_memo": deduction_memo, "discount": discount, "document_id": document_id, "entity": entity, "entity_bank_account_id": entity_bank_account_id, "entity_vat_id_id": entity_vat_id_id, "fulfillment_date": fulfillment_date, "line_items": line_items, "memo": memo, "overdue_reminder_id": overdue_reminder_id, "partner_metadata": partner_metadata, "payment_page_url": payment_page_url, "payment_reminder_id": payment_reminder_id, "payment_terms_id": payment_terms_id, "project_id": project_id, "purchase_order": purchase_order, "tag_ids": tag_ids, "trade_name": trade_name, "type": type, "vat_exempt": vat_exempt, "vat_exemption_rationale": vat_exemption_rationale, "vat_mode": vat_mode, "withholding_tax_rate": withholding_tax_rate }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of ReceivableFacadeCreateInvoicePayload
    #
    # @param json_object [String] 
    # @return [Monite::ReceivableFacadeCreateInvoicePayload]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      commercial_condition_description = parsed_json["commercial_condition_description"]
      counterpart_billing_address_id = parsed_json["counterpart_billing_address_id"]
      counterpart_business_type = parsed_json["counterpart_business_type"]
      counterpart_id = parsed_json["counterpart_id"]
      counterpart_shipping_address_id = parsed_json["counterpart_shipping_address_id"]
      counterpart_vat_id_id = parsed_json["counterpart_vat_id_id"]
      currency = parsed_json["currency"]
      deduction_amount = parsed_json["deduction_amount"]
      deduction_memo = parsed_json["deduction_memo"]
      unless parsed_json["discount"].nil?
        discount = parsed_json["discount"].to_json
        discount = Monite::Discount.from_json(json_object: discount)
      else
        discount = nil
      end
      document_id = parsed_json["document_id"]
      unless parsed_json["entity"].nil?
        entity = parsed_json["entity"].to_json
        entity = Monite::ReceivableEntityBase.from_json(json_object: entity)
      else
        entity = nil
      end
      entity_bank_account_id = parsed_json["entity_bank_account_id"]
      entity_vat_id_id = parsed_json["entity_vat_id_id"]
      fulfillment_date = parsed_json["fulfillment_date"]
      line_items = parsed_json["line_items"]&.map do | item |
  item = item.to_json
  Monite::LineItem.from_json(json_object: item)
end
      memo = parsed_json["memo"]
      overdue_reminder_id = parsed_json["overdue_reminder_id"]
      partner_metadata = parsed_json["partner_metadata"]
      payment_page_url = parsed_json["payment_page_url"]
      payment_reminder_id = parsed_json["payment_reminder_id"]
      payment_terms_id = parsed_json["payment_terms_id"]
      project_id = parsed_json["project_id"]
      purchase_order = parsed_json["purchase_order"]
      tag_ids = parsed_json["tag_ids"]
      trade_name = parsed_json["trade_name"]
      type = parsed_json["type"]
      vat_exempt = parsed_json["vat_exempt"]
      vat_exemption_rationale = parsed_json["vat_exemption_rationale"]
      vat_mode = parsed_json["vat_mode"]
      withholding_tax_rate = parsed_json["withholding_tax_rate"]
      new(
        commercial_condition_description: commercial_condition_description,
        counterpart_billing_address_id: counterpart_billing_address_id,
        counterpart_business_type: counterpart_business_type,
        counterpart_id: counterpart_id,
        counterpart_shipping_address_id: counterpart_shipping_address_id,
        counterpart_vat_id_id: counterpart_vat_id_id,
        currency: currency,
        deduction_amount: deduction_amount,
        deduction_memo: deduction_memo,
        discount: discount,
        document_id: document_id,
        entity: entity,
        entity_bank_account_id: entity_bank_account_id,
        entity_vat_id_id: entity_vat_id_id,
        fulfillment_date: fulfillment_date,
        line_items: line_items,
        memo: memo,
        overdue_reminder_id: overdue_reminder_id,
        partner_metadata: partner_metadata,
        payment_page_url: payment_page_url,
        payment_reminder_id: payment_reminder_id,
        payment_terms_id: payment_terms_id,
        project_id: project_id,
        purchase_order: purchase_order,
        tag_ids: tag_ids,
        trade_name: trade_name,
        type: type,
        vat_exempt: vat_exempt,
        vat_exemption_rationale: vat_exemption_rationale,
        vat_mode: vat_mode,
        withholding_tax_rate: withholding_tax_rate,
        additional_properties: struct
      )
    end
# Serialize an instance of ReceivableFacadeCreateInvoicePayload to a JSON object
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
      obj.commercial_condition_description&.is_a?(String) != false || raise("Passed value for field obj.commercial_condition_description is not the expected type, validation failed.")
      obj.counterpart_billing_address_id.is_a?(String) != false || raise("Passed value for field obj.counterpart_billing_address_id is not the expected type, validation failed.")
      obj.counterpart_business_type&.is_a?(String) != false || raise("Passed value for field obj.counterpart_business_type is not the expected type, validation failed.")
      obj.counterpart_id.is_a?(String) != false || raise("Passed value for field obj.counterpart_id is not the expected type, validation failed.")
      obj.counterpart_shipping_address_id&.is_a?(String) != false || raise("Passed value for field obj.counterpart_shipping_address_id is not the expected type, validation failed.")
      obj.counterpart_vat_id_id&.is_a?(String) != false || raise("Passed value for field obj.counterpart_vat_id_id is not the expected type, validation failed.")
      obj.currency.is_a?(Monite::CurrencyEnum) != false || raise("Passed value for field obj.currency is not the expected type, validation failed.")
      obj.deduction_amount&.is_a?(Integer) != false || raise("Passed value for field obj.deduction_amount is not the expected type, validation failed.")
      obj.deduction_memo&.is_a?(String) != false || raise("Passed value for field obj.deduction_memo is not the expected type, validation failed.")
      obj.discount.nil? || Monite::Discount.validate_raw(obj: obj.discount)
      obj.document_id&.is_a?(String) != false || raise("Passed value for field obj.document_id is not the expected type, validation failed.")
      obj.entity.nil? || Monite::ReceivableEntityBase.validate_raw(obj: obj.entity)
      obj.entity_bank_account_id&.is_a?(String) != false || raise("Passed value for field obj.entity_bank_account_id is not the expected type, validation failed.")
      obj.entity_vat_id_id&.is_a?(String) != false || raise("Passed value for field obj.entity_vat_id_id is not the expected type, validation failed.")
      obj.fulfillment_date&.is_a?(String) != false || raise("Passed value for field obj.fulfillment_date is not the expected type, validation failed.")
      obj.line_items.is_a?(Array) != false || raise("Passed value for field obj.line_items is not the expected type, validation failed.")
      obj.memo&.is_a?(String) != false || raise("Passed value for field obj.memo is not the expected type, validation failed.")
      obj.overdue_reminder_id&.is_a?(String) != false || raise("Passed value for field obj.overdue_reminder_id is not the expected type, validation failed.")
      obj.partner_metadata&.is_a?(Hash) != false || raise("Passed value for field obj.partner_metadata is not the expected type, validation failed.")
      obj.payment_page_url&.is_a?(String) != false || raise("Passed value for field obj.payment_page_url is not the expected type, validation failed.")
      obj.payment_reminder_id&.is_a?(String) != false || raise("Passed value for field obj.payment_reminder_id is not the expected type, validation failed.")
      obj.payment_terms_id&.is_a?(String) != false || raise("Passed value for field obj.payment_terms_id is not the expected type, validation failed.")
      obj.project_id&.is_a?(String) != false || raise("Passed value for field obj.project_id is not the expected type, validation failed.")
      obj.purchase_order&.is_a?(String) != false || raise("Passed value for field obj.purchase_order is not the expected type, validation failed.")
      obj.tag_ids&.is_a?(Array) != false || raise("Passed value for field obj.tag_ids is not the expected type, validation failed.")
      obj.trade_name&.is_a?(String) != false || raise("Passed value for field obj.trade_name is not the expected type, validation failed.")
      obj.type.is_a?(String) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
      obj.vat_exempt&.is_a?(Boolean) != false || raise("Passed value for field obj.vat_exempt is not the expected type, validation failed.")
      obj.vat_exemption_rationale&.is_a?(String) != false || raise("Passed value for field obj.vat_exemption_rationale is not the expected type, validation failed.")
      obj.vat_mode&.is_a?(Monite::VatModeEnum) != false || raise("Passed value for field obj.vat_mode is not the expected type, validation failed.")
      obj.withholding_tax_rate&.is_a?(Integer) != false || raise("Passed value for field obj.withholding_tax_rate is not the expected type, validation failed.")
    end
  end
end