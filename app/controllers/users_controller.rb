class UsersController < ApplicationController
    def index
        @users = User.all
    end

     def show
        @user = User.find(params[:id])
    end
    
    def new 
        @user = User.new 
    end 

     def create
        @user = User.create(users_params) 
        redirect_to user_path(@user)
    end 

    def edit 
        @user = User.find(params[:id]) 
    end 

    def update 
        @user = User.find(params[:id])
        @user.update(users_params)

        redirect_to users_path
    end 


    private
    def users_params
        params.require(:user).permit(:f_name,:l_name,:address,:bio,:occupation,:age)
    end 

end
