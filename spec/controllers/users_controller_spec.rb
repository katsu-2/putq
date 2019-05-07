require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe '#show' do
    before do
      @user = create(:user)
    end

    context "登録済みユーザー" do
      it "正常なレスポンス返す" do
        sign_in @user
        get :show, params: { id: @user.id }
        expect(response).to be_success
      end

      it "ユーザー詳細ページが表示" do
        sign_in @user
        expect(@user).to eq(controller.current_user)
        get :show, params: { id: @user.id }
        expect(response).to have_http_status 200
      end
    end

    context "未登録ユーザー" do
      it "ログインページにリダイレクトされる" do
        get :show, params: { id: @user.id }
        expect(response).to redirect_to new_user_session_path
      end

      it "正常なレスポンス返さない" do
        get :show, params: { id: @user.id }
        expect(response).to have_http_status 302
      end
    end
  end
end
