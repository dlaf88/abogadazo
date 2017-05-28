class Attorney < ApplicationRecord
	mount_uploader :profile_photo, ProfilePictureUploader
	belongs_to :firm
	has_many :attorney_law_categories
	has_one :article
	has_many :law_categories, through: :attorney_law_categories
	accepts_nested_attributes_for :attorney_law_categories, :law_categories



	def to_param
		"#{id} #{first_name}-#{last_name}".parameterize
	end 
	
end

