class RemoveStatusAtFromActives < ActiveRecord::Migration[7.0]
  def change
    remove_column :actives, :status, :string
  end
end
