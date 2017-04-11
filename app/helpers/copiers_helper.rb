module CopiersHelper
  def log_search(input_params)
    begin
      f = File.open("search_log.txt", "a")
      f.write(input_params.to_s + "\n")
      f.close
    rescue
    end
  end
  
end
