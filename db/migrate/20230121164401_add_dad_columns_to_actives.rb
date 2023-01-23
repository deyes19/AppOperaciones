class AddDadColumnsToActives < ActiveRecord::Migration[7.0]
  def change
    add_column :actives, :dad, :string
  end
end
