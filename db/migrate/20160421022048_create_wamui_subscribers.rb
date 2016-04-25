class CreateWamuiSubscribers < ActiveRecord::Migration
  def change
    create_table :wamui_subscribers do |t|
      t.string :email
      t.string :slack
      t.timestamps null: false
    end
  end
end
