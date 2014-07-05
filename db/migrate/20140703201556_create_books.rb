class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :isbn
      t.string :titulo
      t.string :autor
      t.string :editorial
      t.float :precio
      t.float :cantidad
      t.integer :category_id

      t.timestamps
    end
  end
end
