class RemoveKeyAndSecretFromCredentials < ActiveRecord::Migration[7.0]
  def change
    remove_column :api_credentials, :key, :string
    remove_column :api_credentials, :secret, :string
  end
end
