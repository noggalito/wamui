class Order < ActiveRecord::Base
  has_many :order_items

  after_create :send_notifications

  validates :nombres,
            :email,
            :telefono,
            :direccion,
            presence: true
  validate :has_any_order_items!

  accepts_nested_attributes_for(
    :order_items,
    allow_destroy: true,
    reject_if: proc do |attributes|
      attributes['detalle'].blank?
    end
  )

  private

  def has_any_order_items!
    errors.add(
      :base,
      "Necesita tener al menos un producto"
    ) unless order_items.length > 0
  end

  def send_notifications
    NotificationMailer.notify_supervisor(self).deliver_later
    NotificationMailer.notify_client(self).deliver_later
  end
end
