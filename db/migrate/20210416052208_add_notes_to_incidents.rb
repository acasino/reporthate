class AddNotesToIncidents < ActiveRecord::Migration[6.1]
  def change
    add_column :incidents, :notes, :text
  end
end
