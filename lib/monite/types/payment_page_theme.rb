# frozen_string_literal: true
require_relative "button_theme"
require_relative "card_theme"
require "ostruct"
require "json"

module Monite
  class PaymentPageTheme
  # @return [String] 
    attr_reader :background_color
  # @return [String] 
    attr_reader :border_radius
  # @return [Monite::ButtonTheme] 
    attr_reader :button
  # @return [Monite::CardTheme] 
    attr_reader :card
  # @return [String] 
    attr_reader :font_color
  # @return [String] 
    attr_reader :font_family
  # @return [String] 
    attr_reader :font_link_href
  # @return [String] 
    attr_reader :logo_src
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param background_color [String] 
    # @param border_radius [String] 
    # @param button [Monite::ButtonTheme] 
    # @param card [Monite::CardTheme] 
    # @param font_color [String] 
    # @param font_family [String] 
    # @param font_link_href [String] 
    # @param logo_src [String] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::PaymentPageTheme]
    def initialize(background_color: OMIT, border_radius: OMIT, button: OMIT, card: OMIT, font_color: OMIT, font_family: OMIT, font_link_href: OMIT, logo_src: OMIT, additional_properties: nil)
      @background_color = background_color if background_color != OMIT
      @border_radius = border_radius if border_radius != OMIT
      @button = button if button != OMIT
      @card = card if card != OMIT
      @font_color = font_color if font_color != OMIT
      @font_family = font_family if font_family != OMIT
      @font_link_href = font_link_href if font_link_href != OMIT
      @logo_src = logo_src if logo_src != OMIT
      @additional_properties = additional_properties
      @_field_set = { "background_color": background_color, "border_radius": border_radius, "button": button, "card": card, "font_color": font_color, "font_family": font_family, "font_link_href": font_link_href, "logo_src": logo_src }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of PaymentPageTheme
    #
    # @param json_object [String] 
    # @return [Monite::PaymentPageTheme]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      background_color = parsed_json["background_color"]
      border_radius = parsed_json["border_radius"]
      unless parsed_json["button"].nil?
        button = parsed_json["button"].to_json
        button = Monite::ButtonTheme.from_json(json_object: button)
      else
        button = nil
      end
      unless parsed_json["card"].nil?
        card = parsed_json["card"].to_json
        card = Monite::CardTheme.from_json(json_object: card)
      else
        card = nil
      end
      font_color = parsed_json["font_color"]
      font_family = parsed_json["font_family"]
      font_link_href = parsed_json["font_link_href"]
      logo_src = parsed_json["logo_src"]
      new(
        background_color: background_color,
        border_radius: border_radius,
        button: button,
        card: card,
        font_color: font_color,
        font_family: font_family,
        font_link_href: font_link_href,
        logo_src: logo_src,
        additional_properties: struct
      )
    end
# Serialize an instance of PaymentPageTheme to a JSON object
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
      obj.background_color&.is_a?(String) != false || raise("Passed value for field obj.background_color is not the expected type, validation failed.")
      obj.border_radius&.is_a?(String) != false || raise("Passed value for field obj.border_radius is not the expected type, validation failed.")
      obj.button.nil? || Monite::ButtonTheme.validate_raw(obj: obj.button)
      obj.card.nil? || Monite::CardTheme.validate_raw(obj: obj.card)
      obj.font_color&.is_a?(String) != false || raise("Passed value for field obj.font_color is not the expected type, validation failed.")
      obj.font_family&.is_a?(String) != false || raise("Passed value for field obj.font_family is not the expected type, validation failed.")
      obj.font_link_href&.is_a?(String) != false || raise("Passed value for field obj.font_link_href is not the expected type, validation failed.")
      obj.logo_src&.is_a?(String) != false || raise("Passed value for field obj.logo_src is not the expected type, validation failed.")
    end
  end
end