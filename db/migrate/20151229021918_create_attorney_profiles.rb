class CreateAttorneyProfiles < ActiveRecord::Migration
  def change
    create_table :attorney_profiles do |t|

      t.timestamps null: false
    end
  end
end
