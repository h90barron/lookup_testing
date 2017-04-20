class CopiersController < ApplicationController
  respond_to :json
  before_action :logged_in_admin, only: [:new, :create, :edit, :destroy]
  #before_action :check_for_mobile, only: [:show]
  
  def new
    @copier = Copier.new
  end
  
  def create
    @copier = Copier.new copier_params
    if @copier.save
      flash[:notice] = "Copier successfully created!"
      redirect_to @copier
    else
      flash[:notice] = "Copier not successfully created. Please check required fields."
      redirect_to action: "new"
    end
  end
  
  def show
    @copier = Copier.find_by(id: params[:id])
    @test = Oem.find_by(name: @copier.oem)
    @matrix = MatrixMfd.where("LOWER(oem) LIKE ?", "%#{@copier.oem.downcase}%")
    # @matrix = MatrixMfd.exists?(:oem => "#%{@copier.oem.downcase}%")
    respond_to do |format|
      format.html
      format.pdf do
        render :pdf => "file_name",
               :template => "copiers/show.pdf.erb"
      end
    end
  end
  
  def index
    # testing new search
    
    if params.has_key?(:copier_search)
      #@copier = Copier.search(params[:copier_search])
      @copier = basic_search(params[:copier_search])
      @search_text = params[:copier_search][:text_search]
      @copier = @copier.paginate(page: params[:page]) if !@copier.nil?
    else 
      # @copier = Copier.all
      @search_text = ""
    end
    
    # log_search params[:q]
    
  end
  
  def edit
    @copier = Copier.find_by(id: params[:id])
  end
  
  def update 
    @copier = Copier.find_by(id: params[:id])
    if @copier.update_attributes(copier_params)
      redirect_to @copier
      #raise
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
      params.require(:copier).permit(:name, :oem, :marketer, :embedded_platform, :general_notes, :aka, :intro_date, :disc_date,
                     :print, :copy, :scan, :fax, :card_reader_support, :oem_vending_harness_01, :old_db_id, :acdi_vending_harness_01,
                     :pcb_details_01, :acdi_vending_harness_02, :oem_vending_harness_02, :pcb_details_02, :name_details, :model_type, :manufacturing_status,
                     :print_speed, :supported_name, :supported_notes_01, :supported_notes_02, :supported_status)
    end
    
    # def logged_in_admin
    #   unless admin_logged_in?
    #     flash[:notice] = "Please log in as admin."
    #     redirect_to login_url
    #   end
    # end
  
end


