# frozen_string_literal: true
require_relative "../../requests"
require_relative "../types/credit_note_dimension_enum"
require_relative "../types/credit_note_metric_enum"
require_relative "../types/aggregation_function_enum"
require_relative "../types/date_dimension_breakdown_enum"
require "date"
require "date"
require "date"
require "date"
require_relative "../types/credit_note_state_enum"
require_relative "../types/currency_enum"
require_relative "../types/payable_analytics_response"
require_relative "../types/payable_dimension_enum"
require_relative "../types/payable_metric_enum"
require "date"
require "date"
require "date"
require "date"
require_relative "../types/payable_state_enum"
require_relative "../types/source_of_payable_data_enum"
require_relative "../types/ocr_status_enum"
require "async"
require "async"
require_relative "../../requests"

module Monite
  class AnalyticsClient
  # @return [Monite::RequestClient] 
    attr_reader :request_client


    # @param request_client [Monite::RequestClient] 
    # @return [Monite::AnalyticsClient]
    def initialize(request_client:)
      @request_client = request_client
    end
# Retrieve aggregated statistics for payables with different breakdowns.
    #
    # @param dimension [Monite::CreditNoteDimensionEnum] 
    # @param metric [Monite::CreditNoteMetricEnum] 
    # @param aggregation_function [Monite::AggregationFunctionEnum] 
    # @param date_dimension_breakdown [Monite::DateDimensionBreakdownEnum] 
    # @param created_at_gt [DateTime] 
    # @param created_at_lt [DateTime] 
    # @param created_at_gte [DateTime] 
    # @param created_at_lte [DateTime] 
    # @param issued_at [String] 
    # @param issued_at_gt [String] 
    # @param issued_at_lt [String] 
    # @param issued_at_gte [String] 
    # @param issued_at_lte [String] 
    # @param document_id [String] 
    # @param document_id_iexact [String] 
    # @param document_id_contains [String] 
    # @param document_id_icontains [String] 
    # @param total_amount_gt [Integer] 
    # @param total_amount_lt [Integer] 
    # @param total_amount_gte [Integer] 
    # @param total_amount_lte [Integer] 
    # @param subtotal_gt [Integer] 
    # @param subtotal_lt [Integer] 
    # @param subtotal_gte [Integer] 
    # @param subtotal_lte [Integer] 
    # @param based_on [String] 
    # @param counterpart_id [String] 
    # @param created_by_entity_user_id [String] 
    # @param status [Monite::CreditNoteStateEnum] 
    # @param status_in [Monite::CreditNoteStateEnum] 
    # @param status_not_in [Monite::CreditNoteStateEnum] 
    # @param currency [Monite::CurrencyEnum] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::PayableAnalyticsResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.analytics.get_analytics_credit_notes(metric: ID, aggregation_function: COUNT)
    def get_analytics_credit_notes(dimension: nil, metric:, aggregation_function:, date_dimension_breakdown: nil, created_at_gt: nil, created_at_lt: nil, created_at_gte: nil, created_at_lte: nil, issued_at: nil, issued_at_gt: nil, issued_at_lt: nil, issued_at_gte: nil, issued_at_lte: nil, document_id: nil, document_id_iexact: nil, document_id_contains: nil, document_id_icontains: nil, total_amount_gt: nil, total_amount_lt: nil, total_amount_gte: nil, total_amount_lte: nil, subtotal_gt: nil, subtotal_lt: nil, subtotal_gte: nil, subtotal_lte: nil, based_on: nil, counterpart_id: nil, created_by_entity_user_id: nil, status: nil, status_in: nil, status_not_in: nil, currency: nil, request_options: nil)
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
  req.params = { **(request_options&.additional_query_parameters || {}), "dimension": dimension, "metric": metric, "aggregation_function": aggregation_function, "date_dimension_breakdown": date_dimension_breakdown, "created_at__gt": created_at_gt, "created_at__lt": created_at_lt, "created_at__gte": created_at_gte, "created_at__lte": created_at_lte, "issued_at": issued_at, "issued_at__gt": issued_at_gt, "issued_at__lt": issued_at_lt, "issued_at__gte": issued_at_gte, "issued_at__lte": issued_at_lte, "document_id": document_id, "document_id__iexact": document_id_iexact, "document_id__contains": document_id_contains, "document_id__icontains": document_id_icontains, "total_amount__gt": total_amount_gt, "total_amount__lt": total_amount_lt, "total_amount__gte": total_amount_gte, "total_amount__lte": total_amount_lte, "subtotal__gt": subtotal_gt, "subtotal__lt": subtotal_lt, "subtotal__gte": subtotal_gte, "subtotal__lte": subtotal_lte, "based_on": based_on, "counterpart_id": counterpart_id, "created_by_entity_user_id": created_by_entity_user_id, "status": status, "status__in": status_in, "status__not_in": status_not_in, "currency": currency }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/analytics/credit_notes"
end
      Monite::PayableAnalyticsResponse.from_json(json_object: response.body)
    end
# Retrieve aggregated statistics for payables with different breakdowns.
    #
    # @param dimension [Monite::PayableDimensionEnum] 
    # @param metric [Monite::PayableMetricEnum] 
    # @param aggregation_function [Monite::AggregationFunctionEnum] 
    # @param date_dimension_breakdown [Monite::DateDimensionBreakdownEnum] 
    # @param created_at_gt [DateTime] Return only payables created in Monite after the specified date and time. The
#  value must be in the ISO 8601 format YYYY-MM-DDThh:mm[:ss[.ffffff]][Z|±hh:mm].
    # @param created_at_lt [DateTime] Return only payables created in Monite before the specified date and time.
    # @param created_at_gte [DateTime] Return only payables created in Monite on or after the specified date and time.
    # @param created_at_lte [DateTime] Return only payables created in Monite before or on the specified date and time.
    # @param status [Monite::PayableStateEnum] Return only payables that have the specified
#  [status](https://docs.monite.com/accounts-payable/payables/index).
#  To query multiple statuses at once, use the `status__in` parameter instead.
    # @param status_in [Monite::PayableStateEnum] Return only payables that have the specified
#  [statuses](https://docs.monite.com/accounts-payable/payables/index).
#  To specify multiple statuses, repeat this parameter for each value:
#  `status__in=draft&status__in=new`
    # @param id_in [String] Return only payables with specified IDs. Valid but nonexistent IDs do not raise
#  errors but produce no results.
#  To specify multiple IDs, repeat this parameter for each value:
#  `id__in=<id1>&id__in=<id2>`
    # @param total_amount [Integer] Return only payables with the exact specified total amount. The amount must be
#  specified in the minor units of currency. For example, $12.5 is represented as
#  1250.
    # @param total_amount_gt [Integer] Return only payables whose total amount (in minor units) exceeds the specified
#  value.
    # @param total_amount_lt [Integer] Return only payables whose total amount (in minor units) is less than the
#  specified value.
    # @param total_amount_gte [Integer] Return only payables whose total amount (in minor units) is greater than or
#  equal to the specified value.
    # @param total_amount_lte [Integer] Return only payables whose total amount (in minor units) is less than or equal
#  to the specified value.
    # @param amount [Integer] Return only payables with the specified amount.
    # @param amount_gt [Integer] Return only payables whose amount (in minor units) exceeds the specified value.
    # @param amount_lt [Integer] Return only payables whose amount (in minor units) is less than the specified
#  value.
    # @param amount_gte [Integer] Return only payables whose amount (in minor units) is greater than or equal to
#  the specified value.
    # @param amount_lte [Integer] Return only payables whose amount (in minor units) is less than or equal to the
#  specified value.
    # @param currency [Monite::CurrencyEnum] Return only payables that use the specified currency.
    # @param counterpart_name [String] Return only payables received from counterparts with the specified name (exact
#  match, case-sensitive).
#  For counterparts of `type = individual`, the full name is formatted as
#  `first_name last_name`.
    # @param counterpart_name_contains [String] Return only payables received from counterparts whose name contains the
#  specified string (case-sensitive).
    # @param counterpart_name_icontains [String] Return only payables received from counterparts whose name contains the
#  specified string (case-insensitive).
    # @param search_text [String] Apply the `icontains` condition to search for the specified text in the
#  `document_id` and `counterpart_name` fields in the payables.
    # @param due_date [String] Return payables that are due on the specified date (YYYY-MM-DD)
    # @param due_date_gt [String] Return payables that are due after the specified date (exclusive, YYYY-MM-DD).
    # @param due_date_lt [String] Return payables that are due before the specified date (exclusive, YYYY-MM-DD).
    # @param due_date_gte [String] Return payables that are due on or after the specified date (YYYY-MM-DD).
    # @param due_date_lte [String] Return payables that are due before or on the specified date (YYYY-MM-DD).
    # @param document_id [String] Return a payable with the exact specified document number (case-sensitive).
#  The `document_id` is the user-facing document number such as INV-00042, not to
#  be confused with Monite resource IDs (`id`).
    # @param document_id_contains [String] Return only payables whose document number (`document_id`) contains the
#  specified string (case-sensitive).
    # @param document_id_icontains [String] Return only payables whose document number (`document_id`) contains the
#  specified string (case-insensitive).
    # @param was_created_by_user_id [String] Return only payables created in Monite by the entity user with the specified ID.
    # @param counterpart_id [String] Return only payables received from the counterpart with the specified ID.
#  Counterparts that have been deleted but have associated payables will still
#  return results here because the payables contain a frozen copy of the
#  counterpart data.
#  If the specified counterpart ID does not exist and never existed, no results are
#  returned.
    # @param source_of_payable_data [Monite::SourceOfPayableDataEnum] Return only payables coming from the specified source.
    # @param ocr_status [Monite::OcrStatusEnum] Return only payables with specific OCR statuses.
    # @param line_item_id [String] Search for a payable by the identifier of the line item associated with it.
    # @param purchase_order_id [String] Search for a payable by the identifier of the purchase order associated with it.
    # @param project_id [String] Return only payables assigned to the project with the specified ID.
#  Valid but nonexistent project IDs do not raise errors but return no results.
    # @param tag_ids [String] Return only payables whose `tags` include at least one of the tags with the
#  specified IDs. Valid but nonexistent tag IDs do not raise errors but produce no
#  results.
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::PayableAnalyticsResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.analytics.get_analytics_payables(metric: ID, aggregation_function: COUNT)
    def get_analytics_payables(dimension: nil, metric:, aggregation_function:, date_dimension_breakdown: nil, created_at_gt: nil, created_at_lt: nil, created_at_gte: nil, created_at_lte: nil, status: nil, status_in: nil, id_in: nil, total_amount: nil, total_amount_gt: nil, total_amount_lt: nil, total_amount_gte: nil, total_amount_lte: nil, amount: nil, amount_gt: nil, amount_lt: nil, amount_gte: nil, amount_lte: nil, currency: nil, counterpart_name: nil, counterpart_name_contains: nil, counterpart_name_icontains: nil, search_text: nil, due_date: nil, due_date_gt: nil, due_date_lt: nil, due_date_gte: nil, due_date_lte: nil, document_id: nil, document_id_contains: nil, document_id_icontains: nil, was_created_by_user_id: nil, counterpart_id: nil, source_of_payable_data: nil, ocr_status: nil, line_item_id: nil, purchase_order_id: nil, project_id: nil, tag_ids: nil, request_options: nil)
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
  req.params = { **(request_options&.additional_query_parameters || {}), "dimension": dimension, "metric": metric, "aggregation_function": aggregation_function, "date_dimension_breakdown": date_dimension_breakdown, "created_at__gt": created_at_gt, "created_at__lt": created_at_lt, "created_at__gte": created_at_gte, "created_at__lte": created_at_lte, "status": status, "status__in": status_in, "id__in": id_in, "total_amount": total_amount, "total_amount__gt": total_amount_gt, "total_amount__lt": total_amount_lt, "total_amount__gte": total_amount_gte, "total_amount__lte": total_amount_lte, "amount": amount, "amount__gt": amount_gt, "amount__lt": amount_lt, "amount__gte": amount_gte, "amount__lte": amount_lte, "currency": currency, "counterpart_name": counterpart_name, "counterpart_name__contains": counterpart_name_contains, "counterpart_name__icontains": counterpart_name_icontains, "search_text": search_text, "due_date": due_date, "due_date__gt": due_date_gt, "due_date__lt": due_date_lt, "due_date__gte": due_date_gte, "due_date__lte": due_date_lte, "document_id": document_id, "document_id__contains": document_id_contains, "document_id__icontains": document_id_icontains, "was_created_by_user_id": was_created_by_user_id, "counterpart_id": counterpart_id, "source_of_payable_data": source_of_payable_data, "ocr_status": ocr_status, "line_item_id": line_item_id, "purchase_order_id": purchase_order_id, "project_id": project_id, "tag_ids": tag_ids }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/analytics/payables"
end
      Monite::PayableAnalyticsResponse.from_json(json_object: response.body)
    end
  end
  class AsyncAnalyticsClient
  # @return [Monite::AsyncRequestClient] 
    attr_reader :request_client


    # @param request_client [Monite::RequestClient] 
    # @return [Monite::AsyncAnalyticsClient]
    def initialize(request_client:)
      @request_client = request_client
    end
# Retrieve aggregated statistics for payables with different breakdowns.
    #
    # @param dimension [Monite::CreditNoteDimensionEnum] 
    # @param metric [Monite::CreditNoteMetricEnum] 
    # @param aggregation_function [Monite::AggregationFunctionEnum] 
    # @param date_dimension_breakdown [Monite::DateDimensionBreakdownEnum] 
    # @param created_at_gt [DateTime] 
    # @param created_at_lt [DateTime] 
    # @param created_at_gte [DateTime] 
    # @param created_at_lte [DateTime] 
    # @param issued_at [String] 
    # @param issued_at_gt [String] 
    # @param issued_at_lt [String] 
    # @param issued_at_gte [String] 
    # @param issued_at_lte [String] 
    # @param document_id [String] 
    # @param document_id_iexact [String] 
    # @param document_id_contains [String] 
    # @param document_id_icontains [String] 
    # @param total_amount_gt [Integer] 
    # @param total_amount_lt [Integer] 
    # @param total_amount_gte [Integer] 
    # @param total_amount_lte [Integer] 
    # @param subtotal_gt [Integer] 
    # @param subtotal_lt [Integer] 
    # @param subtotal_gte [Integer] 
    # @param subtotal_lte [Integer] 
    # @param based_on [String] 
    # @param counterpart_id [String] 
    # @param created_by_entity_user_id [String] 
    # @param status [Monite::CreditNoteStateEnum] 
    # @param status_in [Monite::CreditNoteStateEnum] 
    # @param status_not_in [Monite::CreditNoteStateEnum] 
    # @param currency [Monite::CurrencyEnum] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::PayableAnalyticsResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.analytics.get_analytics_credit_notes(metric: ID, aggregation_function: COUNT)
    def get_analytics_credit_notes(dimension: nil, metric:, aggregation_function:, date_dimension_breakdown: nil, created_at_gt: nil, created_at_lt: nil, created_at_gte: nil, created_at_lte: nil, issued_at: nil, issued_at_gt: nil, issued_at_lt: nil, issued_at_gte: nil, issued_at_lte: nil, document_id: nil, document_id_iexact: nil, document_id_contains: nil, document_id_icontains: nil, total_amount_gt: nil, total_amount_lt: nil, total_amount_gte: nil, total_amount_lte: nil, subtotal_gt: nil, subtotal_lt: nil, subtotal_gte: nil, subtotal_lte: nil, based_on: nil, counterpart_id: nil, created_by_entity_user_id: nil, status: nil, status_in: nil, status_not_in: nil, currency: nil, request_options: nil)
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
  req.params = { **(request_options&.additional_query_parameters || {}), "dimension": dimension, "metric": metric, "aggregation_function": aggregation_function, "date_dimension_breakdown": date_dimension_breakdown, "created_at__gt": created_at_gt, "created_at__lt": created_at_lt, "created_at__gte": created_at_gte, "created_at__lte": created_at_lte, "issued_at": issued_at, "issued_at__gt": issued_at_gt, "issued_at__lt": issued_at_lt, "issued_at__gte": issued_at_gte, "issued_at__lte": issued_at_lte, "document_id": document_id, "document_id__iexact": document_id_iexact, "document_id__contains": document_id_contains, "document_id__icontains": document_id_icontains, "total_amount__gt": total_amount_gt, "total_amount__lt": total_amount_lt, "total_amount__gte": total_amount_gte, "total_amount__lte": total_amount_lte, "subtotal__gt": subtotal_gt, "subtotal__lt": subtotal_lt, "subtotal__gte": subtotal_gte, "subtotal__lte": subtotal_lte, "based_on": based_on, "counterpart_id": counterpart_id, "created_by_entity_user_id": created_by_entity_user_id, "status": status, "status__in": status_in, "status__not_in": status_not_in, "currency": currency }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/analytics/credit_notes"
end
        Monite::PayableAnalyticsResponse.from_json(json_object: response.body)
      end
    end
# Retrieve aggregated statistics for payables with different breakdowns.
    #
    # @param dimension [Monite::PayableDimensionEnum] 
    # @param metric [Monite::PayableMetricEnum] 
    # @param aggregation_function [Monite::AggregationFunctionEnum] 
    # @param date_dimension_breakdown [Monite::DateDimensionBreakdownEnum] 
    # @param created_at_gt [DateTime] Return only payables created in Monite after the specified date and time. The
#  value must be in the ISO 8601 format YYYY-MM-DDThh:mm[:ss[.ffffff]][Z|±hh:mm].
    # @param created_at_lt [DateTime] Return only payables created in Monite before the specified date and time.
    # @param created_at_gte [DateTime] Return only payables created in Monite on or after the specified date and time.
    # @param created_at_lte [DateTime] Return only payables created in Monite before or on the specified date and time.
    # @param status [Monite::PayableStateEnum] Return only payables that have the specified
#  [status](https://docs.monite.com/accounts-payable/payables/index).
#  To query multiple statuses at once, use the `status__in` parameter instead.
    # @param status_in [Monite::PayableStateEnum] Return only payables that have the specified
#  [statuses](https://docs.monite.com/accounts-payable/payables/index).
#  To specify multiple statuses, repeat this parameter for each value:
#  `status__in=draft&status__in=new`
    # @param id_in [String] Return only payables with specified IDs. Valid but nonexistent IDs do not raise
#  errors but produce no results.
#  To specify multiple IDs, repeat this parameter for each value:
#  `id__in=<id1>&id__in=<id2>`
    # @param total_amount [Integer] Return only payables with the exact specified total amount. The amount must be
#  specified in the minor units of currency. For example, $12.5 is represented as
#  1250.
    # @param total_amount_gt [Integer] Return only payables whose total amount (in minor units) exceeds the specified
#  value.
    # @param total_amount_lt [Integer] Return only payables whose total amount (in minor units) is less than the
#  specified value.
    # @param total_amount_gte [Integer] Return only payables whose total amount (in minor units) is greater than or
#  equal to the specified value.
    # @param total_amount_lte [Integer] Return only payables whose total amount (in minor units) is less than or equal
#  to the specified value.
    # @param amount [Integer] Return only payables with the specified amount.
    # @param amount_gt [Integer] Return only payables whose amount (in minor units) exceeds the specified value.
    # @param amount_lt [Integer] Return only payables whose amount (in minor units) is less than the specified
#  value.
    # @param amount_gte [Integer] Return only payables whose amount (in minor units) is greater than or equal to
#  the specified value.
    # @param amount_lte [Integer] Return only payables whose amount (in minor units) is less than or equal to the
#  specified value.
    # @param currency [Monite::CurrencyEnum] Return only payables that use the specified currency.
    # @param counterpart_name [String] Return only payables received from counterparts with the specified name (exact
#  match, case-sensitive).
#  For counterparts of `type = individual`, the full name is formatted as
#  `first_name last_name`.
    # @param counterpart_name_contains [String] Return only payables received from counterparts whose name contains the
#  specified string (case-sensitive).
    # @param counterpart_name_icontains [String] Return only payables received from counterparts whose name contains the
#  specified string (case-insensitive).
    # @param search_text [String] Apply the `icontains` condition to search for the specified text in the
#  `document_id` and `counterpart_name` fields in the payables.
    # @param due_date [String] Return payables that are due on the specified date (YYYY-MM-DD)
    # @param due_date_gt [String] Return payables that are due after the specified date (exclusive, YYYY-MM-DD).
    # @param due_date_lt [String] Return payables that are due before the specified date (exclusive, YYYY-MM-DD).
    # @param due_date_gte [String] Return payables that are due on or after the specified date (YYYY-MM-DD).
    # @param due_date_lte [String] Return payables that are due before or on the specified date (YYYY-MM-DD).
    # @param document_id [String] Return a payable with the exact specified document number (case-sensitive).
#  The `document_id` is the user-facing document number such as INV-00042, not to
#  be confused with Monite resource IDs (`id`).
    # @param document_id_contains [String] Return only payables whose document number (`document_id`) contains the
#  specified string (case-sensitive).
    # @param document_id_icontains [String] Return only payables whose document number (`document_id`) contains the
#  specified string (case-insensitive).
    # @param was_created_by_user_id [String] Return only payables created in Monite by the entity user with the specified ID.
    # @param counterpart_id [String] Return only payables received from the counterpart with the specified ID.
#  Counterparts that have been deleted but have associated payables will still
#  return results here because the payables contain a frozen copy of the
#  counterpart data.
#  If the specified counterpart ID does not exist and never existed, no results are
#  returned.
    # @param source_of_payable_data [Monite::SourceOfPayableDataEnum] Return only payables coming from the specified source.
    # @param ocr_status [Monite::OcrStatusEnum] Return only payables with specific OCR statuses.
    # @param line_item_id [String] Search for a payable by the identifier of the line item associated with it.
    # @param purchase_order_id [String] Search for a payable by the identifier of the purchase order associated with it.
    # @param project_id [String] Return only payables assigned to the project with the specified ID.
#  Valid but nonexistent project IDs do not raise errors but return no results.
    # @param tag_ids [String] Return only payables whose `tags` include at least one of the tags with the
#  specified IDs. Valid but nonexistent tag IDs do not raise errors but produce no
#  results.
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::PayableAnalyticsResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.analytics.get_analytics_payables(metric: ID, aggregation_function: COUNT)
    def get_analytics_payables(dimension: nil, metric:, aggregation_function:, date_dimension_breakdown: nil, created_at_gt: nil, created_at_lt: nil, created_at_gte: nil, created_at_lte: nil, status: nil, status_in: nil, id_in: nil, total_amount: nil, total_amount_gt: nil, total_amount_lt: nil, total_amount_gte: nil, total_amount_lte: nil, amount: nil, amount_gt: nil, amount_lt: nil, amount_gte: nil, amount_lte: nil, currency: nil, counterpart_name: nil, counterpart_name_contains: nil, counterpart_name_icontains: nil, search_text: nil, due_date: nil, due_date_gt: nil, due_date_lt: nil, due_date_gte: nil, due_date_lte: nil, document_id: nil, document_id_contains: nil, document_id_icontains: nil, was_created_by_user_id: nil, counterpart_id: nil, source_of_payable_data: nil, ocr_status: nil, line_item_id: nil, purchase_order_id: nil, project_id: nil, tag_ids: nil, request_options: nil)
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
  req.params = { **(request_options&.additional_query_parameters || {}), "dimension": dimension, "metric": metric, "aggregation_function": aggregation_function, "date_dimension_breakdown": date_dimension_breakdown, "created_at__gt": created_at_gt, "created_at__lt": created_at_lt, "created_at__gte": created_at_gte, "created_at__lte": created_at_lte, "status": status, "status__in": status_in, "id__in": id_in, "total_amount": total_amount, "total_amount__gt": total_amount_gt, "total_amount__lt": total_amount_lt, "total_amount__gte": total_amount_gte, "total_amount__lte": total_amount_lte, "amount": amount, "amount__gt": amount_gt, "amount__lt": amount_lt, "amount__gte": amount_gte, "amount__lte": amount_lte, "currency": currency, "counterpart_name": counterpart_name, "counterpart_name__contains": counterpart_name_contains, "counterpart_name__icontains": counterpart_name_icontains, "search_text": search_text, "due_date": due_date, "due_date__gt": due_date_gt, "due_date__lt": due_date_lt, "due_date__gte": due_date_gte, "due_date__lte": due_date_lte, "document_id": document_id, "document_id__contains": document_id_contains, "document_id__icontains": document_id_icontains, "was_created_by_user_id": was_created_by_user_id, "counterpart_id": counterpart_id, "source_of_payable_data": source_of_payable_data, "ocr_status": ocr_status, "line_item_id": line_item_id, "purchase_order_id": purchase_order_id, "project_id": project_id, "tag_ids": tag_ids }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/analytics/payables"
end
        Monite::PayableAnalyticsResponse.from_json(json_object: response.body)
      end
    end
  end
end