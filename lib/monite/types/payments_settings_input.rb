# frozen_string_literal: true
require_relative "payment_page_theme"
require "ostruct"
require "json"

module Monite
  class PaymentsSettingsInput
  # @return [String] 
    attr_reader :payment_page_domain
  # @return [Monite::PaymentPageTheme] 
    attr_reader :payment_page_theme
  # @return [String] The support email address
    attr_reader :support_email
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param payment_page_domain [String] 
    # @param payment_page_theme [Monite::PaymentPageTheme] 
    # @param support_email [String] The support email address
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::PaymentsSettingsInput]
    def initialize(payment_page_domain: OMIT, payment_page_theme: OMIT, support_email: OMIT, additional_properties: nil)
      @payment_page_domain = payment_page_domain if payment_page_domain != OMIT
      @payment_page_theme = payment_page_theme if payment_page_theme != OMIT
      @support_email = support_email if support_email != OMIT
      @additional_properties = additional_properties
      @_field_set = { "payment_page_domain": payment_page_domain, "payment_page_theme": payment_page_theme, "support_email": support_email }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of PaymentsSettingsInput
    #
    # @param json_object [String] 
    # @return [Monite::PaymentsSettingsInput]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      payment_page_domain = parsed_json["payment_page_domain"]
      unless parsed_json["payment_page_theme"].nil?
        payment_page_theme = parsed_json["payment_page_theme"].to_json
        payment_page_theme = Monite::PaymentPageTheme.from_json(json_object: payment_page_theme)
      else
        payment_page_theme = nil
      end
      support_email = parsed_json["support_email"]
      new(
        payment_page_domain: payment_page_domain,
        payment_page_theme: payment_page_theme,
        support_email: support_email,
        additional_properties: struct
      )
    end
# Serialize an instance of PaymentsSettingsInput to a JSON object
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
      obj.payment_page_domain&.is_a?(String) != false || raise("Passed value for field obj.payment_page_domain is not the expected type, validation failed.")
      obj.payment_page_theme.nil? || Monite::PaymentPageTheme.validate_raw(obj: obj.payment_page_theme)
      obj.support_email&.is_a?(String) != false || raise("Passed value for field obj.support_email is not the expected type, validation failed.")
    end
  end
end