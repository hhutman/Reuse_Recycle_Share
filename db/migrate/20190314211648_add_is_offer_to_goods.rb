class AddIsOfferToGoods < ActiveRecord::Migration[5.2]
  def change
    add_column :goods, :is_offer, :boolean
  end
end
