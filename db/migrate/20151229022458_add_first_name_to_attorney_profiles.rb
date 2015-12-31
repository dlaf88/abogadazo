class AddFirstNameToAttorneyProfiles < ActiveRecord::Migration
  def change
    add_column :attorney_profiles, :first_name, :string    
    add_column :attorney_profiles, :middle_name, :string
    add_column :attorney_profiles, :last_name, :string
    add_column :attorney_profiles, :suffix, :string
    add_column :attorney_profiles, :firm_name, :string
    add_column :attorney_profiles, :firm_address, :string
    add_column :attorney_profiles, :office_phone, :string
    add_column :attorney_profiles, :licensed_since, :string
  end
end
