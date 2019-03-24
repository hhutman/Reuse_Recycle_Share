class CreateGoodPosts < ActiveRecord::Migration[5.2]
  def change
    create_table :good_posts do |t|
      t.references :user, foreign_key: true
      t.references :good, foreign_key: true
      t.string :body
      t.timestamps
    end
  end
end
