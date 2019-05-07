require 'rails_helper'

RSpec.describe "ユーザー編集機能", type: :system do

  before do
    @user = create(:user)
    visit new_user_session_path
    fill_in "メールアドレス", with: @user.email
    fill_in "パスワード", with: @user.password
    click_button "ログイン"
    visit edit_user_registration_path
  end

  context "有効な情報を送信" do
    it "記事一覧にリダイレクト" do
      fill_in "名前", with: "EDIT NAME"
      fill_in "メールアドレス", with: @user.email
      click_button "変更する"

      expect(page).to have_content "最新の問題"
    end
  end

  context "無効な情報を送信" do
    it "空の名前を入力" do
      fill_in "名前", with: ""
      fill_in "メールアドレス", with: @user.email
      click_button "変更する"

      expect(page).to have_content "ユーザー編集"
    end
  end
end
