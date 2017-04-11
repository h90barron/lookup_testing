class OemsController < ApplicationController
  respond_to :json
  before_action :logged_in_admin, only: [:new, :create, :edit, :destroy]
  
  def new
    @oem = Oem.new
    @oems = Oem.all
  end
  
  def create
    @oem = Oem.new oem_params
    if @oem.save
      flash[:notice] = "Copier successfully created!"
      render 'new'
    else
      flash[:notice] = "Copier not successfully created"
      render 'new' 
    end
  end
  
  private
  
  def oem_params
    params.require(:oem).permit(:name)
  end
end