class CreateActives < ActiveRecord::Migration[7.0]
  def change
    create_table :actives do |t|
      t.string :barcode
      t.string :serial
      t.string :name

      t.timestamps
    end
  end
end
