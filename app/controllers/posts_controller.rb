class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:show, :create]
  before_action :set_q, only: [:index, :search]
  before_action :find_post, only: [:show, :edit, :update, :destroy]
  def index
    @posts = Post.order(created_at: :desc).page(params[:page]).per(10)
  end

  def show
    @user = User.find_by(id: @post.user_id)
    @comments = @post.comments.includes(:user).all
    @comment = @post.comments.build(user_id: current_user.id) if current_user
  end

  def new 
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to posts_path, notice: "投稿しました"
    else
      flash.now[:alert] = "入力必須項目が抜けています。"
      render :new
    end
  end

  def edit; end
    
  def update
    if @post.update(post_params)
      redirect_to post_path(@post), notice: '投稿内容を変更しました'
    else 
      flash.now[:alert] = '投稿内容を変更できませんでした'
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end

  def search
    @results = @q.result
  end

  private
    def post_params
      params.require(:post).permit(:title, :menu, :price, :address, :body, :image, :tag_list)
    end

    def set_q
      @q = Post.ransack(params[:q])
    end

    def find_post
      @post = Post.find(params[:id])
    end
end
