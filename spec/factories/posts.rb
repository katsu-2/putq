FactoryBot.define do
  factory :post do
    title { "Railsの問題" }
    content { "あいうえおかきくけこ" }
    answer { "さしすせそたちつてと" }
    user
    category
  end
end
