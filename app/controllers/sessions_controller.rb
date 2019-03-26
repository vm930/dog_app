class SessionsController < ApplicationController

  def new
    render :new
  end

  def create
    @user = User.find_by(username: params[:username])
    @doguser = Dog.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
        redirect_to @user
    elsif @doguser && @doguser.authenticate(params[:password])
      session[:dog_id] = @doguser.id
        redirect_to @doguser
    else
      flash[:notice] = "Invalid Username or Password"
      redirect_to login_path
    end
  end

end
