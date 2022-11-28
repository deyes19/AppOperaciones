class AddZoneAtToCenters < ActiveRecord::Migration[7.0]
  def change
    add_reference :centers, :zone, null: false, foreign_key: true
  end
end
