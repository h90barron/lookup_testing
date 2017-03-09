class CopiersController < ApplicationController
  respond_to :json
  before_action :logged_in_admin, only: [:new, :create, :edit, :destroy]
  
  def new
    @copier = Copier.new
  end
  
  def create
    @copier = Copier.new copier_params
    if @copier.save
      flash[:notice] = "Copier successfully created!"
      redirect_to @copier
    else
      flash[:notice] = "Copier not successfully created"
      redirect_to root_url
    end
  end
  
  def show
    @copier = Copier.find_by(id: params[:id])
  end
  
  def index
    @q = Copier.ransack(params[:q])
    @copier = @q.result
    log_search params[:q]
    
    #@search.build_condition
    
    # @q = Copier.search(params[:q])
    # @copier = @q.result
  end
  
  def edit
    @copier = Copier.find_by(id: params[:id])
  end
  
  def update 
    @copier = Copier.find_by(id: params[:id])
    if @copier.update_attributes(copier_params)
      redirect_to @copier
      flash[:notice] = "Successfully updated!"
    else
      render 'edit'
      flash[:notice] = "Unsuccessfully updated"
    end
  end
  
  def destroy
    copier = Copier.find_by(id: params[:id])
    copier.delete
    flash[:notice] = "Successfully deleted."
    redirect_to root_url
  end
  
  private
  
    def copier_params
      params.require(:copier).permit(:name, :oem, :marketer, :pc_embedded, :embedded_platform,
                     :pc_int_scanning, :pc_dependency, :pc_dependency_detail, :general_notes, 
                     :aka, :intro_date, :disc_date, :print, :scan, :copy, :fax, :card_reader_support,
                     :vending_connector, :vending_connector_oem, :vending_connector_ex, :vending_connector_cpad,
                     :card_reader_mode, :card_reader_types)
    end
    
    # def logged_in_admin
    #   unless admin_logged_in?
    #     flash[:notice] = "Please log in as admin."
    #     redirect_to login_url
    #   end
    # end
  
end


