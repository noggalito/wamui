require "slack-notifier"

class Order < ActiveRecord::Base
  module SlackNotifications
    include Rails.application.routes.url_helpers

    def notify_slack
      return if halt_notification?
      notifier.ping(
        message,
        icon_emoji: icon_emoji,
        attachments: [ attachment ]
      )
    end

    private

    def halt_notification?
      Rails.env.development? && ENV["NOTIFY_SLACK"].blank?
    end

    def message
      "Tenemos una nueva orden!"
    end

    def fallback
      "#{nombres} ha creado la #{to_s}: #{order_url(self)}"
    end

    def attachment
      {
        title: to_s,
        color: "good",
        fallback: fallback,
        author_name: nombres,
        fields: attachment_fields,
        title_link: order_url(self)
      }
    end

    def attachment_fields
      [
        {
          title: "Organización",
          value: organizacion,
          short: false
        },
        {
          title: "Dirección",
          value: direccion,
          short: false
        }
      ]
    end

    def icon_emoji
      ":rotating_light:"
    end

    def notifier
      Slack::Notifier.new(
        webhook_url,
        username: username
      )
    end

    def username
      Rails.application.class.parent_name.downcase
    end

    def webhook_url
      Rails.application.secrets.slack_webhook_url
    end

    def default_url_options
      Rails.application.routes.default_url_options
    end
  end
end
