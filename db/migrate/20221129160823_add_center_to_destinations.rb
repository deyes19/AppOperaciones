class AddCenterToDestinations < ActiveRecord::Migration[7.0]
  def change
    add_reference :destinations, :center, null: false, foreign_key: true
  end
end
