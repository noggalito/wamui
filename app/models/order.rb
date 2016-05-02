class Order < ActiveRecord::Base
  include SlackNotifications

  belongs_to :user
  has_many :order_items

  after_create :send_email_notifications
  after_create :notify_slack

  validates :nombres,
            :email,
            :telefono,
            :direccion,
            :cedula,
            presence: true
  validate :has_any_order_items!

  accepts_nested_attributes_for(
    :order_items,
    allow_destroy: true,
    reject_if: proc do |attributes|
      attributes['detalle'].blank?
    end
  )

  def to_s
    "Orden Nº#{id}"
  end

  private

  def has_any_order_items!
    errors.add(
      :base,
      "Necesita tener al menos un producto"
    ) unless order_items.length > 0
  end

  def send_email_notifications
    NotificationMailer.notify_supervisor(self).deliver_later
    NotificationMailer.notify_client(self).deliver_later
  end
end
