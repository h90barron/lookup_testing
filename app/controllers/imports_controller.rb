class ImportsController < ApplicationController
  def new_copier
  end
  
  def import_copiers
    Copier.import(params[:file])
    # begin
    #   Copier.import(params[:file])
    # rescue ActiveRecord::UnknownAttributeError
    #   flash[:notice] = "Incorrect field names in file, please check reference"
    # end
    #catch ActiveRecord::ActiveRecordError

    render 'new_copier'
  end
  
  def new_harness
  end
  
  def import_harnesses
    Harness.import(params[:file])
    
    render 'new_harness'
  end
  
  def new_vendor_harness
  end
  
  def import_vendor_harnesses
    VendorHarness.import(params[:file])
    
    render 'new_vendor_harness'
  end
  
  
  def new_oem
  end
  
  def import_oems
    Oem.import(params[:file])
    
    render 'new_oem'
  end
  
  
  def new_matrix_mfd
  end
  
  def import_matrix_mfds
    MatrixMfd.import(params[:file])
    
    render 'new_matrix_mfd'    
  end
  
  def export
    @copiers = Copier.all
    respond_to do |format|
      format.csv { send_data @copiers.export, :filename => "CoperList.csv" }
    end
  end
end
