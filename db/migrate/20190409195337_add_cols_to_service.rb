class AddColsToService < ActiveRecord::Migration[5.2]
  def change
    add_column :services, :title, :string
    add_column :services, :user_id, :integer 
  end
end
