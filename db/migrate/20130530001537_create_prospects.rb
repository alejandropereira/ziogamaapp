class CreateProspects < ActiveRecord::Migration
  def change
    create_table :prospects do |t|
      t.string :name
      t.string :company
      t.string :phone
      t.string :address
      t.string :email
      t.boolean :state
      t.string :product
      t.boolean :status
      t.text :comments

      t.timestamps
    end
  end
end
