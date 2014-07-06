class CreateSaleDetails < ActiveRecord::Migration
  def change
    create_table :sale_details do |t|
      t.integer :sale_id
      t.integer :book_id
      t.float :cantidad
      t.float :precio
      t.float :descuento
      t.float :total

      t.timestamps
    end
  end
end
