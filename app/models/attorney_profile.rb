class AttorneyProfile < ActiveRecord::Base
  geocoded_by :firm_address
  after_validation :geocode, if: ->(obj){ obj.firm_address_changed? }
  searchkick locations: ["location"]
   def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      AttorneyProfile.create row.to_hash
    end 
  end 
  def search_data
    attributes.merge location: [latitude,longitude]
  end
  
end
