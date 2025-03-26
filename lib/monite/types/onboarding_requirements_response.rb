# frozen_string_literal: true
require_relative "account_disabled_reason"
require_relative "payment_requirements"
require_relative "requirements_error"
require_relative "verification_error"
require_relative "verification_status_enum"
require "ostruct"
require "json"

module Monite
  class OnboardingRequirementsResponse
  # @return [Monite::AccountDisabledReason] 
    attr_reader :disabled_reason
  # @return [Monite::PaymentRequirements] 
    attr_reader :requirements
  # @return [Array<Monite::RequirementsError>] 
    attr_reader :requirements_errors
  # @return [Array<Monite::VerificationError>] 
    attr_reader :verification_errors
  # @return [Monite::VerificationStatusEnum] 
    attr_reader :verification_status
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param disabled_reason [Monite::AccountDisabledReason] 
    # @param requirements [Monite::PaymentRequirements] 
    # @param requirements_errors [Array<Monite::RequirementsError>] 
    # @param verification_errors [Array<Monite::VerificationError>] 
    # @param verification_status [Monite::VerificationStatusEnum] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::OnboardingRequirementsResponse]
    def initialize(disabled_reason: OMIT, requirements:, requirements_errors:, verification_errors:, verification_status:, additional_properties: nil)
      @disabled_reason = disabled_reason if disabled_reason != OMIT
      @requirements = requirements
      @requirements_errors = requirements_errors
      @verification_errors = verification_errors
      @verification_status = verification_status
      @additional_properties = additional_properties
      @_field_set = { "disabled_reason": disabled_reason, "requirements": requirements, "requirements_errors": requirements_errors, "verification_errors": verification_errors, "verification_status": verification_status }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of OnboardingRequirementsResponse
    #
    # @param json_object [String] 
    # @return [Monite::OnboardingRequirementsResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      disabled_reason = parsed_json["disabled_reason"]
      unless parsed_json["requirements"].nil?
        requirements = parsed_json["requirements"].to_json
        requirements = Monite::PaymentRequirements.from_json(json_object: requirements)
      else
        requirements = nil
      end
      requirements_errors = parsed_json["requirements_errors"]&.map do | item |
  item = item.to_json
  Monite::RequirementsError.from_json(json_object: item)
end
      verification_errors = parsed_json["verification_errors"]&.map do | item |
  item = item.to_json
  Monite::VerificationError.from_json(json_object: item)
end
      verification_status = parsed_json["verification_status"]
      new(
        disabled_reason: disabled_reason,
        requirements: requirements,
        requirements_errors: requirements_errors,
        verification_errors: verification_errors,
        verification_status: verification_status,
        additional_properties: struct
      )
    end
# Serialize an instance of OnboardingRequirementsResponse to a JSON object
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
      obj.disabled_reason&.is_a?(Monite::AccountDisabledReason) != false || raise("Passed value for field obj.disabled_reason is not the expected type, validation failed.")
      Monite::PaymentRequirements.validate_raw(obj: obj.requirements)
      obj.requirements_errors.is_a?(Array) != false || raise("Passed value for field obj.requirements_errors is not the expected type, validation failed.")
      obj.verification_errors.is_a?(Array) != false || raise("Passed value for field obj.verification_errors is not the expected type, validation failed.")
      obj.verification_status.is_a?(Monite::VerificationStatusEnum) != false || raise("Passed value for field obj.verification_status is not the expected type, validation failed.")
    end
  end
end