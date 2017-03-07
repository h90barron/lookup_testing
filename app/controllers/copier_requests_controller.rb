class CopierRequestsController < ApplicationController
  before_action :logged_in_admin, only: [:index, :delete]
  
  def new
    @request = CopierRequest.new
  end
  
  def create
    @request = CopierRequest.new copier_request_params
    if @request.save
      flash[:notice] = "Request submitted successfully"
    else
      flash[:notice] = "Request failed to submit"
    end
    redirect_to '/copiers'
  end
  
  def index
    @requests = CopierRequest.all
  end
  
  def show
    @request = CopierRequest.find_by(id: params[:id])
  end
  
  def edit
    @request = CopierRequest.find_by(id: params[:id])
  end
  
  def update
    @req = CopierRequest.find_by(id: params[:id])
    if @req.update_attributes(copier_request_params)
      flash[:notice] = "Successfully edited and created!"
      redirect_to @req
    else
      flash[:notice] = "Unsuccessful edit...."
    end
  end
  
  def destroy
    @request = CopierRequest.find_by(id: params[:id])
    @request.delete
    redirect_to action: :index
  end
  
  def accept
    # @req = Request.find_by(id: params[:id])
    req = CopierRequest.find_by(id: params[:id])
    if create_copier_from_request req
      flash[:notice] = "Successful creation!"
      req.delete
      redirect_to action: :index
    else
      flash[:notice] = "Unsuccessful..."
    end
  end
  
  private
    def copier_request_params
      params.require(:coper_request).permit(:user_name, :user_phone, :req_name, :req_oem, :req_marketer, :req_pc_embedded, :req_embedded_platform,
                     :req_pc_int_scanning, :req_pc_dependency, :req_pc_dependency_detail, :req_general_notes, 
                     :req_aka, :req_intro_date, :req_disc_date, :req_print, :req_scan, :req_copy, :req_fax)
    end
end
