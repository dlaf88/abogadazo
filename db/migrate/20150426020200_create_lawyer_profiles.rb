class CreateLawyerProfiles < ActiveRecord::Migration
  def change
    create_table :lawyer_profiles do |t|
      t.text :name
      t.string :address
      t.text :state
      t.text :body
      t.text :practices
      t.text :license
      t.string :phone

      t.timestamps
    end
  end
end
