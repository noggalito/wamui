class OrderItem < ActiveRecord::Base
  belongs_to :order
  validates :cantidad,
            :detalle,
            :unidad,
            :proveedor,
            presence: true
end
