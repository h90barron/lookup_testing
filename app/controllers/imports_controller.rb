class ImportsController < ApplicationController
  def new
  end
  
  def create
    Copier.import(params[:file])
    # begin
    #   Copier.import(params[:file])
    # rescue ActiveRecord::UnknownAttributeError
    #   flash[:notice] = "Incorrect field names in file, please check reference"
    # end
    #catch ActiveRecord::ActiveRecordError

    render 'new'
  end
  
  def export
    @copiers = Copier.all
    respond_to do |format|
      format.csv { send_data @copiers.export, :filename => "CoperList.csv" }
    end
  end
end
