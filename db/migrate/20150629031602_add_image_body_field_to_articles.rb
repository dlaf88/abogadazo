class AddImageBodyFieldToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :image_body_field, :string
    add_column :articles, :image_body_boo, :boolean
  end
end
