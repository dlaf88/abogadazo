class AddDescriptionToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :description, :text
  end
end
