class CreateAttorneys < ActiveRecord::Migration[5.0]
  def change
    create_table :attorneys do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :phone_number
      t.string :contact_email
      t.string :profile_photo

      t.timestamps
    end
  end
end
