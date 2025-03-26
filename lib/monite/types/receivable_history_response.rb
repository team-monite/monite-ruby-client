# frozen_string_literal: true
require_relative "receivable_history_response_event_data"
require_relative "receivable_history_event_type_enum"
require "date"
require "ostruct"
require "json"

module Monite
# Represents an entry in the change history of an accounts receivable document.
  class ReceivableHistoryResponse
  # @return [String] A unique ID of the history record.
    attr_reader :id
  # @return [String] A URL of the PDF file that shows the document state after the change. Available
#  only for the following event types: `receivable_created`, `receivable_updated`,
#  `status_changed`, and `payment_received`. In other event types the
#  `current_pdf_url` value is `null`.
#  In `payment_received` events, the `current_pdf_url` value is available only in
#  case of full payments and only if the entity setting `generate_paid_invoice_pdf`
#  is `true`.
#  Note that Monite generates PDFs asynchronously. This means that the initial
#  value of `current_pdf_url` for the abovementioned events right after they
#  occurred is usually `null` and the value gets populated later after the PDF
#  document has been generated.
    attr_reader :current_pdf_url
  # @return [String] ID of the entity user who made the change or trigger the event, or `null` if it
#  was done by using a partner access token.
    attr_reader :entity_user_id
  # @return [Monite::ReceivableHistoryResponseEventData] An object containing additional information about the event or change. The
#  object structure varies based on the `event_type`. In `receivable_created` and
#  `receivable_updated` events, `event_data` is an empty object `{}`.
    attr_reader :event_data
  # @return [Monite::ReceivableHistoryEventTypeEnum] The type of the event or change. See [Event
#  ypes](https://docs.monite.com/accounts-receivable/document-history#event-types).
    attr_reader :event_type
  # @return [String] ID of the receivable document that was changed or triggered an event.
    attr_reader :receivable_id
  # @return [DateTime] UTC date and time when the event or change occurred.
    attr_reader :timestamp
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] A unique ID of the history record.
    # @param current_pdf_url [String] A URL of the PDF file that shows the document state after the change. Available
#  only for the following event types: `receivable_created`, `receivable_updated`,
#  `status_changed`, and `payment_received`. In other event types the
#  `current_pdf_url` value is `null`.
#  In `payment_received` events, the `current_pdf_url` value is available only in
#  case of full payments and only if the entity setting `generate_paid_invoice_pdf`
#  is `true`.
#  Note that Monite generates PDFs asynchronously. This means that the initial
#  value of `current_pdf_url` for the abovementioned events right after they
#  occurred is usually `null` and the value gets populated later after the PDF
#  document has been generated.
    # @param entity_user_id [String] ID of the entity user who made the change or trigger the event, or `null` if it
#  was done by using a partner access token.
    # @param event_data [Monite::ReceivableHistoryResponseEventData] An object containing additional information about the event or change. The
#  object structure varies based on the `event_type`. In `receivable_created` and
#  `receivable_updated` events, `event_data` is an empty object `{}`.
    # @param event_type [Monite::ReceivableHistoryEventTypeEnum] The type of the event or change. See [Event
#  ypes](https://docs.monite.com/accounts-receivable/document-history#event-types).
    # @param receivable_id [String] ID of the receivable document that was changed or triggered an event.
    # @param timestamp [DateTime] UTC date and time when the event or change occurred.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::ReceivableHistoryResponse]
    def initialize(id:, current_pdf_url: OMIT, entity_user_id: OMIT, event_data:, event_type:, receivable_id:, timestamp:, additional_properties: nil)
      @id = id
      @current_pdf_url = current_pdf_url if current_pdf_url != OMIT
      @entity_user_id = entity_user_id if entity_user_id != OMIT
      @event_data = event_data
      @event_type = event_type
      @receivable_id = receivable_id
      @timestamp = timestamp
      @additional_properties = additional_properties
      @_field_set = { "id": id, "current_pdf_url": current_pdf_url, "entity_user_id": entity_user_id, "event_data": event_data, "event_type": event_type, "receivable_id": receivable_id, "timestamp": timestamp }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of ReceivableHistoryResponse
    #
    # @param json_object [String] 
    # @return [Monite::ReceivableHistoryResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      current_pdf_url = parsed_json["current_pdf_url"]
      entity_user_id = parsed_json["entity_user_id"]
      unless parsed_json["event_data"].nil?
        event_data = parsed_json["event_data"].to_json
        event_data = Monite::ReceivableHistoryResponseEventData.from_json(json_object: event_data)
      else
        event_data = nil
      end
      event_type = parsed_json["event_type"]
      receivable_id = parsed_json["receivable_id"]
      timestamp = unless parsed_json["timestamp"].nil?
  DateTime.parse(parsed_json["timestamp"])
else
  nil
end
      new(
        id: id,
        current_pdf_url: current_pdf_url,
        entity_user_id: entity_user_id,
        event_data: event_data,
        event_type: event_type,
        receivable_id: receivable_id,
        timestamp: timestamp,
        additional_properties: struct
      )
    end
# Serialize an instance of ReceivableHistoryResponse to a JSON object
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
      obj.current_pdf_url&.is_a?(String) != false || raise("Passed value for field obj.current_pdf_url is not the expected type, validation failed.")
      obj.entity_user_id&.is_a?(String) != false || raise("Passed value for field obj.entity_user_id is not the expected type, validation failed.")
      Monite::ReceivableHistoryResponseEventData.validate_raw(obj: obj.event_data)
      obj.event_type.is_a?(Monite::ReceivableHistoryEventTypeEnum) != false || raise("Passed value for field obj.event_type is not the expected type, validation failed.")
      obj.receivable_id.is_a?(String) != false || raise("Passed value for field obj.receivable_id is not the expected type, validation failed.")
      obj.timestamp.is_a?(DateTime) != false || raise("Passed value for field obj.timestamp is not the expected type, validation failed.")
    end
  end
end