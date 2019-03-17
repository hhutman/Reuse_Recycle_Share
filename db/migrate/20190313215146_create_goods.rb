class CreateGoods < ActiveRecord::Migration[5.2]
  def change
    create_table :goods do |t|
      t.string :description
      t.string :availability
      t.string :more_information
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
