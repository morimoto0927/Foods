class PostsController < ApplicationController
    before_action :authenticate_user!, only: [:show, :create]
    def index
        @posts = Post.all
    end

    def show
        @post = Post.find(params[:id])
        @user = User.find_by(id: @post.user_id)
        @posts = Post.all
        @comments = @post.comments.includes(:user).all
        @comment = @post.comments.build(user_id: current_user.id) if current_user
    end

    def new 
        @post = Post.new
    end

    def create
        @post = Post.new(post_params)
        @post.user_id = current_user.id
        @post.save
        redirect_to '/posts/new'
    end

    def edit
        @post = Post.find(params[:id])
    end
    
    def update
        @post = Post.find(params[:id])
        if @post.update(post_params)
            redirect_to post_path(@post)
        else 
            render :new
        end
    end

    def destroy
        @post = Post.find(params[:id])
        @post.destroy
        redirect_to post_path(@post)
    end

    private
    def post_params
        params.require(:post).permit(:title, :address, :body)
    end
end
