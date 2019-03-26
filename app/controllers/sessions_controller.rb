class SessionsController < ApplicationController

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
        redirect_to @user
    elsif @doguser && @doguser.authenticate(params[:password])
      session[:dog_id] = @doguser.id
        redirect_to @doguser
    else
      flash[:notice] = "Invalid Username or Password"
      redirect_to login_path
    end
  end

  def destroy
    session.delete(:user_id && :dog_id)
    # flash[:notice] = "Logged Out"
    redirect_to '/'
  end

end
