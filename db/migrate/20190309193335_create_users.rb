class CreateUsers < ActiveRecord::Migration[5.2]
  
  def change
    create_table :users do |t|
      t.string :full_name
      t.string :first_name
      t.string :last_name
      t.string :picture_url
      t.string :utility_bill_url
      t.references :building, foreign_key: true

      t.timestamps
    end
  end
end
