class AddUidAndProviderToVolunteers < ActiveRecord::Migration[6.1]
  def change
    add_column :volunteers, :uid, :string
    add_column :volunteers, :provider, :string
  end
end
