# frozen_string_literal: true
require "ostruct"
require "json"

module Monite
  class EntityOnboardingDocuments
  # @return [String] 
    attr_reader :verification_document_front
  # @return [String] 
    attr_reader :verification_document_back
  # @return [String] 
    attr_reader :additional_verification_document_front
  # @return [String] 
    attr_reader :additional_verification_document_back
  # @return [Array<String>] 
    attr_reader :bank_account_ownership_verification
  # @return [Array<String>] 
    attr_reader :company_license
  # @return [Array<String>] 
    attr_reader :company_memorandum_of_association
  # @return [Array<String>] 
    attr_reader :company_ministerial_decree
  # @return [Array<String>] 
    attr_reader :company_registration_verification
  # @return [Array<String>] 
    attr_reader :company_tax_id_verification
  # @return [Array<String>] 
    attr_reader :proof_of_registration
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param verification_document_front [String] 
    # @param verification_document_back [String] 
    # @param additional_verification_document_front [String] 
    # @param additional_verification_document_back [String] 
    # @param bank_account_ownership_verification [Array<String>] 
    # @param company_license [Array<String>] 
    # @param company_memorandum_of_association [Array<String>] 
    # @param company_ministerial_decree [Array<String>] 
    # @param company_registration_verification [Array<String>] 
    # @param company_tax_id_verification [Array<String>] 
    # @param proof_of_registration [Array<String>] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::EntityOnboardingDocuments]
    def initialize(verification_document_front: OMIT, verification_document_back: OMIT, additional_verification_document_front: OMIT, additional_verification_document_back: OMIT, bank_account_ownership_verification: OMIT, company_license: OMIT, company_memorandum_of_association: OMIT, company_ministerial_decree: OMIT, company_registration_verification: OMIT, company_tax_id_verification: OMIT, proof_of_registration: OMIT, additional_properties: nil)
      @verification_document_front = verification_document_front if verification_document_front != OMIT
      @verification_document_back = verification_document_back if verification_document_back != OMIT
      @additional_verification_document_front = additional_verification_document_front if additional_verification_document_front != OMIT
      @additional_verification_document_back = additional_verification_document_back if additional_verification_document_back != OMIT
      @bank_account_ownership_verification = bank_account_ownership_verification if bank_account_ownership_verification != OMIT
      @company_license = company_license if company_license != OMIT
      @company_memorandum_of_association = company_memorandum_of_association if company_memorandum_of_association != OMIT
      @company_ministerial_decree = company_ministerial_decree if company_ministerial_decree != OMIT
      @company_registration_verification = company_registration_verification if company_registration_verification != OMIT
      @company_tax_id_verification = company_tax_id_verification if company_tax_id_verification != OMIT
      @proof_of_registration = proof_of_registration if proof_of_registration != OMIT
      @additional_properties = additional_properties
      @_field_set = { "verification_document_front": verification_document_front, "verification_document_back": verification_document_back, "additional_verification_document_front": additional_verification_document_front, "additional_verification_document_back": additional_verification_document_back, "bank_account_ownership_verification": bank_account_ownership_verification, "company_license": company_license, "company_memorandum_of_association": company_memorandum_of_association, "company_ministerial_decree": company_ministerial_decree, "company_registration_verification": company_registration_verification, "company_tax_id_verification": company_tax_id_verification, "proof_of_registration": proof_of_registration }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of EntityOnboardingDocuments
    #
    # @param json_object [String] 
    # @return [Monite::EntityOnboardingDocuments]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      verification_document_front = parsed_json["verification_document_front"]
      verification_document_back = parsed_json["verification_document_back"]
      additional_verification_document_front = parsed_json["additional_verification_document_front"]
      additional_verification_document_back = parsed_json["additional_verification_document_back"]
      bank_account_ownership_verification = parsed_json["bank_account_ownership_verification"]
      company_license = parsed_json["company_license"]
      company_memorandum_of_association = parsed_json["company_memorandum_of_association"]
      company_ministerial_decree = parsed_json["company_ministerial_decree"]
      company_registration_verification = parsed_json["company_registration_verification"]
      company_tax_id_verification = parsed_json["company_tax_id_verification"]
      proof_of_registration = parsed_json["proof_of_registration"]
      new(
        verification_document_front: verification_document_front,
        verification_document_back: verification_document_back,
        additional_verification_document_front: additional_verification_document_front,
        additional_verification_document_back: additional_verification_document_back,
        bank_account_ownership_verification: bank_account_ownership_verification,
        company_license: company_license,
        company_memorandum_of_association: company_memorandum_of_association,
        company_ministerial_decree: company_ministerial_decree,
        company_registration_verification: company_registration_verification,
        company_tax_id_verification: company_tax_id_verification,
        proof_of_registration: proof_of_registration,
        additional_properties: struct
      )
    end
# Serialize an instance of EntityOnboardingDocuments to a JSON object
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
      obj.verification_document_front&.is_a?(String) != false || raise("Passed value for field obj.verification_document_front is not the expected type, validation failed.")
      obj.verification_document_back&.is_a?(String) != false || raise("Passed value for field obj.verification_document_back is not the expected type, validation failed.")
      obj.additional_verification_document_front&.is_a?(String) != false || raise("Passed value for field obj.additional_verification_document_front is not the expected type, validation failed.")
      obj.additional_verification_document_back&.is_a?(String) != false || raise("Passed value for field obj.additional_verification_document_back is not the expected type, validation failed.")
      obj.bank_account_ownership_verification&.is_a?(Array) != false || raise("Passed value for field obj.bank_account_ownership_verification is not the expected type, validation failed.")
      obj.company_license&.is_a?(Array) != false || raise("Passed value for field obj.company_license is not the expected type, validation failed.")
      obj.company_memorandum_of_association&.is_a?(Array) != false || raise("Passed value for field obj.company_memorandum_of_association is not the expected type, validation failed.")
      obj.company_ministerial_decree&.is_a?(Array) != false || raise("Passed value for field obj.company_ministerial_decree is not the expected type, validation failed.")
      obj.company_registration_verification&.is_a?(Array) != false || raise("Passed value for field obj.company_registration_verification is not the expected type, validation failed.")
      obj.company_tax_id_verification&.is_a?(Array) != false || raise("Passed value for field obj.company_tax_id_verification is not the expected type, validation failed.")
      obj.proof_of_registration&.is_a?(Array) != false || raise("Passed value for field obj.proof_of_registration is not the expected type, validation failed.")
    end
  end
end