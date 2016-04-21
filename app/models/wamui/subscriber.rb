module Wamui
  class Subscriber < ActiveRecord::Base
    validates :email,
              :slack,
              uniqueness: true,
              allow_blank: true
    validate :validate_email_or_slack

    private

    def validate_email_or_slack
      errors.add(
        :base,
        "Necesita email o slack"
      ) if email.blank? && slack.blank?
    end

    def self.table_name_prefix
      'wamui_'
    end
  end
end
