class CreateUserBuildings < ActiveRecord::Migration[5.2]
  def change
    create_table :user_buildings do |t|
      t.references :user, foreign_key: true
      t.references :building, foreign_key: true

      t.timestamps
    end
  end
end
