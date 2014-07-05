class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.integer :client_id
      t.date :fecha
      t.integer :user_id

      t.timestamps
    end
  end
end
