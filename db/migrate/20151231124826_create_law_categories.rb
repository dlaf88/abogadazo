class CreateLawCategories < ActiveRecord::Migration
  def change
    create_table :law_categories do |t|
      t.string :title

      t.timestamps null: false
    end
  end
end
