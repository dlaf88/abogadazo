class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.text :title
      t.string :author
      t.text :body

      t.timestamps
    end
  end
end
