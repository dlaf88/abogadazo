class AttorneyProfile < ActiveRecord::Base
  has_many :practice_areas
  has_many :law_categories, :through => :practice_areas
  geocoded_by :firm_address
  after_validation :geocode, if: ->(obj){ obj.firm_address_changed? }
  searchkick locations: ["location"]
  
   def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      
      attorney_profile = AttorneyProfile.find_by(:id => row["id"]) || AttorneyProfile.new
      attorney_profile.attributes = row.to_hash.slice("first_name", "middle_name", "last_name", "suffix", "firm_name", "firm_address", "office_phone", "licensed_since")  
      attorney_profile.save
    end 
  end 
  
  def search_data
    attributes.merge location: [latitude,longitude],
    law_categories: law_categories.map(&:title)
  end
  
end
