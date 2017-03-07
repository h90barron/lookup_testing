class CopierRequestsController < ApplicationController
  before_action :logged_in_admin, only: [:index, :delete]
  
  def new
    @request = Request.new
  end
  
  def create
    @request = Request.new request_params
    if @request.save
      flash[:notice] = "Request submitted successfully"
    else
      flash[:notice] = "Request failed to submit"
    end
    redirect_to '/copiers'
  end
  
  def index
    @requests = Request.all
  end
  
  def show
    @request = Request.find_by(id: params[:id])
  end
  
  def edit
    @request = Request.find_by(id: params[:id])
  end
  
  def update
    @req = Request.find_by(id: params[:id])
    if @req.update_attributes(request_params)
      flash[:notice] = "Successfully edited and created!"
      redirect_to @req
    else
      flash[:notice] = "Unsuccessful edit...."
    end
  end
  
  def destroy
    @request = Request.find_by(id: params[:id])
    @request.delete
    redirect_to action: :index
  end
  
  def accept
    # @req = Request.find_by(id: params[:id])
    req = Request.find_by(id: params[:id])
    if create_copier_from_request req
      flash[:notice] = "Successful creation!"
      req.delete
      redirect_to action: :index
    else
      flash[:notice] = "Unsuccessful..."
    end
  end
  
  private
    def request_params
      params.require(:request).permit(:user_name, :user_phone, :req_name, :req_oem, :req_marketer, :req_pc_embedded, :req_embedded_platform,
                     :req_pc_int_scanning, :req_pc_dependency, :req_pc_dependency_detail, :req_general_notes, 
                     :req_aka, :req_intro_date, :req_disc_date, :req_print, :req_scan, :req_copy, :req_fax)
    end
end
