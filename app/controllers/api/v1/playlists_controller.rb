class Api::V1::PlaylistsController < ApplicationController

  def index
    @playlists = Playlist.all 
    respond_to do |format|
      format.json { render json: @playlists}
    end
  end

  private

    def playlist_params
      params.require(:playlist).permit(:name)
    end
end

