class RemoveRelocations < ActiveRecord::Migration[7.0]
  def change
    drop_table :relocations
  end
end
