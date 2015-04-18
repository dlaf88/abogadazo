class RemovePhoneFromQuestions < ActiveRecord::Migration
  def change
    remove_column :questions, :phone, :integer
  end
end
