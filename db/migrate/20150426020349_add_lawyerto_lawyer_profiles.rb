class AddLawyertoLawyerProfiles < ActiveRecord::Migration
  def change
    add_reference :lawyer_profiles, :lawyer, index: true
  end
end
