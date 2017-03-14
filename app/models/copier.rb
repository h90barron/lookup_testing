class Copier < ActiveRecord::Base
  validates :name, uniqueness: true
  
  
  # def self.sort_copier_count
  #   if result.exists?
  #     return result.where(:oem => "Samsung").count
  #   end
  # end
  
  def self.search(search)
      arr = search[:text_search].split(' ')
      if arr.length == 2
        result = where("name LIKE ?", "%#{arr[0]}%")
        result = result.where("name LIKE ?", "%#{arr[1]}%")
        result = result.where("oem LIKE ?", "%#{ search[:oem_cont]}%") if search[:oem_cont].present?
      else 
        result = where("name LIKE ?", "%#{arr[0]}%" )
        result = result.where("oem LIKE ?", "%#{ search[:oem_cont]}%") if search[:oem_cont].present?
      end
      # and_query_bldr = "(name LIKE ?" 
      # if arr.length > 1
        
      # result = where("name LIKE ?", "%#{search[:text_search]}%")
      
      if result.empty?
          result = where("oem LIKE ?", "%#{search}%")
      end
      return result.order(name: "desc")
      #where("manufacturer LIKE ?", "%#{search}%")
  end
end
