require 'rails_helper'

RSpec.describe "問題作成機能", type: :system do

  before do
    @user = create(:user)
    visit new_user_session_path
    fill_in "メールアドレス", with: @user.email
    fill_in "パスワード", with: @user.password
    click_button "ログイン"
    visit new_post_path
  end

  context "有効な情報を送信した時" do
    it "トップページにリダイレクトされる" do
      expect {
        fill_in "例）プログラミングの問題", with: "title"
        fill_in "ここに問題文を書いてください", with: "content"
        fill_in "ここに答えをください", with: "answer"
        # find("option[value='1']").select_option
        # find("option[value='7']").select_option
        # select 'プログラミング', from: 'カテゴリー'
        # select 'HTML', from: 'カテゴリー'
        click_button "問題の作成"

        expect(page).to have_content("title")
        expect(page).to have_content("content")
        expect(page).to have_content("answer")
        # expect(page).to have_select('カテゴリー', selected: 'プログラミング')
        # expect(page).to have_select('カテゴリー', selected: 'HTML')
      }.to change(@user.posts, :count).by(1)
    end
  end
end
