class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.integer :amount
  
      t.timestamps
    end
    add_reference :transactions, :user, foreign_key: true
  end
end
