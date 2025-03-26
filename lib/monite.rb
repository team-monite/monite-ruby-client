# frozen_string_literal: true
require_relative "environment"
require_relative "types_export"
require_relative "requests"
require_relative "monite/analytics/client"
require_relative "monite/approval_policies/client"
require_relative "monite/approval_requests/client"
require_relative "monite/access_tokens/client"
require_relative "monite/comments/client"
require_relative "monite/counterparts/client"
require_relative "monite/data_exports/client"
require_relative "monite/pdf_templates/client"
require_relative "monite/e_invoicing_connections/client"
require_relative "monite/entities/client"
require_relative "monite/entity_users/client"
require_relative "monite/events/client"
require_relative "monite/files/client"
require_relative "monite/financing/client"
require_relative "monite/mail_templates/client"
require_relative "monite/mailbox_domains/client"
require_relative "monite/mailboxes/client"
require_relative "monite/measure_units/client"
require_relative "monite/overdue_reminders/client"
require_relative "monite/credit_notes/client"
require_relative "monite/purchase_orders/client"
require_relative "monite/payables/client"
require_relative "monite/payment_intents/client"
require_relative "monite/payment_links/client"
require_relative "monite/payment_records/client"
require_relative "monite/payment_reminders/client"
require_relative "monite/payment_terms/client"
require_relative "monite/products/client"
require_relative "monite/projects/client"
require_relative "monite/receivables/client"
require_relative "monite/recurrences/client"
require_relative "monite/roles/client"
require_relative "monite/partner_settings/client"
require_relative "monite/tags/client"
require_relative "monite/text_templates/client"
require_relative "monite/vat_rates/client"
require_relative "monite/webhook_deliveries/client"
require_relative "monite/webhook_subscriptions/client"
require_relative "monite/accounting/client"
require_relative "requests"
require_relative "monite/accounting/client"

module Monite
  class Client
  # @return [Monite::AnalyticsClient] 
    attr_reader :analytics
  # @return [Monite::ApprovalPoliciesClient] 
    attr_reader :approval_policies
  # @return [Monite::ApprovalRequestsClient] 
    attr_reader :approval_requests
  # @return [Monite::AccessTokensClient] 
    attr_reader :access_tokens
  # @return [Monite::CommentsClient] 
    attr_reader :comments
  # @return [Monite::CounterpartsClient] 
    attr_reader :counterparts
  # @return [Monite::DataExportsClient] 
    attr_reader :data_exports
  # @return [Monite::PdfTemplatesClient] 
    attr_reader :pdf_templates
  # @return [Monite::EInvoicingConnectionsClient] 
    attr_reader :e_invoicing_connections
  # @return [Monite::EntitiesClient] 
    attr_reader :entities
  # @return [Monite::EntityUsersClient] 
    attr_reader :entity_users
  # @return [Monite::EventsClient] 
    attr_reader :events
  # @return [Monite::FilesClient] 
    attr_reader :files
  # @return [Monite::FinancingClient] 
    attr_reader :financing
  # @return [Monite::MailTemplatesClient] 
    attr_reader :mail_templates
  # @return [Monite::MailboxDomainsClient] 
    attr_reader :mailbox_domains
  # @return [Monite::MailboxesClient] 
    attr_reader :mailboxes
  # @return [Monite::MeasureUnitsClient] 
    attr_reader :measure_units
  # @return [Monite::OverdueRemindersClient] 
    attr_reader :overdue_reminders
  # @return [Monite::CreditNotesClient] 
    attr_reader :credit_notes
  # @return [Monite::PurchaseOrdersClient] 
    attr_reader :purchase_orders
  # @return [Monite::PayablesClient] 
    attr_reader :payables
  # @return [Monite::PaymentIntentsClient] 
    attr_reader :payment_intents
  # @return [Monite::PaymentLinksClient] 
    attr_reader :payment_links
  # @return [Monite::PaymentRecordsClient] 
    attr_reader :payment_records
  # @return [Monite::PaymentRemindersClient] 
    attr_reader :payment_reminders
  # @return [Monite::PaymentTermsClient] 
    attr_reader :payment_terms
  # @return [Monite::ProductsClient] 
    attr_reader :products
  # @return [Monite::ProjectsClient] 
    attr_reader :projects
  # @return [Monite::ReceivablesClient] 
    attr_reader :receivables
  # @return [Monite::RecurrencesClient] 
    attr_reader :recurrences
  # @return [Monite::RolesClient] 
    attr_reader :roles
  # @return [Monite::PartnerSettingsClient] 
    attr_reader :partner_settings
  # @return [Monite::TagsClient] 
    attr_reader :tags
  # @return [Monite::TextTemplatesClient] 
    attr_reader :text_templates
  # @return [Monite::VatRatesClient] 
    attr_reader :vat_rates
  # @return [Monite::WebhookDeliveriesClient] 
    attr_reader :webhook_deliveries
  # @return [Monite::WebhookSubscriptionsClient] 
    attr_reader :webhook_subscriptions
  # @return [Monite::Accounting::Client] 
    attr_reader :accounting


    # @param base_url [String] 
    # @param environment [Monite::Environment] 
    # @param max_retries [Long] The number of times to retry a failed request, defaults to 2.
    # @param timeout_in_seconds [Long] 
    # @param token [String] 
    # @param monite_version [String] 
    # @param monite_entity_id [String] The ID of the entity that owns the requested resource.
    # @return [Monite::Client]
    def initialize(base_url: nil, environment: Monite::Environment::SANDBOX, max_retries: nil, timeout_in_seconds: nil, token:, monite_version:, monite_entity_id: nil)
      @request_client = Monite::RequestClient.new(
  base_url: base_url,
  environment: environment,
  max_retries: max_retries,
  timeout_in_seconds: timeout_in_seconds,
  token: token,
  monite_version: monite_version,
  monite_entity_id: monite_entity_id
)
      @analytics = Monite::AnalyticsClient.new(request_client: @request_client)
      @approval_policies = Monite::ApprovalPoliciesClient.new(request_client: @request_client)
      @approval_requests = Monite::ApprovalRequestsClient.new(request_client: @request_client)
      @access_tokens = Monite::AccessTokensClient.new(request_client: @request_client)
      @comments = Monite::CommentsClient.new(request_client: @request_client)
      @counterparts = Monite::CounterpartsClient.new(request_client: @request_client)
      @data_exports = Monite::DataExportsClient.new(request_client: @request_client)
      @pdf_templates = Monite::PdfTemplatesClient.new(request_client: @request_client)
      @e_invoicing_connections = Monite::EInvoicingConnectionsClient.new(request_client: @request_client)
      @entities = Monite::EntitiesClient.new(request_client: @request_client)
      @entity_users = Monite::EntityUsersClient.new(request_client: @request_client)
      @events = Monite::EventsClient.new(request_client: @request_client)
      @files = Monite::FilesClient.new(request_client: @request_client)
      @financing = Monite::FinancingClient.new(request_client: @request_client)
      @mail_templates = Monite::MailTemplatesClient.new(request_client: @request_client)
      @mailbox_domains = Monite::MailboxDomainsClient.new(request_client: @request_client)
      @mailboxes = Monite::MailboxesClient.new(request_client: @request_client)
      @measure_units = Monite::MeasureUnitsClient.new(request_client: @request_client)
      @overdue_reminders = Monite::OverdueRemindersClient.new(request_client: @request_client)
      @credit_notes = Monite::CreditNotesClient.new(request_client: @request_client)
      @purchase_orders = Monite::PurchaseOrdersClient.new(request_client: @request_client)
      @payables = Monite::PayablesClient.new(request_client: @request_client)
      @payment_intents = Monite::PaymentIntentsClient.new(request_client: @request_client)
      @payment_links = Monite::PaymentLinksClient.new(request_client: @request_client)
      @payment_records = Monite::PaymentRecordsClient.new(request_client: @request_client)
      @payment_reminders = Monite::PaymentRemindersClient.new(request_client: @request_client)
      @payment_terms = Monite::PaymentTermsClient.new(request_client: @request_client)
      @products = Monite::ProductsClient.new(request_client: @request_client)
      @projects = Monite::ProjectsClient.new(request_client: @request_client)
      @receivables = Monite::ReceivablesClient.new(request_client: @request_client)
      @recurrences = Monite::RecurrencesClient.new(request_client: @request_client)
      @roles = Monite::RolesClient.new(request_client: @request_client)
      @partner_settings = Monite::PartnerSettingsClient.new(request_client: @request_client)
      @tags = Monite::TagsClient.new(request_client: @request_client)
      @text_templates = Monite::TextTemplatesClient.new(request_client: @request_client)
      @vat_rates = Monite::VatRatesClient.new(request_client: @request_client)
      @webhook_deliveries = Monite::WebhookDeliveriesClient.new(request_client: @request_client)
      @webhook_subscriptions = Monite::WebhookSubscriptionsClient.new(request_client: @request_client)
      @accounting = Monite::Accounting::Client.new(request_client: @request_client)
    end
  end
  class AsyncClient
  # @return [Monite::AsyncAnalyticsClient] 
    attr_reader :analytics
  # @return [Monite::AsyncApprovalPoliciesClient] 
    attr_reader :approval_policies
  # @return [Monite::AsyncApprovalRequestsClient] 
    attr_reader :approval_requests
  # @return [Monite::AsyncAccessTokensClient] 
    attr_reader :access_tokens
  # @return [Monite::AsyncCommentsClient] 
    attr_reader :comments
  # @return [Monite::AsyncCounterpartsClient] 
    attr_reader :counterparts
  # @return [Monite::AsyncDataExportsClient] 
    attr_reader :data_exports
  # @return [Monite::AsyncPdfTemplatesClient] 
    attr_reader :pdf_templates
  # @return [Monite::AsyncEInvoicingConnectionsClient] 
    attr_reader :e_invoicing_connections
  # @return [Monite::AsyncEntitiesClient] 
    attr_reader :entities
  # @return [Monite::AsyncEntityUsersClient] 
    attr_reader :entity_users
  # @return [Monite::AsyncEventsClient] 
    attr_reader :events
  # @return [Monite::AsyncFilesClient] 
    attr_reader :files
  # @return [Monite::AsyncFinancingClient] 
    attr_reader :financing
  # @return [Monite::AsyncMailTemplatesClient] 
    attr_reader :mail_templates
  # @return [Monite::AsyncMailboxDomainsClient] 
    attr_reader :mailbox_domains
  # @return [Monite::AsyncMailboxesClient] 
    attr_reader :mailboxes
  # @return [Monite::AsyncMeasureUnitsClient] 
    attr_reader :measure_units
  # @return [Monite::AsyncOverdueRemindersClient] 
    attr_reader :overdue_reminders
  # @return [Monite::AsyncCreditNotesClient] 
    attr_reader :credit_notes
  # @return [Monite::AsyncPurchaseOrdersClient] 
    attr_reader :purchase_orders
  # @return [Monite::AsyncPayablesClient] 
    attr_reader :payables
  # @return [Monite::AsyncPaymentIntentsClient] 
    attr_reader :payment_intents
  # @return [Monite::AsyncPaymentLinksClient] 
    attr_reader :payment_links
  # @return [Monite::AsyncPaymentRecordsClient] 
    attr_reader :payment_records
  # @return [Monite::AsyncPaymentRemindersClient] 
    attr_reader :payment_reminders
  # @return [Monite::AsyncPaymentTermsClient] 
    attr_reader :payment_terms
  # @return [Monite::AsyncProductsClient] 
    attr_reader :products
  # @return [Monite::AsyncProjectsClient] 
    attr_reader :projects
  # @return [Monite::AsyncReceivablesClient] 
    attr_reader :receivables
  # @return [Monite::AsyncRecurrencesClient] 
    attr_reader :recurrences
  # @return [Monite::AsyncRolesClient] 
    attr_reader :roles
  # @return [Monite::AsyncPartnerSettingsClient] 
    attr_reader :partner_settings
  # @return [Monite::AsyncTagsClient] 
    attr_reader :tags
  # @return [Monite::AsyncTextTemplatesClient] 
    attr_reader :text_templates
  # @return [Monite::AsyncVatRatesClient] 
    attr_reader :vat_rates
  # @return [Monite::AsyncWebhookDeliveriesClient] 
    attr_reader :webhook_deliveries
  # @return [Monite::AsyncWebhookSubscriptionsClient] 
    attr_reader :webhook_subscriptions
  # @return [Monite::Accounting::AsyncClient] 
    attr_reader :accounting


    # @param base_url [String] 
    # @param environment [Monite::Environment] 
    # @param max_retries [Long] The number of times to retry a failed request, defaults to 2.
    # @param timeout_in_seconds [Long] 
    # @param token [String] 
    # @param monite_version [String] 
    # @param monite_entity_id [String] The ID of the entity that owns the requested resource.
    # @return [Monite::AsyncClient]
    def initialize(base_url: nil, environment: Monite::Environment::SANDBOX, max_retries: nil, timeout_in_seconds: nil, token:, monite_version:, monite_entity_id: nil)
      @async_request_client = Monite::AsyncRequestClient.new(
  base_url: base_url,
  environment: environment,
  max_retries: max_retries,
  timeout_in_seconds: timeout_in_seconds,
  token: token,
  monite_version: monite_version,
  monite_entity_id: monite_entity_id
)
      @analytics = Monite::AsyncAnalyticsClient.new(request_client: @async_request_client)
      @approval_policies = Monite::AsyncApprovalPoliciesClient.new(request_client: @async_request_client)
      @approval_requests = Monite::AsyncApprovalRequestsClient.new(request_client: @async_request_client)
      @access_tokens = Monite::AsyncAccessTokensClient.new(request_client: @async_request_client)
      @comments = Monite::AsyncCommentsClient.new(request_client: @async_request_client)
      @counterparts = Monite::AsyncCounterpartsClient.new(request_client: @async_request_client)
      @data_exports = Monite::AsyncDataExportsClient.new(request_client: @async_request_client)
      @pdf_templates = Monite::AsyncPdfTemplatesClient.new(request_client: @async_request_client)
      @e_invoicing_connections = Monite::AsyncEInvoicingConnectionsClient.new(request_client: @async_request_client)
      @entities = Monite::AsyncEntitiesClient.new(request_client: @async_request_client)
      @entity_users = Monite::AsyncEntityUsersClient.new(request_client: @async_request_client)
      @events = Monite::AsyncEventsClient.new(request_client: @async_request_client)
      @files = Monite::AsyncFilesClient.new(request_client: @async_request_client)
      @financing = Monite::AsyncFinancingClient.new(request_client: @async_request_client)
      @mail_templates = Monite::AsyncMailTemplatesClient.new(request_client: @async_request_client)
      @mailbox_domains = Monite::AsyncMailboxDomainsClient.new(request_client: @async_request_client)
      @mailboxes = Monite::AsyncMailboxesClient.new(request_client: @async_request_client)
      @measure_units = Monite::AsyncMeasureUnitsClient.new(request_client: @async_request_client)
      @overdue_reminders = Monite::AsyncOverdueRemindersClient.new(request_client: @async_request_client)
      @credit_notes = Monite::AsyncCreditNotesClient.new(request_client: @async_request_client)
      @purchase_orders = Monite::AsyncPurchaseOrdersClient.new(request_client: @async_request_client)
      @payables = Monite::AsyncPayablesClient.new(request_client: @async_request_client)
      @payment_intents = Monite::AsyncPaymentIntentsClient.new(request_client: @async_request_client)
      @payment_links = Monite::AsyncPaymentLinksClient.new(request_client: @async_request_client)
      @payment_records = Monite::AsyncPaymentRecordsClient.new(request_client: @async_request_client)
      @payment_reminders = Monite::AsyncPaymentRemindersClient.new(request_client: @async_request_client)
      @payment_terms = Monite::AsyncPaymentTermsClient.new(request_client: @async_request_client)
      @products = Monite::AsyncProductsClient.new(request_client: @async_request_client)
      @projects = Monite::AsyncProjectsClient.new(request_client: @async_request_client)
      @receivables = Monite::AsyncReceivablesClient.new(request_client: @async_request_client)
      @recurrences = Monite::AsyncRecurrencesClient.new(request_client: @async_request_client)
      @roles = Monite::AsyncRolesClient.new(request_client: @async_request_client)
      @partner_settings = Monite::AsyncPartnerSettingsClient.new(request_client: @async_request_client)
      @tags = Monite::AsyncTagsClient.new(request_client: @async_request_client)
      @text_templates = Monite::AsyncTextTemplatesClient.new(request_client: @async_request_client)
      @vat_rates = Monite::AsyncVatRatesClient.new(request_client: @async_request_client)
      @webhook_deliveries = Monite::AsyncWebhookDeliveriesClient.new(request_client: @async_request_client)
      @webhook_subscriptions = Monite::AsyncWebhookSubscriptionsClient.new(request_client: @async_request_client)
      @accounting = Monite::Accounting::AsyncClient.new(request_client: @async_request_client)
    end
  end
end