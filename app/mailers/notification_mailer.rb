class NotificationMailer < ActionMailer::Base
  default from: "wamui@noggalito.com",
          subject: "wamui - orden creada"

  layout 'mailer'

  def notify_supervisor(order)
    @order = order
    supervisors_emails = Wamui::Subscriber.with_email
                                          .pluck(:email)
                                          .reject(&:blank?)
    mail(to: supervisors_emails)
  end

  def notify_client(order)
    @order = order
    mail(to: @order.email)
  end
end
