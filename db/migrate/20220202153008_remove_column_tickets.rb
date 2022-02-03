class RemoveColumnTickets < ActiveRecord::Migration[6.1]
  def change
    remove_column :tickets, :status
  end
end
