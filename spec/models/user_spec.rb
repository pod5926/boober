require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  it "有効なUserかどうかをテストする" do
    @user = FactoryBot.create(:user)
    expect(@user).to be_valid
  end

  it "名前属性の検証" do
    @user.name = " "
    expect(@user).to be_invalid
    expect(@user.errors[:name]).to include("can't be blank")
  end

  it "名前長さの検証" do
    @user.name = "a" * 51
    expect(@user).to be_invalid
  end

  it "email属性の検証" do
    @user.email = " "
    expect(@user).to be_invalid
  end

  it "email長さの検証" do
    @user.email = "a" * 244 + "@example.com"
    expect(@user).to be_invalid
  end

  it "有効なメールフォーマットをテストする" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
      first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      expect(@user).to be_valid
    end
  end

  it "無効なメールフォーマットをテストする" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                          foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      expect(@user).to be_invalid
      expect(@user.errors[:email]).to include("is invalid")
    end
  end

  it "重複するメールアドレス拒否のテスト" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    expect(duplicate_user).to be_invalid
  end

  it "一意性のテスト" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save!
    expect(duplicate_user).to be_invalid
  end

  it "パスワード検証 空白" do
    @user.password = @user.password_confirmation = "a" * 6
    expect(@user).to be_valid

    #" "が６文字のパスワードのテスト
    @user.password = @user.password_confirmation = " " * 6
    expect(@user).to_not be_valid
  end

  #パスワードの長さテスト
  describe "password length" do
    #パスワードが6桁の時と５桁の時のテストを行うことで、どの位置からバリデーションが用意されているのか可視化している
    context "パスワードが６桁の時" do
      it "正しい" do
        @user = FactoryBot.build(:user, password: "a" * 6, password_confirmation: "a" * 6)
        expect(@user).to be_valid
      end
    end

    context "パスワードが５桁の時" do
      it "正しくない" do
        @user = FactoryBot.build(:user, password: "a" * 5, password_confirmation: "a" * 5)
        expect(@user).to be_invalid
      end
    end
  end
end
