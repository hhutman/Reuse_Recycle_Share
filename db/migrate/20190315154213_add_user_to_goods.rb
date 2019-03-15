class AddUserToGoods < ActiveRecord::Migration[5.2]
  def change
    add_reference :goods, :user, foreign_key: true
  end
end
