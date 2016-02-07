class FilesController < ApplicationController
  def show
  	@dsn = Display.find(params[:id])
  	respond_to do |format|
  		format.json
  	end
  end

  def layout
  	
  end
end
