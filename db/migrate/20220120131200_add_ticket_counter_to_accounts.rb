class AddTicketCounterToAccounts < ActiveRecord::Migration[6.1]
  def change
    add_column :accounts, :ticket_counter, :integer
  end
end
