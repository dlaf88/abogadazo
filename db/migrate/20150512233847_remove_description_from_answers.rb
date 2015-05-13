class RemoveDescriptionFromAnswers < ActiveRecord::Migration
  def change
    remove_column :answers, :description, :string
  end
end
