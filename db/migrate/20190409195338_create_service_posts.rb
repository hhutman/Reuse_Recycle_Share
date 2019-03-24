class CreateServicePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :service_posts do |t|
      t.references :user, foreign_key: true
      t.references :service, foreign_key: true
      t.string :body

      t.timestamps
    end
  end
end
