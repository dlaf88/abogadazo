class AttorneyLawCategory < ApplicationRecord
	belongs_to :attorney
	belongs_to :law_category
end
