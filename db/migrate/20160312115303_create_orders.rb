class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :nombres, null: false
      t.string :email, null: false
      t.string :organizacion
      t.string :telefono, null: false
      t.string :direccion, null: false
      t.text :observaciones

      t.timestamps null: false
    end
  end
end
