class DesignsController < ApplicationController
 skip_before_action :verify_authenticity_token
	def show
		@design = Design.find(params[:id])
		if @design.layout_type == "a"
			render layout: "a"
		end
	end

   def update
    @design = Design.find(params[:id])
    respond_to do |format|
      if @design.update(design_params)
        format.html { redirect_to @design, notice: 'design was successfully updated.' }
        format.json { render :show, status: :ok, location: @design }
        format.js   { render "updated" }
      else
        format.html { render :edit }
        format.json { render json: @design.errors, status: :unprocessable_entity }
      end
    end
  end

	def create
    @playlist = Playlist.find(params["playlist_id"])
		@design = Design.new(design_params)
		respond_to do |format|
      if @design.save
        @playlist.design_id = @design.id
        @playlist.save
      	format.html { redirect_to @design}
        format.json { render :show, status: :created, location: @design }
        format.js {render "created"}
      else
        format.html { render :new }
        format.json { render json: @design.errors, status: :unprocessable_entity }
      end
    end
	end
  
  private

    def design_params
      params.require(:design).permit(:slider,:layout_type, :name, :ticker, :ticker_text, photos_attributes: [:id, :title, :image, :_destroy])
    end
end

