# frozen_string_literal: true
require "ostruct"
require "json"

module Monite
  class WebhookDeliveryResource
  # @return [String] 
    attr_reader :id
  # @return [String] 
    attr_reader :event_id
  # @return [Integer] 
    attr_reader :requests_made_count
  # @return [String] 
    attr_reader :response
  # @return [Integer] 
    attr_reader :response_status_code
  # @return [String] 
    attr_reader :url
  # @return [Boolean] 
    attr_reader :was_successful
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] 
    # @param event_id [String] 
    # @param requests_made_count [Integer] 
    # @param response [String] 
    # @param response_status_code [Integer] 
    # @param url [String] 
    # @param was_successful [Boolean] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::WebhookDeliveryResource]
    def initialize(id:, event_id:, requests_made_count:, response: OMIT, response_status_code: OMIT, url:, was_successful: OMIT, additional_properties: nil)
      @id = id
      @event_id = event_id
      @requests_made_count = requests_made_count
      @response = response if response != OMIT
      @response_status_code = response_status_code if response_status_code != OMIT
      @url = url
      @was_successful = was_successful if was_successful != OMIT
      @additional_properties = additional_properties
      @_field_set = { "id": id, "event_id": event_id, "requests_made_count": requests_made_count, "response": response, "response_status_code": response_status_code, "url": url, "was_successful": was_successful }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of WebhookDeliveryResource
    #
    # @param json_object [String] 
    # @return [Monite::WebhookDeliveryResource]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      event_id = parsed_json["event_id"]
      requests_made_count = parsed_json["requests_made_count"]
      response = parsed_json["response"]
      response_status_code = parsed_json["response_status_code"]
      url = parsed_json["url"]
      was_successful = parsed_json["was_successful"]
      new(
        id: id,
        event_id: event_id,
        requests_made_count: requests_made_count,
        response: response,
        response_status_code: response_status_code,
        url: url,
        was_successful: was_successful,
        additional_properties: struct
      )
    end
# Serialize an instance of WebhookDeliveryResource to a JSON object
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
      obj.event_id.is_a?(String) != false || raise("Passed value for field obj.event_id is not the expected type, validation failed.")
      obj.requests_made_count.is_a?(Integer) != false || raise("Passed value for field obj.requests_made_count is not the expected type, validation failed.")
      obj.response&.is_a?(String) != false || raise("Passed value for field obj.response is not the expected type, validation failed.")
      obj.response_status_code&.is_a?(Integer) != false || raise("Passed value for field obj.response_status_code is not the expected type, validation failed.")
      obj.url.is_a?(String) != false || raise("Passed value for field obj.url is not the expected type, validation failed.")
      obj.was_successful&.is_a?(Boolean) != false || raise("Passed value for field obj.was_successful is not the expected type, validation failed.")
    end
  end
end