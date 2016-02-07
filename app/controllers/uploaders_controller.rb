class UploadersController < ApplicationController
 def index
      @uploaders = uploader.all
   end
   
   def new
      @uploader = uploader.new
   end
   
   def create
      @uploader = uploader.new(uploader_params)
      
      if @uploader.save
         redirect_to uploaders_path, notice: "The uploader #{@uploader.name} has been uploaded."
      else
         render "new"
      end
      
   end
   
   def destroy
      @uploader = uploader.find(params[:id])
      @uploader.destroy
      redirect_to uploaders_path, notice:  "The uploader #{@uploader.name} has been deleted."
   end
   
   private
      def uploader_params
      params.require(:uploader).permit(:name, :attachment)
   end
   
end