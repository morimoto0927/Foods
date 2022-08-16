class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      flash[:alert] = 'コメントを投稿しました'
    elsif @comment.comment.blank?
      flash[:alert] = 'コメントを入力してください'
    elsif @comment.comment * 501
      flash[:alert] = '500文字以内で入力してください'
    end
    redirect_to post_path(@post)
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = Comment.find_by(id: params[:id], post_id: params[:post_id])
    @comment.destroy
    redirect_to post_path(@post)
  end

  private
    def comment_params
      params.require(:comment).permit(:comment)
    end
end
