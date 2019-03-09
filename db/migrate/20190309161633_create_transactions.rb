class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.integer  :shareable_id
      t.integer  :requester_id
      t.integer  :date_attribute
      t.boolean  :approved
      t.boolean  :completed
      t.string   :timestamp

      t.timestamps
    end
  end
end
