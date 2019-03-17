class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.string :transaction_name
      t.boolean :approved
      t.boolean :completed
      t.string :recipient
      t.references :user, foreign_key: true
      t.references :building, foreign_key: true
      t.references :good, foreign_key: true, optional: true
      t.references :service, foreign_key: true, optional: true
      t.timestamps
    end
  end
end
