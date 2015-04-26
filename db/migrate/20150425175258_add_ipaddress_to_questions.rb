class AddIpaddressToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :ipaddress, :string
  end
end
