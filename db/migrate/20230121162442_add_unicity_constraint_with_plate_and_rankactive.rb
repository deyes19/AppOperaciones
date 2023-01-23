class AddUnicityConstraintWithPlateAndRankactive < ActiveRecord::Migration[7.0]
  def change
    def change
      add_index :actives, [:rankactive_id, :plate], unique: true
    end
  end
end
