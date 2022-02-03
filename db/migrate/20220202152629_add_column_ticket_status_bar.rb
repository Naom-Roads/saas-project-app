class AddColumnTicketStatusBar < ActiveRecord::Migration[6.1]
  def change
    add_column :tickets, :status, :string
  end
end
