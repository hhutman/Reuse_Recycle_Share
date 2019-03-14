class CreateGoods < ActiveRecord::Migration[5.2]
  def change
    create_table :goods do |t|
      t.string :description
      t.string :availability
      t.string :more_information

      t.timestamps
    end
  end
end
