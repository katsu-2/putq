require 'rails_helper'

RSpec.describe Post, type: :model do
  describe "バリデーションのテスト" do
    it "title, content, answerがあれば有効" do
      expect(build(:post)).to be_valid
    end

    it "titleがなければ無効" do
      post = build(:post, title: nil)
      post.valid?
      expect(post.errors[:title]).to include("が入力されていません。")
    end

    it "contentがなければ無効" do
      post = build(:post, content: nil)
      post.valid?
      expect(post.errors[:content]).to include("が入力されていません。")
    end

    it "answerがなければ無効" do
      post = build(:post, answer: nil)
      post.valid?
      expect(post.errors[:answer]).to include("が入力されていません。")
    end

    it "titleが30字以上で無効" do
      post = build(:post, title: "a" * 31)
      post.valid?
      expect(post.errors[:title]).to include("は30文字以下に設定して下さい。")
    end
  end
end
