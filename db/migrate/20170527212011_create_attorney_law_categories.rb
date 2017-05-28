class CreateAttorneyLawCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :attorney_law_categories do |t|
      t.belongs_to :attorney, index: true
      t.belongs_to :law_category, index: true      
      t.timestamps
    end
  end
end
