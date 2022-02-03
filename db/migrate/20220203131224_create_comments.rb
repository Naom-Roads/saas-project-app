class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.string :subject
      t.string :body
      t.references :user, null: false, foreign_key: true
      t.references :ticket, null: false, foreign_key: true
      t.timestamps
    end
  end
end
