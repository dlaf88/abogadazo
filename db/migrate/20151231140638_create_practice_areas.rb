class CreatePracticeAreas < ActiveRecord::Migration
  def change
    create_table :practice_areas do |t|
      t.belongs_to :attorney_profile, index: true
      t.belongs_to :law_category, index: true

      t.timestamps null: false
    end
  end
end
