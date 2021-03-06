class SessionsController < ApplicationController
  skip_before_action :authorized

  def new
    render :new
  end

  def create
    if params[:dog_or_user] == "User"
      @user = User.find_by(username: params[:username])
    else
      @doguser = Dog.find_by(username: params[:username])
    end

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      session[:dog_id] = nil
        redirect_to '/'
    elsif @doguser && @doguser.authenticate(params[:password])
      session[:dog_id] = @doguser.id
      session[:user_id] = nil
        redirect_to '/'
    else
      flash[:notice] = "Invalid Username or Password"
      redirect_to login_path
    end
  end

  def destroy
    session.delete(:user_id)
    session.delete(:dog_id)
    flash[:logout] = "Logged Out"
    redirect_to '/'
  end

end
