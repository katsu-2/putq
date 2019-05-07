require 'rails_helper'

RSpec.describe "ユーザーログイン機能", type: :system do

  before do
    @user = create(:user)
  end

  context "有効な情報を送信" do
    it "記事一覧が表示" do
      visit new_user_session_path

      fill_in "メールアドレス", with: @user.email
      fill_in "パスワード", with: @user.password
      click_button "ログイン"

      expect(page).to have_content "最新の問題"
    end
  end

  context "無効な情報を送信" do
    it "メールアドレスが無効" do
      visit new_user_session_path

      fill_in "メールアドレス", with: ""
      fill_in "パスワード", with: @user.password
      click_button "ログイン"

      expect(page).to have_content "putqにログイン"
    end

    it "パスワードが無効" do
      visit new_user_session_path

      fill_in "メールアドレス", with: @user.email
      fill_in "パスワード", with: ""
      click_button "ログイン"

      expect(page).to have_content "putqにログイン"
    end
  end
end
