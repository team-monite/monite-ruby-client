# frozen_string_literal: true
require_relative "../../requests"
require_relative "payables/client"
require_relative "receivables/client"
require_relative "connections/client"
require_relative "synced_records/client"
require_relative "tax_rates/client"
require_relative "ledger_accounts/client"
require_relative "../../requests"

module Monite
  module Accounting
    class Client
    # @return [Monite::Accounting::PayablesClient] 
      attr_reader :payables
    # @return [Monite::Accounting::ReceivablesClient] 
      attr_reader :receivables
    # @return [Monite::Accounting::ConnectionsClient] 
      attr_reader :connections
    # @return [Monite::Accounting::SyncedRecordsClient] 
      attr_reader :synced_records
    # @return [Monite::Accounting::TaxRatesClient] 
      attr_reader :tax_rates
    # @return [Monite::Accounting::LedgerAccountsClient] 
      attr_reader :ledger_accounts


      # @param request_client [Monite::RequestClient] 
      # @return [Monite::Accounting::Client]
      def initialize(request_client:)
        @payables = Monite::Accounting::PayablesClient.new(request_client: request_client)
        @receivables = Monite::Accounting::ReceivablesClient.new(request_client: request_client)
        @connections = Monite::Accounting::ConnectionsClient.new(request_client: request_client)
        @synced_records = Monite::Accounting::SyncedRecordsClient.new(request_client: request_client)
        @tax_rates = Monite::Accounting::TaxRatesClient.new(request_client: request_client)
        @ledger_accounts = Monite::Accounting::LedgerAccountsClient.new(request_client: request_client)
      end
    end
    class AsyncClient
    # @return [Monite::Accounting::AsyncPayablesClient] 
      attr_reader :payables
    # @return [Monite::Accounting::AsyncReceivablesClient] 
      attr_reader :receivables
    # @return [Monite::Accounting::AsyncConnectionsClient] 
      attr_reader :connections
    # @return [Monite::Accounting::AsyncSyncedRecordsClient] 
      attr_reader :synced_records
    # @return [Monite::Accounting::AsyncTaxRatesClient] 
      attr_reader :tax_rates
    # @return [Monite::Accounting::AsyncLedgerAccountsClient] 
      attr_reader :ledger_accounts


      # @param request_client [Monite::AsyncRequestClient] 
      # @return [Monite::Accounting::AsyncClient]
      def initialize(request_client:)
        @payables = Monite::Accounting::AsyncPayablesClient.new(request_client: request_client)
        @receivables = Monite::Accounting::AsyncReceivablesClient.new(request_client: request_client)
        @connections = Monite::Accounting::AsyncConnectionsClient.new(request_client: request_client)
        @synced_records = Monite::Accounting::AsyncSyncedRecordsClient.new(request_client: request_client)
        @tax_rates = Monite::Accounting::AsyncTaxRatesClient.new(request_client: request_client)
        @ledger_accounts = Monite::Accounting::AsyncLedgerAccountsClient.new(request_client: request_client)
      end
    end
  end
end