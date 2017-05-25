class Attorney < ApplicationRecord
	mount_uploader :profile_photo, ProfilePictureUploader



	def to_param
		"#{id} #{first_name}-#{last_name}".parameterize
	end 
	
end

