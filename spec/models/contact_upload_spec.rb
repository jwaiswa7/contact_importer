require "rails_helper"

RSpec.describe ContactUpload, type: :model do
  let(:contact_upload) { FactoryBot.create :contact_upload }

  it "is not valid without a file" do 
    contact_upload.file = nil
    expect(contact_upload).not_to be_valid
  end

  it "is not valid without a user" do 
    contact_upload.user = nil
    expect(contact_upload).not_to be_valid
  end

  it "is a valid contact upload" do
    expect(contact_upload).to be_valid
  end
end
