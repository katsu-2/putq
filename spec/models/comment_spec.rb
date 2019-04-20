require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe "バリデーション" do
    it "コメントがあったら有効" do
      expect(build(:comment)).to be_valid
    end

    it "コメントがなかったら無効" do
      comment = build(:comment, comment: nil)
      comment.valid?
      expect(comment.errors[:comment]).to include("が入力されていません。")
    end

    it "コメントが2001字以上は無効" do
      comment = build(:comment, comment: "a" * 2001)
      comment.valid?
      expect(comment.errors[:comment]).to include("は2000文字以下に設定して下さい。")
    end
  end
end
