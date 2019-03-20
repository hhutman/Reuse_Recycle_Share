class AddColsToGoodsTable < ActiveRecord::Migration[5.2]
  def change
    add_column :goods, :title, :string
    add_column :goods, :owner_id, :integer 
  end
end
