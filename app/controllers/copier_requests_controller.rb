class CopierRequestsController < ApplicationController
  before_action :logged_in_admin, only: [:index, :delete]
  
  def new
    if (params[:copier_id].present?)
        @request = create_request_from_copier(Copier.find_by(id: params[:copier_id]))
        
      end
    #@request = CopierRequest.new
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
    # def copier_request_params
    #   params.require(:copier_request).permit(:user_name, :user_phone, :req_name, :req_oem, :req_marketer, :req_pc_embedded, :req_embedded_platform,
    #                                         :req_pc_int_scanning, :req_pc_dependency, :req_pc_dependency_detail, :req_general_notes, 
    #                                         :req_aka, :req_intro_date, :req_disc_date, :req_print, :req_scan, :req_copy, :req_fax, :req_card_reader_support,
    #                                         :req_vending_connector, :req_vending_connector_oem, :req_vending_connector_ex, :req_vending_connector_cpad,
    #                                         :req_card_reader_mode, :req_card_reader_types)
    # end
    
  def copier_request_params  
    params.require(:copier_request).permit(:user_name, :user_phone, :req_name, :req_oem, :req_marketer, :req_embedded_platform, :req_general_notes, :req_aka, :req_intro_date, :req_disc_date,
                     :req_print, :req_copy, :req_scan, :req_fax, :req_card_reader_support, :req_oem_vending_harness_01, :req_acdi_vending_harness_01,
                     :req_pcb_details_01, :req_acdi_vending_harness_02, :req_oem_vending_harness_02, :req_pcb_details_02, :req_name_details, :req_model_type, :req_manufacturing_status,
                     :req_print_speed, :req_supported_name, :req_supported_notes_01, :req_supported_notes_02, :req_supported_status)
  end
end
