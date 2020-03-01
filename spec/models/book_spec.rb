require 'rails_helper'

RSpec.describe Book, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @book = @user.books.build(title: "test", content: "Lorem ipsum")
  end

  it "有効なBookかどうかをテストする" do
    expect(@book).to be_valid
  end

  it "user id がない時エラー" do
    @book.user_id = nil
    expect(@book).to be_invalid
  end

  describe "content 検証" do
    it "空白エラー" do
      @book.content = ""
      expect(@book).to be_invalid
    end
    it "255文字制限" do
      @book.content = "a" * 256
      expect(@book).to be_invalid
    end
  end
end
