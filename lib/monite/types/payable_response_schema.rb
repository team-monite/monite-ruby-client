# frozen_string_literal: true
require "date"
require "date"
require_relative "counterpart_raw_data"
require_relative "payable_credit_note_data"
require_relative "currency_enum"
require_relative "currency_exchange_schema_2"
require_relative "file_schema_2"
require_relative "ocr_status_enum"
require_relative "payable_response_schema_other_extracted_data"
require "date"
require_relative "payable_origin_enum"
require_relative "payable_payment_terms_create_payload"
require_relative "source_of_payable_data_enum"
require_relative "payable_state_enum"
require_relative "suggested_payment_term"
require_relative "tag_read_schema"
require "ostruct"
require "json"

module Monite
# Represents an Accounts Payable document received from a vendor or supplier.
  class PayableResponseSchema
  # @return [String] A unique ID assigned to this payable.
    attr_reader :id
  # @return [DateTime] UTC date and time when this payable was created. Timestamps follow the [ISO
#  8601](https://en.wikipedia.org/wiki/ISO_8601) format.
    attr_reader :created_at
  # @return [DateTime] UTC date and time when this payable was last updated. Timestamps follow the [ISO
#  8601](https://en.wikipedia.org/wiki/ISO_8601) format.
    attr_reader :updated_at
  # @return [Integer] How much is left to be paid on the invoice (in minor units).
    attr_reader :amount_due
  # @return [Integer] How much was paid on the invoice (in minor units).
    attr_reader :amount_paid
  # @return [Integer] How much is left to be paid on the invoice (in minor units) with discounts from
#  payment terms.
    attr_reader :amount_to_pay
  # @return [String] Id of existing approval policy that applies to this payable, if any. A policy is
#  applied if the payable matches the policy trigger conditions.
    attr_reader :approval_policy_id
  # @return [Monite::CounterpartRawData] Object representing de-normalized counterpart data. Filled at the moment of
#  invoice submitting for approval or payment.
    attr_reader :counterpart
  # @return [String] The ID of counterpart address object stored in counterparts service
    attr_reader :counterpart_address_id
  # @return [String] The ID of counterpart bank account object stored in counterparts service
    attr_reader :counterpart_bank_account_id
  # @return [String] The ID of the counterpart object that represents the vendor or supplier.
    attr_reader :counterpart_id
  # @return [Monite::CounterpartRawData] Object representing counterpart data which was extracted by OCR. Used for
#  informational purposes.
    attr_reader :counterpart_raw_data
  # @return [String] The ID of counterpart VAT ID object stored in counterparts service
    attr_reader :counterpart_vat_id_id
  # @return [String] The ID of the role that the entity user who created this payable had at that
#  time. If the payable was created using a partner access token, the value is
#  `null`.
    attr_reader :created_by_role_id
  # @return [Array<Monite::PayableCreditNoteData>] The list of linked credit notes of the payable.
    attr_reader :credit_notes
  # @return [Monite::CurrencyEnum] The [currency code](https://docs.monite.com/references/currencies) of the
#  currency used in the payable.
    attr_reader :currency
  # @return [Monite::CurrencyExchangeSchema2] 
    attr_reader :currency_exchange
  # @return [String] An arbitrary description of this payable.
    attr_reader :description
  # @return [Integer] The value of the additional discount that will be applied to the total amount.
#  in [minor units](https://docs.monite.com/references/currencies#minor-units). For
#  example, $12.50 is represented as 1250.
    attr_reader :discount
  # @return [String] A unique invoice number assigned by the invoice issuer for payment tracking
#  purposes. This is different from `id` which is an internal ID created
#  automatically by Monite.
    attr_reader :document_id
  # @return [String] The date by which the payable must be paid, in the YYYY-MM-DD format. If the
#  payable specifies payment terms with early payment discounts, this is the final
#  payment date.
    attr_reader :due_date
  # @return [String] The ID of the entity to which the payable was issued.
    attr_reader :entity_id
  # @return [Monite::FileSchema2] The original file from which this payable was created.
    attr_reader :file
  # @return [String] File id to retrieve file info from file saver.
    attr_reader :file_id
  # @return [String] The date when the payable was issued, in the YYYY-MM-DD format.
    attr_reader :issued_at
  # @return [String] The ID of the entity user who marked this document as paid.
    attr_reader :marked_as_paid_by_entity_user_id
  # @return [String] An arbitrary comment that describes how and when this payable was paid.
    attr_reader :marked_as_paid_with_comment
  # @return [String] Id of OCR request to match asynchronous result of processing payable.
    attr_reader :ocr_request_id
  # @return [Monite::OcrStatusEnum] The status of the data recognition process using OCR. The 'processing' status
#  means that the data recognition is in progress and the user needs to wait for
#  the data enrichment. The 'error' status indicates that some error occurred on
#  the OCR side and the user can fill in the data manually. The 'success' status
#  means the data recognition has been successfully completed, after which the user
#  can check the data if desired and enrich or correct it.
    attr_reader :ocr_status
  # @return [Monite::PayableResponseSchemaOtherExtractedData] Data extracted from the uploaded payable by OCR.
    attr_reader :other_extracted_data
  # @return [DateTime] The date by which the payable was paid
    attr_reader :paid_at
  # @return [Hash{String => Object}] Metadata for partner needs
    attr_reader :partner_metadata
  # @return [Monite::PayableOriginEnum] Specifies how this payable was created in Monite: `upload` - created via an API
#  call, `email` - sent via email to the entity's mailbox.
    attr_reader :payable_origin
  # @return [Monite::PayablePaymentTermsCreatePayload] The number of days to pay with potential discount for options shorter than
#  due_date
    attr_reader :payment_terms
  # @return [String] Project ID of a payable.
    attr_reader :project_id
  # @return [String] The identifier of the purchase order to which this payable belongs.
    attr_reader :purchase_order_id
  # @return [String] The email address from which the invoice was sent to the entity.
    attr_reader :sender
  # @return [Monite::SourceOfPayableDataEnum] Specifies how the property values of this payable were provided: `ocr` - Monite
#  OCR service extracted the values from the provided PDF or image file,
#  `user_specified` - values were added or updated via an API call.
    attr_reader :source_of_payable_data
  # @return [Monite::PayableStateEnum] The [status](https://docs.monite.com/accounts-payable/payables/index) of the
#  payable.
    attr_reader :status
  # @return [Integer] The subtotal amount to be paid, in [minor
#  units](https://docs.monite.com/references/currencies#minor-units). For example,
#  $12.50 is represented as 1250.
    attr_reader :subtotal
  # @return [Monite::SuggestedPaymentTerm] The suggested date and corresponding discount in which payable could be paid.
#  The date is in the YYYY-MM-DD format. The discount is calculated as X * (10^-4)
#  - for example, 100 is 1%, 25 is 0,25%, 10000 is 100 %. Date varies depending on
#  the payment terms and may even be equal to the due date with discount 0.
    attr_reader :suggested_payment_term
  # @return [Array<Monite::TagReadSchema>] A list of user-defined tags (labels) assigned to this payable. Tags can be used
#  to trigger a specific approval policy for this payable.
    attr_reader :tags
  # @return [Integer] Registered tax percentage applied for a service price in minor units, e.g. 200
#  means 2%, 1050 means 10.5%.
    attr_reader :tax
  # @return [Integer] Tax amount in [minor
#  units](https://docs.monite.com/references/currencies#minor-units). For example,
#  $12.50 is represented as 1250.
    attr_reader :tax_amount
  # @return [Integer] The total amount to be paid, in [minor
#  units](https://docs.monite.com/references/currencies#minor-units). For example,
#  $12.50 is represented as 1250.
    attr_reader :total_amount
  # @return [Integer] The total price of the payable in [minor
#  units](https://docs.monite.com/references/currencies#minor-units), excluding all
#  issued credit notes.
    attr_reader :total_amount_with_credit_notes
  # @return [String] 
    attr_reader :was_created_by_user_id
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] A unique ID assigned to this payable.
    # @param created_at [DateTime] UTC date and time when this payable was created. Timestamps follow the [ISO
#  8601](https://en.wikipedia.org/wiki/ISO_8601) format.
    # @param updated_at [DateTime] UTC date and time when this payable was last updated. Timestamps follow the [ISO
#  8601](https://en.wikipedia.org/wiki/ISO_8601) format.
    # @param amount_due [Integer] How much is left to be paid on the invoice (in minor units).
    # @param amount_paid [Integer] How much was paid on the invoice (in minor units).
    # @param amount_to_pay [Integer] How much is left to be paid on the invoice (in minor units) with discounts from
#  payment terms.
    # @param approval_policy_id [String] Id of existing approval policy that applies to this payable, if any. A policy is
#  applied if the payable matches the policy trigger conditions.
    # @param counterpart [Monite::CounterpartRawData] Object representing de-normalized counterpart data. Filled at the moment of
#  invoice submitting for approval or payment.
    # @param counterpart_address_id [String] The ID of counterpart address object stored in counterparts service
    # @param counterpart_bank_account_id [String] The ID of counterpart bank account object stored in counterparts service
    # @param counterpart_id [String] The ID of the counterpart object that represents the vendor or supplier.
    # @param counterpart_raw_data [Monite::CounterpartRawData] Object representing counterpart data which was extracted by OCR. Used for
#  informational purposes.
    # @param counterpart_vat_id_id [String] The ID of counterpart VAT ID object stored in counterparts service
    # @param created_by_role_id [String] The ID of the role that the entity user who created this payable had at that
#  time. If the payable was created using a partner access token, the value is
#  `null`.
    # @param credit_notes [Array<Monite::PayableCreditNoteData>] The list of linked credit notes of the payable.
    # @param currency [Monite::CurrencyEnum] The [currency code](https://docs.monite.com/references/currencies) of the
#  currency used in the payable.
    # @param currency_exchange [Monite::CurrencyExchangeSchema2] 
    # @param description [String] An arbitrary description of this payable.
    # @param discount [Integer] The value of the additional discount that will be applied to the total amount.
#  in [minor units](https://docs.monite.com/references/currencies#minor-units). For
#  example, $12.50 is represented as 1250.
    # @param document_id [String] A unique invoice number assigned by the invoice issuer for payment tracking
#  purposes. This is different from `id` which is an internal ID created
#  automatically by Monite.
    # @param due_date [String] The date by which the payable must be paid, in the YYYY-MM-DD format. If the
#  payable specifies payment terms with early payment discounts, this is the final
#  payment date.
    # @param entity_id [String] The ID of the entity to which the payable was issued.
    # @param file [Monite::FileSchema2] The original file from which this payable was created.
    # @param file_id [String] File id to retrieve file info from file saver.
    # @param issued_at [String] The date when the payable was issued, in the YYYY-MM-DD format.
    # @param marked_as_paid_by_entity_user_id [String] The ID of the entity user who marked this document as paid.
    # @param marked_as_paid_with_comment [String] An arbitrary comment that describes how and when this payable was paid.
    # @param ocr_request_id [String] Id of OCR request to match asynchronous result of processing payable.
    # @param ocr_status [Monite::OcrStatusEnum] The status of the data recognition process using OCR. The 'processing' status
#  means that the data recognition is in progress and the user needs to wait for
#  the data enrichment. The 'error' status indicates that some error occurred on
#  the OCR side and the user can fill in the data manually. The 'success' status
#  means the data recognition has been successfully completed, after which the user
#  can check the data if desired and enrich or correct it.
    # @param other_extracted_data [Monite::PayableResponseSchemaOtherExtractedData] Data extracted from the uploaded payable by OCR.
    # @param paid_at [DateTime] The date by which the payable was paid
    # @param partner_metadata [Hash{String => Object}] Metadata for partner needs
    # @param payable_origin [Monite::PayableOriginEnum] Specifies how this payable was created in Monite: `upload` - created via an API
#  call, `email` - sent via email to the entity's mailbox.
    # @param payment_terms [Monite::PayablePaymentTermsCreatePayload] The number of days to pay with potential discount for options shorter than
#  due_date
    # @param project_id [String] Project ID of a payable.
    # @param purchase_order_id [String] The identifier of the purchase order to which this payable belongs.
    # @param sender [String] The email address from which the invoice was sent to the entity.
    # @param source_of_payable_data [Monite::SourceOfPayableDataEnum] Specifies how the property values of this payable were provided: `ocr` - Monite
#  OCR service extracted the values from the provided PDF or image file,
#  `user_specified` - values were added or updated via an API call.
    # @param status [Monite::PayableStateEnum] The [status](https://docs.monite.com/accounts-payable/payables/index) of the
#  payable.
    # @param subtotal [Integer] The subtotal amount to be paid, in [minor
#  units](https://docs.monite.com/references/currencies#minor-units). For example,
#  $12.50 is represented as 1250.
    # @param suggested_payment_term [Monite::SuggestedPaymentTerm] The suggested date and corresponding discount in which payable could be paid.
#  The date is in the YYYY-MM-DD format. The discount is calculated as X * (10^-4)
#  - for example, 100 is 1%, 25 is 0,25%, 10000 is 100 %. Date varies depending on
#  the payment terms and may even be equal to the due date with discount 0.
    # @param tags [Array<Monite::TagReadSchema>] A list of user-defined tags (labels) assigned to this payable. Tags can be used
#  to trigger a specific approval policy for this payable.
    # @param tax [Integer] Registered tax percentage applied for a service price in minor units, e.g. 200
#  means 2%, 1050 means 10.5%.
    # @param tax_amount [Integer] Tax amount in [minor
#  units](https://docs.monite.com/references/currencies#minor-units). For example,
#  $12.50 is represented as 1250.
    # @param total_amount [Integer] The total amount to be paid, in [minor
#  units](https://docs.monite.com/references/currencies#minor-units). For example,
#  $12.50 is represented as 1250.
    # @param total_amount_with_credit_notes [Integer] The total price of the payable in [minor
#  units](https://docs.monite.com/references/currencies#minor-units), excluding all
#  issued credit notes.
    # @param was_created_by_user_id [String] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::PayableResponseSchema]
    def initialize(id:, created_at:, updated_at:, amount_due: OMIT, amount_paid: OMIT, amount_to_pay: OMIT, approval_policy_id: OMIT, counterpart: OMIT, counterpart_address_id: OMIT, counterpart_bank_account_id: OMIT, counterpart_id: OMIT, counterpart_raw_data: OMIT, counterpart_vat_id_id: OMIT, created_by_role_id: OMIT, credit_notes:, currency: OMIT, currency_exchange: OMIT, description: OMIT, discount: OMIT, document_id: OMIT, due_date: OMIT, entity_id:, file: OMIT, file_id: OMIT, issued_at: OMIT, marked_as_paid_by_entity_user_id: OMIT, marked_as_paid_with_comment: OMIT, ocr_request_id: OMIT, ocr_status: OMIT, other_extracted_data: OMIT, paid_at: OMIT, partner_metadata: OMIT, payable_origin:, payment_terms: OMIT, project_id: OMIT, purchase_order_id: OMIT, sender: OMIT, source_of_payable_data:, status:, subtotal: OMIT, suggested_payment_term: OMIT, tags: OMIT, tax: OMIT, tax_amount: OMIT, total_amount: OMIT, total_amount_with_credit_notes: OMIT, was_created_by_user_id: OMIT, additional_properties: nil)
      @id = id
      @created_at = created_at
      @updated_at = updated_at
      @amount_due = amount_due if amount_due != OMIT
      @amount_paid = amount_paid if amount_paid != OMIT
      @amount_to_pay = amount_to_pay if amount_to_pay != OMIT
      @approval_policy_id = approval_policy_id if approval_policy_id != OMIT
      @counterpart = counterpart if counterpart != OMIT
      @counterpart_address_id = counterpart_address_id if counterpart_address_id != OMIT
      @counterpart_bank_account_id = counterpart_bank_account_id if counterpart_bank_account_id != OMIT
      @counterpart_id = counterpart_id if counterpart_id != OMIT
      @counterpart_raw_data = counterpart_raw_data if counterpart_raw_data != OMIT
      @counterpart_vat_id_id = counterpart_vat_id_id if counterpart_vat_id_id != OMIT
      @created_by_role_id = created_by_role_id if created_by_role_id != OMIT
      @credit_notes = credit_notes
      @currency = currency if currency != OMIT
      @currency_exchange = currency_exchange if currency_exchange != OMIT
      @description = description if description != OMIT
      @discount = discount if discount != OMIT
      @document_id = document_id if document_id != OMIT
      @due_date = due_date if due_date != OMIT
      @entity_id = entity_id
      @file = file if file != OMIT
      @file_id = file_id if file_id != OMIT
      @issued_at = issued_at if issued_at != OMIT
      @marked_as_paid_by_entity_user_id = marked_as_paid_by_entity_user_id if marked_as_paid_by_entity_user_id != OMIT
      @marked_as_paid_with_comment = marked_as_paid_with_comment if marked_as_paid_with_comment != OMIT
      @ocr_request_id = ocr_request_id if ocr_request_id != OMIT
      @ocr_status = ocr_status if ocr_status != OMIT
      @other_extracted_data = other_extracted_data if other_extracted_data != OMIT
      @paid_at = paid_at if paid_at != OMIT
      @partner_metadata = partner_metadata if partner_metadata != OMIT
      @payable_origin = payable_origin
      @payment_terms = payment_terms if payment_terms != OMIT
      @project_id = project_id if project_id != OMIT
      @purchase_order_id = purchase_order_id if purchase_order_id != OMIT
      @sender = sender if sender != OMIT
      @source_of_payable_data = source_of_payable_data
      @status = status
      @subtotal = subtotal if subtotal != OMIT
      @suggested_payment_term = suggested_payment_term if suggested_payment_term != OMIT
      @tags = tags if tags != OMIT
      @tax = tax if tax != OMIT
      @tax_amount = tax_amount if tax_amount != OMIT
      @total_amount = total_amount if total_amount != OMIT
      @total_amount_with_credit_notes = total_amount_with_credit_notes if total_amount_with_credit_notes != OMIT
      @was_created_by_user_id = was_created_by_user_id if was_created_by_user_id != OMIT
      @additional_properties = additional_properties
      @_field_set = { "id": id, "created_at": created_at, "updated_at": updated_at, "amount_due": amount_due, "amount_paid": amount_paid, "amount_to_pay": amount_to_pay, "approval_policy_id": approval_policy_id, "counterpart": counterpart, "counterpart_address_id": counterpart_address_id, "counterpart_bank_account_id": counterpart_bank_account_id, "counterpart_id": counterpart_id, "counterpart_raw_data": counterpart_raw_data, "counterpart_vat_id_id": counterpart_vat_id_id, "created_by_role_id": created_by_role_id, "credit_notes": credit_notes, "currency": currency, "currency_exchange": currency_exchange, "description": description, "discount": discount, "document_id": document_id, "due_date": due_date, "entity_id": entity_id, "file": file, "file_id": file_id, "issued_at": issued_at, "marked_as_paid_by_entity_user_id": marked_as_paid_by_entity_user_id, "marked_as_paid_with_comment": marked_as_paid_with_comment, "ocr_request_id": ocr_request_id, "ocr_status": ocr_status, "other_extracted_data": other_extracted_data, "paid_at": paid_at, "partner_metadata": partner_metadata, "payable_origin": payable_origin, "payment_terms": payment_terms, "project_id": project_id, "purchase_order_id": purchase_order_id, "sender": sender, "source_of_payable_data": source_of_payable_data, "status": status, "subtotal": subtotal, "suggested_payment_term": suggested_payment_term, "tags": tags, "tax": tax, "tax_amount": tax_amount, "total_amount": total_amount, "total_amount_with_credit_notes": total_amount_with_credit_notes, "was_created_by_user_id": was_created_by_user_id }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of PayableResponseSchema
    #
    # @param json_object [String] 
    # @return [Monite::PayableResponseSchema]
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
      amount_due = parsed_json["amount_due"]
      amount_paid = parsed_json["amount_paid"]
      amount_to_pay = parsed_json["amount_to_pay"]
      approval_policy_id = parsed_json["approval_policy_id"]
      unless parsed_json["counterpart"].nil?
        counterpart = parsed_json["counterpart"].to_json
        counterpart = Monite::CounterpartRawData.from_json(json_object: counterpart)
      else
        counterpart = nil
      end
      counterpart_address_id = parsed_json["counterpart_address_id"]
      counterpart_bank_account_id = parsed_json["counterpart_bank_account_id"]
      counterpart_id = parsed_json["counterpart_id"]
      unless parsed_json["counterpart_raw_data"].nil?
        counterpart_raw_data = parsed_json["counterpart_raw_data"].to_json
        counterpart_raw_data = Monite::CounterpartRawData.from_json(json_object: counterpart_raw_data)
      else
        counterpart_raw_data = nil
      end
      counterpart_vat_id_id = parsed_json["counterpart_vat_id_id"]
      created_by_role_id = parsed_json["created_by_role_id"]
      credit_notes = parsed_json["credit_notes"]&.map do | item |
  item = item.to_json
  Monite::PayableCreditNoteData.from_json(json_object: item)
end
      currency = parsed_json["currency"]
      unless parsed_json["currency_exchange"].nil?
        currency_exchange = parsed_json["currency_exchange"].to_json
        currency_exchange = Monite::CurrencyExchangeSchema2.from_json(json_object: currency_exchange)
      else
        currency_exchange = nil
      end
      description = parsed_json["description"]
      discount = parsed_json["discount"]
      document_id = parsed_json["document_id"]
      due_date = parsed_json["due_date"]
      entity_id = parsed_json["entity_id"]
      unless parsed_json["file"].nil?
        file = parsed_json["file"].to_json
        file = Monite::FileSchema2.from_json(json_object: file)
      else
        file = nil
      end
      file_id = parsed_json["file_id"]
      issued_at = parsed_json["issued_at"]
      marked_as_paid_by_entity_user_id = parsed_json["marked_as_paid_by_entity_user_id"]
      marked_as_paid_with_comment = parsed_json["marked_as_paid_with_comment"]
      ocr_request_id = parsed_json["ocr_request_id"]
      ocr_status = parsed_json["ocr_status"]
      unless parsed_json["other_extracted_data"].nil?
        other_extracted_data = parsed_json["other_extracted_data"].to_json
        other_extracted_data = Monite::PayableResponseSchemaOtherExtractedData.from_json(json_object: other_extracted_data)
      else
        other_extracted_data = nil
      end
      paid_at = unless parsed_json["paid_at"].nil?
  DateTime.parse(parsed_json["paid_at"])
else
  nil
end
      partner_metadata = parsed_json["partner_metadata"]
      payable_origin = parsed_json["payable_origin"]
      unless parsed_json["payment_terms"].nil?
        payment_terms = parsed_json["payment_terms"].to_json
        payment_terms = Monite::PayablePaymentTermsCreatePayload.from_json(json_object: payment_terms)
      else
        payment_terms = nil
      end
      project_id = parsed_json["project_id"]
      purchase_order_id = parsed_json["purchase_order_id"]
      sender = parsed_json["sender"]
      source_of_payable_data = parsed_json["source_of_payable_data"]
      status = parsed_json["status"]
      subtotal = parsed_json["subtotal"]
      unless parsed_json["suggested_payment_term"].nil?
        suggested_payment_term = parsed_json["suggested_payment_term"].to_json
        suggested_payment_term = Monite::SuggestedPaymentTerm.from_json(json_object: suggested_payment_term)
      else
        suggested_payment_term = nil
      end
      tags = parsed_json["tags"]&.map do | item |
  item = item.to_json
  Monite::TagReadSchema.from_json(json_object: item)
end
      tax = parsed_json["tax"]
      tax_amount = parsed_json["tax_amount"]
      total_amount = parsed_json["total_amount"]
      total_amount_with_credit_notes = parsed_json["total_amount_with_credit_notes"]
      was_created_by_user_id = parsed_json["was_created_by_user_id"]
      new(
        id: id,
        created_at: created_at,
        updated_at: updated_at,
        amount_due: amount_due,
        amount_paid: amount_paid,
        amount_to_pay: amount_to_pay,
        approval_policy_id: approval_policy_id,
        counterpart: counterpart,
        counterpart_address_id: counterpart_address_id,
        counterpart_bank_account_id: counterpart_bank_account_id,
        counterpart_id: counterpart_id,
        counterpart_raw_data: counterpart_raw_data,
        counterpart_vat_id_id: counterpart_vat_id_id,
        created_by_role_id: created_by_role_id,
        credit_notes: credit_notes,
        currency: currency,
        currency_exchange: currency_exchange,
        description: description,
        discount: discount,
        document_id: document_id,
        due_date: due_date,
        entity_id: entity_id,
        file: file,
        file_id: file_id,
        issued_at: issued_at,
        marked_as_paid_by_entity_user_id: marked_as_paid_by_entity_user_id,
        marked_as_paid_with_comment: marked_as_paid_with_comment,
        ocr_request_id: ocr_request_id,
        ocr_status: ocr_status,
        other_extracted_data: other_extracted_data,
        paid_at: paid_at,
        partner_metadata: partner_metadata,
        payable_origin: payable_origin,
        payment_terms: payment_terms,
        project_id: project_id,
        purchase_order_id: purchase_order_id,
        sender: sender,
        source_of_payable_data: source_of_payable_data,
        status: status,
        subtotal: subtotal,
        suggested_payment_term: suggested_payment_term,
        tags: tags,
        tax: tax,
        tax_amount: tax_amount,
        total_amount: total_amount,
        total_amount_with_credit_notes: total_amount_with_credit_notes,
        was_created_by_user_id: was_created_by_user_id,
        additional_properties: struct
      )
    end
# Serialize an instance of PayableResponseSchema to a JSON object
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
      obj.amount_due&.is_a?(Integer) != false || raise("Passed value for field obj.amount_due is not the expected type, validation failed.")
      obj.amount_paid&.is_a?(Integer) != false || raise("Passed value for field obj.amount_paid is not the expected type, validation failed.")
      obj.amount_to_pay&.is_a?(Integer) != false || raise("Passed value for field obj.amount_to_pay is not the expected type, validation failed.")
      obj.approval_policy_id&.is_a?(String) != false || raise("Passed value for field obj.approval_policy_id is not the expected type, validation failed.")
      obj.counterpart.nil? || Monite::CounterpartRawData.validate_raw(obj: obj.counterpart)
      obj.counterpart_address_id&.is_a?(String) != false || raise("Passed value for field obj.counterpart_address_id is not the expected type, validation failed.")
      obj.counterpart_bank_account_id&.is_a?(String) != false || raise("Passed value for field obj.counterpart_bank_account_id is not the expected type, validation failed.")
      obj.counterpart_id&.is_a?(String) != false || raise("Passed value for field obj.counterpart_id is not the expected type, validation failed.")
      obj.counterpart_raw_data.nil? || Monite::CounterpartRawData.validate_raw(obj: obj.counterpart_raw_data)
      obj.counterpart_vat_id_id&.is_a?(String) != false || raise("Passed value for field obj.counterpart_vat_id_id is not the expected type, validation failed.")
      obj.created_by_role_id&.is_a?(String) != false || raise("Passed value for field obj.created_by_role_id is not the expected type, validation failed.")
      obj.credit_notes.is_a?(Array) != false || raise("Passed value for field obj.credit_notes is not the expected type, validation failed.")
      obj.currency&.is_a?(Monite::CurrencyEnum) != false || raise("Passed value for field obj.currency is not the expected type, validation failed.")
      obj.currency_exchange.nil? || Monite::CurrencyExchangeSchema2.validate_raw(obj: obj.currency_exchange)
      obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
      obj.discount&.is_a?(Integer) != false || raise("Passed value for field obj.discount is not the expected type, validation failed.")
      obj.document_id&.is_a?(String) != false || raise("Passed value for field obj.document_id is not the expected type, validation failed.")
      obj.due_date&.is_a?(String) != false || raise("Passed value for field obj.due_date is not the expected type, validation failed.")
      obj.entity_id.is_a?(String) != false || raise("Passed value for field obj.entity_id is not the expected type, validation failed.")
      obj.file.nil? || Monite::FileSchema2.validate_raw(obj: obj.file)
      obj.file_id&.is_a?(String) != false || raise("Passed value for field obj.file_id is not the expected type, validation failed.")
      obj.issued_at&.is_a?(String) != false || raise("Passed value for field obj.issued_at is not the expected type, validation failed.")
      obj.marked_as_paid_by_entity_user_id&.is_a?(String) != false || raise("Passed value for field obj.marked_as_paid_by_entity_user_id is not the expected type, validation failed.")
      obj.marked_as_paid_with_comment&.is_a?(String) != false || raise("Passed value for field obj.marked_as_paid_with_comment is not the expected type, validation failed.")
      obj.ocr_request_id&.is_a?(String) != false || raise("Passed value for field obj.ocr_request_id is not the expected type, validation failed.")
      obj.ocr_status&.is_a?(Monite::OcrStatusEnum) != false || raise("Passed value for field obj.ocr_status is not the expected type, validation failed.")
      obj.other_extracted_data.nil? || Monite::PayableResponseSchemaOtherExtractedData.validate_raw(obj: obj.other_extracted_data)
      obj.paid_at&.is_a?(DateTime) != false || raise("Passed value for field obj.paid_at is not the expected type, validation failed.")
      obj.partner_metadata&.is_a?(Hash) != false || raise("Passed value for field obj.partner_metadata is not the expected type, validation failed.")
      obj.payable_origin.is_a?(Monite::PayableOriginEnum) != false || raise("Passed value for field obj.payable_origin is not the expected type, validation failed.")
      obj.payment_terms.nil? || Monite::PayablePaymentTermsCreatePayload.validate_raw(obj: obj.payment_terms)
      obj.project_id&.is_a?(String) != false || raise("Passed value for field obj.project_id is not the expected type, validation failed.")
      obj.purchase_order_id&.is_a?(String) != false || raise("Passed value for field obj.purchase_order_id is not the expected type, validation failed.")
      obj.sender&.is_a?(String) != false || raise("Passed value for field obj.sender is not the expected type, validation failed.")
      obj.source_of_payable_data.is_a?(Monite::SourceOfPayableDataEnum) != false || raise("Passed value for field obj.source_of_payable_data is not the expected type, validation failed.")
      obj.status.is_a?(Monite::PayableStateEnum) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
      obj.subtotal&.is_a?(Integer) != false || raise("Passed value for field obj.subtotal is not the expected type, validation failed.")
      obj.suggested_payment_term.nil? || Monite::SuggestedPaymentTerm.validate_raw(obj: obj.suggested_payment_term)
      obj.tags&.is_a?(Array) != false || raise("Passed value for field obj.tags is not the expected type, validation failed.")
      obj.tax&.is_a?(Integer) != false || raise("Passed value for field obj.tax is not the expected type, validation failed.")
      obj.tax_amount&.is_a?(Integer) != false || raise("Passed value for field obj.tax_amount is not the expected type, validation failed.")
      obj.total_amount&.is_a?(Integer) != false || raise("Passed value for field obj.total_amount is not the expected type, validation failed.")
      obj.total_amount_with_credit_notes&.is_a?(Integer) != false || raise("Passed value for field obj.total_amount_with_credit_notes is not the expected type, validation failed.")
      obj.was_created_by_user_id&.is_a?(String) != false || raise("Passed value for field obj.was_created_by_user_id is not the expected type, validation failed.")
    end
  end
end