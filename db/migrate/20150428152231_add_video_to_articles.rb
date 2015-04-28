class AddVideoToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :video, :boolean, default: false
    
  end
end
