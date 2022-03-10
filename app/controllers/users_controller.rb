class UsersController < ApplicationController
    def index
       
    end

    def show
       @user = User.find(params[:id])
    end

    def followings_user
        @user = User.find(params[:id])
    end

    def followers_user
        @user = User.find(params[:id])
    end


end
