class Article < ActiveRecord::Base
  belongs_to :law_category
  belongs_to :attorney
  mount_uploader :image, RegImageUploader
  mount_uploader :image_body_field, RegImageUploader
  acts_as_taggable
  extend FriendlyId

  friendly_id :title, use: [:slugged,:history]




  #image_body_field is the main image for each article - this was bad name but had to be left due to hassle of changing all pictures in production application.
  
  def old_param
  	"#{self.id}-#{self.title}".parameterize
  end 
end

