class AddImageToLawyerProfiles < ActiveRecord::Migration
  def change
    add_column :lawyer_profiles, :image, :string
  end
end
