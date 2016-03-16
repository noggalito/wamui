class OrderItem < ActiveRecord::Base
  UNIDADES = %w(
    unidades
    kg
    lt
  ).freeze

  belongs_to :order
  validates :unidad,
            :detalle,
            :cantidad,
            :proveedor,
            presence: true
end
