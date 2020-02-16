require 'rails_helper'

RSpec.feature "StaticPages", type: :feature do
  describe "Home page" do
    before do
      visit root_path   # 名前付きルートを使用
    end

    # Homeページに思い出を語ろうと表示されていること
    it "should have the content '思い出を語ろう'" do
      expect(page).to have_content "思い出を語ろう"
    end

    # タイトルが正しく表示されていること
    it "should have the right title" do
      expect(page).to have_title full_title('')
    end

    it "ボタン確認" do
      click_on 'Sign up now!'
      # ログインに成功したことを検証する
      expect(page).to have_content 'Sign up'
    end
  end

  #helpページ
  describe "Help page" do
    before do
      visit helf_path
    end

    it "should have the content 'StaticPages#help'" do
      expect(page).to have_content "StaticPages#help"
    end

    it "should have the right title" do
      expect(page).to have_title full_title('')
    end
  end

  #helpページ
  describe "signup page" do
    before do
      visit signup_path
    end

    it "should have the content 'Sign up'" do
      expect(page).to have_content "Sign up"
    end

    it "should have the right title" do
      expect(page).to have_title full_title('')
    end
  end
end
