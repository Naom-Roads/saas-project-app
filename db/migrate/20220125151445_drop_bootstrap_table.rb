class DropBootstrapTable < ActiveRecord::Migration[6.1]
  def change
    drop_table :views_bootstrap_templates
  end
end
