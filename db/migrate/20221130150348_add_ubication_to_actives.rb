class AddUbicationToActives < ActiveRecord::Migration[7.0]
  def change
    add_reference :actives, :ubication, null: false, foreign_key: true
  end
end
