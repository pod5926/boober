require 'rails_helper'
# メモ
# describe[テスト対象], type: [Specの種類] do
# it [仕様の内容（期待の概要）]
# [期待する動作]
# end
# end

RSpec.describe StaticPagesController, type: :controller do
  # homeの接続
  describe "#home の接続テスト" do
    it "returns http success" do
      get :home
      expect(response).to have_http_status(:success)
    end
  end

  # help
  describe "#help の接続テスト" do
    it "returns http success" do
      get :help
      expect(response).to have_http_status(:success)
    end
  end

  # about
  describe "#about の接続テスト" do
    it "returns http success" do
      get :about
      expect(response).to have_http_status(:success)
    end
  end
end
