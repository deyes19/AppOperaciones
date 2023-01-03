class DropResponsiblesTable < ActiveRecord::Migration[7.0]
  def up
    drop_table :responsibles
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end 
end
