class AddVoiceToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :voice, :string
  end
end
