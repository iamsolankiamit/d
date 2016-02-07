class PlaylistsController < ApplicationController

  def index
    @playlists = Playlists.all 
    respond_to do |format|
      format.json { render json: @playlists}
    end
  end

  private

    def playlist_params
      params.require(:playlist).permit(:name)
    end
end

