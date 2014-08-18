class AddProviderToUser < ActiveRecord::Migration
  def change
    add_column :users, :facebook_token, :text
    add_column :users, :google_oauth2_token, :text
  end
end
