class MatrixMfdsController < ApplicationController
  def show
    @matrix = MatrixMfd.find_by(id: params[:matrix])
  end
end
