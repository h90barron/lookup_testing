module SearchService
  def basic_search(search)
    if search[:text_search].present?
      search_words = search[:text_search].split(' ')
    
      result = Copier.where("name LIKE ?", "%#{search_words[0]}%")
      if search_words.length > 1
        for word in 1..(search_words.length - 1) do
          result = result.where("name LIKE ?", "%#{search_words[word]}%")
        end
      end
    end
    
    if result.nil?
      result = Copier.all
    end
      
    result = add_search_filters result, search
    
    return result.order(name: "asc")
  
  end
  
  def add_search_filters(result, search)
    result = result.where("oem LIKE ?", "%#{search[:oem]}%") if search[:oem].present?
    result = result.where(pc_embedded: search[:pc_embedded]) if search[:pc_embedded].present?
    return result
  end
  
  # def self.search(search)
  #     arr = search[:text_search].split(' ')
  #     if arr.length == 2
  #       result = where("name LIKE ?", "%#{arr[0]}%")
  #       result = result.where("name LIKE ?", "%#{arr[1]}%")
  #       result = result.where("oem LIKE ?", "%#{ search[:oem_cont]}%") if search[:oem_cont].present?
  #     else 
  #       result = where("name LIKE ?", "%#{arr[0]}%" )
  #       result = result.where("oem LIKE ?", "%#{ search[:oem_cont]}%") if search[:oem_cont].present?
  #     end
      
  #     if result.empty?
  #         result = where("oem LIKE ?", "%#{search}%")
  #     end
  #     return result.order(name: "desc")

  # end
end