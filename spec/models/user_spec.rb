require 'rails_helper'

RSpec.describe User, type: :model do
  describe "バリデーションのテスト" do
    it "名前、メールアドレス、パスワードがあったら有効" do
      expect(build(:user)).to be_valid
    end

    it "名前が無いと無効" do
      user = build(:user, name: nil)
      user.valid?
      expect(user.errors[:name]).to include("が入力されていません。")
    end

    it "名前が15字以上は無効" do
      user = build(:user, name: "a" * 16)
      user.valid?
      expect(user.errors[:name]).to include("は15文字以下に設定して下さい。")
    end

    it "メールアドレスが無いと無効" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("が入力されていません。")
    end

    it "重複するメールアドレスは無効" do
      user = create(:user, email: "tester@example.com")
      another = build(:user, email: "tester@example.com")
      another.valid?
      expect(another.errors[:email]).to include("は既に使用されています。")
    end
    it "パスワードが無いと無効" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("が入力されていません。")
    end
  end
end
