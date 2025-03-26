# frozen_string_literal: true

module Monite
  class PayableStateEnum

    DRAFT = "draft"
    NEW = "new"
    APPROVE_IN_PROGRESS = "approve_in_progress"
    WAITING_TO_BE_PAID = "waiting_to_be_paid"
    PARTIALLY_PAID = "partially_paid"
    PAID = "paid"
    CANCELED = "canceled"
    REJECTED = "rejected"

  end
end