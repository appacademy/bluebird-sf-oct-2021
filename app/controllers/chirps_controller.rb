class ChirpsController < ApplicationController
	before_action :require_logged_in, only: [:new, :create]

    def index
		if params[:user_id]
			@chirps = Chirp.where(author_id: params[:user_id]).includes(:author)
		else
			@chirps = Chirp.all.includes(:author)
		end

		render :index
    end 

    def create  
		@chirp = Chirp.new(chirp_params)
		@chirp.author_id = current_user.id
		
		if @chirp.save
			redirect_to chirp_url(@chirp)
		else
			flash.now[:errors] = @chirp.errors.full_messages
			render :new, status: 422
		end
    end 

    def show
		@chirp = Chirp.find(params[:id])
		render :show
    end

    def new
		@chirp = Chirp.new
		render :new
    end

	def destroy
        @chirp = Chirp.find(params[:id])
        @chirp.destroy
        redirect_to chirps_url
    end

    private
    def chirp_params
      	params.require(:chirp).permit(:body)
    end
end
