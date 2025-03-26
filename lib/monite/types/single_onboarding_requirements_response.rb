# frozen_string_literal: true
require_relative "payment_method_requirements"
require_relative "onboarding_requirements_error"
require_relative "onboarding_verification_error"
require_relative "onboarding_verification_status_enum"
require "ostruct"
require "json"

module Monite
  class SingleOnboardingRequirementsResponse
  # @return [String] 
    attr_reader :disabled_reason
  # @return [String] 
    attr_reader :payment_method
  # @return [Monite::PaymentMethodRequirements] 
    attr_reader :requirements
  # @return [Array<Monite::OnboardingRequirementsError>] 
    attr_reader :requirements_errors
  # @return [Array<Monite::OnboardingVerificationError>] 
    attr_reader :verification_errors
  # @return [Monite::OnboardingVerificationStatusEnum] 
    attr_reader :verification_status
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param disabled_reason [String] 
    # @param payment_method [String] 
    # @param requirements [Monite::PaymentMethodRequirements] 
    # @param requirements_errors [Array<Monite::OnboardingRequirementsError>] 
    # @param verification_errors [Array<Monite::OnboardingVerificationError>] 
    # @param verification_status [Monite::OnboardingVerificationStatusEnum] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::SingleOnboardingRequirementsResponse]
    def initialize(disabled_reason: OMIT, payment_method:, requirements:, requirements_errors:, verification_errors:, verification_status:, additional_properties: nil)
      @disabled_reason = disabled_reason if disabled_reason != OMIT
      @payment_method = payment_method
      @requirements = requirements
      @requirements_errors = requirements_errors
      @verification_errors = verification_errors
      @verification_status = verification_status
      @additional_properties = additional_properties
      @_field_set = { "disabled_reason": disabled_reason, "payment_method": payment_method, "requirements": requirements, "requirements_errors": requirements_errors, "verification_errors": verification_errors, "verification_status": verification_status }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of SingleOnboardingRequirementsResponse
    #
    # @param json_object [String] 
    # @return [Monite::SingleOnboardingRequirementsResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      disabled_reason = parsed_json["disabled_reason"]
      payment_method = parsed_json["payment_method"]
      unless parsed_json["requirements"].nil?
        requirements = parsed_json["requirements"].to_json
        requirements = Monite::PaymentMethodRequirements.from_json(json_object: requirements)
      else
        requirements = nil
      end
      requirements_errors = parsed_json["requirements_errors"]&.map do | item |
  item = item.to_json
  Monite::OnboardingRequirementsError.from_json(json_object: item)
end
      verification_errors = parsed_json["verification_errors"]&.map do | item |
  item = item.to_json
  Monite::OnboardingVerificationError.from_json(json_object: item)
end
      verification_status = parsed_json["verification_status"]
      new(
        disabled_reason: disabled_reason,
        payment_method: payment_method,
        requirements: requirements,
        requirements_errors: requirements_errors,
        verification_errors: verification_errors,
        verification_status: verification_status,
        additional_properties: struct
      )
    end
# Serialize an instance of SingleOnboardingRequirementsResponse to a JSON object
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
      obj.disabled_reason&.is_a?(String) != false || raise("Passed value for field obj.disabled_reason is not the expected type, validation failed.")
      obj.payment_method.is_a?(String) != false || raise("Passed value for field obj.payment_method is not the expected type, validation failed.")
      Monite::PaymentMethodRequirements.validate_raw(obj: obj.requirements)
      obj.requirements_errors.is_a?(Array) != false || raise("Passed value for field obj.requirements_errors is not the expected type, validation failed.")
      obj.verification_errors.is_a?(Array) != false || raise("Passed value for field obj.verification_errors is not the expected type, validation failed.")
      obj.verification_status.is_a?(Monite::OnboardingVerificationStatusEnum) != false || raise("Passed value for field obj.verification_status is not the expected type, validation failed.")
    end
  end
end