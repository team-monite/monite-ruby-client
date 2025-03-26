# frozen_string_literal: true
require_relative "currency_enum"
require_relative "discount"
require_relative "receivable_entity_base"
require_relative "line_item_update"
require "ostruct"
require "json"

module Monite
  class UpdateInvoice
  # @return [String] Unique ID of the counterpart contact.
    attr_reader :contact_id
  # @return [String] Address of invoicing, need to state as a separate fields for some countries if
#  it differs from address of a company.
    attr_reader :counterpart_billing_address_id
  # @return [String] Unique ID of the counterpart.
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
  # @return [Array<Monite::LineItemUpdate>] 
    attr_reader :line_items
  # @return [String] A note with additional information for a receivable
    attr_reader :memo
  # @return [String] 
    attr_reader :overdue_reminder_id
  # @return [Hash{String => Object}] Metadata for partner needs
    attr_reader :partner_metadata
  # @return [String] Link to your invoice's custom payment rails or external payment link.
    attr_reader :payment_page_url
  # @return [String] 
    attr_reader :payment_reminder_id
  # @return [String] Unique ID of the payment terms.
    attr_reader :payment_terms_id
  # @return [String] A project related to current receivable
    attr_reader :project_id
  # @return [Array<String>] A list of IDs of user-defined tags (labels) assigned to this receivable.
    attr_reader :tag_ids
  # @return [String] Trade name of the entity
    attr_reader :trade_name
  # @return [Boolean] Indicates whether the goods, materials, or services listed in the receivable are
#  exempt from VAT or not.
    attr_reader :vat_exempt
  # @return [String] The reason for the VAT exemption, if applicable.
    attr_reader :vat_exemption_rationale
  # @return [Integer] The amount of tax withheld in percent minor units
    attr_reader :withholding_tax_rate
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param contact_id [String] Unique ID of the counterpart contact.
    # @param counterpart_billing_address_id [String] Address of invoicing, need to state as a separate fields for some countries if
#  it differs from address of a company.
    # @param counterpart_id [String] Unique ID of the counterpart.
    # @param counterpart_shipping_address_id [String] Address where goods were shipped / where services were provided.
    # @param counterpart_vat_id_id [String] Counterpart VAT ID id
    # @param currency [Monite::CurrencyEnum] 
    # @param deduction_amount [Integer] The amount of tax deducted in minor units
    # @param deduction_memo [String] A note with additional information about a tax deduction
    # @param discount [Monite::Discount] The discount for a receivable.
    # @param entity [Monite::ReceivableEntityBase] 
    # @param entity_bank_account_id [String] Entity bank account ID
    # @param entity_vat_id_id [String] Entity VAT ID id
    # @param fulfillment_date [String] The date when the goods are shipped or the service is provided. Can be a
#  current, past, or future date.
#  If omitted or `null`, defaults to the invoice issue date and the value is
#  automatically set when the invoice is moved to the `issued` status.
    # @param line_items [Array<Monite::LineItemUpdate>] 
    # @param memo [String] A note with additional information for a receivable
    # @param overdue_reminder_id [String] 
    # @param partner_metadata [Hash{String => Object}] Metadata for partner needs
    # @param payment_page_url [String] Link to your invoice's custom payment rails or external payment link.
    # @param payment_reminder_id [String] 
    # @param payment_terms_id [String] Unique ID of the payment terms.
    # @param project_id [String] A project related to current receivable
    # @param tag_ids [Array<String>] A list of IDs of user-defined tags (labels) assigned to this receivable.
    # @param trade_name [String] Trade name of the entity
    # @param vat_exempt [Boolean] Indicates whether the goods, materials, or services listed in the receivable are
#  exempt from VAT or not.
    # @param vat_exemption_rationale [String] The reason for the VAT exemption, if applicable.
    # @param withholding_tax_rate [Integer] The amount of tax withheld in percent minor units
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::UpdateInvoice]
    def initialize(contact_id: OMIT, counterpart_billing_address_id: OMIT, counterpart_id: OMIT, counterpart_shipping_address_id: OMIT, counterpart_vat_id_id: OMIT, currency: OMIT, deduction_amount: OMIT, deduction_memo: OMIT, discount: OMIT, entity: OMIT, entity_bank_account_id: OMIT, entity_vat_id_id: OMIT, fulfillment_date: OMIT, line_items: OMIT, memo: OMIT, overdue_reminder_id: OMIT, partner_metadata: OMIT, payment_page_url: OMIT, payment_reminder_id: OMIT, payment_terms_id: OMIT, project_id: OMIT, tag_ids: OMIT, trade_name: OMIT, vat_exempt: OMIT, vat_exemption_rationale: OMIT, withholding_tax_rate: OMIT, additional_properties: nil)
      @contact_id = contact_id if contact_id != OMIT
      @counterpart_billing_address_id = counterpart_billing_address_id if counterpart_billing_address_id != OMIT
      @counterpart_id = counterpart_id if counterpart_id != OMIT
      @counterpart_shipping_address_id = counterpart_shipping_address_id if counterpart_shipping_address_id != OMIT
      @counterpart_vat_id_id = counterpart_vat_id_id if counterpart_vat_id_id != OMIT
      @currency = currency if currency != OMIT
      @deduction_amount = deduction_amount if deduction_amount != OMIT
      @deduction_memo = deduction_memo if deduction_memo != OMIT
      @discount = discount if discount != OMIT
      @entity = entity if entity != OMIT
      @entity_bank_account_id = entity_bank_account_id if entity_bank_account_id != OMIT
      @entity_vat_id_id = entity_vat_id_id if entity_vat_id_id != OMIT
      @fulfillment_date = fulfillment_date if fulfillment_date != OMIT
      @line_items = line_items if line_items != OMIT
      @memo = memo if memo != OMIT
      @overdue_reminder_id = overdue_reminder_id if overdue_reminder_id != OMIT
      @partner_metadata = partner_metadata if partner_metadata != OMIT
      @payment_page_url = payment_page_url if payment_page_url != OMIT
      @payment_reminder_id = payment_reminder_id if payment_reminder_id != OMIT
      @payment_terms_id = payment_terms_id if payment_terms_id != OMIT
      @project_id = project_id if project_id != OMIT
      @tag_ids = tag_ids if tag_ids != OMIT
      @trade_name = trade_name if trade_name != OMIT
      @vat_exempt = vat_exempt if vat_exempt != OMIT
      @vat_exemption_rationale = vat_exemption_rationale if vat_exemption_rationale != OMIT
      @withholding_tax_rate = withholding_tax_rate if withholding_tax_rate != OMIT
      @additional_properties = additional_properties
      @_field_set = { "contact_id": contact_id, "counterpart_billing_address_id": counterpart_billing_address_id, "counterpart_id": counterpart_id, "counterpart_shipping_address_id": counterpart_shipping_address_id, "counterpart_vat_id_id": counterpart_vat_id_id, "currency": currency, "deduction_amount": deduction_amount, "deduction_memo": deduction_memo, "discount": discount, "entity": entity, "entity_bank_account_id": entity_bank_account_id, "entity_vat_id_id": entity_vat_id_id, "fulfillment_date": fulfillment_date, "line_items": line_items, "memo": memo, "overdue_reminder_id": overdue_reminder_id, "partner_metadata": partner_metadata, "payment_page_url": payment_page_url, "payment_reminder_id": payment_reminder_id, "payment_terms_id": payment_terms_id, "project_id": project_id, "tag_ids": tag_ids, "trade_name": trade_name, "vat_exempt": vat_exempt, "vat_exemption_rationale": vat_exemption_rationale, "withholding_tax_rate": withholding_tax_rate }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of UpdateInvoice
    #
    # @param json_object [String] 
    # @return [Monite::UpdateInvoice]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      contact_id = parsed_json["contact_id"]
      counterpart_billing_address_id = parsed_json["counterpart_billing_address_id"]
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
  Monite::LineItemUpdate.from_json(json_object: item)
end
      memo = parsed_json["memo"]
      overdue_reminder_id = parsed_json["overdue_reminder_id"]
      partner_metadata = parsed_json["partner_metadata"]
      payment_page_url = parsed_json["payment_page_url"]
      payment_reminder_id = parsed_json["payment_reminder_id"]
      payment_terms_id = parsed_json["payment_terms_id"]
      project_id = parsed_json["project_id"]
      tag_ids = parsed_json["tag_ids"]
      trade_name = parsed_json["trade_name"]
      vat_exempt = parsed_json["vat_exempt"]
      vat_exemption_rationale = parsed_json["vat_exemption_rationale"]
      withholding_tax_rate = parsed_json["withholding_tax_rate"]
      new(
        contact_id: contact_id,
        counterpart_billing_address_id: counterpart_billing_address_id,
        counterpart_id: counterpart_id,
        counterpart_shipping_address_id: counterpart_shipping_address_id,
        counterpart_vat_id_id: counterpart_vat_id_id,
        currency: currency,
        deduction_amount: deduction_amount,
        deduction_memo: deduction_memo,
        discount: discount,
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
        tag_ids: tag_ids,
        trade_name: trade_name,
        vat_exempt: vat_exempt,
        vat_exemption_rationale: vat_exemption_rationale,
        withholding_tax_rate: withholding_tax_rate,
        additional_properties: struct
      )
    end
# Serialize an instance of UpdateInvoice to a JSON object
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
      obj.contact_id&.is_a?(String) != false || raise("Passed value for field obj.contact_id is not the expected type, validation failed.")
      obj.counterpart_billing_address_id&.is_a?(String) != false || raise("Passed value for field obj.counterpart_billing_address_id is not the expected type, validation failed.")
      obj.counterpart_id&.is_a?(String) != false || raise("Passed value for field obj.counterpart_id is not the expected type, validation failed.")
      obj.counterpart_shipping_address_id&.is_a?(String) != false || raise("Passed value for field obj.counterpart_shipping_address_id is not the expected type, validation failed.")
      obj.counterpart_vat_id_id&.is_a?(String) != false || raise("Passed value for field obj.counterpart_vat_id_id is not the expected type, validation failed.")
      obj.currency&.is_a?(Monite::CurrencyEnum) != false || raise("Passed value for field obj.currency is not the expected type, validation failed.")
      obj.deduction_amount&.is_a?(Integer) != false || raise("Passed value for field obj.deduction_amount is not the expected type, validation failed.")
      obj.deduction_memo&.is_a?(String) != false || raise("Passed value for field obj.deduction_memo is not the expected type, validation failed.")
      obj.discount.nil? || Monite::Discount.validate_raw(obj: obj.discount)
      obj.entity.nil? || Monite::ReceivableEntityBase.validate_raw(obj: obj.entity)
      obj.entity_bank_account_id&.is_a?(String) != false || raise("Passed value for field obj.entity_bank_account_id is not the expected type, validation failed.")
      obj.entity_vat_id_id&.is_a?(String) != false || raise("Passed value for field obj.entity_vat_id_id is not the expected type, validation failed.")
      obj.fulfillment_date&.is_a?(String) != false || raise("Passed value for field obj.fulfillment_date is not the expected type, validation failed.")
      obj.line_items&.is_a?(Array) != false || raise("Passed value for field obj.line_items is not the expected type, validation failed.")
      obj.memo&.is_a?(String) != false || raise("Passed value for field obj.memo is not the expected type, validation failed.")
      obj.overdue_reminder_id&.is_a?(String) != false || raise("Passed value for field obj.overdue_reminder_id is not the expected type, validation failed.")
      obj.partner_metadata&.is_a?(Hash) != false || raise("Passed value for field obj.partner_metadata is not the expected type, validation failed.")
      obj.payment_page_url&.is_a?(String) != false || raise("Passed value for field obj.payment_page_url is not the expected type, validation failed.")
      obj.payment_reminder_id&.is_a?(String) != false || raise("Passed value for field obj.payment_reminder_id is not the expected type, validation failed.")
      obj.payment_terms_id&.is_a?(String) != false || raise("Passed value for field obj.payment_terms_id is not the expected type, validation failed.")
      obj.project_id&.is_a?(String) != false || raise("Passed value for field obj.project_id is not the expected type, validation failed.")
      obj.tag_ids&.is_a?(Array) != false || raise("Passed value for field obj.tag_ids is not the expected type, validation failed.")
      obj.trade_name&.is_a?(String) != false || raise("Passed value for field obj.trade_name is not the expected type, validation failed.")
      obj.vat_exempt&.is_a?(Boolean) != false || raise("Passed value for field obj.vat_exempt is not the expected type, validation failed.")
      obj.vat_exemption_rationale&.is_a?(String) != false || raise("Passed value for field obj.vat_exemption_rationale is not the expected type, validation failed.")
      obj.withholding_tax_rate&.is_a?(Integer) != false || raise("Passed value for field obj.withholding_tax_rate is not the expected type, validation failed.")
    end
  end
end