require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @post = FactoryBot.create(:post, user: @user)
  end

  it 'タイトルと住所とメニューと価格と本文が有効であること' do
    expect(@post).to be_valid
  end

  describe '投稿のバリデーションについて' do
    it 'タイトルがなければ無効であること' do
      @post.title = nil
      @post.valid?
      expect(@post.errors[:title]).to include('を入力してください')
    end

    it 'タイトルが50文字以上であるなら無効であること' do
      @post.title = 'a' * 51
      @post.valid?
      expect(@post.errors).to be_added(:title, :too_long, count: 50)
    end

    it 'タイトルが50文字以内であるなら有効であること' do
      @post.title = 'a' * 50
      expect(@post).to be_valid
    end

    it '住所がなければ無効であること' do
      @post.address = nil
      @post.valid?
      expect(@post.errors[:address]).to include('を入力してください')
    end

    it '住所が100文字以上であるなら無効であること' do
      @post.address = 'a' * 101
      @post.valid?
      expect(@post.errors).to be_added(:address, :too_long, count: 100)
    end

    it '住所が100文字以内であるなら有効であること' do
      @post.address = 'a' * 100
      expect(@post).to be_valid
    end

    it 'メニューがなければ無効であること' do
      @post.menu = nil
      @post.valid?
      expect(@post.errors[:menu]).to include('を入力してください')
    end

    it 'メニューが50文字以上であるなら無効であること' do
      @post.menu = 'a' * 51
      @post.valid?
      expect(@post.errors).to be_added(:menu, :too_long, count: 50)
    end

    it 'メニューが50文字以内であるなら有効であること' do
      @post.menu = 'a' * 50
      expect(@post).to be_valid
    end

    it '本文がなければ無効であること' do
      @post.body = nil
      @post.valid?
      expect(@post.errors[:body]).to include('を入力してください')
    end

    it '本文が1000文字以上であるなら無効であること' do
      @post.body = 'a' * 1001
      @post.valid?
      expect(@post.errors).to be_added(:body, :too_long, count: 1000)
    end

    it '本文が1000文字以内であるなら有効であること' do
      @post.body = 'a' * 1000
      expect(@post).to be_valid
    end

    it '価格が50文字以上であるなら無効であること' do
      @post.price = 'a' * 51
      @post.valid?
      expect(@post.errors).to be_added(:price, :too_long, count: 50)
    end

    it '価格が50文字以内であるなら有効であること' do
      @post.price = 'a' * 50
      expect(@post).to be_valid
    end

    it '投稿にuser_idがなければ無効であること' do
      @post = Post.create(user_id: nil)
      @post.valid?
      expect(@post.errors[:title]).to include('を入力してください')
    end
  end
end
