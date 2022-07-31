require 'rails_helper'

RSpec.describe 'Pages', type: :system do
  describe 'トップページ' do
    before do
      visit root_path
    end

    it 'Homeに拉麺通信と表記されていること' do
      expect(page).to have_content '拉麺通信'
    end

    context 'ヘッダーに関する検証' do
      it 'ヘッダーに「新規登録」の項目があること' do
        expect(page).to have_content '新規登録'
      end
    end
  end
end
