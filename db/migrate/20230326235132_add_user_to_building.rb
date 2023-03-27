class AddUserToBuilding < ActiveRecord::Migration[7.0]
  def change
    add_reference :buildings, :user, null: true, foreign_key: true
  end
end
