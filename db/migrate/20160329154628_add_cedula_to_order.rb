class AddCedulaToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :cedula, :string
  end
end
