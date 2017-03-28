class ImportsController < ApplicationController
  def new
  end
  
  def create
    begin
      Copier.import(params[:file])
    rescue ActiveRecord::UnknownAttributeError
      flash[:notice] = "Incorrect field names in file, please check reference"
    end
    #catch ActiveRecord::ActiveRecordError

    render 'new'
  end
end
