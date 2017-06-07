class AddRawBodyToArticles < ActiveRecord::Migration[5.0]
  def change
    add_column :articles, :raw_body, :text
  end
end
