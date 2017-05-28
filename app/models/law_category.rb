class LawCategory < ActiveRecord::Base
   has_one :article
   has_many :attorney_law_categories
   has_many :attorneys, through: :attorney_law_categories
  # has_many :attorney_profiles, :through => :practice_areas
  #  def self.import(file)
  #   CSV.foreach(file.path, headers: true) do |row|
      
  #     law_category = LawCategory.find_by(:id => row["id"]) || LawCategory.new
  #     law_category.attributes = row.to_hash.slice("title")  
  #     law_category.save
  #   end 
  # end 
end
