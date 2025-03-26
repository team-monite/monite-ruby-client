# frozen_string_literal: true
require "ostruct"
require "json"

module Monite
# Contains information about a payment received for an invoice.
  class PaymentReceivedEventData
  # @return [Integer] The remainimg amount due of the invoice, in [minor
#  units](https://docs.monite.com/references/currencies#minor-units) of the
#  currency. For example, $12.5 is represented as 1250.
    attr_reader :amount_due
  # @return [Integer] The payment amount, in minor units of the currency.
    attr_reader :amount_paid
  # @return [String] A user-defined comment about this payment, or `null` if no comment was provided.
#  Comments are available only for payments recorded via `POST
#  /receivables/{receivable_id}/mark_as_paid` and `POST
#  /receivables/{receivable_id}/mark_as_partially_paid`.
    attr_reader :comment
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param amount_due [Integer] The remainimg amount due of the invoice, in [minor
#  units](https://docs.monite.com/references/currencies#minor-units) of the
#  currency. For example, $12.5 is represented as 1250.
    # @param amount_paid [Integer] The payment amount, in minor units of the currency.
    # @param comment [String] A user-defined comment about this payment, or `null` if no comment was provided.
#  Comments are available only for payments recorded via `POST
#  /receivables/{receivable_id}/mark_as_paid` and `POST
#  /receivables/{receivable_id}/mark_as_partially_paid`.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::PaymentReceivedEventData]
    def initialize(amount_due:, amount_paid:, comment: OMIT, additional_properties: nil)
      @amount_due = amount_due
      @amount_paid = amount_paid
      @comment = comment if comment != OMIT
      @additional_properties = additional_properties
      @_field_set = { "amount_due": amount_due, "amount_paid": amount_paid, "comment": comment }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of PaymentReceivedEventData
    #
    # @param json_object [String] 
    # @return [Monite::PaymentReceivedEventData]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      amount_due = parsed_json["amount_due"]
      amount_paid = parsed_json["amount_paid"]
      comment = parsed_json["comment"]
      new(
        amount_due: amount_due,
        amount_paid: amount_paid,
        comment: comment,
        additional_properties: struct
      )
    end
# Serialize an instance of PaymentReceivedEventData to a JSON object
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
      obj.amount_due.is_a?(Integer) != false || raise("Passed value for field obj.amount_due is not the expected type, validation failed.")
      obj.amount_paid.is_a?(Integer) != false || raise("Passed value for field obj.amount_paid is not the expected type, validation failed.")
      obj.comment&.is_a?(String) != false || raise("Passed value for field obj.comment is not the expected type, validation failed.")
    end
  end
end