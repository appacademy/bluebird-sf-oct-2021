class ChirpsController < ApplicationController

    def index 
        debugger
        if params[:user_id]
            chirps = Chirp.where(author_id: params[:user_id])
        else 
            chirps = Chirp.all
        end 
        render json: chirps
    end 

end
