class UsersController < ApplicationController

    def index
        debugger
        users = User.all 
        debugger
        render json: users
    end 
    

    def show 
        received_id = params[:id]
        user = User.find_by(id: received_id)
        render json:user
    end 

    def create
        user = User.new(user_params)
        if user.save
            render json: user
        else
            render json: user.errors.full_messages, status: 422 
        end
    end 

    def update
        user = User.find(params[:id])
        redirect_to user_url if user.update(user_params)
    end 


    private 
    def user_params 
        params.require(:user).permit(:username, :email, :age, :name)
    end


end
