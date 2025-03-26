# frozen_string_literal: true

module Monite
# - NEW: The business has submitted an invoice and it is under review.
#  - FUNDED: The funds for the invoice have been disbursed. The business is now
#  expected to pay back the funds.
#  - PAID: A payment was made that fully paid off an outstanding invoice.
#  - LATE: A payment was not made towards an outstanding invoice.
#  - REJECTED: An invoice was rejected during the funding step.
#  - DEFAULTED: A payment was not made towards an outstanding invoice.
  class WcInvoiceStatus

    NEW = "NEW"
    FUNDED = "FUNDED"
    PAID = "PAID"
    LATE = "LATE"
    REJECTED = "REJECTED"
    DEFAULTED = "DEFAULTED"

  end
end