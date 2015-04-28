class AddVideoFieldToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :video_field, :string
  end
end
