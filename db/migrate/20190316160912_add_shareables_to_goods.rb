class AddShareablesToGoods < ActiveRecord::Migration[5.2]
  def change
    add_reference :goods, :shareable, foreign_key: true
  end
end
