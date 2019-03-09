class CreateShareables < ActiveRecord::Migration[5.2]
  def change
    create_table :shareables do |t|
      t.string :shareable_name
      t.string :good_or_service
      t.integer :user_id

      t.timestamps
    end
  end
end
