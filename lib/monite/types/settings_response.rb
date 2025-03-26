# frozen_string_literal: true
require_relative "language_code_enum"
require_relative "currency_settings_output"
require_relative "reminders_settings"
require_relative "vat_mode_enum"
require_relative "payment_priority_enum"
require_relative "receivable_edit_flow"
require_relative "document_i_ds_settings"
require_relative "ocr_auto_tagging_settings_request"
require_relative "accounting_settings"
require "ostruct"
require "json"

module Monite
  class SettingsResponse
  # @return [Monite::LanguageCodeEnum] 
    attr_reader :language
  # @return [Monite::CurrencySettingsOutput] 
    attr_reader :currency
  # @return [Monite::RemindersSettings] 
    attr_reader :reminder
  # @return [Monite::VatModeEnum] Defines whether the prices of products in receivables will already include VAT
#  or not.
    attr_reader :vat_mode
  # @return [Monite::PaymentPriorityEnum] Payment preferences for entity to automate calculating suggested payment date
#  based on payment terms and entity preferences.
    attr_reader :payment_priority
  # @return [Boolean] Automatically attempt to find a corresponding purchase order for all incoming
#  payables.
    attr_reader :allow_purchase_order_autolinking
  # @return [Monite::ReceivableEditFlow] 
    attr_reader :receivable_edit_flow
  # @return [Monite::DocumentIDsSettings] 
    attr_reader :document_ids
  # @return [Array<Monite::OcrAutoTaggingSettingsRequest>] Auto tagging settings for all incoming OCR payable documents.
    attr_reader :payables_ocr_auto_tagging
  # @return [Boolean] Sets the default behavior of whether a signature is required to accept quotes.
    attr_reader :quote_signature_required
  # @return [Boolean] If enabled, the paid invoice's PDF will be in a new layout set by the user.
    attr_reader :generate_paid_invoice_pdf
  # @return [Monite::AccountingSettings] 
    attr_reader :accounting
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param language [Monite::LanguageCodeEnum] 
    # @param currency [Monite::CurrencySettingsOutput] 
    # @param reminder [Monite::RemindersSettings] 
    # @param vat_mode [Monite::VatModeEnum] Defines whether the prices of products in receivables will already include VAT
#  or not.
    # @param payment_priority [Monite::PaymentPriorityEnum] Payment preferences for entity to automate calculating suggested payment date
#  based on payment terms and entity preferences.
    # @param allow_purchase_order_autolinking [Boolean] Automatically attempt to find a corresponding purchase order for all incoming
#  payables.
    # @param receivable_edit_flow [Monite::ReceivableEditFlow] 
    # @param document_ids [Monite::DocumentIDsSettings] 
    # @param payables_ocr_auto_tagging [Array<Monite::OcrAutoTaggingSettingsRequest>] Auto tagging settings for all incoming OCR payable documents.
    # @param quote_signature_required [Boolean] Sets the default behavior of whether a signature is required to accept quotes.
    # @param generate_paid_invoice_pdf [Boolean] If enabled, the paid invoice's PDF will be in a new layout set by the user.
    # @param accounting [Monite::AccountingSettings] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::SettingsResponse]
    def initialize(language: OMIT, currency: OMIT, reminder: OMIT, vat_mode: OMIT, payment_priority: OMIT, allow_purchase_order_autolinking: OMIT, receivable_edit_flow: OMIT, document_ids: OMIT, payables_ocr_auto_tagging: OMIT, quote_signature_required: OMIT, generate_paid_invoice_pdf: OMIT, accounting: OMIT, additional_properties: nil)
      @language = language if language != OMIT
      @currency = currency if currency != OMIT
      @reminder = reminder if reminder != OMIT
      @vat_mode = vat_mode if vat_mode != OMIT
      @payment_priority = payment_priority if payment_priority != OMIT
      @allow_purchase_order_autolinking = allow_purchase_order_autolinking if allow_purchase_order_autolinking != OMIT
      @receivable_edit_flow = receivable_edit_flow if receivable_edit_flow != OMIT
      @document_ids = document_ids if document_ids != OMIT
      @payables_ocr_auto_tagging = payables_ocr_auto_tagging if payables_ocr_auto_tagging != OMIT
      @quote_signature_required = quote_signature_required if quote_signature_required != OMIT
      @generate_paid_invoice_pdf = generate_paid_invoice_pdf if generate_paid_invoice_pdf != OMIT
      @accounting = accounting if accounting != OMIT
      @additional_properties = additional_properties
      @_field_set = { "language": language, "currency": currency, "reminder": reminder, "vat_mode": vat_mode, "payment_priority": payment_priority, "allow_purchase_order_autolinking": allow_purchase_order_autolinking, "receivable_edit_flow": receivable_edit_flow, "document_ids": document_ids, "payables_ocr_auto_tagging": payables_ocr_auto_tagging, "quote_signature_required": quote_signature_required, "generate_paid_invoice_pdf": generate_paid_invoice_pdf, "accounting": accounting }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of SettingsResponse
    #
    # @param json_object [String] 
    # @return [Monite::SettingsResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      language = parsed_json["language"]
      unless parsed_json["currency"].nil?
        currency = parsed_json["currency"].to_json
        currency = Monite::CurrencySettingsOutput.from_json(json_object: currency)
      else
        currency = nil
      end
      unless parsed_json["reminder"].nil?
        reminder = parsed_json["reminder"].to_json
        reminder = Monite::RemindersSettings.from_json(json_object: reminder)
      else
        reminder = nil
      end
      vat_mode = parsed_json["vat_mode"]
      payment_priority = parsed_json["payment_priority"]
      allow_purchase_order_autolinking = parsed_json["allow_purchase_order_autolinking"]
      receivable_edit_flow = parsed_json["receivable_edit_flow"]
      unless parsed_json["document_ids"].nil?
        document_ids = parsed_json["document_ids"].to_json
        document_ids = Monite::DocumentIDsSettings.from_json(json_object: document_ids)
      else
        document_ids = nil
      end
      payables_ocr_auto_tagging = parsed_json["payables_ocr_auto_tagging"]&.map do | item |
  item = item.to_json
  Monite::OcrAutoTaggingSettingsRequest.from_json(json_object: item)
end
      quote_signature_required = parsed_json["quote_signature_required"]
      generate_paid_invoice_pdf = parsed_json["generate_paid_invoice_pdf"]
      unless parsed_json["accounting"].nil?
        accounting = parsed_json["accounting"].to_json
        accounting = Monite::AccountingSettings.from_json(json_object: accounting)
      else
        accounting = nil
      end
      new(
        language: language,
        currency: currency,
        reminder: reminder,
        vat_mode: vat_mode,
        payment_priority: payment_priority,
        allow_purchase_order_autolinking: allow_purchase_order_autolinking,
        receivable_edit_flow: receivable_edit_flow,
        document_ids: document_ids,
        payables_ocr_auto_tagging: payables_ocr_auto_tagging,
        quote_signature_required: quote_signature_required,
        generate_paid_invoice_pdf: generate_paid_invoice_pdf,
        accounting: accounting,
        additional_properties: struct
      )
    end
# Serialize an instance of SettingsResponse to a JSON object
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
      obj.language&.is_a?(Monite::LanguageCodeEnum) != false || raise("Passed value for field obj.language is not the expected type, validation failed.")
      obj.currency.nil? || Monite::CurrencySettingsOutput.validate_raw(obj: obj.currency)
      obj.reminder.nil? || Monite::RemindersSettings.validate_raw(obj: obj.reminder)
      obj.vat_mode&.is_a?(Monite::VatModeEnum) != false || raise("Passed value for field obj.vat_mode is not the expected type, validation failed.")
      obj.payment_priority&.is_a?(Monite::PaymentPriorityEnum) != false || raise("Passed value for field obj.payment_priority is not the expected type, validation failed.")
      obj.allow_purchase_order_autolinking&.is_a?(Boolean) != false || raise("Passed value for field obj.allow_purchase_order_autolinking is not the expected type, validation failed.")
      obj.receivable_edit_flow&.is_a?(Monite::ReceivableEditFlow) != false || raise("Passed value for field obj.receivable_edit_flow is not the expected type, validation failed.")
      obj.document_ids.nil? || Monite::DocumentIDsSettings.validate_raw(obj: obj.document_ids)
      obj.payables_ocr_auto_tagging&.is_a?(Array) != false || raise("Passed value for field obj.payables_ocr_auto_tagging is not the expected type, validation failed.")
      obj.quote_signature_required&.is_a?(Boolean) != false || raise("Passed value for field obj.quote_signature_required is not the expected type, validation failed.")
      obj.generate_paid_invoice_pdf&.is_a?(Boolean) != false || raise("Passed value for field obj.generate_paid_invoice_pdf is not the expected type, validation failed.")
      obj.accounting.nil? || Monite::AccountingSettings.validate_raw(obj: obj.accounting)
    end
  end
end