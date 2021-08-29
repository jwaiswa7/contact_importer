FactoryBot.define do
  factory :contact do
    name { "#{Faker::Name.first_name} #{Faker::Name.first_name}"  }
    date_of_birth { Faker::Date.birthday(min_age: 18, max_age: 65) }
    phone { Faker::PhoneNumber.phone_number_with_country_code }
    address { Faker::Address.street_name }
    credit_card { %w[371449635398431 30569309025904 6011111111111117 3530111333300000 5555555555554444 4111111111111111].sample }
    email { Faker::Internet.email }
    association :user, factory: :user
  end
end
