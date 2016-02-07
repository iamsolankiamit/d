class DesignsController < ApplicationController

	def show
		@design = Design.find(params[:id])
	end
  
  private

    def design_params
      params.require(:design).permit(:slider, :name)
    end
end

