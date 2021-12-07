class UsersController < ApplicationController
  before_action :require_logged_out, only: [:new, :create]
  before_action :require_logged_in, only: [:index, :show, :edit, :update, :destroy]

    def index
        @users = User.my_all 
        # debugger
        render :index
    end 
    

    def show 
        received_id = params[:id]
        @user = User.find_by(id: received_id)
        render :show
    end 

    def new 
        @user = User.new
        render :new
    end

    def create
        @user = User.new(user_params)
        # debugger
        if @user.save
            # debugger
            login!(@user)
            redirect_to user_url(@user.id)
        else
            # need to handle errors when user is not successfully created
            flash.now[:errors] = @user.errors.full_messages
            render :new
        end
    end 

    def edit
        @user = User.find(params[:id])
        render :edit
    end

    def update
        user = User.find(params[:id])
        redirect_to user_url if user.update!(user_params)
    end 

    def destroy
        @user = User.find(params[:id])
        @user.destroy
        redirect_to users_url
    end

    private 
    def user_params 
        params.require(:user).permit(:username, :email, :age, :name, :password)
    end


end
