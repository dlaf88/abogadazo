class AddLongitudeToLawyerProfiles < ActiveRecord::Migration
  def change
    add_column :lawyer_profiles, :longitude, :float
    add_column :lawyer_profiles, :latitude, :float
  end
end
