class AddUidAndProviderToVictims < ActiveRecord::Migration[6.1]
  def change
    add_column :victims, :uid, :string
    add_column :victims, :provider, :string
  end
end
