# frozen_string_literal: true
require "date"
require "date"
require_relative "purchase_order_counterpart_individual_response"
require_relative "language_code_enum"
require_relative "counterpart_type"
require "ostruct"
require "json"

module Monite
# Represents counterparts that are individuals (natural persons).
  class PurchaseOrderCounterpartIndividualRootResponse
  # @return [String] Unique ID of the counterpart.
    attr_reader :id
  # @return [DateTime] Date and time when the counterpart was created. Timestamps follow the [ISO
#  8601](https://en.wikipedia.org/wiki/ISO_8601) standard.
    attr_reader :created_at
  # @return [DateTime] Date and time when the counterpart was last updated. Timestamps follow the [ISO
#  8601](https://en.wikipedia.org/wiki/ISO_8601) standard.
    attr_reader :updated_at
  # @return [Boolean] `true` if the counterpart was created automatically by Monite when processing
#  incoming invoices with OCR. `false` if the counterpart was created by the API
#  client.
    attr_reader :created_automatically
  # @return [String] ID of the counterpart's billing address. If the counterpart is US-based and
#  needs to accept ACH payments, this address must have all fields filled in. If
#  `default_billing_address_id` is not defined, the default address is instead used
#  as the billing address for ACH payments.
    attr_reader :default_billing_address_id
  # @return [String] ID of the shipping address.
    attr_reader :default_shipping_address_id
  # @return [String] Entity user ID of counterpart creator.
    attr_reader :created_by_entity_user_id
  # @return [Monite::PurchaseOrderCounterpartIndividualResponse] 
    attr_reader :individual
  # @return [Monite::LanguageCodeEnum] The language used to generate PDF documents for this counterpart.
    attr_reader :language
  # @return [Boolean] 
    attr_reader :reminders_enabled
  # @return [String] The counterpart's taxpayer identification number or tax ID. This field is
#  required for counterparts that are non-VAT registered.
    attr_reader :tax_id
  # @return [Monite::CounterpartType] The counterpart type: `organization` (juridical person) or `individual` (natural
#  person).
    attr_reader :type
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] Unique ID of the counterpart.
    # @param created_at [DateTime] Date and time when the counterpart was created. Timestamps follow the [ISO
#  8601](https://en.wikipedia.org/wiki/ISO_8601) standard.
    # @param updated_at [DateTime] Date and time when the counterpart was last updated. Timestamps follow the [ISO
#  8601](https://en.wikipedia.org/wiki/ISO_8601) standard.
    # @param created_automatically [Boolean] `true` if the counterpart was created automatically by Monite when processing
#  incoming invoices with OCR. `false` if the counterpart was created by the API
#  client.
    # @param default_billing_address_id [String] ID of the counterpart's billing address. If the counterpart is US-based and
#  needs to accept ACH payments, this address must have all fields filled in. If
#  `default_billing_address_id` is not defined, the default address is instead used
#  as the billing address for ACH payments.
    # @param default_shipping_address_id [String] ID of the shipping address.
    # @param created_by_entity_user_id [String] Entity user ID of counterpart creator.
    # @param individual [Monite::PurchaseOrderCounterpartIndividualResponse] 
    # @param language [Monite::LanguageCodeEnum] The language used to generate PDF documents for this counterpart.
    # @param reminders_enabled [Boolean] 
    # @param tax_id [String] The counterpart's taxpayer identification number or tax ID. This field is
#  required for counterparts that are non-VAT registered.
    # @param type [Monite::CounterpartType] The counterpart type: `organization` (juridical person) or `individual` (natural
#  person).
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::PurchaseOrderCounterpartIndividualRootResponse]
    def initialize(id:, created_at:, updated_at:, created_automatically: OMIT, default_billing_address_id: OMIT, default_shipping_address_id: OMIT, created_by_entity_user_id: OMIT, individual:, language: OMIT, reminders_enabled: OMIT, tax_id: OMIT, type:, additional_properties: nil)
      @id = id
      @created_at = created_at
      @updated_at = updated_at
      @created_automatically = created_automatically if created_automatically != OMIT
      @default_billing_address_id = default_billing_address_id if default_billing_address_id != OMIT
      @default_shipping_address_id = default_shipping_address_id if default_shipping_address_id != OMIT
      @created_by_entity_user_id = created_by_entity_user_id if created_by_entity_user_id != OMIT
      @individual = individual
      @language = language if language != OMIT
      @reminders_enabled = reminders_enabled if reminders_enabled != OMIT
      @tax_id = tax_id if tax_id != OMIT
      @type = type
      @additional_properties = additional_properties
      @_field_set = { "id": id, "created_at": created_at, "updated_at": updated_at, "created_automatically": created_automatically, "default_billing_address_id": default_billing_address_id, "default_shipping_address_id": default_shipping_address_id, "created_by_entity_user_id": created_by_entity_user_id, "individual": individual, "language": language, "reminders_enabled": reminders_enabled, "tax_id": tax_id, "type": type }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of
#  PurchaseOrderCounterpartIndividualRootResponse
    #
    # @param json_object [String] 
    # @return [Monite::PurchaseOrderCounterpartIndividualRootResponse]
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
      created_automatically = parsed_json["created_automatically"]
      default_billing_address_id = parsed_json["default_billing_address_id"]
      default_shipping_address_id = parsed_json["default_shipping_address_id"]
      created_by_entity_user_id = parsed_json["created_by_entity_user_id"]
      unless parsed_json["individual"].nil?
        individual = parsed_json["individual"].to_json
        individual = Monite::PurchaseOrderCounterpartIndividualResponse.from_json(json_object: individual)
      else
        individual = nil
      end
      language = parsed_json["language"]
      reminders_enabled = parsed_json["reminders_enabled"]
      tax_id = parsed_json["tax_id"]
      type = parsed_json["type"]
      new(
        id: id,
        created_at: created_at,
        updated_at: updated_at,
        created_automatically: created_automatically,
        default_billing_address_id: default_billing_address_id,
        default_shipping_address_id: default_shipping_address_id,
        created_by_entity_user_id: created_by_entity_user_id,
        individual: individual,
        language: language,
        reminders_enabled: reminders_enabled,
        tax_id: tax_id,
        type: type,
        additional_properties: struct
      )
    end
# Serialize an instance of PurchaseOrderCounterpartIndividualRootResponse to a
#  JSON object
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
      obj.created_automatically&.is_a?(Boolean) != false || raise("Passed value for field obj.created_automatically is not the expected type, validation failed.")
      obj.default_billing_address_id&.is_a?(String) != false || raise("Passed value for field obj.default_billing_address_id is not the expected type, validation failed.")
      obj.default_shipping_address_id&.is_a?(String) != false || raise("Passed value for field obj.default_shipping_address_id is not the expected type, validation failed.")
      obj.created_by_entity_user_id&.is_a?(String) != false || raise("Passed value for field obj.created_by_entity_user_id is not the expected type, validation failed.")
      Monite::PurchaseOrderCounterpartIndividualResponse.validate_raw(obj: obj.individual)
      obj.language&.is_a?(Monite::LanguageCodeEnum) != false || raise("Passed value for field obj.language is not the expected type, validation failed.")
      obj.reminders_enabled&.is_a?(Boolean) != false || raise("Passed value for field obj.reminders_enabled is not the expected type, validation failed.")
      obj.tax_id&.is_a?(String) != false || raise("Passed value for field obj.tax_id is not the expected type, validation failed.")
      obj.type.is_a?(Monite::CounterpartType) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
    end
  end
end