class CreateSuppliers < ActiveRecord::Migration[7.0]
  def change
    create_table :suppliers do |t|
      t.integer :nit
      t.string :description

      t.timestamps
    end
  end
end
