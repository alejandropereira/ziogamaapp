class AddCompleteToProspect < ActiveRecord::Migration
  def change
    add_column :prospects, :complete, :boolean
  end
end
