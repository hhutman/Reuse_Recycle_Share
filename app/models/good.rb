class Good < ApplicationRecord


  def change
    create_table :good do |t|
      t.string :description
      t.string :availability
      t.string :more_information

      t.timestamps
    end
  end
end
