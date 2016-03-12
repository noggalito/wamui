class Order < ActiveRecord::Base
  has_many :order_items
  validates :nombres,
            :email,
            :telefono,
            :direccion,
            presence: true

  accepts_nested_attributes_for(
    :order_items,
    reject_if: proc do |attributes|
      attributes['detalle'].blank?
    end
  )
end
