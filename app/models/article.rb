class Article < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  mount_uploader :image_body_field, RegImageUploader
end
