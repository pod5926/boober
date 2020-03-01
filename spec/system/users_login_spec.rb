require 'rails_helper'

describe "Login機能", type: :system do
  describe '一覧表示機能' do
    let(:user_a) { FactoryBot.create(:user, name: 'ユーザーA', email: 'a@example.com', activated: true) }
    let(:user_b) { FactoryBot.create(:user, name: 'ユーザーB', email: 'b@example.com', activated: false) }

    before do
      FactoryBot.create(:book, title: 'book1', content: 'test', user_id: login_user.id)
      visit login_path
      fill_in 'session_email', with: login_user.email
      fill_in 'session_password', with: login_user.password
      click_button 'ログイン'
    end

    context "ユーザーAでログイン" do
      let(:login_user) { user_a }

      it 'ユーザーAのbookが表示される' do
        expect(page).to have_content 'book1'
      end
    end

    context "ユーザーBでログイン" do
      let(:login_user) { user_b }

      it 'リダイレクトされる' do
        expect(page).to have_content 'アカウントがアクティブではありませんアクティベーションメールを確認してください'
      end
    end
  end
end
