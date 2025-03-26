# frozen_string_literal: true
require_relative "../../requests"
require_relative "line_items/client"
require_relative "../types/order_enum"
require_relative "../types/payable_cursor_fields"
require "date"
require "date"
require "date"
require "date"
require_relative "../types/payable_state_enum"
require_relative "../types/currency_enum"
require_relative "../types/source_of_payable_data_enum"
require_relative "../types/ocr_status_enum"
require_relative "../types/payable_pagination_response"
require_relative "../types/payable_payment_terms_create_payload"
require_relative "../types/suggested_payment_term"
require_relative "../types/payable_response_schema"
require "date"
require "date"
require "date"
require "date"
require_relative "../types/payable_aggregated_data_response"
require_relative "../../core/file_utilities"
require_relative "../types/payable_validations_resource"
require_relative "../types/payables_fields_allowed_for_validate"
require_relative "../types/payable_templates_variables_object_list"
require_relative "../types/counterpart_raw_data_update_request"
require_relative "../types/payable_validation_response"
require "async"
require "async"
require "async"
require "async"
require "async"
require "async"
require "async"
require "async"
require "async"
require "async"
require "async"
require "async"
require "async"
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
  class PayablesClient
  # @return [Monite::RequestClient] 
    attr_reader :request_client
  # @return [Monite::Payables::LineItemsClient] 
    attr_reader :line_items


    # @param request_client [Monite::RequestClient] 
    # @return [Monite::PayablesClient]
    def initialize(request_client:)
      @request_client = request_client
      @line_items = Monite::Payables::LineItemsClient.new(request_client: request_client)
    end
# Lists all payables from the connected entity.
#  If you already have the data of the payable (amount in [minor units](
#  https://docs.monite.com/references/currencies#minor-units), currency, vendor
#  information, and other details)
#  stored somewhere as individual attributes, you can create a payable with these
#  attributes by calling [POST
#  /payables](https://docs.monite.com/api/payables/post-payables) and providing the
#  [base64-encoded](
#  https://en.wikipedia.org/wiki/Base64) contents of the original invoice file in
#  the field `base64_encoded_file`.
#  A payable is a financial document given by an entity`s supplier itemizing the
#  purchase of a good or a service and
#  demanding payment.
#  The `file_name` field is optional. If omitted, it defaults to
#  “default_file_name”. If the settings are configured
#  to automatically set `suggested_payment_term`, this object can be omitted from
#  the request body.
#  The `id` generated for this payable can be used in other API calls to update the
#  data of this payable or trigger [
#  status
#  nsitions](https://docs.monite.com/accounts-payable/approvals/manual-transition),
#  for example. essential data
#  fields to move from `draft` to `new`
#  Related guide: [Create a payable from
#  ://docs.monite.com/accounts-payable/payables/collect#create-a-payable-from-data)
#  See also:
#  [Automatic calculation of due
#  .monite.com/accounts-payable/payables/collect#automatic-calculation-of-due-date)
#  [Suggested payment
#  ttps://docs.monite.com/accounts-payable/payables/collect#suggested-payment-date)
#  [Attach
#  file](https://docs.monite.com/accounts-payable/payables/collect#attach-file)
#  [Collect payables by
#  ttps://docs.monite.com/accounts-payable/payables/collect#send-payables-by-email)
#  [Manage line
#  items](https://docs.monite.com/accounts-payable/payables/line-items)
    #
    # @param order [Monite::OrderEnum] Sort order (ascending by default). Typically used together with the `sort`
#  parameter.
    # @param limit [Integer] The number of items (0 .. 100) to return in a single page of the response. The
#  response may contain fewer items if it is the last or only page.
    # @param pagination_token [String] A pagination token obtained from a previous call to this endpoint. Use it to get
#  the next or previous page of results for your initial query. If
#  `pagination_token` is specified, all other query parameters are ignored and
#  inferred from the initial query.
#  If not specified, the first page of results will be returned.
    # @param sort [Monite::PayableCursorFields] The field to sort the results by. Typically used together with the `order`
#  parameter.
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
    # @return [Monite::PayablePaginationResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.payables.get
    def get(order: nil, limit: nil, pagination_token: nil, sort: nil, created_at_gt: nil, created_at_lt: nil, created_at_gte: nil, created_at_lte: nil, status: nil, status_in: nil, id_in: nil, total_amount: nil, total_amount_gt: nil, total_amount_lt: nil, total_amount_gte: nil, total_amount_lte: nil, amount: nil, amount_gt: nil, amount_lt: nil, amount_gte: nil, amount_lte: nil, currency: nil, counterpart_name: nil, counterpart_name_contains: nil, counterpart_name_icontains: nil, search_text: nil, due_date: nil, due_date_gt: nil, due_date_lt: nil, due_date_gte: nil, due_date_lte: nil, document_id: nil, document_id_contains: nil, document_id_icontains: nil, was_created_by_user_id: nil, counterpart_id: nil, source_of_payable_data: nil, ocr_status: nil, line_item_id: nil, purchase_order_id: nil, project_id: nil, tag_ids: nil, request_options: nil)
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
  req.params = { **(request_options&.additional_query_parameters || {}), "order": order, "limit": limit, "pagination_token": pagination_token, "sort": sort, "created_at__gt": created_at_gt, "created_at__lt": created_at_lt, "created_at__gte": created_at_gte, "created_at__lte": created_at_lte, "status": status, "status__in": status_in, "id__in": id_in, "total_amount": total_amount, "total_amount__gt": total_amount_gt, "total_amount__lt": total_amount_lt, "total_amount__gte": total_amount_gte, "total_amount__lte": total_amount_lte, "amount": amount, "amount__gt": amount_gt, "amount__lt": amount_lt, "amount__gte": amount_gte, "amount__lte": amount_lte, "currency": currency, "counterpart_name": counterpart_name, "counterpart_name__contains": counterpart_name_contains, "counterpart_name__icontains": counterpart_name_icontains, "search_text": search_text, "due_date": due_date, "due_date__gt": due_date_gt, "due_date__lt": due_date_lt, "due_date__gte": due_date_gte, "due_date__lte": due_date_lte, "document_id": document_id, "document_id__contains": document_id_contains, "document_id__icontains": document_id_icontains, "was_created_by_user_id": was_created_by_user_id, "counterpart_id": counterpart_id, "source_of_payable_data": source_of_payable_data, "ocr_status": ocr_status, "line_item_id": line_item_id, "purchase_order_id": purchase_order_id, "project_id": project_id, "tag_ids": tag_ids }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/payables"
end
      Monite::PayablePaginationResponse.from_json(json_object: response.body)
    end
# Add a new payable by providing the amount, currency, vendor name, and other
#  details.
#  You can provide the base64_encoded contents of the original invoice file in the
#  field `base64_encoded_file`.
#  You can use this endpoint to bypass the Monite OCR service and provide the data
#  directly
#  (for example, if you already have the data in place).
#  A newly created payable has the the `draft`
#  [status](https://docs.monite.com/accounts-payable/payables/index).
    #
    # @param base_64_encoded_file [String] Base64-encoded contents of the original issued payable. The file is provided for
#  reference purposes as the original source of the data.
#  Any file formats are allowed. The most common formats are PDF, PNG, JPEG, TIFF.
    # @param counterpart_address_id [String] The ID of counterpart address object stored in counterparts service
    # @param counterpart_bank_account_id [String] The ID of counterpart bank account object stored in counterparts service
    # @param counterpart_id [String] The ID of the counterpart object that represents the vendor or supplier.
    # @param counterpart_vat_id_id [String] The ID of counterpart VAT ID object stored in counterparts service
    # @param currency [Monite::CurrencyEnum] The [currency code](https://docs.monite.com/references/currencies) of the
#  currency used in the payable.
    # @param description [String] An arbitrary description of this payable.
    # @param discount [Integer] The value of the additional discount that will be applied to the total amount.
#  in [minor units](https://docs.monite.com/references/currencies#minor-units). For
#  example, $12.50 is represented as 1250.
    # @param document_id [String] A unique invoice number assigned by the invoice issuer for payment tracking
#  purposes.
    # @param due_date [String] The date by which the payable must be paid, in the YYYY-MM-DD format. If the
#  payable specifies payment terms with early payment discounts, this is the final
#  payment date.
    # @param file_name [String] The original file name.
    # @param issued_at [String] The date when the payable was issued, in the YYYY-MM-DD format.
    # @param partner_metadata [Hash{String => Object}] Metadata for partner needs
    # @param payment_terms [Hash] The number of days to pay with potential discount for options shorter than
#  due_dateRequest of type Monite::PayablePaymentTermsCreatePayload, as a Hash
    #   * :description (String) 
    #   * :name (String) 
    #   * :term_1 (Hash)
    #     * :discount (Integer) 
    #     * :number_of_days (Integer) 
    #   * :term_2 (Hash)
    #     * :discount (Integer) 
    #     * :number_of_days (Integer) 
    #   * :term_final (Hash)
    #     * :number_of_days (Integer) 
    # @param project_id [String] The ID of a project
    # @param purchase_order_id [String] The identifier of the purchase order to which this payable belongs.
    # @param sender [String] The email address from which the invoice was sent to the entity.
    # @param subtotal [Integer] The subtotal amount to be paid, in [minor
#  units](https://docs.monite.com/references/currencies#minor-units). For example,
#  $12.50 is represented as 1250.
    # @param suggested_payment_term [Hash] The suggested date and corresponding discount in which payable could be paid.
#  The date is in the YYYY-MM-DD format. The discount is calculated as X * (10^-4)
#  - for example, 100 is 1%, 25 is 0,25%, 10000 is 100 %. Date varies depending on
#  the payment terms and may even be equal to the due date with discount 0.Request of type Monite::SuggestedPaymentTerm, as a Hash
    #   * :date (String) 
    #   * :discount (Integer) 
    # @param tag_ids [Array<String>] A list of IDs of user-defined tags (labels) assigned to this payable. Tags can
#  be used to trigger a specific approval policy for this payable.
    # @param tax [Integer] Registered tax percentage applied for a service price in minor units, e.g. 200
#  means 2%. 1050 means 10.5%.
    # @param tax_amount [Integer] Tax amount in [minor
#  units](https://docs.monite.com/references/currencies#minor-units). For example,
#  $12.50 is represented as 1250.
    # @param total_amount [Integer] The total amount to be paid, in [minor
#  units](https://docs.monite.com/references/currencies#minor-units). For example,
#  $12.50 is represented as 1250.
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::PayableResponseSchema]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.payables.create
    def create(base_64_encoded_file: nil, counterpart_address_id: nil, counterpart_bank_account_id: nil, counterpart_id: nil, counterpart_vat_id_id: nil, currency: nil, description: nil, discount: nil, document_id: nil, due_date: nil, file_name: nil, issued_at: nil, partner_metadata: nil, payment_terms: nil, project_id: nil, purchase_order_id: nil, sender: nil, subtotal: nil, suggested_payment_term: nil, tag_ids: nil, tax: nil, tax_amount: nil, total_amount: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), base64_encoded_file: base_64_encoded_file, counterpart_address_id: counterpart_address_id, counterpart_bank_account_id: counterpart_bank_account_id, counterpart_id: counterpart_id, counterpart_vat_id_id: counterpart_vat_id_id, currency: currency, description: description, discount: discount, document_id: document_id, due_date: due_date, file_name: file_name, issued_at: issued_at, partner_metadata: partner_metadata, payment_terms: payment_terms, project_id: project_id, purchase_order_id: purchase_order_id, sender: sender, subtotal: subtotal, suggested_payment_term: suggested_payment_term, tag_ids: tag_ids, tax: tax, tax_amount: tax_amount, total_amount: total_amount }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/payables"
end
      Monite::PayableResponseSchema.from_json(json_object: response.body)
    end
# Retrieve aggregated statistics for payables, including total amount and count,
#  both overall and by status.
#  For more flexible configuration and retrieval of other data types, use `GET
#  /analytics/payables`.
    #
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
    # @return [Monite::PayableAggregatedDataResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.payables.get_analytics
    def get_analytics(created_at_gt: nil, created_at_lt: nil, created_at_gte: nil, created_at_lte: nil, status: nil, status_in: nil, id_in: nil, total_amount: nil, total_amount_gt: nil, total_amount_lt: nil, total_amount_gte: nil, total_amount_lte: nil, amount: nil, amount_gt: nil, amount_lt: nil, amount_gte: nil, amount_lte: nil, currency: nil, counterpart_name: nil, counterpart_name_contains: nil, counterpart_name_icontains: nil, search_text: nil, due_date: nil, due_date_gt: nil, due_date_lt: nil, due_date_gte: nil, due_date_lte: nil, document_id: nil, document_id_contains: nil, document_id_icontains: nil, was_created_by_user_id: nil, counterpart_id: nil, source_of_payable_data: nil, ocr_status: nil, line_item_id: nil, purchase_order_id: nil, project_id: nil, tag_ids: nil, request_options: nil)
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
  req.params = { **(request_options&.additional_query_parameters || {}), "created_at__gt": created_at_gt, "created_at__lt": created_at_lt, "created_at__gte": created_at_gte, "created_at__lte": created_at_lte, "status": status, "status__in": status_in, "id__in": id_in, "total_amount": total_amount, "total_amount__gt": total_amount_gt, "total_amount__lt": total_amount_lt, "total_amount__gte": total_amount_gte, "total_amount__lte": total_amount_lte, "amount": amount, "amount__gt": amount_gt, "amount__lt": amount_lt, "amount__gte": amount_gte, "amount__lte": amount_lte, "currency": currency, "counterpart_name": counterpart_name, "counterpart_name__contains": counterpart_name_contains, "counterpart_name__icontains": counterpart_name_icontains, "search_text": search_text, "due_date": due_date, "due_date__gt": due_date_gt, "due_date__lt": due_date_lt, "due_date__gte": due_date_gte, "due_date__lte": due_date_lte, "document_id": document_id, "document_id__contains": document_id_contains, "document_id__icontains": document_id_icontains, "was_created_by_user_id": was_created_by_user_id, "counterpart_id": counterpart_id, "source_of_payable_data": source_of_payable_data, "ocr_status": ocr_status, "line_item_id": line_item_id, "purchase_order_id": purchase_order_id, "project_id": project_id, "tag_ids": tag_ids }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/payables/analytics"
end
      Monite::PayableAggregatedDataResponse.from_json(json_object: response.body)
    end
# Upload an incoming invoice (payable) in PDF, PNG, JPEG, or TIFF format and scan
#  its contents. The maximum file size is 10MB.
    #
    # @param file [String, IO] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::PayableResponseSchema]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.payables.upload_from_file(file: my_file.txt)
    def upload_from_file(file:, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), file: Monite::FileUtilities.as_faraday_multipart(file_like: file) }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/payables/upload_from_file"
end
      Monite::PayableResponseSchema.from_json(json_object: response.body)
    end
# Get payable validations.
    #
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::PayableValidationsResource]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.payables.get_validations
    def get_validations(request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/payables/validations"
end
      Monite::PayableValidationsResource.from_json(json_object: response.body)
    end
# Update payable validations.
    #
    # @param required_fields [Array<Monite::PayablesFieldsAllowedForValidate>] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::PayableValidationsResource]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.payables.update_validations(required_fields: [CURRENCY])
    def update_validations(required_fields:, request_options: nil)
      response = @request_client.conn.put do | req |
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
  req.body = { **(request_options&.additional_body_parameters || {}), required_fields: required_fields }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/payables/validations"
end
      Monite::PayableValidationsResource.from_json(json_object: response.body)
    end
# Reset payable validations to default ones.
    #
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::PayableValidationsResource]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.payables.reset_validations
    def reset_validations(request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/payables/validations/reset"
end
      Monite::PayableValidationsResource.from_json(json_object: response.body)
    end
# Get a list of placeholders allowed to insert into an email template for
#  customization
    #
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::PayableTemplatesVariablesObjectList]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.payables.get_variables
    def get_variables(request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/payables/variables"
end
      Monite::PayableTemplatesVariablesObjectList.from_json(json_object: response.body)
    end
# Retrieves information about a specific payable with the given ID.
    #
    # @param payable_id [String] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::PayableResponseSchema]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.payables.get_by_id(payable_id: "payable_id")
    def get_by_id(payable_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/payables/#{payable_id}"
end
      Monite::PayableResponseSchema.from_json(json_object: response.body)
    end
# Deletes a specific payable.
    #
    # @param payable_id [String] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Void]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.payables.delete_by_id(payable_id: "payable_id")
    def delete_by_id(payable_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/payables/#{payable_id}"
end
    end
# Updates the information about a specific payable.
    #
    # @param payable_id [String] 
    # @param counterpart_address_id [String] The ID of counterpart address object stored in counterparts service
    # @param counterpart_bank_account_id [String] The ID of counterpart bank account object stored in counterparts service
    # @param counterpart_id [String] The ID of the counterpart object that represents the vendor or supplier.
    # @param counterpart_raw_data [Hash] Allows to fix some data in counterpart recognised fields to correct them in
#  order to make autolinking happen.Request of type Monite::CounterpartRawDataUpdateRequest, as a Hash
    #   * :address (Hash)
    #     * :city (String) 
    #     * :country (Monite::AllowedCountries) 
    #     * :line_1 (String) 
    #     * :line_2 (String) 
    #     * :postal_code (String) 
    #     * :state (String) 
    #   * :bank_account (Hash)
    #     * :account_holder_name (String) 
    #     * :account_number (String) 
    #     * :bic (String) 
    #     * :iban (String) 
    #     * :sort_code (String) 
    #   * :email (String) 
    #   * :name (String) 
    #   * :phone (String) 
    #   * :tax_id (String) 
    #   * :vat_id (Hash)
    #     * :country (Monite::AllowedCountries) 
    #     * :type (String) 
    #     * :value (String) 
    # @param counterpart_vat_id_id [String] The ID of counterpart VAT ID object stored in counterparts service
    # @param currency [Monite::CurrencyEnum] The [currency code](https://docs.monite.com/references/currencies) of the
#  currency used in the payable.
    # @param description [String] An arbitrary description of this payable.
    # @param discount [Integer] The value of the additional discount that will be applied to the total amount.
#  in [minor units](https://docs.monite.com/references/currencies#minor-units). For
#  example, $12.50 is represented as 1250.
    # @param document_id [String] A unique invoice number assigned by the invoice issuer for payment tracking
#  purposes.
    # @param due_date [String] The date by which the payable must be paid, in the YYYY-MM-DD format. If the
#  payable specifies payment terms with early payment discounts, this is the final
#  payment date.
    # @param issued_at [String] The date when the payable was issued, in the YYYY-MM-DD format.
    # @param partner_metadata [Hash{String => Object}] Metadata for partner needs
    # @param payment_terms [Hash] The number of days to pay with potential discount for options shorter than
#  due_dateRequest of type Monite::PayablePaymentTermsCreatePayload, as a Hash
    #   * :description (String) 
    #   * :name (String) 
    #   * :term_1 (Hash)
    #     * :discount (Integer) 
    #     * :number_of_days (Integer) 
    #   * :term_2 (Hash)
    #     * :discount (Integer) 
    #     * :number_of_days (Integer) 
    #   * :term_final (Hash)
    #     * :number_of_days (Integer) 
    # @param project_id [String] The project ID of the payable.
    # @param purchase_order_id [String] The identifier of the purchase order to which this payable belongs.
    # @param sender [String] The email address from which the invoice was sent to the entity.
    # @param subtotal [Integer] The subtotal amount to be paid, in [minor
#  units](https://docs.monite.com/references/currencies#minor-units). For example,
#  $12.50 is represented as 1250.
    # @param suggested_payment_term [Hash] The suggested date and corresponding discount in which payable could be paid.
#  The date is in the YYYY-MM-DD format. The discount is calculated as X * (10^-4)
#  - for example, 100 is 1%, 25 is 0,25%, 10000 is 100 %. Date varies depending on
#  the payment terms and may even be equal to the due date with discount 0.Request of type Monite::SuggestedPaymentTerm, as a Hash
    #   * :date (String) 
    #   * :discount (Integer) 
    # @param tag_ids [Array<String>] A list of IDs of user-defined tags (labels) assigned to this payable. Tags can
#  be used to trigger a specific approval policy for this payable.
    # @param tax [Integer] Registered tax percentage applied for a service price in minor units, e.g. 200
#  means 2%, 1050 means 10.5%.
    # @param tax_amount [Integer] Tax amount in [minor
#  units](https://docs.monite.com/references/currencies#minor-units). For example,
#  $12.50 is represented as 1250.
    # @param total_amount [Integer] The total amount to be paid, in [minor
#  units](https://docs.monite.com/references/currencies#minor-units). For example,
#  $12.50 is represented as 1250.
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::PayableResponseSchema]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.payables.update_by_id(payable_id: "payable_id")
    def update_by_id(payable_id:, counterpart_address_id: nil, counterpart_bank_account_id: nil, counterpart_id: nil, counterpart_raw_data: nil, counterpart_vat_id_id: nil, currency: nil, description: nil, discount: nil, document_id: nil, due_date: nil, issued_at: nil, partner_metadata: nil, payment_terms: nil, project_id: nil, purchase_order_id: nil, sender: nil, subtotal: nil, suggested_payment_term: nil, tag_ids: nil, tax: nil, tax_amount: nil, total_amount: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), counterpart_address_id: counterpart_address_id, counterpart_bank_account_id: counterpart_bank_account_id, counterpart_id: counterpart_id, counterpart_raw_data: counterpart_raw_data, counterpart_vat_id_id: counterpart_vat_id_id, currency: currency, description: description, discount: discount, document_id: document_id, due_date: due_date, issued_at: issued_at, partner_metadata: partner_metadata, payment_terms: payment_terms, project_id: project_id, purchase_order_id: purchase_order_id, sender: sender, subtotal: subtotal, suggested_payment_term: suggested_payment_term, tag_ids: tag_ids, tax: tax, tax_amount: tax_amount, total_amount: total_amount }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/payables/#{payable_id}"
end
      Monite::PayableResponseSchema.from_json(json_object: response.body)
    end
# Confirms that the payable is ready to be paid.
    #
    # @param payable_id [String] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::PayableResponseSchema]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.payables.approve_payment_by_id(payable_id: "payable_id")
    def approve_payment_by_id(payable_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/payables/#{payable_id}/approve_payment_operation"
end
      Monite::PayableResponseSchema.from_json(json_object: response.body)
    end
# Attach file to payable without existing attachment.
    #
    # @param payable_id [String] 
    # @param file [String, IO] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::PayableResponseSchema]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.payables.attach_file_by_id(payable_id: "payable_id", file: my_file.txt)
    def attach_file_by_id(payable_id:, file:, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), file: Monite::FileUtilities.as_faraday_multipart(file_like: file) }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/payables/#{payable_id}/attach_file"
end
      Monite::PayableResponseSchema.from_json(json_object: response.body)
    end
# Cancels the payable that was not confirmed during the review.
    #
    # @param payable_id [String] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::PayableResponseSchema]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.payables.cancel_by_id(payable_id: "payable_id")
    def cancel_by_id(payable_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/payables/#{payable_id}/cancel"
end
      Monite::PayableResponseSchema.from_json(json_object: response.body)
    end
# Request to cancel the OCR processing of the specified payable.
    #
    # @param payable_id [String] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::PayableResponseSchema]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.payables.post_payables_id_cancel_ocr(payable_id: "payable_id")
    def post_payables_id_cancel_ocr(payable_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/payables/#{payable_id}/cancel_ocr"
end
      Monite::PayableResponseSchema.from_json(json_object: response.body)
    end
# Mark a payable as paid.
#  Payables can be paid using the payment channels offered by Monite or through
#  external payment channels. In the latter
#  case, the invoice is not automatically marked as paid in the system and needs
#  to be converted to the paid status
#  manually.
#  Optionally, it is possible to pass the `comment` field in the request body, to
#  describe how and when the invoice was
#  paid.
#  Notes:
#  - To use this endpoint with an entity user token, this entity user must have a
#  role that includes the `pay` permission
#  for payables.
#  - The `amount_to_pay` field is automatically calculated based on the
#  `amount_due` less the percentage described
#  in the `payment_terms.discount` value.
#  Related guide: [Mark a payable as
#  tps://docs.monite.com/accounts-payable/approvals/manual-transition#mark-as-paid)
#  See also:
#  [Payables lifecycle](https://docs.monite.com/accounts-payable/payables/index)
#  [Payables status
#  ttps://docs.monite.com/accounts-payable/payables/collect#suggested-payment-date)
    #
    # @param payable_id [String] 
    # @param comment [String] An arbitrary comment that describes how and when this payable was paid.
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::PayableResponseSchema]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.payables.mark_as_paid_by_id(payable_id: "payable_id")
    def mark_as_paid_by_id(payable_id:, comment: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), comment: comment }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/payables/#{payable_id}/mark_as_paid"
end
      Monite::PayableResponseSchema.from_json(json_object: response.body)
    end
# Mark a payable as partially paid.
#  If the payable is partially paid, its status is moved to `partially_paid`. The
#  value of the `amount_paid` field must be
#  the sum of all payments made, not only the last one.
#  Notes:
#  - This endpoint can be used for payables in the `waiting_to_be_paid` status.
#  - The `amount_paid` must be greater than 0 and less than the total payable
#  amount specified by the `amount` field.
#  - You can use this endpoint multiple times for the same payable to reflect
#  multiple partial payments, always setting the
#  sum of all payments made.
#  - To use this endpoint with an entity user token, this entity user must have a
#  role that includes the `pay`
#  permission for payables.
#  - The `amount_to_pay` field is automatically calculated based on the
#  `amount_due` less the percentage described
#  in the `payment_terms.discount` value.
#  Related guide: [Mark a payable as partially
#  .monite.com/accounts-payable/approvals/manual-transition#mark-as-partially-paid)
#  See also:
#  [Payables lifecycle](https://docs.monite.com/accounts-payable/payables/index)
#  [Payables status
#  ttps://docs.monite.com/accounts-payable/payables/collect#suggested-payment-date)
#  [Mark a payable as
#  tps://docs.monite.com/accounts-payable/approvals/manual-transition#mark-as-paid)
    #
    # @param payable_id [String] 
    # @param amount_paid [Integer] How much was paid on the invoice (in minor units).
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::PayableResponseSchema]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.payables.mark_as_partially_paid_by_id(payable_id: "payable_id", amount_paid: 1)
    def mark_as_partially_paid_by_id(payable_id:, amount_paid:, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), amount_paid: amount_paid }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/payables/#{payable_id}/mark_as_partially_paid"
end
      Monite::PayableResponseSchema.from_json(json_object: response.body)
    end
# Declines the payable when an approver finds any mismatch or discrepancies.
    #
    # @param payable_id [String] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::PayableResponseSchema]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.payables.reject_by_id(payable_id: "payable_id")
    def reject_by_id(payable_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/payables/#{payable_id}/reject"
end
      Monite::PayableResponseSchema.from_json(json_object: response.body)
    end
# Reset payable state from rejected to new.
    #
    # @param payable_id [String] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::PayableResponseSchema]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.payables.reopen_by_id(payable_id: "payable_id")
    def reopen_by_id(payable_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/payables/#{payable_id}/reopen"
end
      Monite::PayableResponseSchema.from_json(json_object: response.body)
    end
# Starts the approval process once the uploaded payable is validated.
    #
    # @param payable_id [String] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::PayableResponseSchema]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.payables.submit_for_approval_by_id(payable_id: "payable_id")
    def submit_for_approval_by_id(payable_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/payables/#{payable_id}/submit_for_approval"
end
      Monite::PayableResponseSchema.from_json(json_object: response.body)
    end
# Check the invoice for compliance with the requirements for movement from draft
#  to new status.
    #
    # @param payable_id [String] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::PayableValidationResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.payables.validate_by_id(payable_id: "payable_id")
    def validate_by_id(payable_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/payables/#{payable_id}/validate"
end
      Monite::PayableValidationResponse.from_json(json_object: response.body)
    end
  end
  class AsyncPayablesClient
  # @return [Monite::AsyncRequestClient] 
    attr_reader :request_client
  # @return [Monite::Payables::LineItemsClient] 
    attr_reader :line_items


    # @param request_client [Monite::RequestClient] 
    # @return [Monite::AsyncPayablesClient]
    def initialize(request_client:)
      @request_client = request_client
      @line_items = Monite::Payables::AsyncLineItemsClient.new(request_client: request_client)
    end
# Lists all payables from the connected entity.
#  If you already have the data of the payable (amount in [minor units](
#  https://docs.monite.com/references/currencies#minor-units), currency, vendor
#  information, and other details)
#  stored somewhere as individual attributes, you can create a payable with these
#  attributes by calling [POST
#  /payables](https://docs.monite.com/api/payables/post-payables) and providing the
#  [base64-encoded](
#  https://en.wikipedia.org/wiki/Base64) contents of the original invoice file in
#  the field `base64_encoded_file`.
#  A payable is a financial document given by an entity`s supplier itemizing the
#  purchase of a good or a service and
#  demanding payment.
#  The `file_name` field is optional. If omitted, it defaults to
#  “default_file_name”. If the settings are configured
#  to automatically set `suggested_payment_term`, this object can be omitted from
#  the request body.
#  The `id` generated for this payable can be used in other API calls to update the
#  data of this payable or trigger [
#  status
#  nsitions](https://docs.monite.com/accounts-payable/approvals/manual-transition),
#  for example. essential data
#  fields to move from `draft` to `new`
#  Related guide: [Create a payable from
#  ://docs.monite.com/accounts-payable/payables/collect#create-a-payable-from-data)
#  See also:
#  [Automatic calculation of due
#  .monite.com/accounts-payable/payables/collect#automatic-calculation-of-due-date)
#  [Suggested payment
#  ttps://docs.monite.com/accounts-payable/payables/collect#suggested-payment-date)
#  [Attach
#  file](https://docs.monite.com/accounts-payable/payables/collect#attach-file)
#  [Collect payables by
#  ttps://docs.monite.com/accounts-payable/payables/collect#send-payables-by-email)
#  [Manage line
#  items](https://docs.monite.com/accounts-payable/payables/line-items)
    #
    # @param order [Monite::OrderEnum] Sort order (ascending by default). Typically used together with the `sort`
#  parameter.
    # @param limit [Integer] The number of items (0 .. 100) to return in a single page of the response. The
#  response may contain fewer items if it is the last or only page.
    # @param pagination_token [String] A pagination token obtained from a previous call to this endpoint. Use it to get
#  the next or previous page of results for your initial query. If
#  `pagination_token` is specified, all other query parameters are ignored and
#  inferred from the initial query.
#  If not specified, the first page of results will be returned.
    # @param sort [Monite::PayableCursorFields] The field to sort the results by. Typically used together with the `order`
#  parameter.
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
    # @return [Monite::PayablePaginationResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.payables.get
    def get(order: nil, limit: nil, pagination_token: nil, sort: nil, created_at_gt: nil, created_at_lt: nil, created_at_gte: nil, created_at_lte: nil, status: nil, status_in: nil, id_in: nil, total_amount: nil, total_amount_gt: nil, total_amount_lt: nil, total_amount_gte: nil, total_amount_lte: nil, amount: nil, amount_gt: nil, amount_lt: nil, amount_gte: nil, amount_lte: nil, currency: nil, counterpart_name: nil, counterpart_name_contains: nil, counterpart_name_icontains: nil, search_text: nil, due_date: nil, due_date_gt: nil, due_date_lt: nil, due_date_gte: nil, due_date_lte: nil, document_id: nil, document_id_contains: nil, document_id_icontains: nil, was_created_by_user_id: nil, counterpart_id: nil, source_of_payable_data: nil, ocr_status: nil, line_item_id: nil, purchase_order_id: nil, project_id: nil, tag_ids: nil, request_options: nil)
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
  req.params = { **(request_options&.additional_query_parameters || {}), "order": order, "limit": limit, "pagination_token": pagination_token, "sort": sort, "created_at__gt": created_at_gt, "created_at__lt": created_at_lt, "created_at__gte": created_at_gte, "created_at__lte": created_at_lte, "status": status, "status__in": status_in, "id__in": id_in, "total_amount": total_amount, "total_amount__gt": total_amount_gt, "total_amount__lt": total_amount_lt, "total_amount__gte": total_amount_gte, "total_amount__lte": total_amount_lte, "amount": amount, "amount__gt": amount_gt, "amount__lt": amount_lt, "amount__gte": amount_gte, "amount__lte": amount_lte, "currency": currency, "counterpart_name": counterpart_name, "counterpart_name__contains": counterpart_name_contains, "counterpart_name__icontains": counterpart_name_icontains, "search_text": search_text, "due_date": due_date, "due_date__gt": due_date_gt, "due_date__lt": due_date_lt, "due_date__gte": due_date_gte, "due_date__lte": due_date_lte, "document_id": document_id, "document_id__contains": document_id_contains, "document_id__icontains": document_id_icontains, "was_created_by_user_id": was_created_by_user_id, "counterpart_id": counterpart_id, "source_of_payable_data": source_of_payable_data, "ocr_status": ocr_status, "line_item_id": line_item_id, "purchase_order_id": purchase_order_id, "project_id": project_id, "tag_ids": tag_ids }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/payables"
end
        Monite::PayablePaginationResponse.from_json(json_object: response.body)
      end
    end
# Add a new payable by providing the amount, currency, vendor name, and other
#  details.
#  You can provide the base64_encoded contents of the original invoice file in the
#  field `base64_encoded_file`.
#  You can use this endpoint to bypass the Monite OCR service and provide the data
#  directly
#  (for example, if you already have the data in place).
#  A newly created payable has the the `draft`
#  [status](https://docs.monite.com/accounts-payable/payables/index).
    #
    # @param base_64_encoded_file [String] Base64-encoded contents of the original issued payable. The file is provided for
#  reference purposes as the original source of the data.
#  Any file formats are allowed. The most common formats are PDF, PNG, JPEG, TIFF.
    # @param counterpart_address_id [String] The ID of counterpart address object stored in counterparts service
    # @param counterpart_bank_account_id [String] The ID of counterpart bank account object stored in counterparts service
    # @param counterpart_id [String] The ID of the counterpart object that represents the vendor or supplier.
    # @param counterpart_vat_id_id [String] The ID of counterpart VAT ID object stored in counterparts service
    # @param currency [Monite::CurrencyEnum] The [currency code](https://docs.monite.com/references/currencies) of the
#  currency used in the payable.
    # @param description [String] An arbitrary description of this payable.
    # @param discount [Integer] The value of the additional discount that will be applied to the total amount.
#  in [minor units](https://docs.monite.com/references/currencies#minor-units). For
#  example, $12.50 is represented as 1250.
    # @param document_id [String] A unique invoice number assigned by the invoice issuer for payment tracking
#  purposes.
    # @param due_date [String] The date by which the payable must be paid, in the YYYY-MM-DD format. If the
#  payable specifies payment terms with early payment discounts, this is the final
#  payment date.
    # @param file_name [String] The original file name.
    # @param issued_at [String] The date when the payable was issued, in the YYYY-MM-DD format.
    # @param partner_metadata [Hash{String => Object}] Metadata for partner needs
    # @param payment_terms [Hash] The number of days to pay with potential discount for options shorter than
#  due_dateRequest of type Monite::PayablePaymentTermsCreatePayload, as a Hash
    #   * :description (String) 
    #   * :name (String) 
    #   * :term_1 (Hash)
    #     * :discount (Integer) 
    #     * :number_of_days (Integer) 
    #   * :term_2 (Hash)
    #     * :discount (Integer) 
    #     * :number_of_days (Integer) 
    #   * :term_final (Hash)
    #     * :number_of_days (Integer) 
    # @param project_id [String] The ID of a project
    # @param purchase_order_id [String] The identifier of the purchase order to which this payable belongs.
    # @param sender [String] The email address from which the invoice was sent to the entity.
    # @param subtotal [Integer] The subtotal amount to be paid, in [minor
#  units](https://docs.monite.com/references/currencies#minor-units). For example,
#  $12.50 is represented as 1250.
    # @param suggested_payment_term [Hash] The suggested date and corresponding discount in which payable could be paid.
#  The date is in the YYYY-MM-DD format. The discount is calculated as X * (10^-4)
#  - for example, 100 is 1%, 25 is 0,25%, 10000 is 100 %. Date varies depending on
#  the payment terms and may even be equal to the due date with discount 0.Request of type Monite::SuggestedPaymentTerm, as a Hash
    #   * :date (String) 
    #   * :discount (Integer) 
    # @param tag_ids [Array<String>] A list of IDs of user-defined tags (labels) assigned to this payable. Tags can
#  be used to trigger a specific approval policy for this payable.
    # @param tax [Integer] Registered tax percentage applied for a service price in minor units, e.g. 200
#  means 2%. 1050 means 10.5%.
    # @param tax_amount [Integer] Tax amount in [minor
#  units](https://docs.monite.com/references/currencies#minor-units). For example,
#  $12.50 is represented as 1250.
    # @param total_amount [Integer] The total amount to be paid, in [minor
#  units](https://docs.monite.com/references/currencies#minor-units). For example,
#  $12.50 is represented as 1250.
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::PayableResponseSchema]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.payables.create
    def create(base_64_encoded_file: nil, counterpart_address_id: nil, counterpart_bank_account_id: nil, counterpart_id: nil, counterpart_vat_id_id: nil, currency: nil, description: nil, discount: nil, document_id: nil, due_date: nil, file_name: nil, issued_at: nil, partner_metadata: nil, payment_terms: nil, project_id: nil, purchase_order_id: nil, sender: nil, subtotal: nil, suggested_payment_term: nil, tag_ids: nil, tax: nil, tax_amount: nil, total_amount: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), base64_encoded_file: base_64_encoded_file, counterpart_address_id: counterpart_address_id, counterpart_bank_account_id: counterpart_bank_account_id, counterpart_id: counterpart_id, counterpart_vat_id_id: counterpart_vat_id_id, currency: currency, description: description, discount: discount, document_id: document_id, due_date: due_date, file_name: file_name, issued_at: issued_at, partner_metadata: partner_metadata, payment_terms: payment_terms, project_id: project_id, purchase_order_id: purchase_order_id, sender: sender, subtotal: subtotal, suggested_payment_term: suggested_payment_term, tag_ids: tag_ids, tax: tax, tax_amount: tax_amount, total_amount: total_amount }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/payables"
end
        Monite::PayableResponseSchema.from_json(json_object: response.body)
      end
    end
# Retrieve aggregated statistics for payables, including total amount and count,
#  both overall and by status.
#  For more flexible configuration and retrieval of other data types, use `GET
#  /analytics/payables`.
    #
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
    # @return [Monite::PayableAggregatedDataResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.payables.get_analytics
    def get_analytics(created_at_gt: nil, created_at_lt: nil, created_at_gte: nil, created_at_lte: nil, status: nil, status_in: nil, id_in: nil, total_amount: nil, total_amount_gt: nil, total_amount_lt: nil, total_amount_gte: nil, total_amount_lte: nil, amount: nil, amount_gt: nil, amount_lt: nil, amount_gte: nil, amount_lte: nil, currency: nil, counterpart_name: nil, counterpart_name_contains: nil, counterpart_name_icontains: nil, search_text: nil, due_date: nil, due_date_gt: nil, due_date_lt: nil, due_date_gte: nil, due_date_lte: nil, document_id: nil, document_id_contains: nil, document_id_icontains: nil, was_created_by_user_id: nil, counterpart_id: nil, source_of_payable_data: nil, ocr_status: nil, line_item_id: nil, purchase_order_id: nil, project_id: nil, tag_ids: nil, request_options: nil)
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
  req.params = { **(request_options&.additional_query_parameters || {}), "created_at__gt": created_at_gt, "created_at__lt": created_at_lt, "created_at__gte": created_at_gte, "created_at__lte": created_at_lte, "status": status, "status__in": status_in, "id__in": id_in, "total_amount": total_amount, "total_amount__gt": total_amount_gt, "total_amount__lt": total_amount_lt, "total_amount__gte": total_amount_gte, "total_amount__lte": total_amount_lte, "amount": amount, "amount__gt": amount_gt, "amount__lt": amount_lt, "amount__gte": amount_gte, "amount__lte": amount_lte, "currency": currency, "counterpart_name": counterpart_name, "counterpart_name__contains": counterpart_name_contains, "counterpart_name__icontains": counterpart_name_icontains, "search_text": search_text, "due_date": due_date, "due_date__gt": due_date_gt, "due_date__lt": due_date_lt, "due_date__gte": due_date_gte, "due_date__lte": due_date_lte, "document_id": document_id, "document_id__contains": document_id_contains, "document_id__icontains": document_id_icontains, "was_created_by_user_id": was_created_by_user_id, "counterpart_id": counterpart_id, "source_of_payable_data": source_of_payable_data, "ocr_status": ocr_status, "line_item_id": line_item_id, "purchase_order_id": purchase_order_id, "project_id": project_id, "tag_ids": tag_ids }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/payables/analytics"
end
        Monite::PayableAggregatedDataResponse.from_json(json_object: response.body)
      end
    end
# Upload an incoming invoice (payable) in PDF, PNG, JPEG, or TIFF format and scan
#  its contents. The maximum file size is 10MB.
    #
    # @param file [String, IO] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::PayableResponseSchema]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.payables.upload_from_file(file: my_file.txt)
    def upload_from_file(file:, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), file: Monite::FileUtilities.as_faraday_multipart(file_like: file) }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/payables/upload_from_file"
end
        Monite::PayableResponseSchema.from_json(json_object: response.body)
      end
    end
# Get payable validations.
    #
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::PayableValidationsResource]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.payables.get_validations
    def get_validations(request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/payables/validations"
end
        Monite::PayableValidationsResource.from_json(json_object: response.body)
      end
    end
# Update payable validations.
    #
    # @param required_fields [Array<Monite::PayablesFieldsAllowedForValidate>] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::PayableValidationsResource]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.payables.update_validations(required_fields: [CURRENCY])
    def update_validations(required_fields:, request_options: nil)
      Async do
        response = @request_client.conn.put do | req |
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
  req.body = { **(request_options&.additional_body_parameters || {}), required_fields: required_fields }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/payables/validations"
end
        Monite::PayableValidationsResource.from_json(json_object: response.body)
      end
    end
# Reset payable validations to default ones.
    #
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::PayableValidationsResource]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.payables.reset_validations
    def reset_validations(request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/payables/validations/reset"
end
        Monite::PayableValidationsResource.from_json(json_object: response.body)
      end
    end
# Get a list of placeholders allowed to insert into an email template for
#  customization
    #
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::PayableTemplatesVariablesObjectList]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.payables.get_variables
    def get_variables(request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/payables/variables"
end
        Monite::PayableTemplatesVariablesObjectList.from_json(json_object: response.body)
      end
    end
# Retrieves information about a specific payable with the given ID.
    #
    # @param payable_id [String] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::PayableResponseSchema]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.payables.get_by_id(payable_id: "payable_id")
    def get_by_id(payable_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/payables/#{payable_id}"
end
        Monite::PayableResponseSchema.from_json(json_object: response.body)
      end
    end
# Deletes a specific payable.
    #
    # @param payable_id [String] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Void]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.payables.delete_by_id(payable_id: "payable_id")
    def delete_by_id(payable_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/payables/#{payable_id}"
end
      end
    end
# Updates the information about a specific payable.
    #
    # @param payable_id [String] 
    # @param counterpart_address_id [String] The ID of counterpart address object stored in counterparts service
    # @param counterpart_bank_account_id [String] The ID of counterpart bank account object stored in counterparts service
    # @param counterpart_id [String] The ID of the counterpart object that represents the vendor or supplier.
    # @param counterpart_raw_data [Hash] Allows to fix some data in counterpart recognised fields to correct them in
#  order to make autolinking happen.Request of type Monite::CounterpartRawDataUpdateRequest, as a Hash
    #   * :address (Hash)
    #     * :city (String) 
    #     * :country (Monite::AllowedCountries) 
    #     * :line_1 (String) 
    #     * :line_2 (String) 
    #     * :postal_code (String) 
    #     * :state (String) 
    #   * :bank_account (Hash)
    #     * :account_holder_name (String) 
    #     * :account_number (String) 
    #     * :bic (String) 
    #     * :iban (String) 
    #     * :sort_code (String) 
    #   * :email (String) 
    #   * :name (String) 
    #   * :phone (String) 
    #   * :tax_id (String) 
    #   * :vat_id (Hash)
    #     * :country (Monite::AllowedCountries) 
    #     * :type (String) 
    #     * :value (String) 
    # @param counterpart_vat_id_id [String] The ID of counterpart VAT ID object stored in counterparts service
    # @param currency [Monite::CurrencyEnum] The [currency code](https://docs.monite.com/references/currencies) of the
#  currency used in the payable.
    # @param description [String] An arbitrary description of this payable.
    # @param discount [Integer] The value of the additional discount that will be applied to the total amount.
#  in [minor units](https://docs.monite.com/references/currencies#minor-units). For
#  example, $12.50 is represented as 1250.
    # @param document_id [String] A unique invoice number assigned by the invoice issuer for payment tracking
#  purposes.
    # @param due_date [String] The date by which the payable must be paid, in the YYYY-MM-DD format. If the
#  payable specifies payment terms with early payment discounts, this is the final
#  payment date.
    # @param issued_at [String] The date when the payable was issued, in the YYYY-MM-DD format.
    # @param partner_metadata [Hash{String => Object}] Metadata for partner needs
    # @param payment_terms [Hash] The number of days to pay with potential discount for options shorter than
#  due_dateRequest of type Monite::PayablePaymentTermsCreatePayload, as a Hash
    #   * :description (String) 
    #   * :name (String) 
    #   * :term_1 (Hash)
    #     * :discount (Integer) 
    #     * :number_of_days (Integer) 
    #   * :term_2 (Hash)
    #     * :discount (Integer) 
    #     * :number_of_days (Integer) 
    #   * :term_final (Hash)
    #     * :number_of_days (Integer) 
    # @param project_id [String] The project ID of the payable.
    # @param purchase_order_id [String] The identifier of the purchase order to which this payable belongs.
    # @param sender [String] The email address from which the invoice was sent to the entity.
    # @param subtotal [Integer] The subtotal amount to be paid, in [minor
#  units](https://docs.monite.com/references/currencies#minor-units). For example,
#  $12.50 is represented as 1250.
    # @param suggested_payment_term [Hash] The suggested date and corresponding discount in which payable could be paid.
#  The date is in the YYYY-MM-DD format. The discount is calculated as X * (10^-4)
#  - for example, 100 is 1%, 25 is 0,25%, 10000 is 100 %. Date varies depending on
#  the payment terms and may even be equal to the due date with discount 0.Request of type Monite::SuggestedPaymentTerm, as a Hash
    #   * :date (String) 
    #   * :discount (Integer) 
    # @param tag_ids [Array<String>] A list of IDs of user-defined tags (labels) assigned to this payable. Tags can
#  be used to trigger a specific approval policy for this payable.
    # @param tax [Integer] Registered tax percentage applied for a service price in minor units, e.g. 200
#  means 2%, 1050 means 10.5%.
    # @param tax_amount [Integer] Tax amount in [minor
#  units](https://docs.monite.com/references/currencies#minor-units). For example,
#  $12.50 is represented as 1250.
    # @param total_amount [Integer] The total amount to be paid, in [minor
#  units](https://docs.monite.com/references/currencies#minor-units). For example,
#  $12.50 is represented as 1250.
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::PayableResponseSchema]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.payables.update_by_id(payable_id: "payable_id")
    def update_by_id(payable_id:, counterpart_address_id: nil, counterpart_bank_account_id: nil, counterpart_id: nil, counterpart_raw_data: nil, counterpart_vat_id_id: nil, currency: nil, description: nil, discount: nil, document_id: nil, due_date: nil, issued_at: nil, partner_metadata: nil, payment_terms: nil, project_id: nil, purchase_order_id: nil, sender: nil, subtotal: nil, suggested_payment_term: nil, tag_ids: nil, tax: nil, tax_amount: nil, total_amount: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), counterpart_address_id: counterpart_address_id, counterpart_bank_account_id: counterpart_bank_account_id, counterpart_id: counterpart_id, counterpart_raw_data: counterpart_raw_data, counterpart_vat_id_id: counterpart_vat_id_id, currency: currency, description: description, discount: discount, document_id: document_id, due_date: due_date, issued_at: issued_at, partner_metadata: partner_metadata, payment_terms: payment_terms, project_id: project_id, purchase_order_id: purchase_order_id, sender: sender, subtotal: subtotal, suggested_payment_term: suggested_payment_term, tag_ids: tag_ids, tax: tax, tax_amount: tax_amount, total_amount: total_amount }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/payables/#{payable_id}"
end
        Monite::PayableResponseSchema.from_json(json_object: response.body)
      end
    end
# Confirms that the payable is ready to be paid.
    #
    # @param payable_id [String] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::PayableResponseSchema]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.payables.approve_payment_by_id(payable_id: "payable_id")
    def approve_payment_by_id(payable_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/payables/#{payable_id}/approve_payment_operation"
end
        Monite::PayableResponseSchema.from_json(json_object: response.body)
      end
    end
# Attach file to payable without existing attachment.
    #
    # @param payable_id [String] 
    # @param file [String, IO] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::PayableResponseSchema]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.payables.attach_file_by_id(payable_id: "payable_id", file: my_file.txt)
    def attach_file_by_id(payable_id:, file:, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), file: Monite::FileUtilities.as_faraday_multipart(file_like: file) }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/payables/#{payable_id}/attach_file"
end
        Monite::PayableResponseSchema.from_json(json_object: response.body)
      end
    end
# Cancels the payable that was not confirmed during the review.
    #
    # @param payable_id [String] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::PayableResponseSchema]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.payables.cancel_by_id(payable_id: "payable_id")
    def cancel_by_id(payable_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/payables/#{payable_id}/cancel"
end
        Monite::PayableResponseSchema.from_json(json_object: response.body)
      end
    end
# Request to cancel the OCR processing of the specified payable.
    #
    # @param payable_id [String] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::PayableResponseSchema]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.payables.post_payables_id_cancel_ocr(payable_id: "payable_id")
    def post_payables_id_cancel_ocr(payable_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/payables/#{payable_id}/cancel_ocr"
end
        Monite::PayableResponseSchema.from_json(json_object: response.body)
      end
    end
# Mark a payable as paid.
#  Payables can be paid using the payment channels offered by Monite or through
#  external payment channels. In the latter
#  case, the invoice is not automatically marked as paid in the system and needs
#  to be converted to the paid status
#  manually.
#  Optionally, it is possible to pass the `comment` field in the request body, to
#  describe how and when the invoice was
#  paid.
#  Notes:
#  - To use this endpoint with an entity user token, this entity user must have a
#  role that includes the `pay` permission
#  for payables.
#  - The `amount_to_pay` field is automatically calculated based on the
#  `amount_due` less the percentage described
#  in the `payment_terms.discount` value.
#  Related guide: [Mark a payable as
#  tps://docs.monite.com/accounts-payable/approvals/manual-transition#mark-as-paid)
#  See also:
#  [Payables lifecycle](https://docs.monite.com/accounts-payable/payables/index)
#  [Payables status
#  ttps://docs.monite.com/accounts-payable/payables/collect#suggested-payment-date)
    #
    # @param payable_id [String] 
    # @param comment [String] An arbitrary comment that describes how and when this payable was paid.
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::PayableResponseSchema]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.payables.mark_as_paid_by_id(payable_id: "payable_id")
    def mark_as_paid_by_id(payable_id:, comment: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), comment: comment }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/payables/#{payable_id}/mark_as_paid"
end
        Monite::PayableResponseSchema.from_json(json_object: response.body)
      end
    end
# Mark a payable as partially paid.
#  If the payable is partially paid, its status is moved to `partially_paid`. The
#  value of the `amount_paid` field must be
#  the sum of all payments made, not only the last one.
#  Notes:
#  - This endpoint can be used for payables in the `waiting_to_be_paid` status.
#  - The `amount_paid` must be greater than 0 and less than the total payable
#  amount specified by the `amount` field.
#  - You can use this endpoint multiple times for the same payable to reflect
#  multiple partial payments, always setting the
#  sum of all payments made.
#  - To use this endpoint with an entity user token, this entity user must have a
#  role that includes the `pay`
#  permission for payables.
#  - The `amount_to_pay` field is automatically calculated based on the
#  `amount_due` less the percentage described
#  in the `payment_terms.discount` value.
#  Related guide: [Mark a payable as partially
#  .monite.com/accounts-payable/approvals/manual-transition#mark-as-partially-paid)
#  See also:
#  [Payables lifecycle](https://docs.monite.com/accounts-payable/payables/index)
#  [Payables status
#  ttps://docs.monite.com/accounts-payable/payables/collect#suggested-payment-date)
#  [Mark a payable as
#  tps://docs.monite.com/accounts-payable/approvals/manual-transition#mark-as-paid)
    #
    # @param payable_id [String] 
    # @param amount_paid [Integer] How much was paid on the invoice (in minor units).
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::PayableResponseSchema]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.payables.mark_as_partially_paid_by_id(payable_id: "payable_id", amount_paid: 1)
    def mark_as_partially_paid_by_id(payable_id:, amount_paid:, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), amount_paid: amount_paid }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/payables/#{payable_id}/mark_as_partially_paid"
end
        Monite::PayableResponseSchema.from_json(json_object: response.body)
      end
    end
# Declines the payable when an approver finds any mismatch or discrepancies.
    #
    # @param payable_id [String] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::PayableResponseSchema]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.payables.reject_by_id(payable_id: "payable_id")
    def reject_by_id(payable_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/payables/#{payable_id}/reject"
end
        Monite::PayableResponseSchema.from_json(json_object: response.body)
      end
    end
# Reset payable state from rejected to new.
    #
    # @param payable_id [String] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::PayableResponseSchema]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.payables.reopen_by_id(payable_id: "payable_id")
    def reopen_by_id(payable_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/payables/#{payable_id}/reopen"
end
        Monite::PayableResponseSchema.from_json(json_object: response.body)
      end
    end
# Starts the approval process once the uploaded payable is validated.
    #
    # @param payable_id [String] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::PayableResponseSchema]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.payables.submit_for_approval_by_id(payable_id: "payable_id")
    def submit_for_approval_by_id(payable_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/payables/#{payable_id}/submit_for_approval"
end
        Monite::PayableResponseSchema.from_json(json_object: response.body)
      end
    end
# Check the invoice for compliance with the requirements for movement from draft
#  to new status.
    #
    # @param payable_id [String] 
    # @param request_options [Monite::RequestOptions] 
    # @return [Monite::PayableValidationResponse]
    # @example
#  api = Monite::Client.new(
#    base_url: "https://api.example.com",
#    environment: Monite::Environment::SANDBOX,
#    token: "YOUR_AUTH_TOKEN",
#    monite_version: "MoniteVersion"
#  )
#  api.payables.validate_by_id(payable_id: "payable_id")
    def validate_by_id(payable_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/payables/#{payable_id}/validate"
end
        Monite::PayableValidationResponse.from_json(json_object: response.body)
      end
    end
  end
end