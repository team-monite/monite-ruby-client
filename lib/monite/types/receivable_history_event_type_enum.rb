# frozen_string_literal: true

module Monite
  class ReceivableHistoryEventTypeEnum

    STATUS_CHANGED = "status_changed"
    RECEIVABLE_CREATED = "receivable_created"
    RECEIVABLE_UPDATED = "receivable_updated"
    BASED_ON_RECEIVABLE_CREATED = "based_on_receivable_created"
    PAYMENT_RECEIVED = "payment_received"
    MAIL_SENT = "mail_sent"
    PAYMENT_REMINDER_MAIL_SENT = "payment_reminder_mail_sent"
    OVERDUE_REMINDER_MAIL_SENT = "overdue_reminder_mail_sent"

  end
end