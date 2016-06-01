class NotifyOrderJob
  include SuckerPunch::Job

  def perform(order)
    order.notify_slack
    order.send :send_email_notifications
  end
end
