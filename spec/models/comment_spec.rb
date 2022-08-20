require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'コメントのバリデーションについての検証' do
    before do
      @user = FactoryBot.create(:user)
      @post = FactoryBot.create(:post, user: @user)
      @comment = @user.comments.create(
        comment: 'Hello!',
        post: @post
      )
    end

    it 'コメントが有効であること' do
      expect(@comment).to be_valid
    end

    it 'コメントが空欄だと無効であること' do
      @comment.comment = nil
      @comment.valid?
      expect(@comment.errors).to be_added(:comment, :blank)
    end

    it 'コメントが501文字以上であるなら無効であること' do
      @comment.comment = 'a' * 501
      @comment.valid?
      expect(@comment.errors).to be_added(:comment, :too_long, count: 500)
    end

    it 'コメントが500文字であるなら有効であること' do
      @comment.comment = 'a' * 500
      expect(@comment).to be_valid
    end
  end 
end 