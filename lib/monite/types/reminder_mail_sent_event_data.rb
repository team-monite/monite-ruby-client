# frozen_string_literal: true
require_relative "receivable_mail_status_enum"
require_relative "receivable_mail_recipients"
require_relative "reminder_type_enum"
require "ostruct"
require "json"

module Monite
# Contains information about an invoice reminder sent via email.
  class ReminderMailSentEventData
  # @return [String] ID of the email sending operation. Can be used to get the email sending status
#  from `GET /receivables/{receivable_id}/mails/{mail_id}`.
    attr_reader :mail_id
  # @return [Monite::ReceivableMailStatusEnum] The overall email sending status across all recipients.
    attr_reader :mail_status
  # @return [Monite::ReceivableMailRecipients] Contains a list of email recipients (To, CC, BCC) and the email sending status
#  for each recipient.
    attr_reader :recipients
  # @return [Monite::ReminderTypeEnum] Invoice reminder type:
#  * `term_1` - [payment
#  eminder](https://docs.monite.com/accounts-receivable/invoices/payment-reminders)
#  sent before discount date 1,
#  * `term_2` - payment reminder sent before discount date 2,
#  * `term_final` - payment reminder sent before the invoice due date.
#  * `overdue` - [overdue
#  eminder](https://docs.monite.com/accounts-receivable/invoices/overdue-reminders)
#  sent after the due date.
    attr_reader :term
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param mail_id [String] ID of the email sending operation. Can be used to get the email sending status
#  from `GET /receivables/{receivable_id}/mails/{mail_id}`.
    # @param mail_status [Monite::ReceivableMailStatusEnum] The overall email sending status across all recipients.
    # @param recipients [Monite::ReceivableMailRecipients] Contains a list of email recipients (To, CC, BCC) and the email sending status
#  for each recipient.
    # @param term [Monite::ReminderTypeEnum] Invoice reminder type:
#  * `term_1` - [payment
#  eminder](https://docs.monite.com/accounts-receivable/invoices/payment-reminders)
#  sent before discount date 1,
#  * `term_2` - payment reminder sent before discount date 2,
#  * `term_final` - payment reminder sent before the invoice due date.
#  * `overdue` - [overdue
#  eminder](https://docs.monite.com/accounts-receivable/invoices/overdue-reminders)
#  sent after the due date.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Monite::ReminderMailSentEventData]
    def initialize(mail_id:, mail_status:, recipients:, term:, additional_properties: nil)
      @mail_id = mail_id
      @mail_status = mail_status
      @recipients = recipients
      @term = term
      @additional_properties = additional_properties
      @_field_set = { "mail_id": mail_id, "mail_status": mail_status, "recipients": recipients, "term": term }
    end
# Deserialize a JSON object to an instance of ReminderMailSentEventData
    #
    # @param json_object [String] 
    # @return [Monite::ReminderMailSentEventData]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      mail_id = parsed_json["mail_id"]
      mail_status = parsed_json["mail_status"]
      unless parsed_json["recipients"].nil?
        recipients = parsed_json["recipients"].to_json
        recipients = Monite::ReceivableMailRecipients.from_json(json_object: recipients)
      else
        recipients = nil
      end
      term = parsed_json["term"]
      new(
        mail_id: mail_id,
        mail_status: mail_status,
        recipients: recipients,
        term: term,
        additional_properties: struct
      )
    end
# Serialize an instance of ReminderMailSentEventData to a JSON object
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
      obj.mail_id.is_a?(String) != false || raise("Passed value for field obj.mail_id is not the expected type, validation failed.")
      obj.mail_status.is_a?(Monite::ReceivableMailStatusEnum) != false || raise("Passed value for field obj.mail_status is not the expected type, validation failed.")
      Monite::ReceivableMailRecipients.validate_raw(obj: obj.recipients)
      obj.term.is_a?(Monite::ReminderTypeEnum) != false || raise("Passed value for field obj.term is not the expected type, validation failed.")
    end
  end
end