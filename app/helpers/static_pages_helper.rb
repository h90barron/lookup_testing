module StaticPagesHelper
  def allow_access
    session[:access_token] = true
  end
  
  def has_access?
    return session[:access_token]
  end
  
  def check_access
    if !has_access?
      redirect_to static_pages_front_door_url
    end
  end
    
end
