class AddAttorneyIdToLawyerProfiles < ActiveRecord::Migration
  def change
    add_column :lawyer_profiles, :attorney_id, :string
  end
end
