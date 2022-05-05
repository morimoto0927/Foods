class UsersController < ApplicationController
    before_action :set_q, only: [:index, :search]
    def index
       @users = User.all
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

    def search
        @results = @q.result
    end

    private
    
    def set_q
        @q = User.ransack(params[:q])
    end


end
