class CreateAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :accounts do |t|
      t.string :address
      t.integer :account_number
      t.integer :age
      t.integer :balance
      t.string :city
      t.string :email
      t.string :employer
      t.string :firstname
      t.string :gender
      t.string :state
    end
  end
end
