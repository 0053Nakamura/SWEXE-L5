class UsersController < ApplicationController
    def index
        @users = User.all
        @tweets = Tweet.all
    end
    
    def new
        @user = User.new
    end
    
    def create
        name = params[:user][:uid]
        @user = User.new(
            uid: name, 
            password: params[:user][:password],
            password_confirmation: params[:user][:password_confirmation])
        if @user.save
            redirect_to root_path
        else
            render new_path
        end
    end
    
    def destroy
        user = User.find(params[:id])
        user.destroy
        redirect_to root_path
    end
end
