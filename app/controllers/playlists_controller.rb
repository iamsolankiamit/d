class PlaylistsController < ApplicationController

  def index
    @playlists = Playlists.all 
    respond_to do |format|
      format.json { render json: @playlists}
    end
  end

  def show
    @playlist = Playlist.find(params[:id])
    @design = Design.find(@playlist.design_id) if @playlist.design_id != nil
    @d = Design.new

    @design ||= @d

    # @design.photos
  end

  def update
    @playlist = Playlist.find(params[:id])
    respond_to do |format|
      if @playlist.update(playlist_params)
        format.html { redirect_to @playlist, notice: 'playlist was successfully updated.' }
        format.json { render :show, status: :ok, location: @playlist }
      else
        format.html { render :edit }
        format.json { render json: @playlist.errors, status: :unprocessable_entity }
      end
    end
  end

  def create
    @playlist = Playlist.new(playlist_params)
    respond_to do |format|
      if @playlist.save
        format.html {redirect_to @playlist}
        format.js {render "create"}
      end
    end
  end

  def destroy
    @playlist = Playlist.find(params[:id])
    @playlist.destroy
    respond_to do |format|
      format.html { redirect_to playlists_url, notice: 'playlist was successfully destroyed.' }
      format.json { head :no_content }
      format.js {render "destroy"}
    end
  end


  private

    def playlist_params
      params.require(:playlist).permit(:name)
    end
end

