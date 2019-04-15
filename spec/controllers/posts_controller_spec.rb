require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe "GET #index" do
    let!(:user) { create(:user) }
    let!(:other_user) { create(:user) }
    let!(:post) { create(:post, user: user) }
    let!(:other_post) { create(:post, user: other_user) }

    context '登録済みユーザー' do
      before do
        sign_in user
        get :index
      end

      it "正常にレスポンスを返す" do
        expect(response).to be_successful
      end

      it "200レスポンスを返す" do
        expect(response).to have_http_status 200
      end

      it "indexテンプレの表示" do
        expect(response).to render_template :index
      end

      it "userのpostを表示" do
        expect(assigns(:posts)).to include(post)
      end

      it "other_userのpostを表示" do
        expect(assigns(:posts)).to include(other_post)
      end

      it "投稿数が2になる" do
        expect(assigns(:posts).count).to eq 2
      end
    end

    context '未登録ユーザー' do
      before do
        get :index
      end

      it "正常にレスポンスを返す" do
        expect(response).to be_successful
      end

      it "200レスポンスを返す" do
        expect(response).to have_http_status 200
      end

      it "indexテンプレの表示" do
        expect(response).to render_template :index
      end

      it "userのpostを表示" do
        expect(assigns(:posts)).to include(post)
      end

      it "other_userのpostを表示" do
        expect(assigns(:posts)).to include(other_post)
      end

      it "投稿数が2になる" do
        expect(assigns(:posts).count).to eq 2
      end
    end
  end

  describe "GET #show" do
    let!(:user) { create(:user) }
    let!(:post) { create(:post, user: user) }

    context "登録済みユーザー" do
      before do
        sign_in user
        get :show, params: { id: post.id }
      end

      it "正常なレスポンスを返す" do
        expect(response).to be_successful
      end

      it "200レスポンスを返す" do
        expect(response).to have_http_status 200
      end

      it "showテンプレを返す" do
        expect(response).to render_template :show
      end

      it "投稿を表示" do
        expect(assigns(:post)).to match(post)
      end
    end

    context "未登録ユーザー" do
      before do
        get :show, params: { id: post.id }
      end

      it "正常なレスポンスを返さない" do
        expect(response).to_not be_successful
      end

      it "302レスポンスを返す" do
        expect(response).to have_http_status 302
      end

      it "showテンプレを返さない" do
        expect(response).to_not render_template :show
      end
    end
  end

  describe "GET #new" do
    let!(:user) { create(:user) }
    let!(:post) { create(:post, user: user) }

    context "登録済みユーザー" do
      before do
        sign_in user
        get :new, params: {}
      end

      it "正常なレスポンス返す" do
        expect(response).to be_successful
      end

      it "200レスポンス返す" do
        expect(response).to have_http_status 200
      end

      it "@postが定義される" do
        expect(assigns(:post)).to be_a_new Post
      end

      it "newテンプレを返す" do
        expect(response).to render_template :new
      end
    end

    context "未登録ユーザー" do
      before do
        get :new, params: {}
      end

      it "正常なレスポンス返さない" do
        expect(response).to_not be_successful
      end

      it "302レスポンス返す" do
        expect(response).to have_http_status 302
      end

      it "@postが定義されない" do
        expect(assigns(:post)).to_not be_a_new Post
      end

      it "ログインページにリダイレクト" do
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe "POST #create" do
    let!(:user) { create(:user) }
    let!(:post_attributes) { attributes_for(:post) }

    context "登録済みユーザー" do
      before do
        sign_in user
      end

      it "投稿を保存する" do
        expect do
          post :create, params: { post: post_attributes }
        end.to change(Post, :count).by(1)
      end

      it "投稿に成功したら、投稿一覧ページにリダイレクト" do
        post :create, params: { post: post_attributes }
        expect(response).to redirect_to(posts_path)
      end
    end

    context "未登録ユーザー" do
      it "302レスポンス返す" do
        post :create, params: { post: post_attributes }
        expect(response).to have_http_status "302"
      end

      it "ログインページにリダイレクトする" do
        post :create, params: { post: post_attributes }
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe "DELETE #destroy" do
    let!(:user) { create(:user) }
    let!(:post) { create(:post, user: user) }

    context "登録済みユーザー" do
      before do
        sign_in user
      end

      it "投稿を削除できる" do
        expect do
          delete :destroy, params: { id: post.id }
        end.to change(Post, :count).by(-1)
      end

      it "削除後、投稿一覧へリダイレクト" do
        delete :destroy, params: { id: post.id }
        expect(response).to redirect_to(posts_path)
      end
    end

    context "未登録ユーザー" do
      it "投稿を削除できない" do
        expect do
          delete :destroy, params: { id: post.id }
        end.to_not change(Post, :count)
      end

      it "302レスポンスを返す" do
        delete :destroy, params: { id: post.id }
        expect(response).to have_http_status 302
      end

      it "ログイン画面へリダイレクト" do
        delete :destroy, params: { id: post.id }
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end
