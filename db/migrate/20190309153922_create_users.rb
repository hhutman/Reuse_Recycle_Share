class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :utility_bill
      t.string :picture_id

      t.timestamps
    end
  end
end
