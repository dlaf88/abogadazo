class LawyerProfile < ActiveRecord::Base
  
  belongs_to :lawyer
  validates_uniqueness_of :lawyer_id
  mount_uploader :image, ImageUploader
  geocoded_by :address
  after_validation :geocode
end
