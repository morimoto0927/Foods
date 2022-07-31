require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'バリデーションについての検証' do
    before do
      @user = FactoryBot.create(:user)
    end

    it 'ユーザー、メールアドレス、パスワードが有効であること' do
      expect(@user).to be_valid
    end

    context 'ユーザー名を検証する場合' do
      it 'ユーザー名がなければ無効であること' do
        @user.username = nil
        @user.valid?
        expect(@user.errors[:username]).to include('を入力してください')
      end

      it '同じユーザー名は無効であること' do
        @other = User.new(
          username: 'testuser',
          email: 'test@example.com',
          password: 'test12345',
          password_confirmation: 'test12345'
        )
        @other.valid?
        expect(@other.valid?).to eq(false)
      end
    end

    context 'メールアドレスを検証する場合' do
      it 'メールアドレスがなければ無効であること' do
        @user.email = nil
        @user.valid?
        expect(@user.errors[:email]).to include('を入力してください')
      end

      it 'メールアドレスに@が含まれていないなら無効であること' do
        @user.email = 'testemail.com'
        @user.valid?
        expect(@user.errors[:email]).to include('は不正な値です')
      end

      it 'メールアドレスが保存される前に小文字に変換されること' do
        @user.email = 'TEST@example.com'
        @user.valid?
        expect(@user.email).to eq 'test@example.com'
      end

      it 'メールアドレスが重複していると登録できないこと' do
        @other = User.new(
          username: 'testuser2',
          email: 'test@example.com',
          password: 'test12345',
          password_confirmation: 'test12345'
        )
        @other.valid?
        expect(@other.valid?).to eq(false)
      end
    end

    context 'パスワードについての検証' do
      it 'パスワードがなければ無効であること' do
        @user.password = nil
        @user.valid?
        expect(@user.errors).to be_added(:password, :blank)
      end

      it 'パスワードが6文字未満なら無効であること' do
        @user.password = @user.password_confirmation = 'a' * 5
        @user.valid?
        expect(@user.errors).to be_added(:password, :too_short, count: 6)
      end

      it 'パスワードが6文字以上なら有効であること' do
        @user.password = @user.password_confirmation = 'a' * 6
        @user.valid?
        expect(@user).to be_valid
      end

      it 'パスワードと確認用パスワードが一致していないと無効であること' do
        @user.password = 'password'
        @user.password_confirmation = 'password1'
        @user.valid?
        expect(@user.errors[:password_confirmation]).to include('とパスワードの入力が一致しません')
      end
    end
  end

  describe 'アカウントを削除すると関連するものも削除されることの検証' do
    it 'アカウントを削除するとユーザーの投稿も削除されること' do
      user1 = FactoryBot.create(:user)
      post = FactoryBot.create(:post, user: user1)
      expect{ user1.destroy }.to change(Post, :count).by(-1)
    end

    it 'アカウントを削除するとフォロー中のユーザーとの関係が削除されることの検証' do
      user1 = FactoryBot.create(:user)
      follower_user = FactoryBot.create(:user, username: 'testuser2', email: 'test2@example.com')
      follower_user.follow(user1)
      expect { user1.destroy }.to change(follower_user.followings, :count).by(-1)
    end

    it 'アカウントを削除するとフォロワーとの関係も削除されること' do
      user1 = FactoryBot.create(:user)
      follower_user = FactoryBot.create(:user, username: 'testuser3', email: 'test3@example.com')
      follower_user.follow(user1)
      expect { user1.destroy }.to change(follower_user.followings, :count).by(-1)
    end
  end
end
