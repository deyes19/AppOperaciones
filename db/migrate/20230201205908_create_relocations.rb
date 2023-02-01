class CreateRelocations < ActiveRecord::Migration[7.0]
  def change
    create_table :relocations do |t|
      t.datetime :date_solicited
      t.datetime :date_accept

      t.timestamps
    end
  end
end
