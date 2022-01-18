class DropAsapTeches < ActiveRecord::Migration[6.1]
  def change
    drop_table :asap_teches
  end
end
