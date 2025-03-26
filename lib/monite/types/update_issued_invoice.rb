# frozen_string_literal: true
require_relative "update_issued_invoice_entity"
require_relative "receivable_entity_address_schema"
require "ostruct"
require "json"

module Monite
  class UpdateIssuedInvoice
  # @return [String] Unique ID of the counterpart contact.
    attr_reader :contact_id
  # @return [String] Id of a new or updated counterpart
    attr_reader :counterpart_id
  # @return [String] Counterpart VAT ID id
    attr_reader :counterpart_vat_id_id
  # @return [Monite::UpdateIssuedInvoiceEntity] 
    attr_reader :entity
  # @return [Monite::ReceivableEntityAddressSchema] 
    attr_reader :entity_address
  # @return [String] Entity VAT ID id
    attr_reader :entity_vat_id_id
  # @return [String] The date when the goods are shipped or the service is provided. Can be a
#  current, past, or future date.
    attr_reader :fulfillment_date
  # @return [String] A note with additional information for a receivable
    attr_reader :memo
  # @return [String] 
    attr_reader :overdue_reminder_id
  # @return [Hash{String => Object}] Metadata for partner needs
    attr_reader :partner_metadata
  # @return [String] 
    attr_reader :payment_reminder_id
  # @return [String] 
    attr_reader :payment_terms_id
  # @return [String] A project related to current receivable
    attr_reader :project_id
  # @return [Array<String>] A list of IDs of user-defined tags (labels) assigned to this receivable.
    attr_reader :tag_ids
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param contact_id [String] Unique ID of the counterpart contact.
    # @param counterpart_id [String] Id of a new or updated counterpart
    # @param counterpart_vat_id_id [String] Counterpart VAT ID id
    # @param entity [Monite::UpdateIssuedInvoiceEntity] 
    # @param entity_address [Monite::ReceivableEntityAddressSchema] 
    # @param entity_vat_id_id [String] Entity VAT ID id
    # @param fulfillment_date [String] The date when the goods are shipped or the service is provided. Can be a
#  current, past, or future date.
    # @param memo [String] A note with additional information for a receivable
    # @param overdue_reminder_id [String] 
    # @param partner_metadata [Hash{String => Object}] Metadata for partner needs
    # @param payment_reminder_id [String] 
    # @param payment_terms_id [String] 
    # @param project_id [String] A project related to current receivable
    # @param tag_ids [Array<String>] A list of IDs of user-defined tags (labels) assigned to this receivable.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::UpdateIssuedInvoice]
    def initialize(contact_id: OMIT, counterpart_id: OMIT, counterpart_vat_id_id: OMIT, entity: OMIT, entity_address: OMIT, entity_vat_id_id: OMIT, fulfillment_date: OMIT, memo: OMIT, overdue_reminder_id: OMIT, partner_metadata: OMIT, payment_reminder_id: OMIT, payment_terms_id: OMIT, project_id: OMIT, tag_ids: OMIT, additional_properties: nil)
      @contact_id = contact_id if contact_id != OMIT
      @counterpart_id = counterpart_id if counterpart_id != OMIT
      @counterpart_vat_id_id = counterpart_vat_id_id if counterpart_vat_id_id != OMIT
      @entity = entity if entity != OMIT
      @entity_address = entity_address if entity_address != OMIT
      @entity_vat_id_id = entity_vat_id_id if entity_vat_id_id != OMIT
      @fulfillment_date = fulfillment_date if fulfillment_date != OMIT
      @memo = memo if memo != OMIT
      @overdue_reminder_id = overdue_reminder_id if overdue_reminder_id != OMIT
      @partner_metadata = partner_metadata if partner_metadata != OMIT
      @payment_reminder_id = payment_reminder_id if payment_reminder_id != OMIT
      @payment_terms_id = payment_terms_id if payment_terms_id != OMIT
      @project_id = project_id if project_id != OMIT
      @tag_ids = tag_ids if tag_ids != OMIT
      @additional_properties = additional_properties
      @_field_set = { "contact_id": contact_id, "counterpart_id": counterpart_id, "counterpart_vat_id_id": counterpart_vat_id_id, "entity": entity, "entity_address": entity_address, "entity_vat_id_id": entity_vat_id_id, "fulfillment_date": fulfillment_date, "memo": memo, "overdue_reminder_id": overdue_reminder_id, "partner_metadata": partner_metadata, "payment_reminder_id": payment_reminder_id, "payment_terms_id": payment_terms_id, "project_id": project_id, "tag_ids": tag_ids }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of UpdateIssuedInvoice
    #
    # @param json_object [String] 
    # @return [Monite::UpdateIssuedInvoice]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      contact_id = parsed_json["contact_id"]
      counterpart_id = parsed_json["counterpart_id"]
      counterpart_vat_id_id = parsed_json["counterpart_vat_id_id"]
      unless parsed_json["entity"].nil?
        entity = parsed_json["entity"].to_json
        entity = Monite::UpdateIssuedInvoiceEntity.from_json(json_object: entity)
      else
        entity = nil
      end
      unless parsed_json["entity_address"].nil?
        entity_address = parsed_json["entity_address"].to_json
        entity_address = Monite::ReceivableEntityAddressSchema.from_json(json_object: entity_address)
      else
        entity_address = nil
      end
      entity_vat_id_id = parsed_json["entity_vat_id_id"]
      fulfillment_date = parsed_json["fulfillment_date"]
      memo = parsed_json["memo"]
      overdue_reminder_id = parsed_json["overdue_reminder_id"]
      partner_metadata = parsed_json["partner_metadata"]
      payment_reminder_id = parsed_json["payment_reminder_id"]
      payment_terms_id = parsed_json["payment_terms_id"]
      project_id = parsed_json["project_id"]
      tag_ids = parsed_json["tag_ids"]
      new(
        contact_id: contact_id,
        counterpart_id: counterpart_id,
        counterpart_vat_id_id: counterpart_vat_id_id,
        entity: entity,
        entity_address: entity_address,
        entity_vat_id_id: entity_vat_id_id,
        fulfillment_date: fulfillment_date,
        memo: memo,
        overdue_reminder_id: overdue_reminder_id,
        partner_metadata: partner_metadata,
        payment_reminder_id: payment_reminder_id,
        payment_terms_id: payment_terms_id,
        project_id: project_id,
        tag_ids: tag_ids,
        additional_properties: struct
      )
    end
# Serialize an instance of UpdateIssuedInvoice to a JSON object
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
      obj.counterpart_id&.is_a?(String) != false || raise("Passed value for field obj.counterpart_id is not the expected type, validation failed.")
      obj.counterpart_vat_id_id&.is_a?(String) != false || raise("Passed value for field obj.counterpart_vat_id_id is not the expected type, validation failed.")
      obj.entity.nil? || Monite::UpdateIssuedInvoiceEntity.validate_raw(obj: obj.entity)
      obj.entity_address.nil? || Monite::ReceivableEntityAddressSchema.validate_raw(obj: obj.entity_address)
      obj.entity_vat_id_id&.is_a?(String) != false || raise("Passed value for field obj.entity_vat_id_id is not the expected type, validation failed.")
      obj.fulfillment_date&.is_a?(String) != false || raise("Passed value for field obj.fulfillment_date is not the expected type, validation failed.")
      obj.memo&.is_a?(String) != false || raise("Passed value for field obj.memo is not the expected type, validation failed.")
      obj.overdue_reminder_id&.is_a?(String) != false || raise("Passed value for field obj.overdue_reminder_id is not the expected type, validation failed.")
      obj.partner_metadata&.is_a?(Hash) != false || raise("Passed value for field obj.partner_metadata is not the expected type, validation failed.")
      obj.payment_reminder_id&.is_a?(String) != false || raise("Passed value for field obj.payment_reminder_id is not the expected type, validation failed.")
      obj.payment_terms_id&.is_a?(String) != false || raise("Passed value for field obj.payment_terms_id is not the expected type, validation failed.")
      obj.project_id&.is_a?(String) != false || raise("Passed value for field obj.project_id is not the expected type, validation failed.")
      obj.tag_ids&.is_a?(Array) != false || raise("Passed value for field obj.tag_ids is not the expected type, validation failed.")
    end
  end
end