class UsersController < ApplicationController
  before_action :set_q, only: [:index, :search]
  before_action :set_user, only: [:followings_user, :followers_user, :show, :favorites]

  def index; end

  def show
    @posts = @user.posts.page(params[:page]).per(10).order('updated_at DESC')
    favorites = Favorite.where(user_id: current_user.id).pluck(:post_id)
    @favorite_list = Post.find(favorites)
  end

  def followings_user; end

  def followers_user; end

  def search
    @results = @q.result
  end

  private
    def set_q
      @q = User.ransack(params[:q])
    end

    def set_user
      @user = User.find(params[:id])
    end
end
