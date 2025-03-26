# frozen_string_literal: true
require "date"
require "date"
require_relative "receivables_representation_of_counterpart_address"
require_relative "receivable_counterpart_contact"
require_relative "receivable_counterpart_type"
require_relative "receivable_counterpart_vat_id_response"
require_relative "currency_enum"
require_relative "discount"
require_relative "quote_response_payload_entity"
require_relative "receivable_entity_address_schema"
require_relative "receivables_representation_of_entity_bank_account"
require_relative "receivable_entity_vat_id_response"
require_relative "language_code_enum"
require "date"
require_relative "response_item"
require_relative "quote_state_enum"
require_relative "tag_read_schema"
require_relative "total_vat_amount_item"
require_relative "vat_mode_enum"
require "ostruct"
require "json"

module Monite
  class QuoteResponsePayload
  # @return [String] 
    attr_reader :id
  # @return [DateTime] Time at which the receivable was created. Timestamps follow the ISO 8601
#  standard.
    attr_reader :created_at
  # @return [DateTime] Time at which the receivable was last updated. Timestamps follow the ISO 8601
#  standard.
    attr_reader :updated_at
  # @return [String] The unique ID of a previous document related to the receivable if applicable.
    attr_reader :based_on
  # @return [String] The unique document ID of a previous document related to the receivable if
#  applicable.
    attr_reader :based_on_document_id
  # @return [String] Field with a comment on why the client declined this Quote
    attr_reader :comment
  # @return [String] The commercial terms of the receivable (e.g. The products must be delivered in X
#  days).
    attr_reader :commercial_condition_description
  # @return [Monite::ReceivablesRepresentationOfCounterpartAddress] Address of invoicing, need to state as a separate fields for some countries if
#  it differs from address of a company.
    attr_reader :counterpart_billing_address
  # @return [String] Different types of companies for different countries, ex. GmbH, SAS, SNC, etc.
    attr_reader :counterpart_business_type
  # @return [Monite::ReceivableCounterpartContact] Additional information about counterpart contacts.
    attr_reader :counterpart_contact
  # @return [String] Unique ID of the counterpart.
    attr_reader :counterpart_id
  # @return [String] A legal name of a counterpart it is an organization or first and last name if it
#  is an individual
    attr_reader :counterpart_name
  # @return [Monite::ReceivablesRepresentationOfCounterpartAddress] Address where goods were shipped / where services were provided.
    attr_reader :counterpart_shipping_address
  # @return [String] The VAT/TAX ID of the counterpart.
    attr_reader :counterpart_tax_id
  # @return [Monite::ReceivableCounterpartType] The type of the counterpart.
    attr_reader :counterpart_type
  # @return [Monite::ReceivableCounterpartVatIdResponse] 
    attr_reader :counterpart_vat_id
  # @return [Monite::CurrencyEnum] The currency used in the receivable.
    attr_reader :currency
  # @return [Integer] The amount of tax deducted in minor units
    attr_reader :deduction_amount
  # @return [String] A note with additional information about a tax deduction
    attr_reader :deduction_memo
  # @return [Monite::Discount] The discount for a receivable.
    attr_reader :discount
  # @return [Integer] Total price of the receivable with discounts before taxes [minor
#  units](https://docs.monite.com/references/currencies#minor-units).
    attr_reader :discounted_subtotal
  # @return [String] The sequential code systematically assigned to invoices.
    attr_reader :document_id
  # @return [String] Optional field representing date until which invoice should be paid
    attr_reader :due_date
  # @return [Monite::QuoteResponsePayloadEntity] 
    attr_reader :entity
  # @return [Monite::ReceivableEntityAddressSchema] 
    attr_reader :entity_address
  # @return [Monite::ReceivablesRepresentationOfEntityBankAccount] 
    attr_reader :entity_bank_account
  # @return [String] The entity user who created this document.
    attr_reader :entity_user_id
  # @return [Monite::ReceivableEntityVatIdResponse] 
    attr_reader :entity_vat_id
  # @return [String] The date (in ISO 8601 format) until which the quote is valid.
    attr_reader :expiry_date
  # @return [Monite::LanguageCodeEnum] The language of the customer-facing PDF file (`file_url`). The value matches the
#  counterpart's `language` at the time when this PDF file was generated.
    attr_reader :file_language
  # @return [String] The receivable's PDF URL in the counterpart's default language.
    attr_reader :file_url
  # @return [DateTime] Optional field for the issue of the entry.
    attr_reader :issue_date
  # @return [Array<Monite::ResponseItem>] 
    attr_reader :line_items
  # @return [String] A note with additional information for a receivable.
    attr_reader :memo
  # @return [Monite::LanguageCodeEnum] The language of the entity's copy of the PDF file (`original_file_url`). The
#  value matches the entity's `language` at the time when this PDF file was
#  generated.
    attr_reader :original_file_language
  # @return [String] The receivable's PDF URL in the entity's default language.
    attr_reader :original_file_url
  # @return [Hash{String => Object}] Metadata for partner needs
    attr_reader :partner_metadata
  # @return [String] A project related to current receivable
    attr_reader :project_id
  # @return [String] Link for custom quote accept page
    attr_reader :quote_accept_page_url
  # @return [Boolean] Whether acceptance a quote requires a signature.
    attr_reader :signature_required
  # @return [Monite::QuoteStateEnum] The status of the Quote inside the receivable workflow.
    attr_reader :status
  # @return [Integer] The subtotal (excluding VAT), in [minor
#  units](https://docs.monite.com/references/currencies#minor-units).
    attr_reader :subtotal
  # @return [Array<Monite::TagReadSchema>] The list of tags for this receivable.
    attr_reader :tags
  # @return [Integer] Total price of the receivable in [minor
#  units](https://docs.monite.com/references/currencies#minor-units). Calculated as
#  a subtotal + total_vat_amount.
    attr_reader :total_amount
  # @return [Integer] The total VAT of all line items, in [minor
#  units](https://docs.monite.com/references/currencies#minor-units).
    attr_reader :total_vat_amount
  # @return [Array<Monite::TotalVatAmountItem>] List of total vat amount for each VAT, presented in receivable
    attr_reader :total_vat_amounts
  # @return [Integer] Total price of the receivable with tax withheld in minor units
    attr_reader :total_withholding_tax
  # @return [String] Trade name of the entity
    attr_reader :trade_name
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

    # @param id [String] 
    # @param created_at [DateTime] Time at which the receivable was created. Timestamps follow the ISO 8601
#  standard.
    # @param updated_at [DateTime] Time at which the receivable was last updated. Timestamps follow the ISO 8601
#  standard.
    # @param based_on [String] The unique ID of a previous document related to the receivable if applicable.
    # @param based_on_document_id [String] The unique document ID of a previous document related to the receivable if
#  applicable.
    # @param comment [String] Field with a comment on why the client declined this Quote
    # @param commercial_condition_description [String] The commercial terms of the receivable (e.g. The products must be delivered in X
#  days).
    # @param counterpart_billing_address [Monite::ReceivablesRepresentationOfCounterpartAddress] Address of invoicing, need to state as a separate fields for some countries if
#  it differs from address of a company.
    # @param counterpart_business_type [String] Different types of companies for different countries, ex. GmbH, SAS, SNC, etc.
    # @param counterpart_contact [Monite::ReceivableCounterpartContact] Additional information about counterpart contacts.
    # @param counterpart_id [String] Unique ID of the counterpart.
    # @param counterpart_name [String] A legal name of a counterpart it is an organization or first and last name if it
#  is an individual
    # @param counterpart_shipping_address [Monite::ReceivablesRepresentationOfCounterpartAddress] Address where goods were shipped / where services were provided.
    # @param counterpart_tax_id [String] The VAT/TAX ID of the counterpart.
    # @param counterpart_type [Monite::ReceivableCounterpartType] The type of the counterpart.
    # @param counterpart_vat_id [Monite::ReceivableCounterpartVatIdResponse] 
    # @param currency [Monite::CurrencyEnum] The currency used in the receivable.
    # @param deduction_amount [Integer] The amount of tax deducted in minor units
    # @param deduction_memo [String] A note with additional information about a tax deduction
    # @param discount [Monite::Discount] The discount for a receivable.
    # @param discounted_subtotal [Integer] Total price of the receivable with discounts before taxes [minor
#  units](https://docs.monite.com/references/currencies#minor-units).
    # @param document_id [String] The sequential code systematically assigned to invoices.
    # @param due_date [String] Optional field representing date until which invoice should be paid
    # @param entity [Monite::QuoteResponsePayloadEntity] 
    # @param entity_address [Monite::ReceivableEntityAddressSchema] 
    # @param entity_bank_account [Monite::ReceivablesRepresentationOfEntityBankAccount] 
    # @param entity_user_id [String] The entity user who created this document.
    # @param entity_vat_id [Monite::ReceivableEntityVatIdResponse] 
    # @param expiry_date [String] The date (in ISO 8601 format) until which the quote is valid.
    # @param file_language [Monite::LanguageCodeEnum] The language of the customer-facing PDF file (`file_url`). The value matches the
#  counterpart's `language` at the time when this PDF file was generated.
    # @param file_url [String] The receivable's PDF URL in the counterpart's default language.
    # @param issue_date [DateTime] Optional field for the issue of the entry.
    # @param line_items [Array<Monite::ResponseItem>] 
    # @param memo [String] A note with additional information for a receivable.
    # @param original_file_language [Monite::LanguageCodeEnum] The language of the entity's copy of the PDF file (`original_file_url`). The
#  value matches the entity's `language` at the time when this PDF file was
#  generated.
    # @param original_file_url [String] The receivable's PDF URL in the entity's default language.
    # @param partner_metadata [Hash{String => Object}] Metadata for partner needs
    # @param project_id [String] A project related to current receivable
    # @param quote_accept_page_url [String] Link for custom quote accept page
    # @param signature_required [Boolean] Whether acceptance a quote requires a signature.
    # @param status [Monite::QuoteStateEnum] The status of the Quote inside the receivable workflow.
    # @param subtotal [Integer] The subtotal (excluding VAT), in [minor
#  units](https://docs.monite.com/references/currencies#minor-units).
    # @param tags [Array<Monite::TagReadSchema>] The list of tags for this receivable.
    # @param total_amount [Integer] Total price of the receivable in [minor
#  units](https://docs.monite.com/references/currencies#minor-units). Calculated as
#  a subtotal + total_vat_amount.
    # @param total_vat_amount [Integer] The total VAT of all line items, in [minor
#  units](https://docs.monite.com/references/currencies#minor-units).
    # @param total_vat_amounts [Array<Monite::TotalVatAmountItem>] List of total vat amount for each VAT, presented in receivable
    # @param total_withholding_tax [Integer] Total price of the receivable with tax withheld in minor units
    # @param trade_name [String] Trade name of the entity
    # @param vat_exempt [Boolean] Indicates whether the goods, materials, or services listed in the receivable are
#  exempt from VAT or not.
    # @param vat_exemption_rationale [String] The reason for the VAT exemption, if applicable.
    # @param vat_mode [Monite::VatModeEnum] Defines whether the prices of products in receivable will already include VAT or
#  not.
    # @param withholding_tax_rate [Integer] The amount of tax withheld in percent minor units
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::QuoteResponsePayload]
    def initialize(id:, created_at:, updated_at:, based_on: OMIT, based_on_document_id: OMIT, comment: OMIT, commercial_condition_description: OMIT, counterpart_billing_address: OMIT, counterpart_business_type: OMIT, counterpart_contact: OMIT, counterpart_id:, counterpart_name: OMIT, counterpart_shipping_address: OMIT, counterpart_tax_id: OMIT, counterpart_type:, counterpart_vat_id: OMIT, currency:, deduction_amount: OMIT, deduction_memo: OMIT, discount: OMIT, discounted_subtotal: OMIT, document_id: OMIT, due_date: OMIT, entity:, entity_address:, entity_bank_account: OMIT, entity_user_id: OMIT, entity_vat_id: OMIT, expiry_date: OMIT, file_language:, file_url: OMIT, issue_date: OMIT, line_items:, memo: OMIT, original_file_language:, original_file_url: OMIT, partner_metadata: OMIT, project_id: OMIT, quote_accept_page_url: OMIT, signature_required: OMIT, status:, subtotal: OMIT, tags: OMIT, total_amount: OMIT, total_vat_amount:, total_vat_amounts: OMIT, total_withholding_tax: OMIT, trade_name: OMIT, vat_exempt: OMIT, vat_exemption_rationale: OMIT, vat_mode: OMIT, withholding_tax_rate: OMIT, additional_properties: nil)
      @id = id
      @created_at = created_at
      @updated_at = updated_at
      @based_on = based_on if based_on != OMIT
      @based_on_document_id = based_on_document_id if based_on_document_id != OMIT
      @comment = comment if comment != OMIT
      @commercial_condition_description = commercial_condition_description if commercial_condition_description != OMIT
      @counterpart_billing_address = counterpart_billing_address if counterpart_billing_address != OMIT
      @counterpart_business_type = counterpart_business_type if counterpart_business_type != OMIT
      @counterpart_contact = counterpart_contact if counterpart_contact != OMIT
      @counterpart_id = counterpart_id
      @counterpart_name = counterpart_name if counterpart_name != OMIT
      @counterpart_shipping_address = counterpart_shipping_address if counterpart_shipping_address != OMIT
      @counterpart_tax_id = counterpart_tax_id if counterpart_tax_id != OMIT
      @counterpart_type = counterpart_type
      @counterpart_vat_id = counterpart_vat_id if counterpart_vat_id != OMIT
      @currency = currency
      @deduction_amount = deduction_amount if deduction_amount != OMIT
      @deduction_memo = deduction_memo if deduction_memo != OMIT
      @discount = discount if discount != OMIT
      @discounted_subtotal = discounted_subtotal if discounted_subtotal != OMIT
      @document_id = document_id if document_id != OMIT
      @due_date = due_date if due_date != OMIT
      @entity = entity
      @entity_address = entity_address
      @entity_bank_account = entity_bank_account if entity_bank_account != OMIT
      @entity_user_id = entity_user_id if entity_user_id != OMIT
      @entity_vat_id = entity_vat_id if entity_vat_id != OMIT
      @expiry_date = expiry_date if expiry_date != OMIT
      @file_language = file_language
      @file_url = file_url if file_url != OMIT
      @issue_date = issue_date if issue_date != OMIT
      @line_items = line_items
      @memo = memo if memo != OMIT
      @original_file_language = original_file_language
      @original_file_url = original_file_url if original_file_url != OMIT
      @partner_metadata = partner_metadata if partner_metadata != OMIT
      @project_id = project_id if project_id != OMIT
      @quote_accept_page_url = quote_accept_page_url if quote_accept_page_url != OMIT
      @signature_required = signature_required if signature_required != OMIT
      @status = status
      @subtotal = subtotal if subtotal != OMIT
      @tags = tags if tags != OMIT
      @total_amount = total_amount if total_amount != OMIT
      @total_vat_amount = total_vat_amount
      @total_vat_amounts = total_vat_amounts if total_vat_amounts != OMIT
      @total_withholding_tax = total_withholding_tax if total_withholding_tax != OMIT
      @trade_name = trade_name if trade_name != OMIT
      @vat_exempt = vat_exempt if vat_exempt != OMIT
      @vat_exemption_rationale = vat_exemption_rationale if vat_exemption_rationale != OMIT
      @vat_mode = vat_mode if vat_mode != OMIT
      @withholding_tax_rate = withholding_tax_rate if withholding_tax_rate != OMIT
      @additional_properties = additional_properties
      @_field_set = { "id": id, "created_at": created_at, "updated_at": updated_at, "based_on": based_on, "based_on_document_id": based_on_document_id, "comment": comment, "commercial_condition_description": commercial_condition_description, "counterpart_billing_address": counterpart_billing_address, "counterpart_business_type": counterpart_business_type, "counterpart_contact": counterpart_contact, "counterpart_id": counterpart_id, "counterpart_name": counterpart_name, "counterpart_shipping_address": counterpart_shipping_address, "counterpart_tax_id": counterpart_tax_id, "counterpart_type": counterpart_type, "counterpart_vat_id": counterpart_vat_id, "currency": currency, "deduction_amount": deduction_amount, "deduction_memo": deduction_memo, "discount": discount, "discounted_subtotal": discounted_subtotal, "document_id": document_id, "due_date": due_date, "entity": entity, "entity_address": entity_address, "entity_bank_account": entity_bank_account, "entity_user_id": entity_user_id, "entity_vat_id": entity_vat_id, "expiry_date": expiry_date, "file_language": file_language, "file_url": file_url, "issue_date": issue_date, "line_items": line_items, "memo": memo, "original_file_language": original_file_language, "original_file_url": original_file_url, "partner_metadata": partner_metadata, "project_id": project_id, "quote_accept_page_url": quote_accept_page_url, "signature_required": signature_required, "status": status, "subtotal": subtotal, "tags": tags, "total_amount": total_amount, "total_vat_amount": total_vat_amount, "total_vat_amounts": total_vat_amounts, "total_withholding_tax": total_withholding_tax, "trade_name": trade_name, "vat_exempt": vat_exempt, "vat_exemption_rationale": vat_exemption_rationale, "vat_mode": vat_mode, "withholding_tax_rate": withholding_tax_rate }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of QuoteResponsePayload
    #
    # @param json_object [String] 
    # @return [Monite::QuoteResponsePayload]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      created_at = unless parsed_json["created_at"].nil?
  DateTime.parse(parsed_json["created_at"])
else
  nil
end
      updated_at = unless parsed_json["updated_at"].nil?
  DateTime.parse(parsed_json["updated_at"])
else
  nil
end
      based_on = parsed_json["based_on"]
      based_on_document_id = parsed_json["based_on_document_id"]
      comment = parsed_json["comment"]
      commercial_condition_description = parsed_json["commercial_condition_description"]
      unless parsed_json["counterpart_billing_address"].nil?
        counterpart_billing_address = parsed_json["counterpart_billing_address"].to_json
        counterpart_billing_address = Monite::ReceivablesRepresentationOfCounterpartAddress.from_json(json_object: counterpart_billing_address)
      else
        counterpart_billing_address = nil
      end
      counterpart_business_type = parsed_json["counterpart_business_type"]
      unless parsed_json["counterpart_contact"].nil?
        counterpart_contact = parsed_json["counterpart_contact"].to_json
        counterpart_contact = Monite::ReceivableCounterpartContact.from_json(json_object: counterpart_contact)
      else
        counterpart_contact = nil
      end
      counterpart_id = parsed_json["counterpart_id"]
      counterpart_name = parsed_json["counterpart_name"]
      unless parsed_json["counterpart_shipping_address"].nil?
        counterpart_shipping_address = parsed_json["counterpart_shipping_address"].to_json
        counterpart_shipping_address = Monite::ReceivablesRepresentationOfCounterpartAddress.from_json(json_object: counterpart_shipping_address)
      else
        counterpart_shipping_address = nil
      end
      counterpart_tax_id = parsed_json["counterpart_tax_id"]
      counterpart_type = parsed_json["counterpart_type"]
      unless parsed_json["counterpart_vat_id"].nil?
        counterpart_vat_id = parsed_json["counterpart_vat_id"].to_json
        counterpart_vat_id = Monite::ReceivableCounterpartVatIdResponse.from_json(json_object: counterpart_vat_id)
      else
        counterpart_vat_id = nil
      end
      currency = parsed_json["currency"]
      deduction_amount = parsed_json["deduction_amount"]
      deduction_memo = parsed_json["deduction_memo"]
      unless parsed_json["discount"].nil?
        discount = parsed_json["discount"].to_json
        discount = Monite::Discount.from_json(json_object: discount)
      else
        discount = nil
      end
      discounted_subtotal = parsed_json["discounted_subtotal"]
      document_id = parsed_json["document_id"]
      due_date = parsed_json["due_date"]
      unless parsed_json["entity"].nil?
        entity = parsed_json["entity"].to_json
        entity = Monite::QuoteResponsePayloadEntity.from_json(json_object: entity)
      else
        entity = nil
      end
      unless parsed_json["entity_address"].nil?
        entity_address = parsed_json["entity_address"].to_json
        entity_address = Monite::ReceivableEntityAddressSchema.from_json(json_object: entity_address)
      else
        entity_address = nil
      end
      unless parsed_json["entity_bank_account"].nil?
        entity_bank_account = parsed_json["entity_bank_account"].to_json
        entity_bank_account = Monite::ReceivablesRepresentationOfEntityBankAccount.from_json(json_object: entity_bank_account)
      else
        entity_bank_account = nil
      end
      entity_user_id = parsed_json["entity_user_id"]
      unless parsed_json["entity_vat_id"].nil?
        entity_vat_id = parsed_json["entity_vat_id"].to_json
        entity_vat_id = Monite::ReceivableEntityVatIdResponse.from_json(json_object: entity_vat_id)
      else
        entity_vat_id = nil
      end
      expiry_date = parsed_json["expiry_date"]
      file_language = parsed_json["file_language"]
      file_url = parsed_json["file_url"]
      issue_date = unless parsed_json["issue_date"].nil?
  DateTime.parse(parsed_json["issue_date"])
else
  nil
end
      line_items = parsed_json["line_items"]&.map do | item |
  item = item.to_json
  Monite::ResponseItem.from_json(json_object: item)
end
      memo = parsed_json["memo"]
      original_file_language = parsed_json["original_file_language"]
      original_file_url = parsed_json["original_file_url"]
      partner_metadata = parsed_json["partner_metadata"]
      project_id = parsed_json["project_id"]
      quote_accept_page_url = parsed_json["quote_accept_page_url"]
      signature_required = parsed_json["signature_required"]
      status = parsed_json["status"]
      subtotal = parsed_json["subtotal"]
      tags = parsed_json["tags"]&.map do | item |
  item = item.to_json
  Monite::TagReadSchema.from_json(json_object: item)
end
      total_amount = parsed_json["total_amount"]
      total_vat_amount = parsed_json["total_vat_amount"]
      total_vat_amounts = parsed_json["total_vat_amounts"]&.map do | item |
  item = item.to_json
  Monite::TotalVatAmountItem.from_json(json_object: item)
end
      total_withholding_tax = parsed_json["total_withholding_tax"]
      trade_name = parsed_json["trade_name"]
      vat_exempt = parsed_json["vat_exempt"]
      vat_exemption_rationale = parsed_json["vat_exemption_rationale"]
      vat_mode = parsed_json["vat_mode"]
      withholding_tax_rate = parsed_json["withholding_tax_rate"]
      new(
        id: id,
        created_at: created_at,
        updated_at: updated_at,
        based_on: based_on,
        based_on_document_id: based_on_document_id,
        comment: comment,
        commercial_condition_description: commercial_condition_description,
        counterpart_billing_address: counterpart_billing_address,
        counterpart_business_type: counterpart_business_type,
        counterpart_contact: counterpart_contact,
        counterpart_id: counterpart_id,
        counterpart_name: counterpart_name,
        counterpart_shipping_address: counterpart_shipping_address,
        counterpart_tax_id: counterpart_tax_id,
        counterpart_type: counterpart_type,
        counterpart_vat_id: counterpart_vat_id,
        currency: currency,
        deduction_amount: deduction_amount,
        deduction_memo: deduction_memo,
        discount: discount,
        discounted_subtotal: discounted_subtotal,
        document_id: document_id,
        due_date: due_date,
        entity: entity,
        entity_address: entity_address,
        entity_bank_account: entity_bank_account,
        entity_user_id: entity_user_id,
        entity_vat_id: entity_vat_id,
        expiry_date: expiry_date,
        file_language: file_language,
        file_url: file_url,
        issue_date: issue_date,
        line_items: line_items,
        memo: memo,
        original_file_language: original_file_language,
        original_file_url: original_file_url,
        partner_metadata: partner_metadata,
        project_id: project_id,
        quote_accept_page_url: quote_accept_page_url,
        signature_required: signature_required,
        status: status,
        subtotal: subtotal,
        tags: tags,
        total_amount: total_amount,
        total_vat_amount: total_vat_amount,
        total_vat_amounts: total_vat_amounts,
        total_withholding_tax: total_withholding_tax,
        trade_name: trade_name,
        vat_exempt: vat_exempt,
        vat_exemption_rationale: vat_exemption_rationale,
        vat_mode: vat_mode,
        withholding_tax_rate: withholding_tax_rate,
        additional_properties: struct
      )
    end
# Serialize an instance of QuoteResponsePayload to a JSON object
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
      obj.created_at.is_a?(DateTime) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
      obj.updated_at.is_a?(DateTime) != false || raise("Passed value for field obj.updated_at is not the expected type, validation failed.")
      obj.based_on&.is_a?(String) != false || raise("Passed value for field obj.based_on is not the expected type, validation failed.")
      obj.based_on_document_id&.is_a?(String) != false || raise("Passed value for field obj.based_on_document_id is not the expected type, validation failed.")
      obj.comment&.is_a?(String) != false || raise("Passed value for field obj.comment is not the expected type, validation failed.")
      obj.commercial_condition_description&.is_a?(String) != false || raise("Passed value for field obj.commercial_condition_description is not the expected type, validation failed.")
      obj.counterpart_billing_address.nil? || Monite::ReceivablesRepresentationOfCounterpartAddress.validate_raw(obj: obj.counterpart_billing_address)
      obj.counterpart_business_type&.is_a?(String) != false || raise("Passed value for field obj.counterpart_business_type is not the expected type, validation failed.")
      obj.counterpart_contact.nil? || Monite::ReceivableCounterpartContact.validate_raw(obj: obj.counterpart_contact)
      obj.counterpart_id.is_a?(String) != false || raise("Passed value for field obj.counterpart_id is not the expected type, validation failed.")
      obj.counterpart_name&.is_a?(String) != false || raise("Passed value for field obj.counterpart_name is not the expected type, validation failed.")
      obj.counterpart_shipping_address.nil? || Monite::ReceivablesRepresentationOfCounterpartAddress.validate_raw(obj: obj.counterpart_shipping_address)
      obj.counterpart_tax_id&.is_a?(String) != false || raise("Passed value for field obj.counterpart_tax_id is not the expected type, validation failed.")
      obj.counterpart_type.is_a?(Monite::ReceivableCounterpartType) != false || raise("Passed value for field obj.counterpart_type is not the expected type, validation failed.")
      obj.counterpart_vat_id.nil? || Monite::ReceivableCounterpartVatIdResponse.validate_raw(obj: obj.counterpart_vat_id)
      obj.currency.is_a?(Monite::CurrencyEnum) != false || raise("Passed value for field obj.currency is not the expected type, validation failed.")
      obj.deduction_amount&.is_a?(Integer) != false || raise("Passed value for field obj.deduction_amount is not the expected type, validation failed.")
      obj.deduction_memo&.is_a?(String) != false || raise("Passed value for field obj.deduction_memo is not the expected type, validation failed.")
      obj.discount.nil? || Monite::Discount.validate_raw(obj: obj.discount)
      obj.discounted_subtotal&.is_a?(Integer) != false || raise("Passed value for field obj.discounted_subtotal is not the expected type, validation failed.")
      obj.document_id&.is_a?(String) != false || raise("Passed value for field obj.document_id is not the expected type, validation failed.")
      obj.due_date&.is_a?(String) != false || raise("Passed value for field obj.due_date is not the expected type, validation failed.")
      Monite::QuoteResponsePayloadEntity.validate_raw(obj: obj.entity)
      Monite::ReceivableEntityAddressSchema.validate_raw(obj: obj.entity_address)
      obj.entity_bank_account.nil? || Monite::ReceivablesRepresentationOfEntityBankAccount.validate_raw(obj: obj.entity_bank_account)
      obj.entity_user_id&.is_a?(String) != false || raise("Passed value for field obj.entity_user_id is not the expected type, validation failed.")
      obj.entity_vat_id.nil? || Monite::ReceivableEntityVatIdResponse.validate_raw(obj: obj.entity_vat_id)
      obj.expiry_date&.is_a?(String) != false || raise("Passed value for field obj.expiry_date is not the expected type, validation failed.")
      obj.file_language.is_a?(Monite::LanguageCodeEnum) != false || raise("Passed value for field obj.file_language is not the expected type, validation failed.")
      obj.file_url&.is_a?(String) != false || raise("Passed value for field obj.file_url is not the expected type, validation failed.")
      obj.issue_date&.is_a?(DateTime) != false || raise("Passed value for field obj.issue_date is not the expected type, validation failed.")
      obj.line_items.is_a?(Array) != false || raise("Passed value for field obj.line_items is not the expected type, validation failed.")
      obj.memo&.is_a?(String) != false || raise("Passed value for field obj.memo is not the expected type, validation failed.")
      obj.original_file_language.is_a?(Monite::LanguageCodeEnum) != false || raise("Passed value for field obj.original_file_language is not the expected type, validation failed.")
      obj.original_file_url&.is_a?(String) != false || raise("Passed value for field obj.original_file_url is not the expected type, validation failed.")
      obj.partner_metadata&.is_a?(Hash) != false || raise("Passed value for field obj.partner_metadata is not the expected type, validation failed.")
      obj.project_id&.is_a?(String) != false || raise("Passed value for field obj.project_id is not the expected type, validation failed.")
      obj.quote_accept_page_url&.is_a?(String) != false || raise("Passed value for field obj.quote_accept_page_url is not the expected type, validation failed.")
      obj.signature_required&.is_a?(Boolean) != false || raise("Passed value for field obj.signature_required is not the expected type, validation failed.")
      obj.status.is_a?(Monite::QuoteStateEnum) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
      obj.subtotal&.is_a?(Integer) != false || raise("Passed value for field obj.subtotal is not the expected type, validation failed.")
      obj.tags&.is_a?(Array) != false || raise("Passed value for field obj.tags is not the expected type, validation failed.")
      obj.total_amount&.is_a?(Integer) != false || raise("Passed value for field obj.total_amount is not the expected type, validation failed.")
      obj.total_vat_amount.is_a?(Integer) != false || raise("Passed value for field obj.total_vat_amount is not the expected type, validation failed.")
      obj.total_vat_amounts&.is_a?(Array) != false || raise("Passed value for field obj.total_vat_amounts is not the expected type, validation failed.")
      obj.total_withholding_tax&.is_a?(Integer) != false || raise("Passed value for field obj.total_withholding_tax is not the expected type, validation failed.")
      obj.trade_name&.is_a?(String) != false || raise("Passed value for field obj.trade_name is not the expected type, validation failed.")
      obj.vat_exempt&.is_a?(Boolean) != false || raise("Passed value for field obj.vat_exempt is not the expected type, validation failed.")
      obj.vat_exemption_rationale&.is_a?(String) != false || raise("Passed value for field obj.vat_exemption_rationale is not the expected type, validation failed.")
      obj.vat_mode&.is_a?(Monite::VatModeEnum) != false || raise("Passed value for field obj.vat_mode is not the expected type, validation failed.")
      obj.withholding_tax_rate&.is_a?(Integer) != false || raise("Passed value for field obj.withholding_tax_rate is not the expected type, validation failed.")
    end
  end
end