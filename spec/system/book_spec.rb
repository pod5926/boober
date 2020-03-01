require 'rails_helper'

describe "Book機能", type: :system do
  let(:user_a) { FactoryBot.create(:user, name: 'ユーザーA', email: 'a@example.com', activated: true) }
  let(:user_b) { FactoryBot.create(:user, name: 'ユーザーB', email: 'b@example.com', activated: true) }
  let!(:book_a) { FactoryBot.create(:book, title: 'book1', content: 'test', user_id: user_a.id) }

  before do
    visit login_path
    fill_in 'session_email', with: login_user.email
    fill_in 'session_password', with: login_user.password
    click_button 'ログイン'
  end

  describe '一覧表示機能' do
    context "ユーザーAがログインしている時" do
      let(:login_user) { user_a }

      it 'ユーザーAのbookが表示される' do
        expect(page).to have_content 'book1'
      end
    end

    context "ユーザーBログインしている時" do
      let(:login_user) { user_b }

      it 'ユーザーAのbookが表示されない' do
        expect(page).to have_no_content 'book1'
      end
    end
  end

  describe '詳細表示機能' do
    context 'ユーザーAがログインしている時' do
      let(:login_user) { user_a }

      before do
        visit book_path(book_a)
      end

      it 'ユーザーAが作成したタスクが表示される' do
        expect(page).to have_content 'book1'
      end
    end
  end
end
