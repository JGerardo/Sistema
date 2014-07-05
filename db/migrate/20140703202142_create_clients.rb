class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :nombre
      t.string :telefono
      t.string :direccion
      t.string :e_mail
      t.string :facebook
      t.string :twitter
      t.string :liked_in

      t.timestamps
    end
  end
end
