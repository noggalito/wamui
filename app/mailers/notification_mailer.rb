class NotificationMailer < ActionMailer::Base
  default from: "wamui@noggalito.com"

  layout 'mailer'

  def notification_supervisor(order)
    @order = order
    @message = "Proveedor, hay una nueva orden:"
    supervisors_emails = ENV["SUPERVISORS_EMAILS"]
    mail(subject: "Notificación", to: supervisors_emails)
  end

  def notification_client(order)
    @order = order
    @message = "Cliente, esta es la orden que acabas de crear:"
    mail(subject: "Notificación", to: @order.email)
  end
end
