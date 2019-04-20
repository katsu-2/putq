FactoryBot.define do
  factory :comment do
    comment { "a" * 2000 }
    association :user
    association :post
  end
end
