class AddUserToActives < ActiveRecord::Migration[7.0]
  def change
    add_reference :actives, :user, null: false, foreign_key: true
  end
end
