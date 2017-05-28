class AddDescriptionToAttorneys < ActiveRecord::Migration[5.0]
  def change
    add_column :attorneys, :description, :text
  end
end
