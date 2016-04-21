module Wamui
  class Subscriber < ActiveRecord::Base
    validates :email,
              :slack,
              uniqueness: true,
              allow_blank: true
    validate :validate_email_or_slack

    scope :with_slack, -> { where.not(slack: nil) }
    scope :with_email, -> { where.not(email: nil) }

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

    def self.slackers
      with_slack.pluck(:slack)
                .reject(&:blank?)
                .map do |nickname|
        "@#{nickname}"
      end
    end
  end
end
