require 'rails_helper'

RSpec.describe 'ユーザー登録についてのテスト', type: :system do
  before do
    visit new_user_registration_path
  end

  context '有効なユーザー登録である場合' do
    before do
      expect do
        fill_in 'user[username]', with: 'testuser'
        fill_in 'user[email]', with: 'test12@gmail.com'
        fill_in 'user[password]', with: 'test12345'
        fill_in 'user[password_confirmation]', with: 'test12345'
        click_button '新規登録'
      end.to change(User, :count).by(1)
    end

    it 'ユーザー詳細画面にリダイレクトされること' do
      expect(current_path).to eq user_path(id: 1)
    end
  end

  context '無効なユーザ登録である場合' do
    before do
      fill_in 'user[username]', with: ''
      fill_in 'user[email]', with: ''
      fill_in 'user[password]', with: 'test12345'
      fill_in 'user[password_confirmation]', with: 'test12345'
      click_button '新規登録'
    end

    it 'ルートにリダイレクトされないこと' do
      expect(current_path).to_not eq user_path(id: 1)
    end
  end
end