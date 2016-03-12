class AcceptNullUnits < ActiveRecord::Migration
  def up
    change_column :order_items, :unidad, :string, null: true
  end

  def down
    change_column :order_items, :unidad, :integer, null: false
  end
end
