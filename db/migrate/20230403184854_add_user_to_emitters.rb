class AddUserToEmitters < ActiveRecord::Migration[7.0]
  def change
    add_reference :emitters, :user, null: true, foreign_key: true
    remove_column :emitters, :building_id, :integer
  end
end
