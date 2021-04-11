class CreateVictims < ActiveRecord::Migration[6.1]
  def change
    create_table :victims do |t|
      t.string :email
      t.string :password_digest
      t.string :name
      t.string :language
      t.string :preferred_contact_method
      t.string :contact_info
      t.string :contact_status

      t.timestamps
    end
  end
end
