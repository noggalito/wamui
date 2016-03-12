class Order < ActiveRecord::Base
  has_many :order_items
  validates :nombres,
            :email,
            :telefono,
            :direccion,
            presence: true
end
