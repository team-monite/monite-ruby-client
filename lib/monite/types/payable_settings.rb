# frozen_string_literal: true
require "ostruct"
require "json"

module Monite
  class PayableSettings
  # @return [Boolean] 
    attr_reader :allow_cancel_duplicates_automatically
  # @return [Boolean] 
    attr_reader :allow_counterpart_autocreation
  # @return [Boolean] 
    attr_reader :allow_counterpart_autolinking
  # @return [Boolean] 
    attr_reader :allow_credit_note_autolinking
  # @return [String] 
    attr_reader :approve_page_url
  # @return [String] A state each new payable will have upon creation
    attr_reader :default_state
  # @return [Boolean] Starting from version 2024-05-25 by default is always set to True.
    attr_reader :enable_line_items
  # @return [Boolean] 
    attr_reader :skip_approval_for_paid_invoice
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param allow_cancel_duplicates_automatically [Boolean] 
    # @param allow_counterpart_autocreation [Boolean] 
    # @param allow_counterpart_autolinking [Boolean] 
    # @param allow_credit_note_autolinking [Boolean] 
    # @param approve_page_url [String] 
    # @param default_state [String] A state each new payable will have upon creation
    # @param enable_line_items [Boolean] Starting from version 2024-05-25 by default is always set to True.
    # @param skip_approval_for_paid_invoice [Boolean] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::PayableSettings]
    def initialize(allow_cancel_duplicates_automatically: OMIT, allow_counterpart_autocreation: OMIT, allow_counterpart_autolinking: OMIT, allow_credit_note_autolinking: OMIT, approve_page_url:, default_state: OMIT, enable_line_items: OMIT, skip_approval_for_paid_invoice: OMIT, additional_properties: nil)
      @allow_cancel_duplicates_automatically = allow_cancel_duplicates_automatically if allow_cancel_duplicates_automatically != OMIT
      @allow_counterpart_autocreation = allow_counterpart_autocreation if allow_counterpart_autocreation != OMIT
      @allow_counterpart_autolinking = allow_counterpart_autolinking if allow_counterpart_autolinking != OMIT
      @allow_credit_note_autolinking = allow_credit_note_autolinking if allow_credit_note_autolinking != OMIT
      @approve_page_url = approve_page_url
      @default_state = default_state if default_state != OMIT
      @enable_line_items = enable_line_items if enable_line_items != OMIT
      @skip_approval_for_paid_invoice = skip_approval_for_paid_invoice if skip_approval_for_paid_invoice != OMIT
      @additional_properties = additional_properties
      @_field_set = { "allow_cancel_duplicates_automatically": allow_cancel_duplicates_automatically, "allow_counterpart_autocreation": allow_counterpart_autocreation, "allow_counterpart_autolinking": allow_counterpart_autolinking, "allow_credit_note_autolinking": allow_credit_note_autolinking, "approve_page_url": approve_page_url, "default_state": default_state, "enable_line_items": enable_line_items, "skip_approval_for_paid_invoice": skip_approval_for_paid_invoice }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of PayableSettings
    #
    # @param json_object [String] 
    # @return [Monite::PayableSettings]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      allow_cancel_duplicates_automatically = parsed_json["allow_cancel_duplicates_automatically"]
      allow_counterpart_autocreation = parsed_json["allow_counterpart_autocreation"]
      allow_counterpart_autolinking = parsed_json["allow_counterpart_autolinking"]
      allow_credit_note_autolinking = parsed_json["allow_credit_note_autolinking"]
      approve_page_url = parsed_json["approve_page_url"]
      default_state = parsed_json["default_state"]
      enable_line_items = parsed_json["enable_line_items"]
      skip_approval_for_paid_invoice = parsed_json["skip_approval_for_paid_invoice"]
      new(
        allow_cancel_duplicates_automatically: allow_cancel_duplicates_automatically,
        allow_counterpart_autocreation: allow_counterpart_autocreation,
        allow_counterpart_autolinking: allow_counterpart_autolinking,
        allow_credit_note_autolinking: allow_credit_note_autolinking,
        approve_page_url: approve_page_url,
        default_state: default_state,
        enable_line_items: enable_line_items,
        skip_approval_for_paid_invoice: skip_approval_for_paid_invoice,
        additional_properties: struct
      )
    end
# Serialize an instance of PayableSettings to a JSON object
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
      obj.allow_cancel_duplicates_automatically&.is_a?(Boolean) != false || raise("Passed value for field obj.allow_cancel_duplicates_automatically is not the expected type, validation failed.")
      obj.allow_counterpart_autocreation&.is_a?(Boolean) != false || raise("Passed value for field obj.allow_counterpart_autocreation is not the expected type, validation failed.")
      obj.allow_counterpart_autolinking&.is_a?(Boolean) != false || raise("Passed value for field obj.allow_counterpart_autolinking is not the expected type, validation failed.")
      obj.allow_credit_note_autolinking&.is_a?(Boolean) != false || raise("Passed value for field obj.allow_credit_note_autolinking is not the expected type, validation failed.")
      obj.approve_page_url.is_a?(String) != false || raise("Passed value for field obj.approve_page_url is not the expected type, validation failed.")
      obj.default_state&.is_a?(String) != false || raise("Passed value for field obj.default_state is not the expected type, validation failed.")
      obj.enable_line_items&.is_a?(Boolean) != false || raise("Passed value for field obj.enable_line_items is not the expected type, validation failed.")
      obj.skip_approval_for_paid_invoice&.is_a?(Boolean) != false || raise("Passed value for field obj.skip_approval_for_paid_invoice is not the expected type, validation failed.")
    end
  end
end