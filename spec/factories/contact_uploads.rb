FactoryBot.define do
  factory :contact_upload do
    file { Rack::Test::UploadedFile.new(Rails.root.join("spec/files/test.csv"), "text/csv") }
    association :user, factory: :user
  end
end
