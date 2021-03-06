class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :description
      t.string :text
      t.references :question, index: true

      t.timestamps
    end
  end
end
