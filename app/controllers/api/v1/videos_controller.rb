class Api::V1::VideosController < ApplicationController

  def index
    @videos = Video.all 
    respond_to do |format|
      format.json { render json: @videos}
    end
  end

  private

    def playlist_params
      params.require(:playlist).permit(:name)
    end
end

