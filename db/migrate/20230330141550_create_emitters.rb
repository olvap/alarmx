class CreateEmitters < ActiveRecord::Migration[7.0]
  def change
    create_table :emitters do |t|
      t.references :building, null: false, foreign_key: true
      t.string :name
      t.string :token

      t.timestamps
    end
  end
end
