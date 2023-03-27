class AddTokenToCredentials < ActiveRecord::Migration[7.0]
  def change
    add_column :api_credentials, :token, :string
  end
end
