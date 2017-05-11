class AddLawCategoryToArticles < ActiveRecord::Migration[5.0]
  def change
    add_reference :articles, :law_category, foreign_key: true
  end
end
