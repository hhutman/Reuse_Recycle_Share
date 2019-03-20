class AddColsToService < ActiveRecord::Migration[5.2]
  def change
    add_column :services, :title, :string
    add_column :services, :owner_id, :integer 
  end
end
