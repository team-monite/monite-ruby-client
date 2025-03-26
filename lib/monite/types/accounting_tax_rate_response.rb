# frozen_string_literal: true
require_relative "tax_component_response"
require "ostruct"
require "json"

module Monite
  class AccountingTaxRateResponse
  # @return [String] 
    attr_reader :id
  # @return [String] Code for the tax rate from the accounting platform.
    attr_reader :code
  # @return [Array<Monite::TaxComponentResponse>] 
    attr_reader :components
  # @return [Integer] Effective tax rate in percent [minor
#  units](https://docs.monite.com/references/currencies#minor-units). Example:
#  12.5% is 1250.
    attr_reader :effective_tax_rate
  # @return [String] 
    attr_reader :name
  # @return [String] 
    attr_reader :status
  # @return [Integer] Total (not compounded) sum of the components of a tax rate in [minor
#  units](https://docs.monite.com/references/currencies#minor-units). Example:
#  12.5% is 1250.
    attr_reader :total_tax_rate
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] 
    # @param code [String] Code for the tax rate from the accounting platform.
    # @param components [Array<Monite::TaxComponentResponse>] 
    # @param effective_tax_rate [Integer] Effective tax rate in percent [minor
#  units](https://docs.monite.com/references/currencies#minor-units). Example:
#  12.5% is 1250.
    # @param name [String] 
    # @param status [String] 
    # @param total_tax_rate [Integer] Total (not compounded) sum of the components of a tax rate in [minor
#  units](https://docs.monite.com/references/currencies#minor-units). Example:
#  12.5% is 1250.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::AccountingTaxRateResponse]
    def initialize(id:, code: OMIT, components: OMIT, effective_tax_rate: OMIT, name: OMIT, status: OMIT, total_tax_rate: OMIT, additional_properties: nil)
      @id = id
      @code = code if code != OMIT
      @components = components if components != OMIT
      @effective_tax_rate = effective_tax_rate if effective_tax_rate != OMIT
      @name = name if name != OMIT
      @status = status if status != OMIT
      @total_tax_rate = total_tax_rate if total_tax_rate != OMIT
      @additional_properties = additional_properties
      @_field_set = { "id": id, "code": code, "components": components, "effective_tax_rate": effective_tax_rate, "name": name, "status": status, "total_tax_rate": total_tax_rate }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of AccountingTaxRateResponse
    #
    # @param json_object [String] 
    # @return [Monite::AccountingTaxRateResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      code = parsed_json["code"]
      components = parsed_json["components"]&.map do | item |
  item = item.to_json
  Monite::TaxComponentResponse.from_json(json_object: item)
end
      effective_tax_rate = parsed_json["effective_tax_rate"]
      name = parsed_json["name"]
      status = parsed_json["status"]
      total_tax_rate = parsed_json["total_tax_rate"]
      new(
        id: id,
        code: code,
        components: components,
        effective_tax_rate: effective_tax_rate,
        name: name,
        status: status,
        total_tax_rate: total_tax_rate,
        additional_properties: struct
      )
    end
# Serialize an instance of AccountingTaxRateResponse to a JSON object
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
      obj.code&.is_a?(String) != false || raise("Passed value for field obj.code is not the expected type, validation failed.")
      obj.components&.is_a?(Array) != false || raise("Passed value for field obj.components is not the expected type, validation failed.")
      obj.effective_tax_rate&.is_a?(Integer) != false || raise("Passed value for field obj.effective_tax_rate is not the expected type, validation failed.")
      obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.status&.is_a?(String) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
      obj.total_tax_rate&.is_a?(Integer) != false || raise("Passed value for field obj.total_tax_rate is not the expected type, validation failed.")
    end
  end
end