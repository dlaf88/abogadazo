class Firm < ApplicationRecord
	mount_uploader :logo, ImageUploader
	has_many :attorneys
end
