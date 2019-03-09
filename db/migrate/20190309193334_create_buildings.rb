class CreateBuildings < ActiveRecord::Migration[5.2]
  has_many :users
  has_many :shareables
  has_many :transactions
  
  def change
    create_table :buildings do |t|
      t.string :building_name
      t.string :address

      t.timestamps
    end
  end
end
