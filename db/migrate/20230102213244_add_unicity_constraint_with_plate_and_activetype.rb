class AddUnicityConstraintWithPlateAndActivetype < ActiveRecord::Migration[7.0]
  def change
    add_index :actives, [:active_type_id, :plate], unique: true
  end
end
