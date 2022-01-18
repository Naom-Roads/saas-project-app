class AddColumnToAccounts < ActiveRecord::Migration[6.1]
  def change
    add_column :tickets, :account_id, :integer
    add_index :tickets, :account_id
  end
end
