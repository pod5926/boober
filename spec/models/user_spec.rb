require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  it "有効なUserかどうかをテストする" do
    @user = FactoryBot.create(:user)
    expect(@user).to be_valid
  end

  it "一意性のテスト" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save!
    expect(duplicate_user).to be_invalid
  end

  describe "名前の検証" do
    it "空白NG" do
      @user.name = " "
      expect(@user).to be_invalid
      expect(@user.errors[:name]).to include("を入力してください")
    end

    it "長さの検証" do
      @user.name = "a" * 51
      expect(@user).to be_invalid
    end
  end

  describe "email属性の検証" do
    it "空白NG" do
      @user.email = " "
      expect(@user).to be_invalid
    end

    it "長さの検証" do
      @user.email = "a" * 244 + "@example.com"
      expect(@user).to be_invalid
    end

    it "重複するメールアドレス拒否のテスト" do
      duplicate_user = @user.dup
      duplicate_user.email = @user.email.upcase
      @user.save
      expect(duplicate_user).to be_invalid
    end

    context "メールフォーマット検証" do
      it "有効なメールフォーマット" do
        valid_addresses = %w(
          user@example.com USER@foo.COM A_US-ER@foo.bar.org
          first.last@foo.jp alice+bob@baz.cn
        )
        valid_addresses.each do |valid_address|
          @user.email = valid_address
          expect(@user).to be_valid
        end
      end

      it "無効なメールフォーマット" do
        invalid_addresses = %w(
          user@example,com user_at_foo.org user.name@example.
          foo@bar_baz.com foo@bar+baz.com
        )
        invalid_addresses.each do |invalid_address|
          @user.email = invalid_address
          expect(@user).to be_invalid
          expect(@user.errors[:email]).to include("は不正な値です")
        end
      end
    end
  end

  describe "パスワードの検証" do
    it "空白NG" do
      @user.password = @user.password_confirmation = " " * 6
      expect(@user).not_to be_valid
    end

    context "パスワード長さ" do
      it "６桁はOK" do
        @user = FactoryBot.build(:user, password: "a" * 6, password_confirmation: "a" * 6)
        expect(@user).to be_valid
      end

      it "５桁はNG" do
        @user = FactoryBot.build(:user, password: "a" * 5, password_confirmation: "a" * 5)
        expect(@user).to be_invalid
      end
    end
  end
end
