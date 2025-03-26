# frozen_string_literal: true
require "json"
require_relative "common_schema_output"
require_relative "payable_schema_output"

module Monite
  class RootSchemaOutput
  # @return [Object] 
    attr_reader :member
  # @return [String] 
    attr_reader :discriminant

    private_class_method :new
    alias kind_of? is_a?

    # @param member [Object] 
    # @param discriminant [String] 
    # @return [Monite::RootSchemaOutput]
    def initialize(member:, discriminant:)
      @member = member
      @discriminant = discriminant
    end
# Deserialize a JSON object to an instance of RootSchemaOutput
    #
    # @param json_object [String] 
    # @return [Monite::RootSchemaOutput]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      case struct.object_type
      when "approval_policy"
        member = Monite::CommonSchemaOutput.from_json(json_object: json_object)
      when "approval_request"
        member = Monite::CommonSchemaOutput.from_json(json_object: json_object)
      when "comment"
        member = Monite::CommonSchemaOutput.from_json(json_object: json_object)
      when "counterpart"
        member = Monite::CommonSchemaOutput.from_json(json_object: json_object)
      when "counterpart_vat_id"
        member = Monite::CommonSchemaOutput.from_json(json_object: json_object)
      when "entity"
        member = Monite::CommonSchemaOutput.from_json(json_object: json_object)
      when "entity_bank_account"
        member = Monite::CommonSchemaOutput.from_json(json_object: json_object)
      when "entity_user"
        member = Monite::CommonSchemaOutput.from_json(json_object: json_object)
      when "entity_vat_ids"
        member = Monite::CommonSchemaOutput.from_json(json_object: json_object)
      when "export"
        member = Monite::CommonSchemaOutput.from_json(json_object: json_object)
      when "mailbox"
        member = Monite::CommonSchemaOutput.from_json(json_object: json_object)
      when "onboarding"
        member = Monite::CommonSchemaOutput.from_json(json_object: json_object)
      when "overdue_reminder"
        member = Monite::CommonSchemaOutput.from_json(json_object: json_object)
      when "payable"
        member = Monite::PayableSchemaOutput.from_json(json_object: json_object)
      when "payables_purchase_order"
        member = Monite::CommonSchemaOutput.from_json(json_object: json_object)
      when "payment_record"
        member = Monite::CommonSchemaOutput.from_json(json_object: json_object)
      when "payment_reminder"
        member = Monite::CommonSchemaOutput.from_json(json_object: json_object)
      when "person"
        member = Monite::CommonSchemaOutput.from_json(json_object: json_object)
      when "product"
        member = Monite::CommonSchemaOutput.from_json(json_object: json_object)
      when "project"
        member = Monite::CommonSchemaOutput.from_json(json_object: json_object)
      when "receivable"
        member = Monite::CommonSchemaOutput.from_json(json_object: json_object)
      when "reconciliation"
        member = Monite::CommonSchemaOutput.from_json(json_object: json_object)
      when "role"
        member = Monite::CommonSchemaOutput.from_json(json_object: json_object)
      when "tag"
        member = Monite::CommonSchemaOutput.from_json(json_object: json_object)
      when "todo_task"
        member = Monite::CommonSchemaOutput.from_json(json_object: json_object)
      when "todo_task_mute"
        member = Monite::CommonSchemaOutput.from_json(json_object: json_object)
      when "transaction"
        member = Monite::CommonSchemaOutput.from_json(json_object: json_object)
      when "workflow"
        member = Monite::CommonSchemaOutput.from_json(json_object: json_object)
      else
        member = Monite::CommonSchemaOutput.from_json(json_object: json_object)
      end
      new(member: member, discriminant: struct.object_type)
    end
# For Union Types, to_json functionality is delegated to the wrapped member.
    #
    # @return [String]
    def to_json
      case @discriminant
      when "approval_policy"
        { **@member.to_json, object_type: @discriminant }.to_json
      when "approval_request"
        { **@member.to_json, object_type: @discriminant }.to_json
      when "comment"
        { **@member.to_json, object_type: @discriminant }.to_json
      when "counterpart"
        { **@member.to_json, object_type: @discriminant }.to_json
      when "counterpart_vat_id"
        { **@member.to_json, object_type: @discriminant }.to_json
      when "entity"
        { **@member.to_json, object_type: @discriminant }.to_json
      when "entity_bank_account"
        { **@member.to_json, object_type: @discriminant }.to_json
      when "entity_user"
        { **@member.to_json, object_type: @discriminant }.to_json
      when "entity_vat_ids"
        { **@member.to_json, object_type: @discriminant }.to_json
      when "export"
        { **@member.to_json, object_type: @discriminant }.to_json
      when "mailbox"
        { **@member.to_json, object_type: @discriminant }.to_json
      when "onboarding"
        { **@member.to_json, object_type: @discriminant }.to_json
      when "overdue_reminder"
        { **@member.to_json, object_type: @discriminant }.to_json
      when "payable"
        { **@member.to_json, object_type: @discriminant }.to_json
      when "payables_purchase_order"
        { **@member.to_json, object_type: @discriminant }.to_json
      when "payment_record"
        { **@member.to_json, object_type: @discriminant }.to_json
      when "payment_reminder"
        { **@member.to_json, object_type: @discriminant }.to_json
      when "person"
        { **@member.to_json, object_type: @discriminant }.to_json
      when "product"
        { **@member.to_json, object_type: @discriminant }.to_json
      when "project"
        { **@member.to_json, object_type: @discriminant }.to_json
      when "receivable"
        { **@member.to_json, object_type: @discriminant }.to_json
      when "reconciliation"
        { **@member.to_json, object_type: @discriminant }.to_json
      when "role"
        { **@member.to_json, object_type: @discriminant }.to_json
      when "tag"
        { **@member.to_json, object_type: @discriminant }.to_json
      when "todo_task"
        { **@member.to_json, object_type: @discriminant }.to_json
      when "todo_task_mute"
        { **@member.to_json, object_type: @discriminant }.to_json
      when "transaction"
        { **@member.to_json, object_type: @discriminant }.to_json
      when "workflow"
        { **@member.to_json, object_type: @discriminant }.to_json
      else
        { "object_type": @discriminant, value: @member }.to_json
      end
      @member.to_json
    end
# Leveraged for Union-type generation, validate_raw attempts to parse the given
#  hash and check each fields type against the current object's property
#  definitions.
    #
    # @param obj [Object] 
    # @return [Void]
    def self.validate_raw(obj:)
      case obj.object_type
      when "approval_policy"
        Monite::CommonSchemaOutput.validate_raw(obj: obj)
      when "approval_request"
        Monite::CommonSchemaOutput.validate_raw(obj: obj)
      when "comment"
        Monite::CommonSchemaOutput.validate_raw(obj: obj)
      when "counterpart"
        Monite::CommonSchemaOutput.validate_raw(obj: obj)
      when "counterpart_vat_id"
        Monite::CommonSchemaOutput.validate_raw(obj: obj)
      when "entity"
        Monite::CommonSchemaOutput.validate_raw(obj: obj)
      when "entity_bank_account"
        Monite::CommonSchemaOutput.validate_raw(obj: obj)
      when "entity_user"
        Monite::CommonSchemaOutput.validate_raw(obj: obj)
      when "entity_vat_ids"
        Monite::CommonSchemaOutput.validate_raw(obj: obj)
      when "export"
        Monite::CommonSchemaOutput.validate_raw(obj: obj)
      when "mailbox"
        Monite::CommonSchemaOutput.validate_raw(obj: obj)
      when "onboarding"
        Monite::CommonSchemaOutput.validate_raw(obj: obj)
      when "overdue_reminder"
        Monite::CommonSchemaOutput.validate_raw(obj: obj)
      when "payable"
        Monite::PayableSchemaOutput.validate_raw(obj: obj)
      when "payables_purchase_order"
        Monite::CommonSchemaOutput.validate_raw(obj: obj)
      when "payment_record"
        Monite::CommonSchemaOutput.validate_raw(obj: obj)
      when "payment_reminder"
        Monite::CommonSchemaOutput.validate_raw(obj: obj)
      when "person"
        Monite::CommonSchemaOutput.validate_raw(obj: obj)
      when "product"
        Monite::CommonSchemaOutput.validate_raw(obj: obj)
      when "project"
        Monite::CommonSchemaOutput.validate_raw(obj: obj)
      when "receivable"
        Monite::CommonSchemaOutput.validate_raw(obj: obj)
      when "reconciliation"
        Monite::CommonSchemaOutput.validate_raw(obj: obj)
      when "role"
        Monite::CommonSchemaOutput.validate_raw(obj: obj)
      when "tag"
        Monite::CommonSchemaOutput.validate_raw(obj: obj)
      when "todo_task"
        Monite::CommonSchemaOutput.validate_raw(obj: obj)
      when "todo_task_mute"
        Monite::CommonSchemaOutput.validate_raw(obj: obj)
      when "transaction"
        Monite::CommonSchemaOutput.validate_raw(obj: obj)
      when "workflow"
        Monite::CommonSchemaOutput.validate_raw(obj: obj)
      else
        raise("Passed value matched no type within the union, validation failed.")
      end
    end
# For Union Types, is_a? functionality is delegated to the wrapped member.
    #
    # @param obj [Object] 
    # @return [Boolean]
    def is_a?(obj)
      @member.is_a?(obj)
    end
    # @param member [Monite::CommonSchemaOutput] 
    # @return [Monite::RootSchemaOutput]
    def self.approval_policy(member:)
      new(member: member, discriminant: "approval_policy")
    end
    # @param member [Monite::CommonSchemaOutput] 
    # @return [Monite::RootSchemaOutput]
    def self.approval_request(member:)
      new(member: member, discriminant: "approval_request")
    end
    # @param member [Monite::CommonSchemaOutput] 
    # @return [Monite::RootSchemaOutput]
    def self.comment(member:)
      new(member: member, discriminant: "comment")
    end
    # @param member [Monite::CommonSchemaOutput] 
    # @return [Monite::RootSchemaOutput]
    def self.counterpart(member:)
      new(member: member, discriminant: "counterpart")
    end
    # @param member [Monite::CommonSchemaOutput] 
    # @return [Monite::RootSchemaOutput]
    def self.counterpart_vat_id(member:)
      new(member: member, discriminant: "counterpart_vat_id")
    end
    # @param member [Monite::CommonSchemaOutput] 
    # @return [Monite::RootSchemaOutput]
    def self.entity(member:)
      new(member: member, discriminant: "entity")
    end
    # @param member [Monite::CommonSchemaOutput] 
    # @return [Monite::RootSchemaOutput]
    def self.entity_bank_account(member:)
      new(member: member, discriminant: "entity_bank_account")
    end
    # @param member [Monite::CommonSchemaOutput] 
    # @return [Monite::RootSchemaOutput]
    def self.entity_user(member:)
      new(member: member, discriminant: "entity_user")
    end
    # @param member [Monite::CommonSchemaOutput] 
    # @return [Monite::RootSchemaOutput]
    def self.entity_vat_ids(member:)
      new(member: member, discriminant: "entity_vat_ids")
    end
    # @param member [Monite::CommonSchemaOutput] 
    # @return [Monite::RootSchemaOutput]
    def self.export(member:)
      new(member: member, discriminant: "export")
    end
    # @param member [Monite::CommonSchemaOutput] 
    # @return [Monite::RootSchemaOutput]
    def self.mailbox(member:)
      new(member: member, discriminant: "mailbox")
    end
    # @param member [Monite::CommonSchemaOutput] 
    # @return [Monite::RootSchemaOutput]
    def self.onboarding(member:)
      new(member: member, discriminant: "onboarding")
    end
    # @param member [Monite::CommonSchemaOutput] 
    # @return [Monite::RootSchemaOutput]
    def self.overdue_reminder(member:)
      new(member: member, discriminant: "overdue_reminder")
    end
    # @param member [Monite::PayableSchemaOutput] 
    # @return [Monite::RootSchemaOutput]
    def self.payable(member:)
      new(member: member, discriminant: "payable")
    end
    # @param member [Monite::CommonSchemaOutput] 
    # @return [Monite::RootSchemaOutput]
    def self.payables_purchase_order(member:)
      new(member: member, discriminant: "payables_purchase_order")
    end
    # @param member [Monite::CommonSchemaOutput] 
    # @return [Monite::RootSchemaOutput]
    def self.payment_record(member:)
      new(member: member, discriminant: "payment_record")
    end
    # @param member [Monite::CommonSchemaOutput] 
    # @return [Monite::RootSchemaOutput]
    def self.payment_reminder(member:)
      new(member: member, discriminant: "payment_reminder")
    end
    # @param member [Monite::CommonSchemaOutput] 
    # @return [Monite::RootSchemaOutput]
    def self.person(member:)
      new(member: member, discriminant: "person")
    end
    # @param member [Monite::CommonSchemaOutput] 
    # @return [Monite::RootSchemaOutput]
    def self.product(member:)
      new(member: member, discriminant: "product")
    end
    # @param member [Monite::CommonSchemaOutput] 
    # @return [Monite::RootSchemaOutput]
    def self.project(member:)
      new(member: member, discriminant: "project")
    end
    # @param member [Monite::CommonSchemaOutput] 
    # @return [Monite::RootSchemaOutput]
    def self.receivable(member:)
      new(member: member, discriminant: "receivable")
    end
    # @param member [Monite::CommonSchemaOutput] 
    # @return [Monite::RootSchemaOutput]
    def self.reconciliation(member:)
      new(member: member, discriminant: "reconciliation")
    end
    # @param member [Monite::CommonSchemaOutput] 
    # @return [Monite::RootSchemaOutput]
    def self.role(member:)
      new(member: member, discriminant: "role")
    end
    # @param member [Monite::CommonSchemaOutput] 
    # @return [Monite::RootSchemaOutput]
    def self.tag(member:)
      new(member: member, discriminant: "tag")
    end
    # @param member [Monite::CommonSchemaOutput] 
    # @return [Monite::RootSchemaOutput]
    def self.todo_task(member:)
      new(member: member, discriminant: "todo_task")
    end
    # @param member [Monite::CommonSchemaOutput] 
    # @return [Monite::RootSchemaOutput]
    def self.todo_task_mute(member:)
      new(member: member, discriminant: "todo_task_mute")
    end
    # @param member [Monite::CommonSchemaOutput] 
    # @return [Monite::RootSchemaOutput]
    def self.transaction(member:)
      new(member: member, discriminant: "transaction")
    end
    # @param member [Monite::CommonSchemaOutput] 
    # @return [Monite::RootSchemaOutput]
    def self.workflow(member:)
      new(member: member, discriminant: "workflow")
    end
  end
end