require 'rails_helper'

RSpec.describe "ユーザー登録機能", type: :system do

  context "有効な情報を送信" do
    it "トップページにリダイレクト" do
      visit new_user_registration_path

      fill_in "名前", with: "testuser"
      fill_in "メールアドレス", with: "test@gmail.com"
      fill_in "パスワード", with: "aaaaaa"
      fill_in "パスワードの確認", with: "aaaaaa"
      click_button "登録する"

      expect(page).to have_content "最新の問題"
    end
  end

  context "無効な情報を送信" do
    it "空の情報を送信" do
      visit new_user_registration_path

      fill_in "名前", with: ""
      fill_in "メールアドレス", with: ""
      fill_in "パスワード", with: ""
      fill_in "パスワードの確認", with: ""
      click_button "登録する"

      expect(page).to have_content "putqへようこそ"
    end
  end
end
