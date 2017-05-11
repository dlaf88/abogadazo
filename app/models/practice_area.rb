class PracticeArea < ActiveRecord::Base

  belongs_to :attorney_profile
  belongs_to :law_category
  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      
      practice_area = PracticeArea.find_by(:id => row["id"]) || PracticeArea.new
      practice_area.attributes = row.to_hash.slice("attorney_profile_id","law_category_id")  
      practice_area.save
    end 
  end 
end
