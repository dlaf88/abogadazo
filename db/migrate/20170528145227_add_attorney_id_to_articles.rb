class AddAttorneyIdToArticles < ActiveRecord::Migration[5.0]
  def change
    add_column :articles, :attorney_id, :integer, index: true
  end
end
