FactoryBot.define do
  factory :user do
    name { 'User' }
    sequence(:email) { |n| "tester#{n}@example.com" }
    password { "foobar" }
    password_confirmation { "foobar" }
  end
end
