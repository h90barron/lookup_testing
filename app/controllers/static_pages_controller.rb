class StaticPagesController < ApplicationController
  skip_before_action :check_access
  def front_door
  end
  
  def grant_access
    if params[:access][:passcode] == "acdi321"
      allow_access
      redirect_to root_url
    else 
      flash[:notice] = "Invalid passcode"
      redirect_to static_pages_front_door_url
    end
  end
end
