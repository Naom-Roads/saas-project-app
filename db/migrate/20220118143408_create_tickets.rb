class CreateTickets < ActiveRecord::Migration[6.1]
  def change
    create_table :tickets do |t|
      t.string :subject
      t.text :description
      t.integer :ticket_number
      t.string :ticket_status
      t.timestamps 
    end
  end
end
