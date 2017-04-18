module SearchService
  def basic_search(search)
    if search[:text_search].present?
      search_words = search[:text_search].split(' ')
      
      
      
      # split non_numeric words into array and find numeric for name search
      non_numeric_words = []

      for word in search_words do
        if !(word =~ /\d/)
          non_numeric_words.append(word)
        else
          numeric_word = word
        end
      end
      
      
      
      # check if non_numerics match a manufacturer
      # if so, set manu to manufacturer and filter after name search
      for word in non_numeric_words do
        manu_result = Oem.where("lower(name) = ?", ("#{word}").downcase)
        if !(manu_result.empty?)
          manu = manu_result.first.name
          non_numeric_words.delete(manu)
          break
        end
      end
      
      
      
      # first check for numerics in copier name
      if numeric_word
        result = Copier.where("lower(name) LIKE ?", ("%#{numeric_word}%").downcase)
      end
      

        
      
      
      # FIX: search to include non-numerics other than manufacturer
      
      # then check for other word matches in result or from copiers if no result
      # for word in non_numeric_words
      #   if defined? result and !result.empty?
      #     result = result.where("lower(name) LIKE ?", ("#{word}").downcase)
      #   else
      #     result = Copier.where("lower(name) LIKE ?", ("#{word}").downcase)
      #   end
      # end
      
    end
    
    
    # if manu is set filter by manufacturer
    if manu
      if result
        result = result.where("lower(oem) = ? ", ("#{manu}").downcase)
      else
        result = Copier.where("lower(oem) = ? ", ("#{manu}").downcase)
      end
    end

    # # return all if no result
    if result.nil?
      return nil
    end
      
    # result = add_search_filters result, search
    
    return result.order(name: "asc")
  
  end
  
  def add_search_filters(result, search)
    result = result.where("oem LIKE ?", "%#{search[:oem]}%") if search[:oem].present?
    # result = result.where(pc_embedded: search[:pc_embedded]) if search[:pc_embedded].present?
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