class AddIndexTicketNumberToTickets < ActiveRecord::Migration[6.1]
  def change
    add_index :tickets, :ticket_number
  end
end
