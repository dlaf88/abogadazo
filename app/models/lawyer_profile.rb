class LawyerProfile < ActiveRecord::Base
  
  belongs_to :attorney
  
  mount_uploader :image, ImageUploader
  geocoded_by :address
  after_validation :geocode
end
