class VideosController < ApplicationController

  private

    def video_params
      params.require(:video).permit()
    end
end

