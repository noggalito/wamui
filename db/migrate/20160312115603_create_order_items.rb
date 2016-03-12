class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.references :order, index: true, foreign_key: true, null: false
      t.integer :cantidad, null: false
      t.string :detalle, null: false
      t.integer :unidad, null: false
      t.string :proveedor, null: false
      t.text :observaciones

      t.timestamps null: false
    end
  end
end
