# frozen_string_literal: true
require "date"
require "date"
require_relative "currency_exchange_schema"
require_relative "tag_read_schema"
require "ostruct"
require "json"

module Monite
# Schema for credit note response. Includes all fields that can be returned from
#  the API.
  class CreditNoteResponse
  # @return [String] The unique identifier of the credit note
    attr_reader :id
  # @return [DateTime] Date and time when the credit note was created in the system
    attr_reader :created_at
  # @return [DateTime] Date and time of the last update to the credit note
    attr_reader :updated_at
  # @return [String] ID of the payable this credit note is based on
    attr_reader :based_on
  # @return [String] The document ID of the original payable that this credit note refers to
    attr_reader :based_on_document_id
  # @return [String] ID of the counterpart's address
    attr_reader :counterpart_address_id
  # @return [String] ID of the counterpart's bank account
    attr_reader :counterpart_bank_account_id
  # @return [String] ID of the counterpart
    attr_reader :counterpart_id
  # @return [String] ID of the counterpart's VAT registration
    attr_reader :counterpart_vat_id_id
  # @return [String] External system's user ID for the creator
    attr_reader :created_by_external_user_id
  # @return [String] Name of the external user who created the credit note
    attr_reader :created_by_external_user_name
  # @return [String] ID of the user who created the credit note
    attr_reader :created_by_user_id
  # @return [String] The currency code
    attr_reader :currency
  # @return [Monite::CurrencyExchangeSchema] 
    attr_reader :currency_exchange
  # @return [String] Description of the credit note
    attr_reader :description
  # @return [String] The credit note's unique document number
    attr_reader :document_id
  # @return [String] The ID of the entity to which the credit note belongs
    attr_reader :entity_id
  # @return [String] The id of the credit note file stored in the file saver.
    attr_reader :file_id
  # @return [String] The URL of the credit note file stored in the file saver.
    attr_reader :file_url
  # @return [String] Date when the credit note was issued
    attr_reader :issued_at
  # @return [String] ID of the OCR processing request
    attr_reader :ocr_request_id
  # @return [String] Status of OCR processing
    attr_reader :ocr_status
  # @return [String] The origin or source system of the credit note
    attr_reader :origin
  # @return [String] ID of the associated project
    attr_reader :project_id
  # @return [String] Email address of the sender
    attr_reader :sender
  # @return [String] How the data was input (ocr/user_specified)
    attr_reader :source_of_data
  # @return [String] The current status of the credit note in its lifecycle
    attr_reader :status
  # @return [Integer] The subtotal amount before taxes
    attr_reader :subtotal
  # @return [Array<Monite::TagReadSchema>] List of tags associated with this credit note
    attr_reader :tags
  # @return [Integer] The tax percentage
    attr_reader :tax
  # @return [Integer] The calculated tax amount
    attr_reader :tax_amount
  # @return [Integer] The total amount including taxes
    attr_reader :total_amount
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] The unique identifier of the credit note
    # @param created_at [DateTime] Date and time when the credit note was created in the system
    # @param updated_at [DateTime] Date and time of the last update to the credit note
    # @param based_on [String] ID of the payable this credit note is based on
    # @param based_on_document_id [String] The document ID of the original payable that this credit note refers to
    # @param counterpart_address_id [String] ID of the counterpart's address
    # @param counterpart_bank_account_id [String] ID of the counterpart's bank account
    # @param counterpart_id [String] ID of the counterpart
    # @param counterpart_vat_id_id [String] ID of the counterpart's VAT registration
    # @param created_by_external_user_id [String] External system's user ID for the creator
    # @param created_by_external_user_name [String] Name of the external user who created the credit note
    # @param created_by_user_id [String] ID of the user who created the credit note
    # @param currency [String] The currency code
    # @param currency_exchange [Monite::CurrencyExchangeSchema] 
    # @param description [String] Description of the credit note
    # @param document_id [String] The credit note's unique document number
    # @param entity_id [String] The ID of the entity to which the credit note belongs
    # @param file_id [String] The id of the credit note file stored in the file saver.
    # @param file_url [String] The URL of the credit note file stored in the file saver.
    # @param issued_at [String] Date when the credit note was issued
    # @param ocr_request_id [String] ID of the OCR processing request
    # @param ocr_status [String] Status of OCR processing
    # @param origin [String] The origin or source system of the credit note
    # @param project_id [String] ID of the associated project
    # @param sender [String] Email address of the sender
    # @param source_of_data [String] How the data was input (ocr/user_specified)
    # @param status [String] The current status of the credit note in its lifecycle
    # @param subtotal [Integer] The subtotal amount before taxes
    # @param tags [Array<Monite::TagReadSchema>] List of tags associated with this credit note
    # @param tax [Integer] The tax percentage
    # @param tax_amount [Integer] The calculated tax amount
    # @param total_amount [Integer] The total amount including taxes
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::CreditNoteResponse]
    def initialize(id:, created_at:, updated_at:, based_on: OMIT, based_on_document_id: OMIT, counterpart_address_id: OMIT, counterpart_bank_account_id: OMIT, counterpart_id: OMIT, counterpart_vat_id_id: OMIT, created_by_external_user_id: OMIT, created_by_external_user_name: OMIT, created_by_user_id: OMIT, currency: OMIT, currency_exchange: OMIT, description: OMIT, document_id: OMIT, entity_id:, file_id: OMIT, file_url: OMIT, issued_at: OMIT, ocr_request_id: OMIT, ocr_status: OMIT, origin:, project_id: OMIT, sender: OMIT, source_of_data:, status:, subtotal: OMIT, tags: OMIT, tax: OMIT, tax_amount: OMIT, total_amount: OMIT, additional_properties: nil)
      @id = id
      @created_at = created_at
      @updated_at = updated_at
      @based_on = based_on if based_on != OMIT
      @based_on_document_id = based_on_document_id if based_on_document_id != OMIT
      @counterpart_address_id = counterpart_address_id if counterpart_address_id != OMIT
      @counterpart_bank_account_id = counterpart_bank_account_id if counterpart_bank_account_id != OMIT
      @counterpart_id = counterpart_id if counterpart_id != OMIT
      @counterpart_vat_id_id = counterpart_vat_id_id if counterpart_vat_id_id != OMIT
      @created_by_external_user_id = created_by_external_user_id if created_by_external_user_id != OMIT
      @created_by_external_user_name = created_by_external_user_name if created_by_external_user_name != OMIT
      @created_by_user_id = created_by_user_id if created_by_user_id != OMIT
      @currency = currency if currency != OMIT
      @currency_exchange = currency_exchange if currency_exchange != OMIT
      @description = description if description != OMIT
      @document_id = document_id if document_id != OMIT
      @entity_id = entity_id
      @file_id = file_id if file_id != OMIT
      @file_url = file_url if file_url != OMIT
      @issued_at = issued_at if issued_at != OMIT
      @ocr_request_id = ocr_request_id if ocr_request_id != OMIT
      @ocr_status = ocr_status if ocr_status != OMIT
      @origin = origin
      @project_id = project_id if project_id != OMIT
      @sender = sender if sender != OMIT
      @source_of_data = source_of_data
      @status = status
      @subtotal = subtotal if subtotal != OMIT
      @tags = tags if tags != OMIT
      @tax = tax if tax != OMIT
      @tax_amount = tax_amount if tax_amount != OMIT
      @total_amount = total_amount if total_amount != OMIT
      @additional_properties = additional_properties
      @_field_set = { "id": id, "created_at": created_at, "updated_at": updated_at, "based_on": based_on, "based_on_document_id": based_on_document_id, "counterpart_address_id": counterpart_address_id, "counterpart_bank_account_id": counterpart_bank_account_id, "counterpart_id": counterpart_id, "counterpart_vat_id_id": counterpart_vat_id_id, "created_by_external_user_id": created_by_external_user_id, "created_by_external_user_name": created_by_external_user_name, "created_by_user_id": created_by_user_id, "currency": currency, "currency_exchange": currency_exchange, "description": description, "document_id": document_id, "entity_id": entity_id, "file_id": file_id, "file_url": file_url, "issued_at": issued_at, "ocr_request_id": ocr_request_id, "ocr_status": ocr_status, "origin": origin, "project_id": project_id, "sender": sender, "source_of_data": source_of_data, "status": status, "subtotal": subtotal, "tags": tags, "tax": tax, "tax_amount": tax_amount, "total_amount": total_amount }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of CreditNoteResponse
    #
    # @param json_object [String] 
    # @return [Monite::CreditNoteResponse]
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
      counterpart_address_id = parsed_json["counterpart_address_id"]
      counterpart_bank_account_id = parsed_json["counterpart_bank_account_id"]
      counterpart_id = parsed_json["counterpart_id"]
      counterpart_vat_id_id = parsed_json["counterpart_vat_id_id"]
      created_by_external_user_id = parsed_json["created_by_external_user_id"]
      created_by_external_user_name = parsed_json["created_by_external_user_name"]
      created_by_user_id = parsed_json["created_by_user_id"]
      currency = parsed_json["currency"]
      unless parsed_json["currency_exchange"].nil?
        currency_exchange = parsed_json["currency_exchange"].to_json
        currency_exchange = Monite::CurrencyExchangeSchema.from_json(json_object: currency_exchange)
      else
        currency_exchange = nil
      end
      description = parsed_json["description"]
      document_id = parsed_json["document_id"]
      entity_id = parsed_json["entity_id"]
      file_id = parsed_json["file_id"]
      file_url = parsed_json["file_url"]
      issued_at = parsed_json["issued_at"]
      ocr_request_id = parsed_json["ocr_request_id"]
      ocr_status = parsed_json["ocr_status"]
      origin = parsed_json["origin"]
      project_id = parsed_json["project_id"]
      sender = parsed_json["sender"]
      source_of_data = parsed_json["source_of_data"]
      status = parsed_json["status"]
      subtotal = parsed_json["subtotal"]
      tags = parsed_json["tags"]&.map do | item |
  item = item.to_json
  Monite::TagReadSchema.from_json(json_object: item)
end
      tax = parsed_json["tax"]
      tax_amount = parsed_json["tax_amount"]
      total_amount = parsed_json["total_amount"]
      new(
        id: id,
        created_at: created_at,
        updated_at: updated_at,
        based_on: based_on,
        based_on_document_id: based_on_document_id,
        counterpart_address_id: counterpart_address_id,
        counterpart_bank_account_id: counterpart_bank_account_id,
        counterpart_id: counterpart_id,
        counterpart_vat_id_id: counterpart_vat_id_id,
        created_by_external_user_id: created_by_external_user_id,
        created_by_external_user_name: created_by_external_user_name,
        created_by_user_id: created_by_user_id,
        currency: currency,
        currency_exchange: currency_exchange,
        description: description,
        document_id: document_id,
        entity_id: entity_id,
        file_id: file_id,
        file_url: file_url,
        issued_at: issued_at,
        ocr_request_id: ocr_request_id,
        ocr_status: ocr_status,
        origin: origin,
        project_id: project_id,
        sender: sender,
        source_of_data: source_of_data,
        status: status,
        subtotal: subtotal,
        tags: tags,
        tax: tax,
        tax_amount: tax_amount,
        total_amount: total_amount,
        additional_properties: struct
      )
    end
# Serialize an instance of CreditNoteResponse to a JSON object
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
      obj.counterpart_address_id&.is_a?(String) != false || raise("Passed value for field obj.counterpart_address_id is not the expected type, validation failed.")
      obj.counterpart_bank_account_id&.is_a?(String) != false || raise("Passed value for field obj.counterpart_bank_account_id is not the expected type, validation failed.")
      obj.counterpart_id&.is_a?(String) != false || raise("Passed value for field obj.counterpart_id is not the expected type, validation failed.")
      obj.counterpart_vat_id_id&.is_a?(String) != false || raise("Passed value for field obj.counterpart_vat_id_id is not the expected type, validation failed.")
      obj.created_by_external_user_id&.is_a?(String) != false || raise("Passed value for field obj.created_by_external_user_id is not the expected type, validation failed.")
      obj.created_by_external_user_name&.is_a?(String) != false || raise("Passed value for field obj.created_by_external_user_name is not the expected type, validation failed.")
      obj.created_by_user_id&.is_a?(String) != false || raise("Passed value for field obj.created_by_user_id is not the expected type, validation failed.")
      obj.currency&.is_a?(String) != false || raise("Passed value for field obj.currency is not the expected type, validation failed.")
      obj.currency_exchange.nil? || Monite::CurrencyExchangeSchema.validate_raw(obj: obj.currency_exchange)
      obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
      obj.document_id&.is_a?(String) != false || raise("Passed value for field obj.document_id is not the expected type, validation failed.")
      obj.entity_id.is_a?(String) != false || raise("Passed value for field obj.entity_id is not the expected type, validation failed.")
      obj.file_id&.is_a?(String) != false || raise("Passed value for field obj.file_id is not the expected type, validation failed.")
      obj.file_url&.is_a?(String) != false || raise("Passed value for field obj.file_url is not the expected type, validation failed.")
      obj.issued_at&.is_a?(String) != false || raise("Passed value for field obj.issued_at is not the expected type, validation failed.")
      obj.ocr_request_id&.is_a?(String) != false || raise("Passed value for field obj.ocr_request_id is not the expected type, validation failed.")
      obj.ocr_status&.is_a?(String) != false || raise("Passed value for field obj.ocr_status is not the expected type, validation failed.")
      obj.origin.is_a?(String) != false || raise("Passed value for field obj.origin is not the expected type, validation failed.")
      obj.project_id&.is_a?(String) != false || raise("Passed value for field obj.project_id is not the expected type, validation failed.")
      obj.sender&.is_a?(String) != false || raise("Passed value for field obj.sender is not the expected type, validation failed.")
      obj.source_of_data.is_a?(String) != false || raise("Passed value for field obj.source_of_data is not the expected type, validation failed.")
      obj.status.is_a?(String) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
      obj.subtotal&.is_a?(Integer) != false || raise("Passed value for field obj.subtotal is not the expected type, validation failed.")
      obj.tags&.is_a?(Array) != false || raise("Passed value for field obj.tags is not the expected type, validation failed.")
      obj.tax&.is_a?(Integer) != false || raise("Passed value for field obj.tax is not the expected type, validation failed.")
      obj.tax_amount&.is_a?(Integer) != false || raise("Passed value for field obj.tax_amount is not the expected type, validation failed.")
      obj.total_amount&.is_a?(Integer) != false || raise("Passed value for field obj.total_amount is not the expected type, validation failed.")
    end
  end
end