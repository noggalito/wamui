class AddDireccion2ToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :direccion_2, :string
  end
end
