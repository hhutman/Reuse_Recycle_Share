class AddAvailabiltyAndMoreInformationToServices < ActiveRecord::Migration[5.2]
  def change
    add_column :services, :availablity, :string
    add_column :services, :more_information, :string
  end
end
