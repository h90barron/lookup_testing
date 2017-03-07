class SessionsController < ApplicationController
  
  def new
  end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      login user
      flash[:notice] = "Successful login"
    else
      flash[:notice] = "Failed Login"
    end
    redirect_to root_url
  end
  
  def destroy
    logout
    redirect_to root_url
  end
  
end
