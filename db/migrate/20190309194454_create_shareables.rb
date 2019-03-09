class CreateShareables < ActiveRecord::Migration[5.2]
  
  def change
    create_table :shareables do |t|
      t.string :product_name
      t.boolean :good
      t.boolean :service
      t.references :building, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
