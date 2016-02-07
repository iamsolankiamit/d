class VersionController < ApplicationController
  def index
  	@dsn = Display.find(params[:id])
  	respond_to do |format|
  		format.json { render json: @dsn.version }
  	end
  end
end
