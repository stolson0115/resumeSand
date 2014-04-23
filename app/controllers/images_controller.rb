class ImagesController < ApplicationController
	def index
		@images=Dir.glob("app/assets/images/*.jpg")		
	end
	def show
		path = "app/assets/images/#{params[:id]}.jpg"
		send_file( path,
      :disposition => 'inline',
      :type => 'image/jpeg',
      :x_sendfile => true )
  	end

	def update
	end
end
