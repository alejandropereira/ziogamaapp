class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.string :company
      t.integer :user_id
      t.text :details
      t.datetime :finished_at
      t.boolean :status

      t.timestamps
    end
  end
end
