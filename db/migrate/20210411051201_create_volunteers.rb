class CreateVolunteers < ActiveRecord::Migration[6.1]
  def change
    create_table :volunteers do |t|
      t.string :email
      t.string :password_digest
      t.string :name
      t.string :language

      t.timestamps
    end
  end
end
