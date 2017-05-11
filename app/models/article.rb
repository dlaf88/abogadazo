class Article < ActiveRecord::Base
  belongs_to :law_category
  mount_uploader :image, RegImageUploader
  mount_uploader :image_body_field, RegImageUploader
  acts_as_taggable



  #image_body_field is the main image for each article - this was bad name but had to be left due to hassle of changing all pictures in production application.
  def to_param
    "#{id} #{title}".parameterize
  end 
end

