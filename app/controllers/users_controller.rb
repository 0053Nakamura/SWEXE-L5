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
        pass = BCrypt::Password.create(params[:user][:pass])
        @user = User.new(uid: name, pass: pass)
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
