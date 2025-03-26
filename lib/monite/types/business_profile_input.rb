# frozen_string_literal: true
require_relative "estimated_monthly_revenue"
require_relative "allowed_countries"
require "ostruct"
require "json"

module Monite
  class BusinessProfileInput
  # @return [String] Required for US entities. A free-form description of the products the entity
#  sells (whether online or at offline retail stores) or the services it provides
#  to its customers.
    attr_reader :description_of_goods_or_services
  # @return [Monite::EstimatedMonthlyRevenue] Required for US entities. The approximate revenue that the business generates
#  per month.
    attr_reader :estimated_monthly_revenue
  # @return [String] The merchant category code of the entity. MCCs are used to classify businesses
#  based on the goods or services they provide.
    attr_reader :mcc
  # @return [Array<Monite::AllowedCountries>] Required for US entities. A list of primary countries where the business
#  conducts its operations, such as selling products or providing services. Use
#  two-letter country codes (ISO 3166-2 alpha-2).
    attr_reader :operating_countries
  # @return [String] The business's publicly available website.
    attr_reader :url
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param description_of_goods_or_services [String] Required for US entities. A free-form description of the products the entity
#  sells (whether online or at offline retail stores) or the services it provides
#  to its customers.
    # @param estimated_monthly_revenue [Monite::EstimatedMonthlyRevenue] Required for US entities. The approximate revenue that the business generates
#  per month.
    # @param mcc [String] The merchant category code of the entity. MCCs are used to classify businesses
#  based on the goods or services they provide.
    # @param operating_countries [Array<Monite::AllowedCountries>] Required for US entities. A list of primary countries where the business
#  conducts its operations, such as selling products or providing services. Use
#  two-letter country codes (ISO 3166-2 alpha-2).
    # @param url [String] The business's publicly available website.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::BusinessProfileInput]
    def initialize(description_of_goods_or_services: OMIT, estimated_monthly_revenue: OMIT, mcc: OMIT, operating_countries: OMIT, url: OMIT, additional_properties: nil)
      @description_of_goods_or_services = description_of_goods_or_services if description_of_goods_or_services != OMIT
      @estimated_monthly_revenue = estimated_monthly_revenue if estimated_monthly_revenue != OMIT
      @mcc = mcc if mcc != OMIT
      @operating_countries = operating_countries if operating_countries != OMIT
      @url = url if url != OMIT
      @additional_properties = additional_properties
      @_field_set = { "description_of_goods_or_services": description_of_goods_or_services, "estimated_monthly_revenue": estimated_monthly_revenue, "mcc": mcc, "operating_countries": operating_countries, "url": url }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of BusinessProfileInput
    #
    # @param json_object [String] 
    # @return [Monite::BusinessProfileInput]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      description_of_goods_or_services = parsed_json["description_of_goods_or_services"]
      unless parsed_json["estimated_monthly_revenue"].nil?
        estimated_monthly_revenue = parsed_json["estimated_monthly_revenue"].to_json
        estimated_monthly_revenue = Monite::EstimatedMonthlyRevenue.from_json(json_object: estimated_monthly_revenue)
      else
        estimated_monthly_revenue = nil
      end
      mcc = parsed_json["mcc"]
      operating_countries = parsed_json["operating_countries"]
      url = parsed_json["url"]
      new(
        description_of_goods_or_services: description_of_goods_or_services,
        estimated_monthly_revenue: estimated_monthly_revenue,
        mcc: mcc,
        operating_countries: operating_countries,
        url: url,
        additional_properties: struct
      )
    end
# Serialize an instance of BusinessProfileInput to a JSON object
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
      obj.description_of_goods_or_services&.is_a?(String) != false || raise("Passed value for field obj.description_of_goods_or_services is not the expected type, validation failed.")
      obj.estimated_monthly_revenue.nil? || Monite::EstimatedMonthlyRevenue.validate_raw(obj: obj.estimated_monthly_revenue)
      obj.mcc&.is_a?(String) != false || raise("Passed value for field obj.mcc is not the expected type, validation failed.")
      obj.operating_countries&.is_a?(Array) != false || raise("Passed value for field obj.operating_countries is not the expected type, validation failed.")
      obj.url&.is_a?(String) != false || raise("Passed value for field obj.url is not the expected type, validation failed.")
    end
  end
end