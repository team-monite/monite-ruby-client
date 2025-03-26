# frozen_string_literal: true

module Monite
# - NEW: A business has been created within Kanmon
#  - ONBOARDED: A business has completed all of the onboarding steps within Kanmon
#  and is now awaiting underwriting.
#  - INPUT_REQUIRED: A business will be asked to provide required data
  class WcBusinessStatus

    NEW = "NEW"
    INPUT_REQUIRED = "INPUT_REQUIRED"
    ONBOARDED = "ONBOARDED"

  end
end