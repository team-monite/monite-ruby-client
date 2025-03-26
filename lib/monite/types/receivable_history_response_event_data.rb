# frozen_string_literal: true
require "json"
require_relative "status_changed_event_data"
require_relative "receivable_updated_event_data"
require_relative "receivable_created_event_data"
require_relative "based_on_receivable_created_event_data"
require_relative "payment_received_event_data"
require_relative "mail_sent_event_data"
require_relative "reminder_mail_sent_event_data"

module Monite
# An object containing additional information about the event or change. The
#  object structure varies based on the `event_type`. In `receivable_created` and
#  `receivable_updated` events, `event_data` is an empty object `{}`.
  class ReceivableHistoryResponseEventData


# Deserialize a JSON object to an instance of ReceivableHistoryResponseEventData
    #
    # @param json_object [String] 
    # @return [Monite::ReceivableHistoryResponseEventData]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      begin
        Monite::StatusChangedEventData.validate_raw(obj: struct)
        unless struct.nil?
  return Monite::StatusChangedEventData.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Monite::ReceivableUpdatedEventData.validate_raw(obj: struct)
        unless struct.nil?
  return Monite::ReceivableUpdatedEventData.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Monite::ReceivableCreatedEventData.validate_raw(obj: struct)
        unless struct.nil?
  return Monite::ReceivableCreatedEventData.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Monite::BasedOnReceivableCreatedEventData.validate_raw(obj: struct)
        unless struct.nil?
  return Monite::BasedOnReceivableCreatedEventData.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Monite::PaymentReceivedEventData.validate_raw(obj: struct)
        unless struct.nil?
  return Monite::PaymentReceivedEventData.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Monite::MailSentEventData.validate_raw(obj: struct)
        unless struct.nil?
  return Monite::MailSentEventData.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Monite::ReminderMailSentEventData.validate_raw(obj: struct)
        unless struct.nil?
  return Monite::ReminderMailSentEventData.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
 return struct
    end
# Leveraged for Union-type generation, validate_raw attempts to parse the given
#  hash and check each fields type against the current object's property
#  definitions.
    #
    # @param obj [Object] 
    # @return [Void]
    def self.validate_raw(obj:)
      begin
        return Monite::StatusChangedEventData.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Monite::ReceivableUpdatedEventData.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Monite::ReceivableCreatedEventData.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Monite::BasedOnReceivableCreatedEventData.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Monite::PaymentReceivedEventData.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Monite::MailSentEventData.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Monite::ReminderMailSentEventData.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      raise("Passed value matched no type within the union, validation failed.")
    end
  end
end