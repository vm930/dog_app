class UsersController < ApplicationController
  skip_before_action :authorized, only: [:index,:new,:create]
    def index
        @users = User.all
    end

    def new
        @user = User.new
    end

     def create
       user = User.create(user_params)
        if user.valid?
          redirect_to login_path
        else
          flash[:user_errors] = user.errors.full_messages
          redirect_to new_user_path
        end
     end

    def show
       @user = User.find(params[:id])
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
      @user = User.find(params[:id])
      @user.update(user_params)
      if @user.valid?
        redirect_to user_path(@user.id)
      else
        flash[:user_errors] = user.errors.full_messages
          redirect_to edit_user_path
      end
    end


    private
    def user_params
        params.require(:user).permit(:username, :password, :full_name, :bio, :occupation, :age, :location)
    end

end
