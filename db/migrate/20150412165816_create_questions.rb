class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :title
      t.text :description
      t.integer :phone

      t.timestamps
    end
  end
end
