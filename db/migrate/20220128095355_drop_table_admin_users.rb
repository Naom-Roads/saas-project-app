class DropTableAdminUsers < ActiveRecord::Migration[6.1]
  def change
    drop_table :table_admin_users
  end
end
