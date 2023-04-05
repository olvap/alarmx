class CreateScenes < ActiveRecord::Migration[7.0]
  def change
    create_table :scenes do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.references :notification_setting, null: false, foreign_key: true

      t.timestamps
    end
  end
end
