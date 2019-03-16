class AddShareableToServices < ActiveRecord::Migration[5.2]
  def change
    add_reference :services, :shareable, foreign_key: true
  end
end
