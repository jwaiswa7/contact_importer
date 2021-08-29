FactoryBot.define do
  factory :contact do
    name { "#{Faker::Name.first_name} #{Faker::Name.first_name}" }
    date_of_birth { Faker::Date.birthday(min_age: 18, max_age: 65) }
    phone { "(+57) 320 432 05 09" }
    address { Faker::Address.street_name }
    credit_card { %w[371449635398431 30569309025904].sample }
    email { Faker::Internet.email }
    association :user, factory: :user
  end
end
