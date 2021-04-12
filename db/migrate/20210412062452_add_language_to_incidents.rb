class AddLanguageToIncidents < ActiveRecord::Migration[6.1]
  def change
    add_column :incidents, :language, :string
  end
end
