class Service < ApplicationRecord
  
  def change
    create_table :services do |t|
      t.string :description
      t.string :availability
      t.string :more_information

      t.timestamps
    end
  end



end
