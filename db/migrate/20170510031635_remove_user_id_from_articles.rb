class RemoveUserIdFromArticles < ActiveRecord::Migration[5.0]
  def change
    remove_column :articles, :user_id, :integer
    remove_column :articles, :video, :boolean
    remove_column :articles, :image_body_boo, :boolean
  end
end
