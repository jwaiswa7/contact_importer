FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { "top@secret" }
  end
end
