class RemoveUnicityConstraintWithPlateAndActiveTypes < ActiveRecord::Migration[7.0]
  def change
        remove_index :actives, [:active_type_id, :plate], unique: true
  end
end
