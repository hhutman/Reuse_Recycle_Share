class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.string :transaction_name
      t.boolean :approved
      t.boolean :completed
      t.string :recipient
      t.references :users, foreign_key: true
      t.references :buildings, foreign_key: true
      t.references :shareables, foreign_key: true

      t.timestamps
    end
  end
end
