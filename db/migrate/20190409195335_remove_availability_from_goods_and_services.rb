class RemoveAvailabilityFromGoodsAndServices < ActiveRecord::Migration[5.2]
  def change
    remove_column :goods, :availability
    remove_column :services, :availablity
  end
end
