require 'rails_helper'

RSpec.describe 'ログインに関するテスト', type: :system do
  before do
    visit new_user_session_path
  end

  context 'ログインが有効である場合' do
    before do
      user = FactoryBot.create(:user)
      fill_in 'user[login]' , with: user.login
      fill_in 'user[email]', with: user.email
      fill_in 'user[password]', with: user.password
      click_button 'ログイン'
    end

    it 'ユーザー詳細画面にリダイレクトされること' do
      expect(current_path).to eq user_path(id: 1)
    end
  end

  context 'ログインが無効である場合' do
    before do
      user = FactoryBot.create(:user) 
      fill_in "user[login]" , with: ''
      fill_in "user[email]", with: ''
      fill_in "user[password]", with: ''
      click_button 'ログイン'
    end

    it 'ルートにリダイレクトされないこと' do
      expect(current_path).to_not eq user_path(id: 1)
    end
  end
end
