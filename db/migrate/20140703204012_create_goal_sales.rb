class CreateGoalSales < ActiveRecord::Migration
  def change
    create_table :goal_sales do |t|
      t.integer :user_id
      t.string :meta
      t.boolean :reached
      t.datetime :fechainicio
      t.datetime :fechafin

      t.timestamps
    end
  end
end
