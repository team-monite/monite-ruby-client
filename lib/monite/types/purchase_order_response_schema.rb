# frozen_string_literal: true
require "date"
require "date"
require_relative "purchase_order_counterpart_schema"
require_relative "purchase_order_counterpart_address_schema"
require_relative "currency_enum"
require_relative "purchase_order_response_schema_entity"
require_relative "purchase_order_vat_id"
require_relative "purchase_order_item"
require "ostruct"
require "json"

module Monite
# Represents response for an Accounts Purchase Order document created by entity.
  class PurchaseOrderResponseSchema
  # @return [String] A unique ID assigned to this purchase order.
    attr_reader :id
  # @return [DateTime] Time at which the receivable was created. Timestamps follow the ISO 8601
#  standard.
    attr_reader :created_at
  # @return [DateTime] Time at which the receivable was last updated. Timestamps follow the ISO 8601
#  standard.
    attr_reader :updated_at
  # @return [Monite::PurchaseOrderCounterpartSchema] Counterpart information about an organization (juridical person) or individual
#  (natural person) that provides goods and services to or buys them from an
    attr_reader :counterpart
  # @return [Monite::PurchaseOrderCounterpartAddressSchema] Counterpart address data saved on creation or update of the purchase order.
    attr_reader :counterpart_address
  # @return [String] The ID of counterpart address object stored in counterparts service. If not
#  provided, counterpart's default address is used.
    attr_reader :counterpart_address_id
  # @return [String] Counterpart unique ID.
    attr_reader :counterpart_id
  # @return [String] ID of the creator of the purchase order
    attr_reader :created_by_user_id
  # @return [Monite::CurrencyEnum] The currency in which the price of the product is set. (all items need to have
#  the same currency)
    attr_reader :currency
  # @return [String] 
    attr_reader :document_id
  # @return [Monite::PurchaseOrderResponseSchemaEntity] Data of the entity (address, name, contact)
    attr_reader :entity
  # @return [String] The ID of the entity which issued the purchase order.
    attr_reader :entity_id
  # @return [Monite::PurchaseOrderVatId] 
    attr_reader :entity_vat_id
  # @return [String] 
    attr_reader :file_id
  # @return [String] 
    attr_reader :file_url
  # @return [String] When status changed from 'draft' to 'send', so after sending purchase order
    attr_reader :issued_at
  # @return [Array<Monite::PurchaseOrderItem>] List of item to purchase
    attr_reader :items
  # @return [String] Msg which will be send to counterpart for who the purchase order is issued.
    attr_reader :message
  # @return [String] Purchase order can be in 'draft' state before sending it to counterpart. After
#  that state is 'issued'
    attr_reader :status
  # @return [Integer] Number of days for which purchase order is valid
    attr_reader :valid_for_days
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] A unique ID assigned to this purchase order.
    # @param created_at [DateTime] Time at which the receivable was created. Timestamps follow the ISO 8601
#  standard.
    # @param updated_at [DateTime] Time at which the receivable was last updated. Timestamps follow the ISO 8601
#  standard.
    # @param counterpart [Monite::PurchaseOrderCounterpartSchema] Counterpart information about an organization (juridical person) or individual
#  (natural person) that provides goods and services to or buys them from an
    # @param counterpart_address [Monite::PurchaseOrderCounterpartAddressSchema] Counterpart address data saved on creation or update of the purchase order.
    # @param counterpart_address_id [String] The ID of counterpart address object stored in counterparts service. If not
#  provided, counterpart's default address is used.
    # @param counterpart_id [String] Counterpart unique ID.
    # @param created_by_user_id [String] ID of the creator of the purchase order
    # @param currency [Monite::CurrencyEnum] The currency in which the price of the product is set. (all items need to have
#  the same currency)
    # @param document_id [String] 
    # @param entity [Monite::PurchaseOrderResponseSchemaEntity] Data of the entity (address, name, contact)
    # @param entity_id [String] The ID of the entity which issued the purchase order.
    # @param entity_vat_id [Monite::PurchaseOrderVatId] 
    # @param file_id [String] 
    # @param file_url [String] 
    # @param issued_at [String] When status changed from 'draft' to 'send', so after sending purchase order
    # @param items [Array<Monite::PurchaseOrderItem>] List of item to purchase
    # @param message [String] Msg which will be send to counterpart for who the purchase order is issued.
    # @param status [String] Purchase order can be in 'draft' state before sending it to counterpart. After
#  that state is 'issued'
    # @param valid_for_days [Integer] Number of days for which purchase order is valid
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::PurchaseOrderResponseSchema]
    def initialize(id:, created_at:, updated_at:, counterpart:, counterpart_address: OMIT, counterpart_address_id: OMIT, counterpart_id:, created_by_user_id: OMIT, currency:, document_id:, entity:, entity_id:, entity_vat_id: OMIT, file_id: OMIT, file_url: OMIT, issued_at: OMIT, items:, message:, status:, valid_for_days:, additional_properties: nil)
      @id = id
      @created_at = created_at
      @updated_at = updated_at
      @counterpart = counterpart
      @counterpart_address = counterpart_address if counterpart_address != OMIT
      @counterpart_address_id = counterpart_address_id if counterpart_address_id != OMIT
      @counterpart_id = counterpart_id
      @created_by_user_id = created_by_user_id if created_by_user_id != OMIT
      @currency = currency
      @document_id = document_id
      @entity = entity
      @entity_id = entity_id
      @entity_vat_id = entity_vat_id if entity_vat_id != OMIT
      @file_id = file_id if file_id != OMIT
      @file_url = file_url if file_url != OMIT
      @issued_at = issued_at if issued_at != OMIT
      @items = items
      @message = message
      @status = status
      @valid_for_days = valid_for_days
      @additional_properties = additional_properties
      @_field_set = { "id": id, "created_at": created_at, "updated_at": updated_at, "counterpart": counterpart, "counterpart_address": counterpart_address, "counterpart_address_id": counterpart_address_id, "counterpart_id": counterpart_id, "created_by_user_id": created_by_user_id, "currency": currency, "document_id": document_id, "entity": entity, "entity_id": entity_id, "entity_vat_id": entity_vat_id, "file_id": file_id, "file_url": file_url, "issued_at": issued_at, "items": items, "message": message, "status": status, "valid_for_days": valid_for_days }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of PurchaseOrderResponseSchema
    #
    # @param json_object [String] 
    # @return [Monite::PurchaseOrderResponseSchema]
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
      unless parsed_json["counterpart"].nil?
        counterpart = parsed_json["counterpart"].to_json
        counterpart = Monite::PurchaseOrderCounterpartSchema.from_json(json_object: counterpart)
      else
        counterpart = nil
      end
      unless parsed_json["counterpart_address"].nil?
        counterpart_address = parsed_json["counterpart_address"].to_json
        counterpart_address = Monite::PurchaseOrderCounterpartAddressSchema.from_json(json_object: counterpart_address)
      else
        counterpart_address = nil
      end
      counterpart_address_id = parsed_json["counterpart_address_id"]
      counterpart_id = parsed_json["counterpart_id"]
      created_by_user_id = parsed_json["created_by_user_id"]
      currency = parsed_json["currency"]
      document_id = parsed_json["document_id"]
      unless parsed_json["entity"].nil?
        entity = parsed_json["entity"].to_json
        entity = Monite::PurchaseOrderResponseSchemaEntity.from_json(json_object: entity)
      else
        entity = nil
      end
      entity_id = parsed_json["entity_id"]
      unless parsed_json["entity_vat_id"].nil?
        entity_vat_id = parsed_json["entity_vat_id"].to_json
        entity_vat_id = Monite::PurchaseOrderVatId.from_json(json_object: entity_vat_id)
      else
        entity_vat_id = nil
      end
      file_id = parsed_json["file_id"]
      file_url = parsed_json["file_url"]
      issued_at = parsed_json["issued_at"]
      items = parsed_json["items"]&.map do | item |
  item = item.to_json
  Monite::PurchaseOrderItem.from_json(json_object: item)
end
      message = parsed_json["message"]
      status = parsed_json["status"]
      valid_for_days = parsed_json["valid_for_days"]
      new(
        id: id,
        created_at: created_at,
        updated_at: updated_at,
        counterpart: counterpart,
        counterpart_address: counterpart_address,
        counterpart_address_id: counterpart_address_id,
        counterpart_id: counterpart_id,
        created_by_user_id: created_by_user_id,
        currency: currency,
        document_id: document_id,
        entity: entity,
        entity_id: entity_id,
        entity_vat_id: entity_vat_id,
        file_id: file_id,
        file_url: file_url,
        issued_at: issued_at,
        items: items,
        message: message,
        status: status,
        valid_for_days: valid_for_days,
        additional_properties: struct
      )
    end
# Serialize an instance of PurchaseOrderResponseSchema to a JSON object
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
      Monite::PurchaseOrderCounterpartSchema.validate_raw(obj: obj.counterpart)
      obj.counterpart_address.nil? || Monite::PurchaseOrderCounterpartAddressSchema.validate_raw(obj: obj.counterpart_address)
      obj.counterpart_address_id&.is_a?(String) != false || raise("Passed value for field obj.counterpart_address_id is not the expected type, validation failed.")
      obj.counterpart_id.is_a?(String) != false || raise("Passed value for field obj.counterpart_id is not the expected type, validation failed.")
      obj.created_by_user_id&.is_a?(String) != false || raise("Passed value for field obj.created_by_user_id is not the expected type, validation failed.")
      obj.currency.is_a?(Monite::CurrencyEnum) != false || raise("Passed value for field obj.currency is not the expected type, validation failed.")
      obj.document_id.is_a?(String) != false || raise("Passed value for field obj.document_id is not the expected type, validation failed.")
      Monite::PurchaseOrderResponseSchemaEntity.validate_raw(obj: obj.entity)
      obj.entity_id.is_a?(String) != false || raise("Passed value for field obj.entity_id is not the expected type, validation failed.")
      obj.entity_vat_id.nil? || Monite::PurchaseOrderVatId.validate_raw(obj: obj.entity_vat_id)
      obj.file_id&.is_a?(String) != false || raise("Passed value for field obj.file_id is not the expected type, validation failed.")
      obj.file_url&.is_a?(String) != false || raise("Passed value for field obj.file_url is not the expected type, validation failed.")
      obj.issued_at&.is_a?(String) != false || raise("Passed value for field obj.issued_at is not the expected type, validation failed.")
      obj.items.is_a?(Array) != false || raise("Passed value for field obj.items is not the expected type, validation failed.")
      obj.message.is_a?(String) != false || raise("Passed value for field obj.message is not the expected type, validation failed.")
      obj.status.is_a?(String) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
      obj.valid_for_days.is_a?(Integer) != false || raise("Passed value for field obj.valid_for_days is not the expected type, validation failed.")
    end
  end
end