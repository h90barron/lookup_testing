module SessionsHelper
  def login(user)
    session[:user_id] = user.id
  end
  
  def current_user
    @current_user || User.find_by(id: session[:user_id])
  end
  
  def admin_logged_in?
    !current_user.nil?
  end
  
  def logout
    session.delete(:user_id)
    @current_user = nil
  end
  
  def logged_in_admin
    unless admin_logged_in?
      flash[:notice] = "Please log in as admin."
      redirect_to login_url
    end
  end
  
end
