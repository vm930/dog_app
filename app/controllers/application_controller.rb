class ApplicationController < ActionController::Base
  before_action :authorized #lock down this whole app
  helper_method :current_user #i can call current_user from a view

  def current_user
    # User.find would throw an error if we cannot find the user
    if session[:user_id]
      User.find_by({ id: session[:user_id] })
    else 
      Dog.find_by({ id: session[:dog_id] })
    end
  end

  def logged_in?
    # nil is falsey in ruby
    # a user instance is truthy
    !!current_user
  end

  def authorized
    redirect_to login_path unless logged_in?
  end

  def welcome
  end

  def get_started
  end

end
