class Copier < ActiveRecord::Base
  validates :name, uniqueness: true
  
  
  # def self.sort_copier_count
  #   if result.exists?
  #     return result.where(:oem => "Samsung").count
  #   end
  # end
end
