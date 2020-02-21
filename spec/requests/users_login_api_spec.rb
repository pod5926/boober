require 'rails_helper'

RSpec.describe "UsersLoginApi", type: :request do
  it "sessions/newにアクセスできること" do
    # ログインページにアクセスします
    get login_path
    expect(response).to have_http_status(:success)
  end

  describe "<sessions#new>" do
    context "ログインに失敗した時" do
      it "フラッシュメッセージの残留をキャッチすること" do
        get login_path
        expect(response).to have_http_status(:success)

        # 「email:""」と「password:""」の値を持ってlogin_pathにアクセスします
        # → バリデーションに引っかかりログインできません
        post login_path, params: { session: { email: "", password: "" } }
        expect(response).to have_http_status(:success)

        # flash[:danger]が表示されているかチェックします
        expect(flash[:danger]).to be_truthy

        # Rails Tutorialだと、minitest記述でbe_emptyとありますが、
        # be_emptyで「flash[:danger]のテストを行うとエラーになります。
        # get root_pathに移動前：expect(flash[:danger]).to_not be_empty → GREEN
        # get root_pathに移動前：expect(flash[:danger]).to be_truthy → RED
        # エラーを見ると返り値が"true"だったため、be_truthyとbe_falseyにしています。

        # root_path（別ページ）に移動してflash[:danger]が表示されていないかチェックします
        get root_path
        expect(flash[:danger]).to be_falsey
      end
    end
  end
end
