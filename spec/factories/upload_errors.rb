FactoryBot.define do
  factory :upload_error do
    details { "Error message" }
    upload_row { 3 }
    association :contact_upload, factory: :contact_upload
  end
end
