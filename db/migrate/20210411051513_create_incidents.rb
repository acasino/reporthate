class CreateIncidents < ActiveRecord::Migration[6.1]
  def change
    create_table :incidents do |t|
      t.text :description
      t.string :location
      t.datetime :time_occurred
      t.belongs_to :victim, null: false, foreign_key: true
      t.integer :volunteer_id
      t.boolean :request_translator
      t.string :contact_status

      t.timestamps
    end
  end
end
