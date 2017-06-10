class Article < ActiveRecord::Base
  belongs_to :law_category
  belongs_to :attorney

  mount_uploader :image, RegImageUploader
  mount_uploader :image_body_field, RegImageUploader
  acts_as_taggable
  extend FriendlyId

  before_save :update_raw_body

  friendly_id :title, use: [:slugged,:history]

  #before_save :raw_body_save 


  #image_body_field is the main image for each article - this was bad name but had to be left due to hassle of changing all pictures in production application.
  
  def old_param
  	"#{self.id}-#{self.title}".parameterize
  end 

  

  private 

  def update_raw_body
    self.raw_body = ActionController::Base.helpers.strip_tags(self.body)
  end 

   def self.search(terms = "")
    sanitized = sanitize_sql_array(["to_tsquery('pg_catalog.spanish', unaccent(?))", terms.gsub(/\s/,"+")])
    Article.where("tsv_search @@ #{sanitized}")
  end

end

