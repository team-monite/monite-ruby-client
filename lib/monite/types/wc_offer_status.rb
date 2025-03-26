# frozen_string_literal: true

module Monite
# - NEW: A new offer has been extended to the business.
#  - ACCEPTED: Business has accepted an offer and is waiting on the closing
#  process.
#  - EXPIRED: Business has not accepted the offer, and the offer has expired.
#  - CURRENT: A loan has been originated and does not currently have any
#  outstanding delayed payments.
#  - LATE: One or more repayments on the issued product have failed.
#  - CLOSED: The issued product is no longer available to the business.
#  - DEFAULTED: The business has failed to meet agreed-upon terms of the loan
#  agreement.
  class WcOfferStatus

    NEW = "NEW"
    ACCEPTED = "ACCEPTED"
    EXPIRED = "EXPIRED"
    CURRENT = "CURRENT"
    LATE = "LATE"
    CLOSED = "CLOSED"
    DEFAULTED = "DEFAULTED"

  end
end