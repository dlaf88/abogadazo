class AddLatitudeAndLongitudeToAttorneyProfiles < ActiveRecord::Migration
  def change
    add_column :attorney_profiles, :latitude, :float
    add_column :attorney_profiles, :longitude, :float
  end
end
