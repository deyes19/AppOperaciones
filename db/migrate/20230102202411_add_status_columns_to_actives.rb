class AddStatusColumnsToActives < ActiveRecord::Migration[7.0]
  def change
    add_column :actives, :status, :boolean
  end
end
