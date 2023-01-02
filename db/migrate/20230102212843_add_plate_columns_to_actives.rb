class AddPlateColumnsToActives < ActiveRecord::Migration[7.0]
  def change
    add_column :actives, :plate, :integer
  end
end
