class LawyerProfile < ActiveRecord::Base
  belongs_to :lawyer
  validates_uniqueness_of :lawyer_id
  mount_uploader :image, ImageUploader
end
