class AddLawyerToAnswers < ActiveRecord::Migration
  def change
    add_reference :answers, :lawyer, index: true
  end
end
