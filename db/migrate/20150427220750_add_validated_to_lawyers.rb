class AddValidatedToLawyers < ActiveRecord::Migration
  def change
    add_column :lawyers, :validated, :boolean, default: false
    
  end
end
