class HomeController < ApplicationController
  def index
  	@dsn = Display.last
  	@playlists= Playlist.all
  end
end
