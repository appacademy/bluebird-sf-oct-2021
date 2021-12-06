class SessionsController < ApplicationController

  before_action :require_logged_out, only: [:new, :create]
  before_action :require_logged_in, only: [:destroy]

  def new
    # debugger
  end 

  def create 
    # debugger
    @user = User.find_by_credentials(params[:user][:username], params[:user][:password])
    # debugger
    if @user
      login(@user)
      redirect_to user_url(@user)
    else
      render :new
    end
  end

  def destroy 
    logout! # changes to db should have a bang 
    redirect_to new_session_url
  end


end
