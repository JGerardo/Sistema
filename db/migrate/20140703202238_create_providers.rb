class CreateProviders < ActiveRecord::Migration
  def change
    create_table :providers do |t|
      t.string :nombreempesa
      t.string :telefono
      t.string :e_mail
      t.string :direccion

      t.timestamps
    end
  end
end
