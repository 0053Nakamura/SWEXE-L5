class TweetsController < ApplicationController
    def index
        @tweets = Tweet.all
    end
    
    def new
        @tweet = Tweet.new
    end
    
    def create
        @tweet = Tweet.new(message: params[:tweet][:message])
        if @tweet.save
            redirect_to users_path
        else
            render new_path
        end
    end
    
    def destroy
        tweet = Tweet.find(params[:id])
        tweet.destroy
        redirect_to users_path
    end
end
