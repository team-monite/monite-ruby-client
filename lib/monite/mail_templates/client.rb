# frozen_string_literal: true
require_relative "../../requests"
require_relative "../types/order_enum"
require_relative "../types/custom_templates_cursor_fields"
require_relative "../types/document_object_type_request_enum"
require_relative "../types/custom_templates_pagination_response"
require_relative "../types/language_code_enum"
require_relative "../types/custom_template_data_schema"
require_relative "../types/preview_template_response"
require_relative "../types/system_templates"
require "async"
require "async"
require "async"
require "async"
require "async"
require "async"
require "async"
require "async"
require_relative "../../requests"

module Monite
  class MailTemplatesClient
  # @return [Monite::RequestClient] 
    attr_reader :request_client


    # @param request_client [Monite::RequestClient] 
    # @return [Monite::MailTemplatesClient]
    def initialize(request_client:)
      @request_client = request_client
    end
# Get all custom templates
    #
    # @param order [Monite::OrderEnum] Order by
    # @param limit [Integer] Max is 100
    # @param pagination_token [String] A token, obtained from previous page. Prior over other filters
    # @param sort [Monite::CustomTemplatesCursorFields] Allowed sort fields
    # @param type [Monite::DocumentObjectTypeRequestEnum] 
    # @param type_in [Monite::DocumentObjectTypeRequestEnum] 
    # @param type_not_in [Monite::DocumentObjectTypeRequestEnum] 
    # @param is_default [Boolean] 
    # @param name [String] 
    # @param name_iexact [String] 
    # @param name_contains [String] 
    # @param name_icontains [String] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::CustomTemplatesPaginationResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.mail_templates.get
    def get(order: nil, limit: nil, pagination_token: nil, sort: nil, type: nil, type_in: nil, type_not_in: nil, is_default: nil, name: nil, name_iexact: nil, name_contains: nil, name_icontains: nil, request_options: nil)
      response = @request_client.conn.get do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.monite_version.nil?
    req.headers["x-monite-version"] = request_options.monite_version
  end
  unless request_options&.monite_entity_id.nil?
    req.headers["x-monite-entity-id"] = request_options.monite_entity_id
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  req.params = { **(request_options&.additional_query_parameters || {}), "order": order, "limit": limit, "pagination_token": pagination_token, "sort": sort, "type": type, "type__in": type_in, "type__not_in": type_not_in, "is_default": is_default, "name": name, "name__iexact": name_iexact, "name__contains": name_contains, "name__icontains": name_icontains }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/mail_templates"
end
      Monite::CustomTemplatesPaginationResponse.from_json(json_object: response.body)
    end
# Create custom template
    #
    # @param body_template [String] Jinja2 compatible string with email body
    # @param is_default [Boolean] Is default template
    # @param language [Monite::LanguageCodeEnum] Lowercase ISO code of language
    # @param name [String] Custom template name
    # @param subject_template [String] Jinja2 compatible string with email subject
    # @param type [Monite::DocumentObjectTypeRequestEnum] Document type of content
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::CustomTemplateDataSchema]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.mail_templates.create(
#    body_template: "body_template",
#    name: "name",
#    subject_template: "subject_template",
#    type: RECEIVABLES_QUOTE
#  )
    def create(body_template:, is_default: nil, language: nil, name:, subject_template:, type:, request_options: nil)
      response = @request_client.conn.post do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.monite_version.nil?
    req.headers["x-monite-version"] = request_options.monite_version
  end
  unless request_options&.monite_entity_id.nil?
    req.headers["x-monite-entity-id"] = request_options.monite_entity_id
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request_options&.additional_body_parameters || {}), body_template: body_template, is_default: is_default, language: language, name: name, subject_template: subject_template, type: type }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/mail_templates"
end
      Monite::CustomTemplateDataSchema.from_json(json_object: response.body)
    end
# Preview rendered template
    #
    # @param body [String] Body text of the template
    # @param document_type [Monite::DocumentObjectTypeRequestEnum] Document type of content
    # @param language_code [Monite::LanguageCodeEnum] Lowercase ISO code of language
    # @param subject [String] Subject text of the template
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::PreviewTemplateResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.mail_templates.preview(
#    body: "body",
#    document_type: RECEIVABLES_QUOTE,
#    language_code: AB,
#    subject: "subject"
#  )
    def preview(body:, document_type:, language_code:, subject:, request_options: nil)
      response = @request_client.conn.post do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.monite_version.nil?
    req.headers["x-monite-version"] = request_options.monite_version
  end
  unless request_options&.monite_entity_id.nil?
    req.headers["x-monite-entity-id"] = request_options.monite_entity_id
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request_options&.additional_body_parameters || {}), body: body, document_type: document_type, language_code: language_code, subject: subject }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/mail_templates/preview"
end
      Monite::PreviewTemplateResponse.from_json(json_object: response.body)
    end
# Get all system templates
    #
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::SystemTemplates]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.mail_templates.get_system
    def get_system(request_options: nil)
      response = @request_client.conn.get do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.monite_version.nil?
    req.headers["x-monite-version"] = request_options.monite_version
  end
  unless request_options&.monite_entity_id.nil?
    req.headers["x-monite-entity-id"] = request_options.monite_entity_id
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/mail_templates/system"
end
      Monite::SystemTemplates.from_json(json_object: response.body)
    end
# Get custom template by ID
    #
    # @param template_id [String] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::CustomTemplateDataSchema]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.mail_templates.get_by_id(template_id: "template_id")
    def get_by_id(template_id:, request_options: nil)
      response = @request_client.conn.get do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.monite_version.nil?
    req.headers["x-monite-version"] = request_options.monite_version
  end
  unless request_options&.monite_entity_id.nil?
    req.headers["x-monite-entity-id"] = request_options.monite_entity_id
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/mail_templates/#{template_id}"
end
      Monite::CustomTemplateDataSchema.from_json(json_object: response.body)
    end
# Delete custom template bt ID
    #
    # @param template_id [String] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Void]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.mail_templates.delete_by_id(template_id: "template_id")
    def delete_by_id(template_id:, request_options: nil)
      response = @request_client.conn.delete do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.monite_version.nil?
    req.headers["x-monite-version"] = request_options.monite_version
  end
  unless request_options&.monite_entity_id.nil?
    req.headers["x-monite-entity-id"] = request_options.monite_entity_id
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/mail_templates/#{template_id}"
end
    end
# Update custom template by ID
    #
    # @param template_id [String] 
    # @param body_template [String] Jinja2 compatible string with email body
    # @param language [Monite::LanguageCodeEnum] Lowercase ISO code of language
    # @param name [String] Custom template name
    # @param subject_template [String] Jinja2 compatible string with email subject
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::CustomTemplateDataSchema]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.mail_templates.update_by_id(template_id: "template_id")
    def update_by_id(template_id:, body_template: nil, language: nil, name: nil, subject_template: nil, request_options: nil)
      response = @request_client.conn.patch do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.monite_version.nil?
    req.headers["x-monite-version"] = request_options.monite_version
  end
  unless request_options&.monite_entity_id.nil?
    req.headers["x-monite-entity-id"] = request_options.monite_entity_id
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request_options&.additional_body_parameters || {}), body_template: body_template, language: language, name: name, subject_template: subject_template }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/mail_templates/#{template_id}"
end
      Monite::CustomTemplateDataSchema.from_json(json_object: response.body)
    end
# Make template default
    #
    # @param template_id [String] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::CustomTemplateDataSchema]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.mail_templates.make_default_by_id(template_id: "template_id")
    def make_default_by_id(template_id:, request_options: nil)
      response = @request_client.conn.post do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.monite_version.nil?
    req.headers["x-monite-version"] = request_options.monite_version
  end
  unless request_options&.monite_entity_id.nil?
    req.headers["x-monite-entity-id"] = request_options.monite_entity_id
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/mail_templates/#{template_id}/make_default"
end
      Monite::CustomTemplateDataSchema.from_json(json_object: response.body)
    end
  end
  class AsyncMailTemplatesClient
  # @return [Monite::AsyncRequestClient] 
    attr_reader :request_client


    # @param request_client [Monite::RequestClient] 
    # @return [Monite::AsyncMailTemplatesClient]
    def initialize(request_client:)
      @request_client = request_client
    end
# Get all custom templates
    #
    # @param order [Monite::OrderEnum] Order by
    # @param limit [Integer] Max is 100
    # @param pagination_token [String] A token, obtained from previous page. Prior over other filters
    # @param sort [Monite::CustomTemplatesCursorFields] Allowed sort fields
    # @param type [Monite::DocumentObjectTypeRequestEnum] 
    # @param type_in [Monite::DocumentObjectTypeRequestEnum] 
    # @param type_not_in [Monite::DocumentObjectTypeRequestEnum] 
    # @param is_default [Boolean] 
    # @param name [String] 
    # @param name_iexact [String] 
    # @param name_contains [String] 
    # @param name_icontains [String] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::CustomTemplatesPaginationResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.mail_templates.get
    def get(order: nil, limit: nil, pagination_token: nil, sort: nil, type: nil, type_in: nil, type_not_in: nil, is_default: nil, name: nil, name_iexact: nil, name_contains: nil, name_icontains: nil, request_options: nil)
      Async do
        response = @request_client.conn.get do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.monite_version.nil?
    req.headers["x-monite-version"] = request_options.monite_version
  end
  unless request_options&.monite_entity_id.nil?
    req.headers["x-monite-entity-id"] = request_options.monite_entity_id
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  req.params = { **(request_options&.additional_query_parameters || {}), "order": order, "limit": limit, "pagination_token": pagination_token, "sort": sort, "type": type, "type__in": type_in, "type__not_in": type_not_in, "is_default": is_default, "name": name, "name__iexact": name_iexact, "name__contains": name_contains, "name__icontains": name_icontains }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/mail_templates"
end
        Monite::CustomTemplatesPaginationResponse.from_json(json_object: response.body)
      end
    end
# Create custom template
    #
    # @param body_template [String] Jinja2 compatible string with email body
    # @param is_default [Boolean] Is default template
    # @param language [Monite::LanguageCodeEnum] Lowercase ISO code of language
    # @param name [String] Custom template name
    # @param subject_template [String] Jinja2 compatible string with email subject
    # @param type [Monite::DocumentObjectTypeRequestEnum] Document type of content
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::CustomTemplateDataSchema]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.mail_templates.create(
#    body_template: "body_template",
#    name: "name",
#    subject_template: "subject_template",
#    type: RECEIVABLES_QUOTE
#  )
    def create(body_template:, is_default: nil, language: nil, name:, subject_template:, type:, request_options: nil)
      Async do
        response = @request_client.conn.post do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.monite_version.nil?
    req.headers["x-monite-version"] = request_options.monite_version
  end
  unless request_options&.monite_entity_id.nil?
    req.headers["x-monite-entity-id"] = request_options.monite_entity_id
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request_options&.additional_body_parameters || {}), body_template: body_template, is_default: is_default, language: language, name: name, subject_template: subject_template, type: type }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/mail_templates"
end
        Monite::CustomTemplateDataSchema.from_json(json_object: response.body)
      end
    end
# Preview rendered template
    #
    # @param body [String] Body text of the template
    # @param document_type [Monite::DocumentObjectTypeRequestEnum] Document type of content
    # @param language_code [Monite::LanguageCodeEnum] Lowercase ISO code of language
    # @param subject [String] Subject text of the template
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::PreviewTemplateResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.mail_templates.preview(
#    body: "body",
#    document_type: RECEIVABLES_QUOTE,
#    language_code: AB,
#    subject: "subject"
#  )
    def preview(body:, document_type:, language_code:, subject:, request_options: nil)
      Async do
        response = @request_client.conn.post do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.monite_version.nil?
    req.headers["x-monite-version"] = request_options.monite_version
  end
  unless request_options&.monite_entity_id.nil?
    req.headers["x-monite-entity-id"] = request_options.monite_entity_id
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request_options&.additional_body_parameters || {}), body: body, document_type: document_type, language_code: language_code, subject: subject }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/mail_templates/preview"
end
        Monite::PreviewTemplateResponse.from_json(json_object: response.body)
      end
    end
# Get all system templates
    #
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::SystemTemplates]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.mail_templates.get_system
    def get_system(request_options: nil)
      Async do
        response = @request_client.conn.get do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.monite_version.nil?
    req.headers["x-monite-version"] = request_options.monite_version
  end
  unless request_options&.monite_entity_id.nil?
    req.headers["x-monite-entity-id"] = request_options.monite_entity_id
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/mail_templates/system"
end
        Monite::SystemTemplates.from_json(json_object: response.body)
      end
    end
# Get custom template by ID
    #
    # @param template_id [String] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::CustomTemplateDataSchema]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.mail_templates.get_by_id(template_id: "template_id")
    def get_by_id(template_id:, request_options: nil)
      Async do
        response = @request_client.conn.get do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.monite_version.nil?
    req.headers["x-monite-version"] = request_options.monite_version
  end
  unless request_options&.monite_entity_id.nil?
    req.headers["x-monite-entity-id"] = request_options.monite_entity_id
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/mail_templates/#{template_id}"
end
        Monite::CustomTemplateDataSchema.from_json(json_object: response.body)
      end
    end
# Delete custom template bt ID
    #
    # @param template_id [String] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Void]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.mail_templates.delete_by_id(template_id: "template_id")
    def delete_by_id(template_id:, request_options: nil)
      Async do
        response = @request_client.conn.delete do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.monite_version.nil?
    req.headers["x-monite-version"] = request_options.monite_version
  end
  unless request_options&.monite_entity_id.nil?
    req.headers["x-monite-entity-id"] = request_options.monite_entity_id
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/mail_templates/#{template_id}"
end
      end
    end
# Update custom template by ID
    #
    # @param template_id [String] 
    # @param body_template [String] Jinja2 compatible string with email body
    # @param language [Monite::LanguageCodeEnum] Lowercase ISO code of language
    # @param name [String] Custom template name
    # @param subject_template [String] Jinja2 compatible string with email subject
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::CustomTemplateDataSchema]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.mail_templates.update_by_id(template_id: "template_id")
    def update_by_id(template_id:, body_template: nil, language: nil, name: nil, subject_template: nil, request_options: nil)
      Async do
        response = @request_client.conn.patch do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.monite_version.nil?
    req.headers["x-monite-version"] = request_options.monite_version
  end
  unless request_options&.monite_entity_id.nil?
    req.headers["x-monite-entity-id"] = request_options.monite_entity_id
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request_options&.additional_body_parameters || {}), body_template: body_template, language: language, name: name, subject_template: subject_template }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/mail_templates/#{template_id}"
end
        Monite::CustomTemplateDataSchema.from_json(json_object: response.body)
      end
    end
# Make template default
    #
    # @param template_id [String] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::CustomTemplateDataSchema]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.mail_templates.make_default_by_id(template_id: "template_id")
    def make_default_by_id(template_id:, request_options: nil)
      Async do
        response = @request_client.conn.post do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.monite_version.nil?
    req.headers["x-monite-version"] = request_options.monite_version
  end
  unless request_options&.monite_entity_id.nil?
    req.headers["x-monite-entity-id"] = request_options.monite_entity_id
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/mail_templates/#{template_id}/make_default"
end
        Monite::CustomTemplateDataSchema.from_json(json_object: response.body)
      end
    end
  end
end