# frozen_string_literal: true
require_relative "receivable_counterpart_contact"
require_relative "receivable_entity_base"
require_relative "update_line_item_for_credit_note"
require "ostruct"
require "json"

module Monite
  class UpdateCreditNote
  # @return [String] Address of invoicing, need to state as a separate fields for some countries if
#  it differs from address of a company.
    attr_reader :counterpart_billing_address_id
  # @return [Monite::ReceivableCounterpartContact] Additional information about counterpart contacts.
    attr_reader :counterpart_contact
  # @return [String] Address where goods were shipped / where services were provided.
    attr_reader :counterpart_shipping_address_id
  # @return [Monite::ReceivableEntityBase] 
    attr_reader :entity
  # @return [Monite::UPDATE_LINE_ITEM_FOR_CREDIT_NOTE] 
    attr_reader :line_items
  # @return [String] A note with additional information for a receivable
    attr_reader :memo
  # @return [Hash{String => Object}] Metadata for partner needs
    attr_reader :partner_metadata
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

    # @param counterpart_billing_address_id [String] Address of invoicing, need to state as a separate fields for some countries if
#  it differs from address of a company.
    # @param counterpart_contact [Monite::ReceivableCounterpartContact] Additional information about counterpart contacts.
    # @param counterpart_shipping_address_id [String] Address where goods were shipped / where services were provided.
    # @param entity [Monite::ReceivableEntityBase] 
    # @param line_items [Monite::UPDATE_LINE_ITEM_FOR_CREDIT_NOTE] 
    # @param memo [String] A note with additional information for a receivable
    # @param partner_metadata [Hash{String => Object}] Metadata for partner needs
    # @param project_id [String] A project related to current receivable
    # @param tag_ids [Array<String>] A list of IDs of user-defined tags (labels) assigned to this receivable.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::UpdateCreditNote]
    def initialize(counterpart_billing_address_id: OMIT, counterpart_contact: OMIT, counterpart_shipping_address_id: OMIT, entity: OMIT, line_items: OMIT, memo: OMIT, partner_metadata: OMIT, project_id: OMIT, tag_ids: OMIT, additional_properties: nil)
      @counterpart_billing_address_id = counterpart_billing_address_id if counterpart_billing_address_id != OMIT
      @counterpart_contact = counterpart_contact if counterpart_contact != OMIT
      @counterpart_shipping_address_id = counterpart_shipping_address_id if counterpart_shipping_address_id != OMIT
      @entity = entity if entity != OMIT
      @line_items = line_items if line_items != OMIT
      @memo = memo if memo != OMIT
      @partner_metadata = partner_metadata if partner_metadata != OMIT
      @project_id = project_id if project_id != OMIT
      @tag_ids = tag_ids if tag_ids != OMIT
      @additional_properties = additional_properties
      @_field_set = { "counterpart_billing_address_id": counterpart_billing_address_id, "counterpart_contact": counterpart_contact, "counterpart_shipping_address_id": counterpart_shipping_address_id, "entity": entity, "line_items": line_items, "memo": memo, "partner_metadata": partner_metadata, "project_id": project_id, "tag_ids": tag_ids }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of UpdateCreditNote
    #
    # @param json_object [String] 
    # @return [Monite::UpdateCreditNote]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      counterpart_billing_address_id = parsed_json["counterpart_billing_address_id"]
      unless parsed_json["counterpart_contact"].nil?
        counterpart_contact = parsed_json["counterpart_contact"].to_json
        counterpart_contact = Monite::ReceivableCounterpartContact.from_json(json_object: counterpart_contact)
      else
        counterpart_contact = nil
      end
      counterpart_shipping_address_id = parsed_json["counterpart_shipping_address_id"]
      unless parsed_json["entity"].nil?
        entity = parsed_json["entity"].to_json
        entity = Monite::ReceivableEntityBase.from_json(json_object: entity)
      else
        entity = nil
      end
      line_items = parsed_json["line_items"]&.transform_values do | value |
  value = value.to_json
  Monite::UpdateProductForCreditNote.from_json(json_object: value)
end
      memo = parsed_json["memo"]
      partner_metadata = parsed_json["partner_metadata"]
      project_id = parsed_json["project_id"]
      tag_ids = parsed_json["tag_ids"]
      new(
        counterpart_billing_address_id: counterpart_billing_address_id,
        counterpart_contact: counterpart_contact,
        counterpart_shipping_address_id: counterpart_shipping_address_id,
        entity: entity,
        line_items: line_items,
        memo: memo,
        partner_metadata: partner_metadata,
        project_id: project_id,
        tag_ids: tag_ids,
        additional_properties: struct
      )
    end
# Serialize an instance of UpdateCreditNote to a JSON object
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
      obj.counterpart_billing_address_id&.is_a?(String) != false || raise("Passed value for field obj.counterpart_billing_address_id is not the expected type, validation failed.")
      obj.counterpart_contact.nil? || Monite::ReceivableCounterpartContact.validate_raw(obj: obj.counterpart_contact)
      obj.counterpart_shipping_address_id&.is_a?(String) != false || raise("Passed value for field obj.counterpart_shipping_address_id is not the expected type, validation failed.")
      obj.entity.nil? || Monite::ReceivableEntityBase.validate_raw(obj: obj.entity)
      obj.line_items&.is_a?(Hash) != false || raise("Passed value for field obj.line_items is not the expected type, validation failed.")
      obj.memo&.is_a?(String) != false || raise("Passed value for field obj.memo is not the expected type, validation failed.")
      obj.partner_metadata&.is_a?(Hash) != false || raise("Passed value for field obj.partner_metadata is not the expected type, validation failed.")
      obj.project_id&.is_a?(String) != false || raise("Passed value for field obj.project_id is not the expected type, validation failed.")
      obj.tag_ids&.is_a?(Array) != false || raise("Passed value for field obj.tag_ids is not the expected type, validation failed.")
    end
  end
end