class OrderItem < ActiveRecord::Base
  UNIDADES = %w(
    kg
    lt
  ).freeze

  belongs_to :order
  validates :cantidad,
            :detalle,
            :proveedor,
            presence: true
end
