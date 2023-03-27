class CreateApiCredentials < ActiveRecord::Migration[7.0]
  def change
    create_table :api_credentials do |t|
      t.string :key
      t.string :secret
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
