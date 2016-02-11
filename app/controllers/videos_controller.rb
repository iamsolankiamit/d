class VideosController < ApplicationController
 skip_before_action :verify_authenticity_token
before_action :set_video, only: [:destroy]

	def create
		@video = Video.new(video_params)
		respond_to do |format|
			if @video.save
				format.html { render text: "hello"}
				format.js { render 'created.js'}
			end
		end
	end

	def destroy
    @video.destroy
    respond_to do |format|
      format.html { redirect_to groups_url, notice: 'Group was successfully destroyed.' }
      format.json { head :no_content }
      format.js { render "destroy.js"}
    end
  end

  private

  	def set_video
      @video = Video.find(params[:id])
    end

    def video_params
      params.require(:video).permit(:movie, :playlist_id)
    end
end

